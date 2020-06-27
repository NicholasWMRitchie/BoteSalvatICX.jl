using Documenter
using Weave
using BoteSalvatICX
using Cairo
using Fontconfig

rm("build",force=true,recursive=true)

weaveit(name) = weave(joinpath("src", "$name"), out_path=joinpath("src", "$(splitext(name)[1]).md"), doctype="github")

names = ( "Example.ipynb", )

weaveit.(names)

makedocs(
    modules = [BoteSalvatICX],
    sitename = "BoteSalvatICX.jl",
    pages = [ "Home" => "index.md", "Using BoteSalvatICX" => "Example.md" ]
    )

map(name->rm(joinpath("src","$(splitext(name)[1]).md")), names)
# deploydocs(repo = "github.com/USNISTGOV/BoteSalvatICX.jl.git")
