function drawTargetCounter(numTargets)
  love.graphics.setColor(255, 128, 0)
  for i = 1,numTargets do
    love.graphics.rectangle("fill", x, y, width, height)
  end
end

function drawTimer(timerToDraw)
  love.window.getWidth()
end
