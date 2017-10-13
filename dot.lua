function dot(x, y, width, height)
  return {x = x, y = y, width = width, height = height, xV = 0, yV = 0,
  onFloor = false, onLeftWall = false, onRightWall = false, onCeiling = false,
  direction = 1} -- 1 is forward, 0 is backwards
end

function drawDot(dotToDraw)
  love.graphics.setColor(170, 20, 100)
  love.graphics.rectangle("fill", dotToDraw.x, dotToDraw.y, dotToDraw.width, dotToDraw.height)
end

function applyAcceleration(dotToUse)
  dotToUse.x =

  dotToUse.x

  +

  dotToUse.xV
  dotToUse.y = dotToUse.y + dotToUse.yV
end
