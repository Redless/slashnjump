require("block")
require("dot")

function love.load()
  mainDot = dot(0,0,1,1)
  currentBlocks = {}
  table.insert(currentBlocks,block(10,10,1,1))
end

function love.update(dt)
  -- body...
end

function love.draw(dt)
  love.graphics.scale(50, 50)
  drawDot(mainDot)
  for i = 1,table.getn(currentBlocks) do
    drawBlock(currentBlocks[i])
  end
end

function love.keypressed(key)

end
