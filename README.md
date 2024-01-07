# NeutrinoTelescopesScripts
A collection of scripts for neutrino telescope simulation

## Running Notebooks

Install julia:
```bash
curl -fsSL https://install.julialang.org | sh
```

Install Pluto:
Run `julia`. In the REPL and enter:

```julia
]add Pluto
```
(the starting "]" activates the package manager submenu)
Exit julia using CTRL+D

Switch into the notebook directory:
```bash
cd notebooks
```

Optional: Install julia packages (the notebook will install them for you otherwise)

Run julia, activating the current folder as environment
```bash
julia --project=.
```

The prompt should change, showing `notebooks`.

Add the custom julia package registry. From the julia REPL run:

```julia
]registry add https://github.com/PLEnuM-group/julia-registry.git
```

Now install the required packages:
```
]add PhotonPropagation, StaticArrays, PhysicsTools, CairoMakie, DataFrames, PlutoUI, HypertextLiteral, Rotations, LinearAlgebra
```

Exit julia and run:
```bash
julia -e "import Pluto; Pluto.run()"
```

Choose a notebook and run.
