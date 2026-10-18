.PHONY: all clean cleanall

PROJECT := ../project
SWEEP_PLOT := $(PROJECT)/plots/parameter_sweep.png

all: $(SWEEP_PLOT)
	quarto render

$(SWEEP_PLOT): $(PROJECT)/scripts/parameter_sweep.jl $(PROJECT)/src/simulation.jl $(PROJECT)/Project.toml
	julia --project=$(PROJECT) $(PROJECT)/scripts/parameter_sweep.jl

clean:
	rm -rf _output

cleanall: clean
	rm -rf .quarto
