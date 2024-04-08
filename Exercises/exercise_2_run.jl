using JuMP
using Clp

include("exercise_2_model.jl")
m, x = build_model("exercise_2_data.jl")
print(m)

set_optimizer(m, Clp.Optimizer)
set_optimizer_attribute(m, "LogLevel", 1)

optimize!(m)

println("z = ", objective_value(m))
println("x = ", value.(x.data))