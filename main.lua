require("block")
require("dot")

function love.load()
  mainDot = dot(0,0,1,1)
  currentBlocks = {}
  table.insert(currentBlocks,block(10,10,1,1))
end

function love.update(dt)
  applyAcceleration(mainDot)
  for i = 1,table.getn(currentBlocks) do
    checkCollisions(mainDot,currentBlocks[i])
  end
end

function love.draw(dt)
  love.graphics.setBackgroundColor(200, 200, 255)
  love.graphics.scale(50, 50)
  drawDot(mainDot)
  for i = 1,table.getn(currentBlocks) do
    drawBlock(currentBlocks[i])
  end
end

function love.keypressed(key)
  if key == "w" then
    mainDot.yV = mainDot.yV - .1
  elseif key == "a" then
    mainDot.xV = mainDot.xV - .1
  elseif key == "s" then
    mainDot.yV = mainDot.yV + .1
  elseif key == "d" then
    mainDot.xV = mainDot.xV + .1
  end
end
