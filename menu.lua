function drawInMenus(args)
  love.graphics.setBackgroundColor(200, 200, 255)
  for i = 1,table.getn(everyMenu[currentMenuIn]) do
    drawMenuButton(i,everyMenu[currentMenuIn][i])
  end
end

function menuButton(text, path)
  return {text = text, path = path}
end

function drawMenuButton(number,buttonToDraw)
  love.graphics.setColor(100, 100, 110)
  love.graphics.rectangle("fill", love.graphics.getWidth()*2/9, (number+2)*love.graphics.getHeight()/7, love.graphics.getWidth()*5/9, love.graphics.getHeight()/7-5,(love.graphics.getHeight()/7-5)/2,(love.graphics.getHeight()/7-5)/2)
  love.graphics.setColor(10, 10, 30)

  love.graphics.setFont(normalFont)
  love.graphics.printf(buttonToDraw.text, love.graphics.getWidth()*2/9, (number+2)*love.graphics.getHeight()/7,love.graphics.getWidth()*5/9,"center")
end

function loadMenus()
  everyMenu = {
    --1 main menu
    {menuButton("PLAY",1),
    menuButton("EDITOR",1),
    menuButton("SCORES",1)}
  }
end
