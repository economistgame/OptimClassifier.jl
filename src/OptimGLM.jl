function OptimGLM(formula, data, p, criteria, seed=0)

responsevar  = formula.lhs
data = splitter(data,p,seed)
training = data["training"]
testing = data["testing"]

Modelos = Prediccion = RMSE = cm = Success_rate =  Dict{Any, Any}(1 => Test)

Modelos_a_testear = Dict(1 => Binomial(),
                         2 => Normal(),
                         3 => Poisson(),
                         4 => Poisson(),
                         5 => Binomial()
                         )
Links = Dict(1 =>LogitLink() ,
             2=>IdentityLink(),
             3=>LogLink(),
             4=>SqrtLink(),
             5=>ProbitLink())
for  i = 1:5
 Modelos[i]= glm(formula, training, Modelos_a_testear[i], Links[i])
 Prediccion[i] = predict(Modelos, testing)
 RMSE[i] = rmse(testing[responsevar], Prediccion)
 Filtro1 = map(x -> Compare(x,0.5),Prediccion)
 Filtro2 = map(x -> ifelse(x,1,0),Filtro1)
 cm[i] = MC(testing[responsevar], Filtro2)
 Success_rate[i] = sum(Diagonal(cm))/sum(cm)
end

threshold = 0:0.05:1


tI_error = (sum(UpperTriangular(cm))-sum(Diagonal(cm)))/sum(cm)
tII_error = (sum(LowerTriangular(cm))-sum(Diagonal(cm)))/sum(cm)

models = DataFrame(Model="GLMSimple",
          success_rate=Success_rate,
          ti_error=tI_error,
          tii_error=tII_error)

return models

end
