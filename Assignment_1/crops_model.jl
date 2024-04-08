function crops_model(data_file::String)
    # import data
    include(data_file)
    # Create & set up model
    m = Model()
    @variable(m, x[I] >= 0) # x is area used to farm each of the three crops
    @objective(m, Min, -sum(c_crops[i] * x[i] for i in I))
    # Constraints
    @constraint(m, area_constraint, sum(x[i] for i in I) <= A)
    @constraint(m, water_constraint, sum(w[i]*x[i] for i in I) <= S)

    return m, x
end