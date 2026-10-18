using DrWatson
@quickactivate "project"

using Graphs
using Plots
using JLD2
using Random

include(srcdir("attack_graph.jl"))

sizes = [10, 15, 20, 21, 22, 23, 24, 25]
time_vals = Float64[]
path_counts = Int[]

Random.seed!(123)

for n in sizes
    println("Размер сети: $n")
    g = build_attack_graph(n, 0.2, Dict(), [])
    t = @elapsed paths = find_all_paths(g, 1, n)

    push!(time_vals, t)
    push!(path_counts, length(paths))

    println(" Время: $(round(t, digits=3)) с, путей: $(length(paths))")
end

plot_style = (
    background_color=:white,
    foreground_color=:grey20,
    grid=true,
    gridcolor=:grey85,
    gridlinewidth=1,
    framestyle=:box,
    margin=8Plots.mm,
)

p1 = plot(
    sizes,
    time_vals;
    marker=:circle,
    markercolor=:royalblue3,
    markerstrokecolor=:white,
    markerstrokewidth=1.5,
    linewidth=2.5,
    linecolor=:royalblue3,
    xlabel="Число узлов",
    ylabel="Время (с)",
    title="Время поиска всех путей",
    legend=false,
    plot_style...,
)

p2 = plot(
    sizes,
    path_counts;
    marker=:circle,
    markercolor=:darkorange2,
    markerstrokecolor=:white,
    markerstrokewidth=1.5,
    linewidth=2.5,
    linecolor=:darkorange2,
    xlabel="Число узлов",
    ylabel="Количество путей",
    title="Количество путей атаки",
    legend=false,
    plot_style...,
)

combined = plot(
    p1,
    p2,
    layout=(2, 1),
    link=:x,
    size=(1000, 760),
    dpi=180,
    plot_title="Исследование трудоёмкости поиска путей",
    plot_titlefontsize=15,
)

mkpath(plotsdir())
savefig(combined, plotsdir("convergence.png"))

data = Dict(:sizes => sizes, :times => time_vals, :path_counts => path_counts)
mkpath(datadir("convergence"))
@save datadir("convergence", "convergence_data.jld2") data
