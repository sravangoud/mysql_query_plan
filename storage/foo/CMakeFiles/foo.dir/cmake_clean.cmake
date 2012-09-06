FILE(REMOVE_RECURSE
  "CMakeFiles/foo.dir/ha_foo.cc.o"
  "ha_foo.pdb"
  "ha_foo.so"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/foo.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
