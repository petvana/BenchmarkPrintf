module BenchmarkPrintf

using BenchmarkTools
using DataFrames
using Test

# where the tested codes are stored
dir = "versions"

global branches = [
    # "local",
    # "petvana/julia/Printf-no-unroll",
    "JuliaLang/julia/v1.5.2",
    "JuliaLang/julia/master",
    "JuliaLang/julia/jq/37784",
    "petvana/julia/jq/37784",
]

#local_file = "/home/petr/software/julia/julia-petvana/stdlib/Printf/src/Printf.jl"

#rm(dir, recursive=true, force=true)

function get_source_file(name)
    actdir = dir * "/" * replace(name, "/" => "-")
    mkpath(actdir)
    source_file = actdir * "/Printf.jl"
end

for (idx, name) in enumerate(branches)
    source_file = get_source_file(name)

    if name == "local"
        cp(local_file, source_file, force=true)
    else
        url = "https://raw.githubusercontent.com/$(name)/stdlib/Printf/src/Printf.jl"
        if !isfile(source_file)
            @info "Downloading from $(url)"
            download(url, source_file)
            run(`sed -i 's/using Base.Grisu/using Grisu/g' $(source_file)`)
        end
    end
end

data = DataFrame(PrintfVersion = branches)
for i=1:7 data[Symbol("F"*string(i))] = NaN end
N = 1
values = rand(N, 8)

idx = 1; include("write_float.jl")
idx = 2; include("write_float.jl")
idx = 3; include("write_float.jl")
idx = 4; include("write_float.jl")

print("\n"); show(stdout, MIME("text/html"), data); print("\n\n")

data = DataFrame(PrintfVersion = branches)
for i=1:7 data[Symbol("F"*string(i))] = NaN end
N = 10^7
values = rand(N, 8)

idx = 1; include("write_float.jl")
idx = 2; include("write_float.jl")
idx = 3; include("write_float.jl")
idx = 4; include("write_float.jl")

print("\n"); show(stdout, MIME("text/html"), data); print("\n\n")

data = DataFrame(PrintfVersion = branches)
for i=1:7 data[Symbol("D"*string(i))] = NaN end
N = 1
values = rand(Int32, N, 8)

idx = 1; include("write_decimal.jl")
idx = 2; include("write_decimal.jl")
idx = 3; include("write_decimal.jl")
idx = 4; include("write_decimal.jl")

print("\n"); show(stdout, MIME("text/html"), data); print("\n\n")

data = DataFrame(PrintfVersion = branches)
for i=1:7 data[Symbol("D"*string(i))] = NaN end
N = 10^7
values = rand(Int32, N, 8)

idx = 1; include("write_decimal.jl")
idx = 2; include("write_decimal.jl")
idx = 3; include("write_decimal.jl")
idx = 4; include("write_decimal.jl")

print("\n"); show(stdout, MIME("text/html"), data); print("\n\n")

end