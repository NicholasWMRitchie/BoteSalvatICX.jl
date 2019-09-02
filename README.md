# BoteSalvatICX.jl
Implements the Bote-Salvat ionization crosssection model described in

* D. Bote and F. Salvat, _"Calculations of inner-shell ionization by electron impact with the distorted-wave and plane-wave Born approximations"_, Phys. Rev. **A77**, 042701 (2008).
* Bote, David, et al. _"Cross sections for ionization of K, L and M shells of atoms by impact of electrons and positrons with energies up to 1 GeV: Analytical formulas."_ Atomic Data and Nuclear Data Tables **95.6** (2009): 871-909.

This is a very lean implementation that only (currently) handles electrons.  The only dependence is the plotting library Gadfly.

Shells are identified by Symbols of the form
```julia
:K, :L1, :L2, :L3, :M1, :M2, :M3, :M4, :M5
```

The element implementation data is stored in
```julia
BoteSalvatElectron::Vector{BoteSalvatElementDatum}
```
* A vector containing implementation data for Z = 1:99 by the element's atomic number.

```julia
boteSalvatICX(z::Int, shell::Symbol, energy::AbstractFloat, edgeenergy::Union{Float64,Nothing}=nothing)
```
* Computes the cross-section in square centimeters for z=1:99, shell=:K|:L1|:L2|...|:M5, energy = 0 to 1 GeV in eV
* If edgeenergy is nothing, the B-S recommended value is used, otherwise the user may provide an edge energy in eV
* Returns 0.0 if energy<edgeenergy or if data isn't available for the specified shell.
or
```julia
compute(bse::BoteSalvatElementDatum, ish::Int, energy::AbstractFloat, edgeenergy::Union{Float64,Nothing}=nothing)
```
* Computes the cross-section in square centimeters for z=1:99, shell=1:9 for K|M5 energy = 0 to 1 GeV in eV
* If edgeenergy is nothing, the B-S recommended value is used, otherwise the user may provide an edge energy in eV
* Returns 0.0 if energy<edgeenergy or if data isn't available for the specified shell.

```julia
isavailable(bse::BoteSalvatElementDatum, shell::Symbol)
```
* True if data is available to compute the crosssection for the specified shell
