function block(x, y, width, height)
  return {x = x, y = y, width = width, height = height}
end

function drawBlock(drawableBlock)
  love.graphics.setColor(10, 50, 80)
  love.graphics.rectangle("fill", drawableBlock.x, drawableBlock.y, drawableBlock.width, drawableBlock.height)
end

function getHeartx(heartHaver)
  return (heartHaver.x+heartHaver.width/2)
end

function getHearty(heartHaver)
  return (heartHaver.y+heartHaver.height/2)
end
