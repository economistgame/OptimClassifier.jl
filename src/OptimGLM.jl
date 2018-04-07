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

#How to square each element of an array in Array class in Julia?

end
