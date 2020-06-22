using Documenter
using Weave
using BoteSalvatICX
using Cairo
using Fontconfig

weave("src/Example.ipynb", out_path="src/Example.html")

makedocs(modules = [BoteSalvatICX], sitename = "BoteSalvatICX.jl")

# deploydocs(repo = "github.com/USNISTGOV/BoteSalvatICX.jl.git")
