local Group = {}

Group.HORIZONTAL = "horizontal"
Group.VERTICAL = "vertical"

Group.new = function(options)
  local group = display.newGroup()
  group.gap = options and options.gap or 0
  group.layout = options and options.layout or Group.HORIZONTAL

  --[[
  group.oriInsert = group.insert
  function group:insert(index, child, resetTransform)
    self:oriInsert(index, child, resetTransform)
  end
  --]]

  function group:resize()
    local lt = 0
    local wh = "width"
    if self.layout == Group.HORIZONTAL then
      wh = "width"
      xy = "x"
    else
      wh = "height"
      xy = "y"
    end
    for i = 1, self.numChildren do
      lt = lt + self[i][wh]
    end
    lt = lt + (self.numChildren - 1) * self.gap
    lt = -lt/2
    for i = 1, self.numChildren do
      if i == 1 then
        self[i][xy] = lt + self[i][wh]/2
      else
        self[i][xy] = self[i-1][xy] + self[i-1][wh]/2 + self[i][wh]/2 + self.gap
      end
    end
  end

  return group
end

return Group
