function updateInGame(dt)
  timer = timer + dt
  mainDot.onLeftWall = false
  mainDot.onRightWall = false
  mainDot.onCeiling = false
  mainDot.onFloor = false
  for i = 1,table.getn(currentBlocks) do
    checkWalls(mainDot,currentBlocks[i])
  end
  applyVelocity(mainDot)
  applyGravity(mainDot)
  applyFriction(mainDot)
  for i = 1,table.getn(currentElectroBlocks) do
    checkElectroCollisions(mainDot,currentElectroBlocks[i])
  end
  for i = 1,table.getn(currentBlocks) do
    checkCollisions(mainDot,currentBlocks[i])
  end
  if (mainDot.slashTime > 0) then
    for i = 1,table.getn(currentTargets) do
      if checkTargetCollisions(mainDot,currentTargets,i) then
        break
      end
    end
  end
  if (not mainDot.alreadyOnFloor) and (mainDot.onFloor) and (not mainDot.onLeftWall) and (not mainDot.onRightWall) then
    mainDot.xV = .6 * mainDot.direction
    love.audio.play(sfxtouchdown)
  end
  mainDot.alreadyOnFloor = mainDot.onFloor
end

function drawInGame(dt)
  updateCamera(mainDot)
  love.graphics.scale(30, 30)
  love.graphics.translate(-cameraX, -cameraY)
  decrementSlashTime(mainDot)
  drawDot(mainDot)
  for i = 1,table.getn(currentSigns) do
    drawText(currentSigns[i])
  end
  for i = 1,table.getn(currentBlocks) do
    drawBlock(currentBlocks[i])
  end
  for i = 1,table.getn(currentElectroBlocks) do
    drawElectroBlock(currentElectroBlocks[i])
  end
  for i = 1,table.getn(currentTargets) do
    drawTarget(currentTargets[i])
  end
  love.graphics.reset()
  love.graphics.setBackgroundColor(200, 200, 255)
  drawTargetCounter(table.getn(currentTargets))
  drawTimer()
end

function youWin()
  love.audio.play(sfxwin)
  mode = "menu"
  currentMenuIn = 1
end
