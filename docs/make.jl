using Raycast
using Documenter

DocMeta.setdocmeta!(Raycast, :DocTestSetup, :(using Raycast); recursive = true)

makedocs(;
    modules = [Raycast],
    authors = "devansh <devansh@umich.edu> and contributors",
    repo = "https://github.com/dev10110/Raycast.jl/blob/{commit}{path}#{line}",
    sitename = "Raycast.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://dev10110.github.io/Raycast.jl",
        edit_link = "main",
        assets = String[],
    ),
    pages = ["Home" => "index.md"],
)

deploydocs(; repo = "github.com/dev10110/Raycast.jl", devbranch = "main")
