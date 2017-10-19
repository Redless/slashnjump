function updateInGame(dt)

  mainDot.onLeftWall = false
  mainDot.onRightWall = false
  mainDot.onFloor = false
  for i = 1,table.getn(currentBlocks) do
    checkWalls(mainDot,currentBlocks[i])
  end
  applyVelocity(mainDot)
  applyGravity(mainDot)
  applyFriction(mainDot)
  for i = 1,table.getn(currentBlocks) do
    checkCollisions(mainDot,currentBlocks[i])
  end
  if (not mainDot.alreadyOnFloor) and (mainDot.onFloor) and (not mainDot.onLeftWall) and (not mainDot.onRightWall) then
    mainDot.xV = .6 * mainDot.direction
    love.audio.play(sfxtouchdown)
  end
  mainDot.alreadyOnFloor = mainDot.onFloor
end

function drawInGame(dt)
  love.graphics.print(mainDot.x)
  love.graphics.print(mainDot.y,0,170)
  updateCamera(mainDot)
  love.graphics.setBackgroundColor(200, 200, 255)
  love.graphics.scale(30, 30)
  love.graphics.translate(-cameraX, -cameraY)
  drawDot(mainDot)
  for i = 1,table.getn(currentBlocks) do
    drawBlock(currentBlocks[i])
  end
end
