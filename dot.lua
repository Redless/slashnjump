function dot(x, y, width, height)
  return {x = x, y = y, width = width, height = height, xV = 0, yV = 0,
  onFloor = false, onLeftWall = false, onRightWall = false, jumping = false,
  heightJumped = 0,
  direction = 1} -- 1 is forward, 0 is backwards
end

function drawDot(dotToDraw, blockToCheck)
  love.graphics.setColor(170, 20, 100)
  love.graphics.rectangle("fill", dotToDraw.x, dotToDraw.y, dotToDraw.width, dotToDraw.height)
end

function applyVelocity(dotToUse)
  if (dotToUse.xV > 0) then
    dotToUse.x = dotToUse.x + math.min(maxSpeed, dotToUse.xV)
  else
    dotToUse.x = dotToUse.x + math.max(-maxSpeed, dotToUse.xV)
  end
  if (dotToUse.yV > 0) then
    dotToUse.y = dotToUse.y + math.min(maxSpeed, dotToUse.yV)
  else
    dotToUse.y = dotToUse.y + math.max(-maxSpeed, dotToUse.yV)
  end

end

function applyGravity(dotToUse)
  dotToUse.jumping = (dotToUse.heightJumped < 3) and (dotToUse.jumping) and love.keyboard.isDown("b")
  if not (dotToUse.jumping) then
    dotToUse.yV = dotToUse.yV + .02
  else
    dotToUse.heightJumped = dotToUse.heightJumped + .1
  end

end

function checkCollisions (dotToCheck, blockToCheck)
  if ((blockToCheck.y + blockToCheck.height) > dotToCheck.y) --its overlapping a block
  and (blockToCheck.y < (dotToCheck.y + dotToCheck.height))
  and ((blockToCheck.x + blockToCheck.width) > dotToCheck.x)
  and (blockToCheck.x < (dotToCheck.x + dotToCheck.width)) then
    if (getHearty(dotToCheck)) >= ((blockToCheck.height/blockToCheck.width)*math.abs(getHeartx(dotToCheck)-getHeartx(blockToCheck))+getHearty(blockToCheck)) then--heart is in the upper v
      --move up in positive y
      dotToCheck.yV = 0
      dotToCheck.y = blockToCheck.y + blockToCheck.height
    elseif (getHearty(dotToCheck)) <= ((-blockToCheck.height/blockToCheck.width)*math.abs(getHeartx(dotToCheck)-getHeartx(blockToCheck))+getHearty(blockToCheck)) then
      --move in negative y
      dotToCheck.yV = 0
      dotToCheck.onFloor = true
      dotToCheck.y = blockToCheck.y - dotToCheck.height
    elseif (getHeartx(dotToCheck)) >= ((blockToCheck.width/blockToCheck.height)*math.abs(getHearty(dotToCheck)-getHearty(blockToCheck))+getHeartx(blockToCheck)) then
      --move in positive x
      dotToCheck.xV = 0
      dotToCheck.x = blockToCheck.x + blockToCheck.width
    elseif (getHeartx(dotToCheck)) <= ((-blockToCheck.width/blockToCheck.height)*math.abs(getHearty(dotToCheck)-getHearty(blockToCheck))+getHeartx(blockToCheck)) then
      --move in negative x
      dotToCheck.xV = 0
      dotToCheck.x = blockToCheck.x - dotToCheck.width
    end
  end
end

function jump(dotToJump)
  dotToJump.heightJumped = 0
  dotToJump.onFloor = false
  dotToJump.jumping = true
  dotToJump.yV = -.2
end
