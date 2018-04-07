__precompile__()
module OptimClassifier
    using GLM
    using DataFrames

    export                              # types
        splitter,
        rmse,
        OptimGLM,
        MC

# Package code goes here.

include("MC.jl")
include("RMSE.jl")
include("splitter.jl")
include("utils.jl")
include("OptimGLM.jl")
end
