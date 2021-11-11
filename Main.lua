-------------
-- H E A D --
-------------

-- this line display mark in the the console when the program work
io.stdout:setvbuf('no')

-- stop the love filter when the image is resized
love.graphics.setDefaultFilter("nearest")



-----------------------
-- V A R I A B L E S --
-----------------------

-- sprite 
local image

--screen 
local screenWidth
local screenHeight


-- sprite
sprites = {}

-- heros
heros = {}

-----------------------
-- F U N C T I O N S --
-----------------------


function CreateSprite(sImageName, sX, sY)
  
  sprite = {}
  sprite.x = sX
  sprite.y = sY
  sprite.image = love.graphics.newImage("Images/"..sImageName..".png")
  sprite.w = sprite.image:getWidth()
  sprite.h = sprite.image:getHeight()
  
  table.insert(sprites, sprite)
  
  return sprite
end 

-- call one time at the start of the game 
function love.load()
  
  -- screen option
  love.window.setMode(1024,768)
  love.window.setTitle("shoot'em up")
  
  
  -- size of the screen 
  screenWidth = love.graphics.getWidth()
  screenHeight = love.graphics.getHeight()
  

  
  heros = CreateSprite("heros", screenWidth / 2, screenHeight / 2)
  heros.y = screenHeight - heros.h * 2

  
  
end

-- call each frame (here 60 time per segond)
function love.update(dt)
  
  if love.keyboard.isDown("right") and heros.x < screenWidth then
    
    heros.x = heros.x + 2
  end
  
  if love.keyboard.isDown("down") and heros.y < screenHeight then
    
    heros.y = heros.y + 2
  end
  
  if love.keyboard.isDown("left") and heros.x > 0  then
    
    heros.x = heros.x - 2
  end
  
  if love.keyboard.isDown("up") and heros.y > 0 then
    
    heros.y = heros.y - 2
  end
  
end


-- for display thing on the screen (player, enemy , wallpaper, etc...)
function love.draw()
  
  local n
  
  for n = 1, #sprites do
    
    local s = sprites[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.w / 2, s.h / 2)
  end 
  
end
