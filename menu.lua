function drawInMenus(args)
  love.graphics.setBackgroundColor(200, 200, 255)
  for i = 1,table.getn(everyMenu[currentMenuIn]) do
    drawMainMenuButton(everyMenu[currentMenuIn][i],
    isOn(everyMenu[currentMenuIn][i]))-- and love.mouse.isDown(1) and (mouseDownCommand == getMouseCommand(love.mouse.getX(),love.mouse.getY(),currentMenuIn)))
  end
end

function menuButton(text, path, x, y, width, height)
  return {text = text, path = path, x = x, y = y, width = width, height = height}
end

function drawMainMenuButton(buttonToDraw,pressed)
  love.graphics.setColor(100, 100, 110)
  if pressed and love.mouse.isDown(1) then
    love.graphics.setColor(50, 50, 55)
  elseif pressed then
    love.graphics.setColor(130, 130, 140)
  end
  love.graphics.rectangle("fill", love.graphics.getWidth()*buttonToDraw.x, (buttonToDraw.y)*love.graphics.getHeight()/7, love.graphics.getWidth()*buttonToDraw.width, (love.graphics.getHeight()/7-5)*buttonToDraw.height,(love.graphics.getHeight()/7-5)/2,(love.graphics.getHeight()/7-5)/2)
  love.graphics.setColor(10, 10, 30)

  love.graphics.setFont(normalFont)
  love.graphics.printf(buttonToDraw.text, love.graphics.getWidth()*buttonToDraw.x, (buttonToDraw.y)*love.graphics.getHeight()/7,love.graphics.getWidth()*buttonToDraw.width,"center")
end

function loadMenus()
  everyMenu = {
    --1 main menu
    {menuButton("PLAY",1,2/9,3,5/9,1),
    menuButton("OPTIONS",1,2/9,4,5/9,1),
    menuButton("QUIT",1,2/9,5,5/18,1),
    menuButton("CREDS",1,1/2,5,5/18,1)}
  }
end

function isOn(buttonToCheck)
  return (love.mouse.getX() > love.graphics.getWidth()*buttonToCheck.x) and
  (love.mouse.getX() < love.graphics.getWidth()*buttonToCheck.x + love.graphics.getWidth()*buttonToCheck.width) and
  (love.mouse.getY() > (buttonToCheck.y)*love.graphics.getHeight()/7) and
  (love.mouse.getY() < (buttonToCheck.y)*love.graphics.getHeight()/7 + (love.graphics.getHeight()/7-5)*buttonToCheck.height)
end

function getMouseCommand(x,y,currentMenuIn)
  for i = 1,table.getn(everyMenu[currentMenuIn]) do
    return (everyMenu[currentMenuIn][i].path)
  end
  return nil
end
