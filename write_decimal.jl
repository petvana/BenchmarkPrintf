include(get_source_file(branches[idx]))
import .Printf

# D1
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %d \n", values[i, 1])
    end
end
data[idx, :D1] = t

# D2
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %d %d \n", values[i, 1:2]...)
    end
end
data[idx, :D2] = t

# D3
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %d %d %d %d \n", values[i, 1:4]...)
    end
end
data[idx, :D3] = t

# D4
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %d %d %d %d %d %d %d %d \n", values[i, 1:8]...)
    end
end
data[idx, :D4] = t

# D5
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " Influence %d [%%], data %d \n", values[i, 1:2]...)
    end
end
data[idx, :D5] = t

# D6
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " Influence %d [%%], data %d, %d, %d, %d, %d, %d, %d, \n", values[i, 1:8]...)
    end
end
data[idx, :D6] = t

# D7
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " Very very very very very very very very very very very very very very very very very very very very long text %d \n", values[i, 1])
    end
end
data[idx, :D7] = t

# println(data)
