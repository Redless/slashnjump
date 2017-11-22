function loadLevel(level)
  --creates borders
  mainDot = dot(10,10,6/10,1)--9/10,7/10)
  currentBlocks = {}
  currentElectroBlocks = {}
  currentSigns = {}
  table.insert(currentBlocks,block(0,-1,level.x,1))
  table.insert(currentBlocks,block(-1,0,1,level.y))
  table.insert(currentBlocks,block(0,level.y,level.x,1))
  table.insert(currentBlocks,block(level.x,0,1,level.y))
  --loads blocks
  for i = 1,table.getn(level.blocks) do
    table.insert(currentBlocks,block(level.blocks[i][1],level.blocks[i][2],level.blocks[i][3],level.blocks[i][4]))
  end
  for i = 1,table.getn(level.electroBlocks) do
    table.insert(currentElectroBlocks,block(level.electroBlocks[i][1],level.electroBlocks[i][2],level.electroBlocks[i][3],level.electroBlocks[i][4]))
  end
  for i = 1,table.getn(level.signs) do
    table.insert(currentSigns,newText(level.signs[i][1],level.signs[i][2],level.signs[i][3]))
  end
  --loads camera
  loadCamera(level.x,level.y)
  --sets maindot position
  mainDot.x = level.startX
  mainDot.y = level.startY
end
everyLevel = {
{x = 50, y = 50, startX = 2, startY = 2, blocks = {
{0,12,20,5},
{25,15,50,5},
{5,0,3,5},
{25,15,2,55}
},
electroBlocks = {
{6,45,2,2}
},
signs = {
{"hello!",30,10}
}
}
}
