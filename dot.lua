function dot(x, y, width, height)
  return {x = x, y = y, width = width, height = height, xV = 0, yV = 0,
  onFloor = true, onLeftWall = false, onRightWall = false, jumping = false,
  heightJumped = 0, alreadyOnFloor = true, slashUsed = false, onCeiling = false,
  slashTime = 1,
  direction = 1} -- 1 is forward, 0 is backwards
end

function drawDot(dotToDraw)
  love.graphics.setColor(170, 20, 100)
  love.graphics.rectangle("fill", dotToDraw.x, dotToDraw.y+1/4*dotToDraw.height, dotToDraw.width, dotToDraw.height/2)
  love.graphics.rectangle("fill", dotToDraw.x+1/4*dotToDraw.width, dotToDraw.y, dotToDraw.width/2, dotToDraw.height)
  love.graphics.rectangle("fill", dotToDraw.x+dotToDraw.width/8, dotToDraw.y+dotToDraw.height/8, dotToDraw.width*3/4, dotToDraw.height*3/4)
  love.graphics.polygon("fill", getHeartx(dotToDraw)+dotToDraw.direction*3/4*dotToDraw.width, getHearty(dotToDraw)-3/4*dotToDraw.height,
  getHeartx(dotToDraw)+dotToDraw.direction*7/8*dotToDraw.width, getHearty(dotToDraw)-3/4*dotToDraw.height,
  getHeartx(dotToDraw)+dotToDraw.direction*dotToDraw.width*5/8, getHearty(dotToDraw)+3/8*dotToDraw.height,
  getHeartx(dotToDraw)+dotToDraw.direction*dotToDraw.width*4/8, getHearty(dotToDraw)+3/8*dotToDraw.height)
  if (dotToDraw.slashTime > 0) then
    love.graphics.setColor(255,255,0)
    love.graphics.polygon("fill",
    getHeartx(dotToDraw)-7/8*dotToDraw.width, getHearty(dotToDraw)-3/4*dotToDraw.height,
    getHeartx(dotToDraw)+7/8*dotToDraw.width, getHearty(dotToDraw)-3/4*dotToDraw.height,
    getHeartx(dotToDraw)+dotToDraw.width*5/8, getHearty(dotToDraw)+3/8*dotToDraw.height,
    getHeartx(dotToDraw)-dotToDraw.width*5/8, getHearty(dotToDraw)+3/8*dotToDraw.height)
  end
end

function applyVelocity(dotToUse)
  if (dotToUse.onLeftWall or dotToUse.onRightWall) then
    curMaxSpeed = maxSpeed/2
  else
    curMaxSpeed = maxSpeed
  end
  if (dotToUse.xV > 0) then
    dotToUse.x = dotToUse.x + math.min(maxSpeed, dotToUse.xV)
  else
    dotToUse.x = dotToUse.x + math.max(-maxSpeed, dotToUse.xV)
  end
  if (dotToUse.yV > 0) then
    dotToUse.y = dotToUse.y + math.min(curMaxSpeed, dotToUse.yV)
  else
    dotToUse.y = dotToUse.y + math.max(-maxSpeed, dotToUse.yV)
  end

end

function applyGravity(dotToUse)
  dotToUse.jumping = (dotToUse.heightJumped < maxJump) and (dotToUse.jumping) and love.keyboard.isDown("space")
  if not (dotToUse.jumping or dotToUse.onFloor or (dotToUse.onCeiling and not (dotToUse.onLeftWall or dotToUse.onRightWall))) then
    dotToUse.yV = dotToUse.yV + .02
  elseif dotToUse.jumping then
    dotToUse.heightJumped = dotToUse.heightJumped + .1
  end

end

function applyFriction(dotToUse)
  if dotToUse.alreadyOnFloor then
    if dotToUse.xV > 0 then
      dotToUse.xV = dotToUse.xV - .01
    elseif dotToUse.xV < 0 then
      dotToUse.xV = dotToUse.xV + .01
    end
    if math.abs(dotToUse.xV) < .1 then
      dotToUse.xV = 0
    end
  end
end

