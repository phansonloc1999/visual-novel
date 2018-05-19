-- AABB Collision handler
function isCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  if (x1 < x2 + w2) and (x1 + w1 > x2) then
    if (y1 < y2 + h2) and (y1 + h1 > y2) then
      return true
    end
  end
  return false
end

-- Common use log function
function LOG(...)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(...)
  love.graphics.setColor(255, 255, 255)
end

-- Keyboard input handler
love.keyboard.keysPressed = {}

function love.keyboard.isPressed(key)
 return love.keyboard.keysPressed[key]
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true

  if (key == 'escape') then
    love.event.quit()
  end
end
