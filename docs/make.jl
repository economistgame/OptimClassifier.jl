using Documenter, OptimClassifier

makedocs(;
    modules=[OptimClassifier],
    format=:html,
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/economistgame/OptimClassifier.jl/blob/{commit}{path}#L{line}",
    sitename="OptimClassifier.jl",
    authors="economistgame",
    assets=[],
)

deploydocs(;
    repo="github.com/economistgame/OptimClassifier.jl",
    target="build",
    julia="0.6",
    deps=nothing,
    make=nothing,
)
