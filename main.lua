require("block")
require("dot")

function love.load()
  maxSpeed = .2
  mainDot = dot(0,0,1,1)
  currentBlocks = {}
  table.insert(currentBlocks,block(0,10,100,10))
  table.insert(currentBlocks,block(10,8,5,10))
  sfx = love.audio.newSource("assets/Jump.wav")
end

function love.update(dt)
  applyGravity(mainDot)
  applyVelocity(mainDot)
  for i = 1,table.getn(currentBlocks) do
    checkCollisions(mainDot,currentBlocks[i])
  end
end

function love.draw(dt)

  love.graphics.setBackgroundColor(200, 200, 255)
  love.graphics.scale(50, 50)
  drawDot(mainDot,currentBlocks[1])
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
  elseif (key == "b") and mainDot.onFloor then
    --love.audio.play(sfx)
    jump(mainDot)
  end
end
