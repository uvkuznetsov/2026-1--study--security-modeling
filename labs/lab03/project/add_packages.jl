##!/usr/bin/env julia
## add_packages.jl
#
using Pkg
Pkg.activate(@__DIR__)

packages = [
  "DrWatson",
  "Distributions",
  "StatsPlots",
  "DifferentialEquations",
  "Plots",
  "DataFrames",
  "CSV",
  "JLD2",
  "Literate",
  "IJulia",
  "BenchmarkTools",
  "Quarto",
  "Graphs",
  "GraphRecipes",
  "StatsBase",
  "Random",
  "Statistics",
  "LinearAlgebra"
]

println("Установка базовых пакетов...")
Pkg.add(packages)

println("\n✅ Все пакеты установлены!")
println("Для проверки: using DrWatson, Graphs, GraphRecipes, Plots")
