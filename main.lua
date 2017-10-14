require("block")
require("dot")
require("menu")
require("gameloop")

function love.load()
  mode = "game"
  maxJump = 3
  maxSpeed = .2
  mainDot = dot(0,0,1,1)
  currentBlocks = {}
  table.insert(currentBlocks,block(0,10,100,10))
  table.insert(currentBlocks,block(10,5,5,500))
  sfx = love.audio.newSource("assets/Jump.wav")
end

function love.update(dt)
  if mode == "game" then
    updateInGame()
  end
end

function love.draw(dt)
  if mode == "game" then
    drawInGame()
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
