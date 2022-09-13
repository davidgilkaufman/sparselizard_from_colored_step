# Solvespace model -> Sparselizard Simulation Framework

This is an example project demonstrating a framework for running sparselizard simulations on 3D models designed in other software.

Files:

- color_test.slvs: solvespace file defining a solid with colored surfaces
  - generates color_test.step
- step.geo: gmsh file that converts step files into msh files
  - generates color_test.msh
- color_test.cpp: parses the mesh, and extracts surface tags for use in sparselizard based on the surface colors

# Requirements

- solvespace (generates colored STEP files)
- gmsh (STEP -> msh)
- sparselizard (simulation)

# Usage

make && ./color_test
