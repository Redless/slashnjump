function checkTargetCollisions(dotToCheck, targetToCheck, targets, index)
  if ((targetToCheck.y + targetToCheck.height) > dotToCheck.y) --its overlapping a block
  and (targetToCheck.y < (dotToCheck.y + dotToCheck.height))
  and ((targetToCheck.x + targetToCheck.width) > dotToCheck.x)
  and (targetToCheck.x < (dotToCheck.x + dotToCheck.width)) then
    table.remove(targets,index)
    if (table.getn(targets) == 0) then
      youWin()
    else
      love.audio.play(sfxshatter)
    end
  end
end

function drawTarget(drawableTarget)
  love.graphics.setColor(255, 128, 0)
  love.graphics.rectangle("fill", drawableTarget.x, drawableTarget.y, drawableTarget.width, drawableTarget.height)
end
