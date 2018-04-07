# Sampler in R, splitter in Julia
"""
    splitter(data,p,seed=0)

    A training/test partition are created by splitter function.


## Examples

```julia-repl

julia> using DataFrames

julia> data = DataFrame(X=[1,2,3], Y=[2,4,7])

julia> Data = splitter(data,0.7,0)

```
"""


function splitter(data::DataFrame, p::Float64, seed::Int64=0)

if(seed!=0)
   nrand(seed)
end

inTrain =  sample(1:nrow(data), Int64(floor(p*nrow(data))), replace = false)

training = data[inTrain, :]
testing  = deleterows!(data, inTrain)
output = Dict{Any, Any}("training"=>training, "testing"=>testing, "RowsTraining"=>inTrain)
return output

end
