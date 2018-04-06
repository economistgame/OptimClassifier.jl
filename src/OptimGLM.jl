function OptimGLM(formula, data, p, criteria, seed=0)

responsevar  = formula.lhs
data = splitter(data,p,seed)
training = data["training"]
testing = data["testing"]
Modelo = glm(formula, training, Normal(), IdentityLink())
Prediccion = predict(Modelo, testing)
RMSE = (testing[responsevar] - Prediccion)^2
threshold = 0:0.05:1

#How to square each element of an array in Array class in Julia?

end
