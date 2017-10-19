function loadLevel(level)
  --creates borders
  currentBlocks = {}
  table.insert(currentBlocks,block(-100,-100,level.x+200,100))
  table.insert(currentBlocks,block(-100,-100,100,level.y+200))
  table.insert(currentBlocks,block(-100,level.y,level.x+200,100))
  table.insert(currentBlocks,block(level.x,-100,100,level.y+200))
  --loads blocks
  for i = 1,table.getn(level.blocks) do
    table.insert(currentBlocks,block(level.blocks[i][1],level.blocks[i][2],level.blocks[i][3],level.blocks[i][1]))
  end
  --loads camera
  loadCamera(level.x,level.y)
  --sets maindot position
  mainDot.x = level.startX
  mainDot.y = level.startY
end

firstLevel = {x = 30, y = 30, startX = 5, startY = 5, blocks = {
{0,12,20,5},
--{25,15,50,5},
--{5,0,3,15},
--{25,15,2,55}
}
}
