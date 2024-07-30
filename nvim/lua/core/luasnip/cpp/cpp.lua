function to_string(file)
  local lines = {}
  for line in io.lines(file) do
    table.insert(lines, line)
  end
  return lines
end

local home = "/home/tomato/pr/"

return {
  s("main", t(to_string(home .. "cp/template/main.cpp"))),
  s("segtree", t(to_string(home .. "algo/segment_tree/segment_tree.h")))
}
