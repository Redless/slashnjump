function checkTargetCollisions(dotToCheck, targets, index)
  if ((targets[index].y + targets[index].height) > dotToCheck.y) --its overlapping a block
  and (targets[index].y < (dotToCheck.y + dotToCheck.height))
  and ((targets[index].x + targets[index].width) > dotToCheck.x)
  and (targets[index].x < (dotToCheck.x + dotToCheck.width)) then
    table.remove(targets,index)
    if (table.getn(targets) == 0) then
      youWin()
    else
      love.audio.play(sfxshatter)
    end
    return true
  end
  return false
end

function drawTarget(drawableTarget)
  love.graphics.setColor(255, 128, 0)
  love.graphics.rectangle("fill", drawableTarget.x, drawableTarget.y, drawableTarget.width, drawableTarget.height)
end
