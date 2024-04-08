function build_model(data_file::String)
    include(data_file)

    m = Model()

    @variable(m, x[I] >=0)
    @objective(m, Min, sum(c[i] * x[i] for i in I))
    @constraint(m, linear_constraint[j in I], sum(A[j,i] * x[i] for i in I) <= b[j])
    @constraint(m, x[1] <=3)

    return m, x
end