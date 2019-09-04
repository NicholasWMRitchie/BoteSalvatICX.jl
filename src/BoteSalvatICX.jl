module BoteSalvatICX

using Requires

include("xione.jl")

export boteSalvatICX # Computes the ionization crosssection for electron impact on free atoms
export boteSalvatAvailable # Is data available for the specified element and shell
export boteSalvatEdgeEnergy # Bote-Salvat's assumed edge energy in eV

function __init__()
    @require Gadfly="c91e804a-d5a3-530f-b6f0-dfbca275c004" include("gadflysupport.jl")
end

export plotBoteSalvatICX # Plot the crosssections profiles.  Only available if Gadfly is loaded.

end # module
