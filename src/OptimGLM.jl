function OptimGLM(formula, data, p, criteria, seed=0)

responsevar  = formula.lhs
data = splitter(data,p,seed)
training = data["training"]
testing = data["testing"]
Modelo = glm(formula, training, Normal(), IdentityLink())
Prediccion = predict(Modelo, testing)
RMSE = rmse(testing[responsevar], Prediccion)
threshold = 0:0.05:1

Filtro1 = map(x -> Compare(x,0.5),Prediccion)
Filtro2 = map(x -> ifelse(x,1,0),Filtro1)
cm = MC(testing[responsevar], Filtro2)
Success_rate = sum(Diagonal(cm))/sum(cm)
tI_error = (sum(UpperTriangular(cm))-sum(Diagonal(cm)))/sum(cm)
tII_error = (sum(LowerTriangular(cm))-sum(Diagonal(cm)))/sum(cm)

models = DataFrame(Model="GLMSimple",
          success_rate=Success_rate,
          ti_error=tI_error,
          tii_error=tII_error)

return models

end
