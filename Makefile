# Constants
export JULIA := julia


# Configurations
.SUFFIXES:
.DELETE_ON_ERROR:
.SECONDARY:
.ONESHELL:
export SHELL := /bin/bash
export SHELLOPTS := pipefail:errexit:nounset:noclobber


.PHONY: all check
all:


check:
check: test/runtests.jl.done


test/runtests.jl.done: src/Transducers.jl


test/%.jl.done: test/%.jl
	JULIA_LOAD_PATH="$(CURDIR)/src:$${JULIA_LOAD_PATH:-}" $(JULIA) $< && touch $@
