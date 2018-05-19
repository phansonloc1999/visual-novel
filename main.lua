-- Animation library
anim8 = require "anim8"

-- Classic OOP class library
Class = require "class"

require "background"
require "mouse"
require "message"
require "utility"
require "entity"
require "inventory"

WINDOW_WIDTH, WINDOW_HEIGHT = 800, 600
Text = ""

-- Main LOVE functions
function love.load()
  -- Window settings
  love.window.setTitle('My Game')
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

  -- Create game objects from class
  BackGround = Background()
  BackGround:init()
  BackGround:music()

  -- Create in-game mouse from class
  MouSe = Mouse()
  MouSe:init()

  -- Create message box from class
  MessBox = Message()
  MessBox:init()

  --Create inventory
  Inventory:init()

  EntityTableInit('Contents/Scene 1')
end

function love.draw()
  BackGround:render()
  MessBox:render()
  MouSe:render()

  LOG(Text)
end

function love.update(dt)
  BackGround:update(dt)
  MessBox:update(dt)
  MouSe:update(dt)

  -- reset keyboard input
  love.keyboard.keysPressed = {}

  -- reset mouse input
  love.mouse.isPressed = false
end
