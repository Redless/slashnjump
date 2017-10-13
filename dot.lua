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
  dotToUse.x = dotToUse.x + dotToUse.xV
  dotToUse.y = dotToUse.y + dotToUse.yV
end

function checkCollisions (dotToCheck, blockToCheck)
  if ((blockToCheck.y + blockToCheck.height) > dotToCheck.y) --its overlapping a block
  and (blockToCheck.y < (dotToCheck.y + dotToCheck.height))
  and ((blockToCheck.x + blockToCheck.width) > dotToCheck.x)
  and (blockToCheck.x < (dotToCheck.x + dotToCheck.width)) then
    if (getHearty(dotToCheck)) >= (blockToCheck.height/blockToCheck.width*math.abs(getHeartx(dotToCheck)-getHeartx(blockToCheck))+getHearty(blockToCheck)) then--heart is in the upper v
      --move up in positive y
      dotToCheck.yV = 0
      dotToCheck.y = blockToCheck.y + blockToCheck.height
    elseif (getHearty(dotToCheck)) <= (-blockToCheck.height/blockToCheck.width*math.abs(getHeartx(dotToCheck)-getHeartx(blockToCheck))+getHearty(blockToCheck)) then
      --move in negative y
      dotToCheck.yV = 0
      dotToCheck.y = blockToCheck.y - dotToCheck.height
    elseif (getHeartx(dotToCheck)) >= (blockToCheck.width/blockToCheck.height*math.abs(getHearty(dotToCheck)-getHearty(blockToCheck))+getHeartx(blockToCheck)) then
      --move in positive x
      dotToCheck.xV = 0
      dotToCheck.x = blockToCheck.x + blockToCheck.width
    else
      --move in negative x
      dotToCheck.xV = 0
      dotToCheck.x = blockToCheck.x - dotToCheck.width
    end
  end
end
