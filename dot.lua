function dot(x, y, width, height)
  return {x = x, y = y, width = width, height = height, xV = 0, yV = 0,
  onFloor = false, onLeftWall = false, onRightWall = false, jumping = false,
  heightJumped = 0,
  direction = 1} -- 1 is forward, 0 is backwards
end

function drawDot(dotToDraw, blockToCheck)
  love.graphics.setColor(170, 20, 100)
  love.graphics.rectangle("fill", dotToDraw.x, dotToDraw.y, dotToDraw.width, dotToDraw.height,.4,.4)
end

function applyVelocity(dotToUse)
  if (dotToUse.onLeftWall or dotToUse.onRightWall) then
    curMaxSpeed = maxSpeed/2
  else
    curMaxSpeed = maxSpeed
  end
  if (dotToUse.xV > 0) then
    dotToUse.x = dotToUse.x + math.min(curMaxSpeed, dotToUse.xV)
  else
    dotToUse.x = dotToUse.x + math.max(-curMaxSpeed, dotToUse.xV)
  end
  if (dotToUse.yV > 0) then
    dotToUse.y = dotToUse.y + math.min(curMaxSpeed, dotToUse.yV)
  else
    dotToUse.y = dotToUse.y + math.max(-curMaxSpeed, dotToUse.yV)
  end

end

function applyGravity(dotToUse)
  dotToUse.jumping = (dotToUse.heightJumped < maxJump) and (dotToUse.jumping) and love.keyboard.isDown("space")
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
    if (dotToCheck.yV <= 0) and (getHearty(dotToCheck)) >= ((blockToCheck.height/blockToCheck.width)*math.abs(getHeartx(dotToCheck)-getHeartx(blockToCheck))+getHearty(blockToCheck)) then--heart is in the upper v
      --move up in positive y
      dotToCheck.yV = 0
      dotToCheck.y = blockToCheck.y + blockToCheck.height
    elseif (dotToCheck.yV >= 0) and (getHearty(dotToCheck)) <= ((-blockToCheck.height/blockToCheck.width)*math.abs(getHeartx(dotToCheck)-getHeartx(blockToCheck))+getHearty(blockToCheck)) then
      --move in negative y
      dotToCheck.yV = 0
      dotToCheck.onFloor = true
      dotToCheck.y = blockToCheck.y - dotToCheck.height
    elseif (dotToCheck.xV <= 0) and (getHeartx(dotToCheck)) >= ((blockToCheck.width/blockToCheck.height)*math.abs(getHearty(dotToCheck)-getHearty(blockToCheck))+getHeartx(blockToCheck)) then
      --move in positive x
      dotToCheck.onLeftWall = true
      dotToCheck.xV = 0
      dotToCheck.x = blockToCheck.x + blockToCheck.width
    elseif (dotToCheck.xV >= 0) and (getHeartx(dotToCheck)) <= ((-blockToCheck.width/blockToCheck.height)*math.abs(getHearty(dotToCheck)-getHearty(blockToCheck))+getHeartx(blockToCheck)) then
      --move in negative x
      dotToCheck.onRightWall = true
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

function leftWallKick(dotToJump)
  dotToJump.heightJumped = 0
  dotToJump.onLeftWall = false
  dotToJump.jumping = true
  dotToJump.yV = -.2
  dotToJump.xV = .2
end

function rightWallKick(dotToJump)
  dotToJump.heightJumped = 0
  dotToJump.onRightWall = false
  dotToJump.jumping = true
  dotToJump.yV = -.2
  dotToJump.xV = -.2
end
