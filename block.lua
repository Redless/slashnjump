function block(x, y, width, height)
  return {x = x, y = y, width = width, height = height}
end

function drawBlock(drawableBlock)
  love.graphics.setColor(10, 50, 80)
  love.graphics.rectangle("fill", drawableBlock.x, drawableBlock.y, drawableBlock.width, drawableBlock.height)
end