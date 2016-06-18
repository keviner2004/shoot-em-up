local tbl = {1,2,3,4}

for k, v in pairs(tbl) do
  print(v)
  if (v == 3) then
    tbl = {}
  end
end