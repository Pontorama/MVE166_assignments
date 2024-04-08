function diesel_model(data_file::String, vegetable_oil_amount)
    include(data_file)

    m = Model()

    @variable(m, x[I] >= 0) # x is amount of diesel produced
    @objective(m, Min, -sum(c_diesel[i] * x[i] for i in I) + price_petrol_diesel*sum((1-percentages[i])*x[i] for i in I))
    @constraint(m, vegetable_oil_constraint, sum(percentages[i]*x[i] for i in I) <= vegetable_oil_amount)
    @constraint(m, petrol_diesel_constraint, sum((1-percenteges[i])*x[i] for i in I) <= P)
    @constraint(m, sum(x[i] for i in I) >= D)

    return m, x
end