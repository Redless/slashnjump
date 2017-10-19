function loadLevel(level)
  --creates borders
  currentBlocks = {}
  table.insert(currentBlocks,block(0,-1,level.x,1))
  table.insert(currentBlocks,block(-1,0,1,level.y))
  table.insert(currentBlocks,block(0,level.y,level.x,9))
  table.insert(currentBlocks,block(level.x,0,9,level.y+8))
  --loads blocks
  for i = 1,table.getn(level.blocks) do
    table.insert(currentBlocks,block(level.blocks[i][1],level.blocks[i][2],level.blocks[i][3],level.blocks[i][4]))
  end
  --loads camera
  loadCamera(level.x,level.y)
  --sets maindot position
  mainDot.x = level.startX
  mainDot.y = level.startY
end

firstLevel = {x = 10, y = 10, startX = 2, startY = 2, blocks = {
--{0,12,20,5},
--{25,15,50,5},
--{5,0,3,15},
--{25,15,2,55}
}
}
