using OptimClassifier
using Base.Test

@testset "OptimClassifier.jl" begin
    ## Test example
    @test 1 == 1
    ## Test MC
    #t = [1,2,3,3,2]
    #t2= [3,2,1,3,2]
    #R = MC(t,t2)
    @test MC([1,2,3,3,2],[3,2,1,3,2]) ==  [0 0 1 ; 0 2 0 ; 1 0 1]
end
