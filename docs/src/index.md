# BoteSalvatICX
## An implementation of the Bote-Salvat electron ionization crosssection

This implementation is based on DBPW computations of the ionization cross section. It is likely to be as good or better than anything available elsewhere. It particular there is very little data for the L and M shells and this computation is likely to be the best resource for this information.

This function delivers the total cross section for electron impact ionization of K, L and M shells of neutral atoms of the elements from hydrogen (IZ=1) to einsteinium (IZ=99). It uses a parameterization of numerical cross sections computed with the distorted-wave and the plane-wave first-Born approximations.

References:
  * D. Bote and F. Salvat, *Calculations of inner-shell ionization by electron impact with the distorted-wave and plane-wave Born approximations*, Phys. Rev. A77, 042701 (2008).
  * D. Bote et al., *Cross sections for ionization of K, L and M shells of atoms by impact of electrons and positrons with energies up to 1 GeV.  Analytical formulas*, Atomic Data and Nuclear Data Tables 95.6 (2009) 871-909.

```@autodocs
Modules = [BoteSalvatICX]
```
