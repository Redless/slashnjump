function drawTargetCounter(numTargets)
  love.graphics.setColor(255, 128, 0)
  for i = 1,numTargets do
    love.graphics.rectangle("fill", love.graphics.getWidth()-50-i*50, 90, 40, 40)
  end
end

function drawTimer()
  love.graphics.setFont(timerFont)
  love.graphics.setColor(170, 20, 100)
  love.graphics.print(math.floor(timer*10)/10, love.graphics.getWidth()-150,5)
end
