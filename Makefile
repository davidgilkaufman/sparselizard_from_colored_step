all: color_test color_test.msh

color_test.step: color_test.slvs
	solvespace-cli export-surfaces --output color_test.step color_test.slvs >/dev/null 2>/dev/null

color_test: color_test.cpp
	c++ -O3 -I /usr/include/sparselizard -l sparselizard -lpetsc -lgmsh -o color_test color_test.cpp

%.msh: %.step step.geo
	gmsh step.geo -v 3 -3 -o $@ -format msh2 -setstring STEP_FILE $< 1>/dev/null

clean:
	rm -f color_test.msh color_test color_test.step

.PHONY: all clean
