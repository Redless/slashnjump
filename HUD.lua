function drawTargetCounter(numTargets)
  love.graphics.setColor(255, 128, 0)
  for i = 1,numTargets do
    love.graphics.rectangle("fill", love.graphics.getWidth()-50-i*50, 20, 40, 40)
  end
end

function drawTimer(timerToDraw)
  love.window.getWidth()
end
