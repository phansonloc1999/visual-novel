Mouse = Class{}

-- Mouse input
love.mouse.isPressed = false

function love.mousepressed(x, y, button, isTouch)
  if (button == 1) then love.mouse.isPressed = true end
end

function Mouse:init()
  self.x, self.y = love.mouse.getPosition()
  self.image = {}
  self.image.normal = love.graphics.newImage('Graphics/Mouse/Mouse.png')
  self.image.grab = love.graphics.newImage('Graphics/Mouse/Mouse_grab.png')
  self.image.width = self.image.normal:getWidth()
  self.image.height = self.image.normal:getHeight()
  love.mouse.setVisible(false)
  self.isEntity = false
  self.isLocked = false
end

function Mouse:render()
  if (not self.isEntity) then
    love.graphics.draw(self.image.normal, self.x, self.y)
  else
    love.graphics.draw(self.image.grab, self.x, self.y)
  end
end

local function isTouchingEntity(x, y, w, h)
  for k, entity in pairs(Entities) do
    if (isCollision(x, y, w, h, entity.x, entity.y, entity.width, entity.height)) and (not entity.isClicked) then
      currentEntity = k
      return true
    end
  end
  return false
end

function Mouse:update(dt)
  -- Prevent mouse clicking when in entity message
  if (not self.isLocked) then
    self.x, self.y = love.mouse.getPosition()
  end

  -- Check if mouse clicked on entity
  self.isEntity = isTouchingEntity(self.x, self.y, self.image.width, self.image.height)
  if (self.isEntity) and (love.mouse.isPressed) then
    self.isLocked = true
    Entities[currentEntity].isClicked = true
    currentEntityMessage = 1
    Entities[currentEntity].isClicked = 1
  end
end
