function dot(x, y, width, height)
  return {x = x, y = y, width = width, height = height, xV = 0, yV = 0,
  onFloor = false, onLeftWall = false, onRightWall = false}
end

function drawDot(dotToDraw)
  love.graphics.setColor(170, 20, 100)
  love.graphics.rectangle("fill", dotToDraw.x, dotToDraw.y, dotToDraw.width, dotToDraw.height)
end
