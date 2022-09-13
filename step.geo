// usage: -setstring STEP_FILE <name of step file>

SetFactory("OpenCASCADE");
Printf(STEP_FILE);
v() = ShapeFromFile(STEP_FILE);

s() = Surface{:};

For i In {0 : #s()-1}
  color() = Color Surface {s(i)};
  // Printf("id %g, color len %g", i, #color());
  cstr~{i} = Sprintf("color_%g_%g_%g", color(0), color(1), color(2));
  If (#color() >= 3)
    // Printf(Sprintf("color_%g_%g_%g", color(0), color(1), color(2)));
    If (GetNumber(Sprintf("color_%g_%g_%g", color(0), color(1), color(2)), 0) == 0)
      // Printf("reset color %g %g %g", color(0), color(1), color(2));
      SetNumber(Sprintf("color_%g_%g_%g", color(0), color(1), color(2)), 1);
      Physical Surface(Sprintf("color_%g_%g_%g", color(0), color(1), color(2))) = {};
    Else
      // Printf("noreset color %g %g %g %g", color(0), color(1), color(2), GetNumber(Sprintf("color_%g_%g_%g", color(0), color(1), color(2)), 0));
    EndIf
    Physical Surface(Sprintf("color_%g_%g_%g", color(0), color(1), color(2))) += s(i);
  EndIf
EndFor
