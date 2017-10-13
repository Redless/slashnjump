require("block")
require("dot")

function love.load()
  maxJump = 3
  maxSpeed = .2
  mainDot = dot(0,0,1,1)
  currentBlocks = {}
  table.insert(currentBlocks,block(0,10,100,10))
  table.insert(currentBlocks,block(10,5,5,500))
  sfx = love.audio.newSource("assets/Jump.wav")
end

function love.update(dt)
  mainDot.onLeftWall = false
  mainDot.onRightWall = false
  for i = 1,table.getn(currentBlocks) do
    checkWalls(mainDot,currentBlocks[i])
  end
  applyVelocity(mainDot)
  applyGravity(mainDot)
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
  elseif (key == "space") and mainDot.onFloor then
    --love.audio.play(sfx)
    jump(mainDot)
  elseif (key == "space") and mainDot.onLeftWall then
    leftWallKick(mainDot)
  elseif (key == "space") and mainDot.onRightWall then
    rightWallKick(mainDot)
  end
end
