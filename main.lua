require("block")
require("dot")
require("menu")
require("gameloop")
require("camera")
require("levels")
require("electroblock")
require("textInLevel")
require("target")
require("HUD")

function love.load()
  love.graphics.setDefaultFilter("nearest","nearest")
  normalFont = love.graphics.newFont(80)
  levelSelectFont = love.graphics.newFont(40)
  timerFont = love.graphics.newFont(77)
  mode = "menu"
  currentMenuIn = 1
  -- 1 is main menu
  -- 2 is level select
  -- 3 is OPTIONS
  -- 4 is CREDITS
  -- 5 is a holding chamber for the game engine
  loadMenus()
  loadCamera(50,100,mainDot)
  menuIn = 1
  maxJump = 3
  maxSpeed = .2
  mainDot = dot(0,0,1,1)
  sfxjump = love.audio.newSource("assets/jump.wav")
  sfxdead = love.audio.newSource("assets/dead.wav")
  sfxtouchdown = love.audio.newSource("assets/touchdown.wav")
  sfxkick = love.audio.newSource("assets/kick.wav")
  sfxslash = love.audio.newSource("assets/slash.wav")
  sfxshatter = love.audio.newSource("assets/shatter.wav")
  sfxwin = love.audio.newSource("assets/win.wav")
  standing = love.graphics.newImage("assets/stand.png")
  dashing = love.graphics.newImage("assets/dash.png")
  clinging = love.graphics.newImage("assets/cling.png")
end

function love.update(dt)
  if mode == "game" then
    updateInGame()
  elseif mode == "menu" and currentMenuIn >= 20 then
    levelOn = everyLevel[currentMenuIn-19]
    loadLevel(levelOn)
    mode = "game"
  end
end

function love.draw(dt)
  --love.graphics.print(getMouseCommand(love.mouse.getX(),love.mouse.getY(),currentMenuIn))
  if mode == "game" then
    drawInGame()
  elseif mode == "menu" then
    drawInMenus()
  end
end

function love.mousepressed(x, y, button, isTouch)
  if ((button == 1) and (mode == "menu")) then
    mouseDownCommand = getMouseCommand(x,y,currentMenuIn)
  end
end

function love.mousereleased(x, y, button, isTouch)
  if ((button == 1) and (mode == "menu") and mouseDownCommand and (mouseDownCommand == getMouseCommand(x,y,currentMenuIn))) then
    currentMenuIn = mouseDownCommand
  end
end

function love.keypressed(key)
  if mode == "game" then
    if (key == "space") and mainDot.onFloor then
      --love.audio.play(sfx)
      jump(mainDot)
    elseif (key == "space") and mainDot.onCeiling then
      mainDot.yV = .1
    elseif (key == "space") and mainDot.onLeftWall then
      leftWallKick(mainDot)
    elseif (key == "space") and mainDot.onRightWall then
      rightWallKick(mainDot)
    elseif (key == "space") then
      slash(mainDot)
    end
  end
end