function checkCollisions (dotToCheck, blockToCheck)
  if ((blockToCheck.y + blockToCheck.height) > dotToCheck.y) --its overlapping a block
  and (blockToCheck.y < (dotToCheck.y + dotToCheck.height))
  and ((blockToCheck.x + blockToCheck.width) > dotToCheck.x)
  and (blockToCheck.x < (dotToCheck.x + dotToCheck.width)) then
    if (getHearty(dotToCheck) >= math.max(getHearty(blockToCheck),math.abs(getHeartx(dotToCheck) - getHeartx(blockToCheck))+blockToCheck.y+blockToCheck.height-blockToCheck.width/2)) then--heart is in the upper v
      --move in positive y
      dotToCheck.yV = 0
      dotToCheck.y = blockToCheck.y + blockToCheck.height

    elseif (getHearty(dotToCheck) <= math.min(getHearty(blockToCheck),-math.abs(getHeartx(dotToCheck) - getHeartx(blockToCheck))+blockToCheck.y+blockToCheck.width/2)) then
      --move in negative y
      dotToCheck.yV = 0

      dotToCheck.y = blockToCheck.y - dotToCheck.height

    elseif (getHeartx(dotToCheck) >= math.max(getHeartx(blockToCheck),math.abs(getHearty(dotToCheck) - getHearty(blockToCheck))+blockToCheck.x+blockToCheck.width-blockToCheck.height/2)) then
      --move in positive x

      dotToCheck.xV = 0
      dotToCheck.x = blockToCheck.x + blockToCheck.width

    elseif (getHeartx(dotToCheck) <= math.min(getHeartx(blockToCheck),-math.abs(getHearty(dotToCheck) - getHearty(blockToCheck))+blockToCheck.x+blockToCheck.height/2)) then
      --move in negative x

      dotToCheck.xV = 0
      dotToCheck.x = blockToCheck.x - dotToCheck.width
    end
  end
end

function checkWalls(dotToCheck, blockToCheck)
  --here we're checking for wall jump opportunities
  if (dotToCheck.x + dotToCheck.width == blockToCheck.x) and (getHearty(dotToCheck) >= blockToCheck.y) and (getHearty(dotToCheck) <= blockToCheck.y + blockToCheck.height) then
    dotToCheck.onRightWall = true
    dotToCheck.direction = -1
    dotToCheck.slashUsed = false
  end
  if (dotToCheck.x == blockToCheck.width + blockToCheck.x) and (getHearty(dotToCheck) >= blockToCheck.y) and (getHearty(dotToCheck) <= blockToCheck.y + blockToCheck.height) then
    dotToCheck.onLeftWall = true
    dotToCheck.direction = 1
    dotToCheck.slashUsed = false
  end
  if (dotToCheck.y + dotToCheck.height == blockToCheck.y) and (dotToCheck.x + dotToCheck.width > blockToCheck.x) and (dotToCheck.x < blockToCheck.x + blockToCheck.width) then
    dotToCheck.onFloor = true
    dotToCheck.slashUsed = false
  end
  if (dotToCheck.y == blockToCheck.height + blockToCheck.y) and (dotToCheck.x + dotToCheck.width > blockToCheck.x) and (dotToCheck.x < blockToCheck.x + blockToCheck.width) then
    dotToCheck.onCeiling = true
    dotToCheck.slashUsed = false
  end
end

function jump(dotToJump)
  dotToJump.heightJumped = 0
  love.audio.play(sfxjump)
  --dotToJump.onFloor = false
  dotToJump.jumping = true
  dotToJump.yV = -.2
end

function leftWallKick(dotToJump)
  love.audio.play(sfxkick)
  dotToJump.heightJumped = 0
  dotToJump.onLeftWall = false
  dotToJump.jumping = true
  dotToJump.yV = -.2
  dotToJump.xV = .2
  dotToJump.direction = 1
end

function rightWallKick(dotToJump)
  love.audio.play(sfxkick)
  dotToJump.heightJumped = 0
  dotToJump.onRightWall = false
  dotToJump.jumping = true
  dotToJump.yV = -.2
  dotToJump.xV = -.2
  dotToJump.direction = -1
end

function slash(dotToSlash)
  if not dotToSlash.slashUsed then
    dotToSlash.slashTime = 10
    love.audio.play(sfxslash)
    dotToSlash.slashUsed = true
    dotToSlash.direction = -dotToSlash.direction
  end
end

function decrementSlashTime(dotToUse)
  dotToUse.slashTime = dotToUse.slashTime - 1
end

function gameOver(dotToKill)
  love.audio.play(sfxdead)
  loadLevel(levelOn)
end
