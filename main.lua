require("block")
require("dot")
require("menu")
require("gameloop")

function love.load()
  normalFont = love.graphics.newFont(99)
  mode = "game"
  currentMenuIn = 1
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
  end
end

function love.draw(dt)
  if mode == "game" then
    drawInGame()
  elseif mode == "menu" then
    drawInMenus()
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
