function loadCamera(maxX, maxY, dotToUse)
  cameraX = -4
  cameraY = -4
  camXMax = maxX
  camYMax = maxY
end

function updateCamera(dotToUse)
  if (dotToUse.x < (cameraX + 1/5*love.graphics.getWidth()/30)) and (1/5*love.graphics.getWidth()/30-4 < dotToUse.x) then
    cameraX = dotToUse.x - (1/5*love.graphics.getWidth()/30)
  elseif (dotToUse.x > (cameraX + 4/5*love.graphics.getWidth()/30)) and (camXMax >= dotToUse.x) then
    cameraX = dotToUse.x - (4/5*love.graphics.getWidth()/30)
  end
  if (dotToUse.y < (cameraY + 1/5*love.graphics.getHeight()/30)) and (1/5*love.graphics.getHeight()/30-4 < dotToUse.y) then
    cameraY = dotToUse.y - (1/5*love.graphics.getHeight()/30)
  elseif (dotToUse.y > (cameraY + 4/5*love.graphics.getHeight()/30)) and (camYMax >= dotToUse.y) then
    cameraY = dotToUse.y - (4/5*love.graphics.getHeight()/30)
  end
end
