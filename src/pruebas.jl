
using DataFrames
using GLM
data = DataFrame(X=[1,2,3], Y=[2,4,7])
Modelos =  Dict{Any, Any}(1 => Test)
Modelos_a_testear = Dict(1 => Binomial(),2 => Normal(),3 => Poisson())
Modelos[2] = 1
for  i = 2:3
 Modelos[i]= glm(@formula(Y ~ X), data,  Modelos_a_testear[i], IdentityLink())
end

R = @formula(Y ~ X)

R = @formula(Y~X)
glm(@formula(Y ~ X), data, Normal(), IdentityLink())
