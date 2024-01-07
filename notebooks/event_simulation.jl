### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 0e3b6bac-ad5b-11ee-3d06-39ca762f6e94
begin
    import Pkg
	# Pkg.Registry.add(Pkg.RegistrySpec(url = "https://github.com/PLEnuM-group/julia-registry.git"))
	
    Pkg.activate(Base.current_project())
	#Pkg.activate()

	
	Pkg.add([
        Pkg.PackageSpec(name="PhotonPropagation"),
        Pkg.PackageSpec(name="StaticArrays"),
		Pkg.PackageSpec(name="PhysicsTools"),
		Pkg.PackageSpec(name="CairoMakie"),
		Pkg.PackageSpec(name="DataFrames"),
		Pkg.PackageSpec(name="PlutoUI"),
		Pkg.PackageSpec(name="HypertextLiteral"),
		Pkg.PackageSpec(name="Rotations"),
		Pkg.PackageSpec(name="LinearAlgebra"),
		Pkg.PackageSpec(name="DataStructures"),
		Pkg.PackageSpec(name="Distributions"),
		Pkg.PackageSpec(url="https://github.com/PLEnuM-group/NeutrinoTelescopes.git"),
    ])
	#Pkg.update()
    Pkg.instantiate()

	
    using PhotonPropagation
	using StaticArrays
	using PhysicsTools
	using CairoMakie
	using DataFrames
	using PlutoUI
	using HypertextLiteral
	using Rotations
	using LinearAlgebra
	using NeutrinoTelescopes
	using DataStructures
	using Distributions
end

# ╔═╡ 0b8e663a-5eec-4aee-8149-e04cba79f143
md"""
# Event Simulation
"""

# ╔═╡ 5d2a7b60-ec13-4e27-ae24-6bd30464da8e
begin
	targets_three_l = [
	    make_detector_line(@SVector[-25.0, 0.0, 0.0], 20, 50, 1),
	    make_detector_line(@SVector[25.0, 0.0, 0.0], 20, 50, 21),
	    make_detector_line(@SVector[0.0, sqrt(50^2 - 25^2), 0.0], 20, 50, 41)]
	medium = make_cascadia_medium_properties(0.95f0)
	d = LineDetector(targets_three_l, medium)
end

# ╔═╡ c4e656bd-8f83-4bc2-acd9-cf252ec28645
begin
	cylinder = get_bounding_cylinder(d)
	pdist = CategoricalSetDistribution(OrderedSet([PMuPlus, PMuMinus]), [0.5, 0.5])
	edist = Pareto(1, 1E4) + 1E4 # E^-1 Powerlaw starting at 10TeV
	ang_dist = LowerHalfSphere() # Facing inwards
	length_dist = Dirac(1E4)
	time_dist = Dirac(0.0)
	#inj = VolumeInjector(cylinder, edist, pdist, ang_dist, length_dist, time_dist)
	inj = SurfaceInjector(CylinderSurface(cylinder), edist, pdist, ang_dist, length_dist, time_dist)
end

# ╔═╡ b9e031e3-f4b7-46cd-8fc7-09d0c95dcf1c
rand(inj)

# ╔═╡ Cell order:
# ╟─0e3b6bac-ad5b-11ee-3d06-39ca762f6e94
# ╠═0b8e663a-5eec-4aee-8149-e04cba79f143
# ╠═5d2a7b60-ec13-4e27-ae24-6bd30464da8e
# ╠═c4e656bd-8f83-4bc2-acd9-cf252ec28645
# ╠═b9e031e3-f4b7-46cd-8fc7-09d0c95dcf1c
