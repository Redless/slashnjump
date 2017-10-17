function loadCamera()
  cameraX = 0
  cameraY = 0
end

function updateCamera(dotToUse)
  if (dotToUse.x < (cameraX + 1/3*love.graphics.getWidth()/30)) then
    cameraX = dotToUse.x - (1/3*love.graphics.getWidth()/30)
  elseif (dotToUse.x > (cameraX + 2/3*love.graphics.getWidth()/30)) then
    cameraX = dotToUse.x - (2/3*love.graphics.getWidth()/30)
  end
end
