# BoteSalvatICX.jl
Implements the Bote-Salvat ionization crosssection model described in

* D. Bote and F. Salvat, _"Calculations of inner-shell ionization by electron impact with the distorted-wave and plane-wave Born approximations"_, Phys. Rev. **A77**, 042701 (2008).
* Bote, David, et al. _"Cross sections for ionization of K, L and M shells of atoms by impact of electrons and positrons with energies up to 1 GeV: Analytical formulas."_ Atomic Data and Nuclear Data Tables **95.6** (2009): 871-909.

This is a very lean implementation that only handles electrons.

Elements are identified by atomic number, z.

Shells are identified by integer indices where 1->K, 2->L1, 3->L2, ...,9->M5 (IUPAC notation) or
1->1S, 2->2S, 3->2P1/2, 4->2P3/2,... (atomic notation).

```julia
boteSalvatICX(z::Int, shell::Symbol, energy::AbstractFloat, edgeenergy::Union{Float64,Nothing}=nothing)
```
* Computes the cross-section in square centimeters for z=1:99, shell=1:<=9, energy = 0 to 1 GeV in eV
* If edgeenergy is nothing, the B-S recommended value is used, otherwise the user may provide an edge energy in eV
* Returns 0.0 if energy<edgeenergy
* Throws an assertion if data isn't available for the specified shell.

```julia
boteSalvatAvailable(z::Int, shell::Symbol)
```
* True if data is available to compute the crosssection for the specified shell

```julia
boteSalvatEdgeEnergy(z::Int, shell::Symbol)
```
* The ionization energy for the specified element and shell.


If the plotting module Gadfly (https://github.com/GiovineItalia/Gadfly.jl) is loaded, the function
```julia
plotBoteSalvatICX(z::Integer)
```
will produce a log-log plot of the cross sections for all available shells from threshold to 1 GeV.
