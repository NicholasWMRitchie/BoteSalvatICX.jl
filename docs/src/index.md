# BoteSalvatICX
## Implements the Bote-Salvat Ionization Cross Section

These functions deliver the total cross section for electron impact ionization of K, L and M sub-shells of neutral atoms of the elements from hydrogen (Z=1) to einsteinium (Z=99). The model is a parameterization of numerical cross sections computed with the distorted-wave and the plane-wave first-Born approximations.

#### References:

  * D. Bote and F. Salvat, *Calculations of inner-shell ionization by electron impact with the distorted-wave and plane-wave Born approximations*, Phys. Rev. A77, 042701 (2008).
  * D. Bote et al., *Cross sections for ionization of K, L and M shells of atoms by impact of electrons and positrons with energies up to 1 GeV.  Analytical formulas*, Atomic Data and Nuclear Data Tables 95.6 (2009) 871-909.

## Using BoteSalvatICX

The [Jupyter notebook](Example.html) in `docs/src` provides examples.

The package was designed to minimize dependencies while providing a focused set of functionality.

```@autodocs
Modules = [BoteSalvatICX]
```
