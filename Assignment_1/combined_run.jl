using JuMP
using Clp

# Crops
include("model.jl")
m, x = model("data.jl")
print(m)

set_optimizer(m, Clp.Optimizer)
set_optimizer_attribute(m, "LogLevel", 1)

optimize!(m)

println("z = ", -objective_value(m))
println("x = ", value.(x.data))
