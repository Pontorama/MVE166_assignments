function model(data_file::String)
    # import data
    include(data_file)
    # Create & set up model
    m = Model()
    @variable(m, x[I] >= 0) # x is area used to farm each of the three crops
    @objective(m, Min, -sum((1-tax[i])*price[i]*x[i+3] for i in I_diesel) + price_petrol_diesel*sum((1-percenteges[i])*x[i+3] for i in I_diesel) + 0.2*price_methanol*sum(c_crops[i]*x[i] for i in I_crops))
    # Constraints
    @constraint(m, area_constraint, sum(x[i] for i in I_crops) <= A)
    @constraint(m, water_constraint, sum(w[i]*x[i] for i in I_crops) <= S)
    @constraint(m, available_biofuel, sum(c_crops[i]*x[i] for i in I_crops)*0.9 >= sum(percenteges[i]*x[i+3] for i in I_diesel))
    @constraint(m, petrol_diesel_constraint, sum((1-percenteges[i])*x[i+3] for i in I_diesel) <= P)
    @constraint(m, sum(x[i+3] for i in I_diesel) >= D)
    return m, x
end