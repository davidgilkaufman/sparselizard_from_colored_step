#include "sparselizard.h"
#include "gmsh.h"
#include <iostream>

using namespace sl;

int getPhysicalNumber(const std::string &name)
{
  gmsh::vectorpair groups;
  gmsh::model::getPhysicalGroups(groups);

  for (auto group : groups)
  {
    std::string scratchName;
    gmsh::model::getPhysicalName(group.first, group.second, scratchName);
    if (name == scratchName) {
      return group.second;
    }
  }
  return -1;
}

int main(void)
{	
    // Init gmsh and load the mesh
    gmsh::initialize();
    gmsh::open("color_test.msh");

    // mesh, gmsh -> sparselizard
    mesh steptest("gmsh:api", 0);

    // color labels, gmsh -> sparselizard
    const std::string colors[] = {"color_255_0_0", "color_0_255_0", "color_0_0_255"};
    for (auto color : colors) {
      int num = getPhysicalNumber(color);
      std::cout << color << " " << num << std::endl;
    }

    // clean up gmsh
    gmsh::finalize();
}

