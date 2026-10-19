##!/usr/bin/env julia
## add_packages.jl
#
using Pkg
Pkg.activate(@__DIR__)

packages = [
  "DrWatson",
  "DataFrames",
  "CSV",
  "Plots",
  "Literate",
  "IJulia",
  "LinearAlgebra",
  "Statistics"
]

println("Установка базовых пакетов...")
Pkg.add(packages)

println("\n✅ Все пакеты установлены!")
println("Для проверки: using DrWatson, DataFrames, CSV, Plots, Literate")
