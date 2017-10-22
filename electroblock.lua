function checkElectroCollisions(dotToCheck, blockToCheck)
  if ((blockToCheck.y + blockToCheck.height) > dotToCheck.y) --its overlapping a block
  and (blockToCheck.y < (dotToCheck.y + dotToCheck.height))
  and ((blockToCheck.x + blockToCheck.width) > dotToCheck.x)
  and (blockToCheck.x < (dotToCheck.x + dotToCheck.width)) then
    gameOver(dotToCheck)
  end
end

function drawElectroBlock(drawableBlock)
  love.graphics.setColor(230, 250, 0)
  love.graphics.rectangle("fill", drawableBlock.x, drawableBlock.y, drawableBlock.width, drawableBlock.height)
end
