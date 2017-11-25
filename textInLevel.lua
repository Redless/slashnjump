function newText(text,x,y)
  return {text = text, x = x, y = y}
end

function drawText(text)
  love.graphics.setFont(normalFont)
  love.graphics.setColor(170, 20, 100)
  love.graphics.print(text.text, text.x, text.y, 0, 1/15)
end
