# BoteSalvatICX.jl
Implements the Bote-Salvat ionization crosssection model described in 

* D. Bote and F. Salvat, "Calculations of inner-shell ionization by electron impact with the distorted-wave and plane-wave Born approximations", Phys. Rev. A77, 042701 (2008).
* Bote, David, et al. "Cross sections for ionization of K, L and M shells of atoms by impact of electrons and positrons with energies up to 1 GeV: Analytical formulas." Atomic Data and Nuclear Data Tables 95.6 (2009): 871-909.

This is a very lean implementation that only (currently) handles electrons.

Shells are identified by Symbols of the form :K, :L1, :L2, :L3, :M1, :M2, :M3, :M4, :M5

BoteSalvatElectron::Vector{BoteSalvatElementDatum} : A vector containing implementation data for Z = 1:99

boteSalvatICX(z::Int, shell::Symbol, energy::AbstractFloat, edgeenergy::Union{Float64,Nothing}=nothing)
* Computes the cross-section in square centimeters for z=1:99, shell=:K|:L1|:L2|...|:M5, energy = 0 to 1 GeV in eV
* If edgeenergy is nothing, the B-S recommended value is used, otherwise the user may provide an edge energy in eV

isavailable(bse::BoteSalvatElementDatum, shell::Symbol)
* True if data is available to compute the crosssection for the specified shell

Gadfly.plot(bse::BoteSalvatElementDatum)
* Plots the crosssection for all available shells on a Log-Log plot.
