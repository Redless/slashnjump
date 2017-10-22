function drawInMenus(args)
  love.graphics.setBackgroundColor(200, 200, 255)
  for i = 1,table.getn(everyMenu[currentMenuIn]) do
    drawMainMenuButton(everyMenu[currentMenuIn][i],
    isOn(everyMenu[currentMenuIn][i]))-- and love.mouse.isDown(1) and (mouseDownCommand == getMouseCommand(love.mouse.getX(),love.mouse.getY(),currentMenuIn)))
  end
end

function menuButton(text, path, x, y, width, height, isPill)
  return {text = text, path = path, x = x, y = y, width = width, height = height, isPill = isPill}
end

function drawMainMenuButton(buttonToDraw,pressed)
  love.graphics.setColor(100, 100, 110)
  if pressed and love.mouse.isDown(1) then
    love.graphics.setColor(50, 50, 55)
  elseif pressed then
    love.graphics.setColor(130, 130, 140)
  end
  if buttonToDraw.isPill then
    love.graphics.rectangle("fill", love.graphics.getWidth()*buttonToDraw.x, (buttonToDraw.y)*love.graphics.getHeight(), love.graphics.getWidth()*buttonToDraw.width, (love.graphics.getHeight())*buttonToDraw.height,(love.graphics.getHeight()/7-5)/2,(love.graphics.getHeight()/7-5)/2)
  else
    love.graphics.rectangle("fill", love.graphics.getWidth()*buttonToDraw.x, (buttonToDraw.y)*love.graphics.getHeight(), love.graphics.getWidth()*buttonToDraw.width, (love.graphics.getHeight())*buttonToDraw.height)
  end
  love.graphics.setColor(10, 10, 30)

  love.graphics.setFont(normalFont)
  love.graphics.printf(buttonToDraw.text, love.graphics.getWidth()*buttonToDraw.x, (buttonToDraw.y)*love.graphics.getHeight(),love.graphics.getWidth()*buttonToDraw.width,"center")
end

function loadMenus()
  everyMenu = {
    --1 main menu
    {menuButton("PLAY",2,2/9,3/7,5/9,6/49,true),
    menuButton("OPTIONS",1,2/9,4/7,5/9,6/49,true),
    menuButton("QUIT",1,2/9,5/7,5/18,6/49,true),
    menuButton("CREDS",1,1/2,5/7,5/18,6/49,true)},
    --2 level select
    {menuButton("BACK",1,2/9,5/7,3/14,1/7,false),
    menuButton("1-1",20,2/9,1/7,8/81,6/49,false),
    menuButton("1-2",21,3/9,1/7,8/81,6/49,false),
    menuButton("1-3",22,4/9,1/7,8/81,6/49,false),
    menuButton("1-4",23,5/9,1/7,8/81,6/49,false),
    menuButton("1-5",24,6/9,1/7,8/81,6/49,false),
    menuButton("2-1",25,2/9,2/7,8/81,6/49,false),
    menuButton("2-2",26,3/9,2/7,8/81,6/49,false),
    menuButton("2-3",27,4/9,2/7,8/81,6/49,false),
    menuButton("2-4",28,5/9,2/7,8/81,6/49,false),
    menuButton("2-5",29,6/9,2/7,8/81,6/49,false),
    menuButton("3-1",30,2/9,3/7,8/81,6/49,false),
    menuButton("3-2",31,3/9,3/7,8/81,6/49,false),
    menuButton("3-3",32,4/9,3/7,8/81,6/49,false),
    menuButton("3-4",33,5/9,3/7,8/81,6/49,false),
    menuButton("3-5",34,6/9,3/7,8/81,6/49,false),
    menuButton("4-1",35,2/9,4/7,8/81,6/49,false),
    menuButton("4-2",36,3/9,4/7,8/81,6/49,false),
    menuButton("4-3",37,4/9,4/7,8/81,6/49,false),
    menuButton("4-4",38,5/9,4/7,8/81,6/49,false),
    menuButton("4-5",39,6/9,4/7,8/81,6/49,false)
  },
    --3 options (disable music, disable sounds, costume picker)
    {},
    --4 credits
    {},
    --5 placeholder (sad)
    {}
  }
end

function isOn(buttonToCheck)
  return (love.mouse.getX() > love.graphics.getWidth()*buttonToCheck.x) and
  (love.mouse.getX() < love.graphics.getWidth()*buttonToCheck.x + love.graphics.getWidth()*buttonToCheck.width) and
  (love.mouse.getY() > (buttonToCheck.y)*love.graphics.getHeight()) and
  (love.mouse.getY() < (buttonToCheck.y)*love.graphics.getHeight() + (love.graphics.getHeight())*buttonToCheck.height)
end

function getMouseCommand(x,y,menuScreen)
  for i = 1,table.getn(everyMenu[menuScreen]) do
    if isOn(everyMenu[menuScreen][i]) then
      return (everyMenu[menuScreen][i].path)
    end
  end
  return nil
end
