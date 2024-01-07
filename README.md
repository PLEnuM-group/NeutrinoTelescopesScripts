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
Exit julia using CTRL+D

Switch into the notebook directory:
```julia
cd notebooks
julia -e "import Pluto; Pluto.run()"
```

Choose a notebook and run.
