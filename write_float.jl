include(get_source_file(branches[idx]))
import .Printf

# F1
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %f \n", values[i, 1])
    end
end
data[idx, :F1] = t

# F2
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %f %f \n", values[i, 1:2]...)
    end
end
data[idx, :F2] = t

# F3
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %f %f %f %f \n", values[i, 1:4]...)
    end
end
data[idx, :F3] = t

# F4
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " %f %f %f %f %f %f %f %f \n", values[i, 1:8]...)
    end
end
data[idx, :F4] = t

# F5
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " Influence %f [%%], data %f \n", values[i, 1:2]...)
    end
end
data[idx, :F5] = t

# F6
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " Influence %f [%%], data %f, %f, %f, %f, %f, %f, %f, \n", values[i, 1:8]...)
    end
end
data[idx, :F6] = t

# F7
t = @elapsed open("/dev/null", "w") do io
    for i = 1:N
        Printf.@printf(io, " Very very very very very very very very very very very very very very very very very very very very long text %f \n", values[i, 1])
    end
end
data[idx, :F7] = t

# println(data)
