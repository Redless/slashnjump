require("block")
require("dot")
require("menu")
require("gameloop")

function love.load()
  normalFont = love.graphics.newFont(99)
  mode = "menu"
  currentMenuIn = 1
  -- 1 is main menu
  -- 2 is level select
  -- 3 is OPTIONS
  -- 4 is CREDITS
  -- 5 is a holding chamber for the game engine
  loadMenus()
  menuIn = 1
  maxJump = 3
  maxSpeed = .2
  mainDot = dot(0,0,1,1)
  currentBlocks = {}
  table.insert(currentBlocks,block(0,10,100,10))
  table.insert(currentBlocks,block(10,5,5,500))
  sfxjump = love.audio.newSource("assets/jump.wav")
  sfxdead = love.audio.newSource("assets/dead.wav")
  sfxtouchdown = love.audio.newSource("assets/touchdown.wav")
  sfxkick = love.audio.newSource("assets/kick.wav")
  sfxslash = love.audio.newSource("assets/slash.wav")
end

function love.update(dt)
  if mode == "game" then
    updateInGame()
  elseif mode == "menu" and currentMenuIn == 5 then
    mode = "game"
  end
end

function love.draw(dt)
  if mode == "game" then
    drawInGame()
  elseif mode == "menu" then
    drawInMenus()
  end
end

function love.mousepressed(x, y, button, isTouch)
  if (button == 1) and (mode == "menu") then
    mouseDownCommand = getMouseCommand(x,y,currentMenuIn)
  end
end

function love.mousereleased(x, y, button, isTouch)
  if (button == 1) and (mode == "menu") and mouseDownCommand and (mouseDownCommand == getMouseCommand(x,y,currentMenuIn)) then
    --executes the mouse command
  end
end

function love.keypressed(key)
  if mode == "game" then
    if (key == "space") and mainDot.onFloor then
      --love.audio.play(sfx)
      jump(mainDot)
    elseif (key == "space") and mainDot.onLeftWall then
      leftWallKick(mainDot)
    elseif (key == "space") and mainDot.onRightWall then
      rightWallKick(mainDot)
    elseif (key == "space") then
      slash(mainDot)
    end
  end
end
