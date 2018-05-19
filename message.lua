Message = Class{}

currentMessage = ""

function Message:init()
  -- Message box
  self.image = love.graphics.newImage("Graphics/Message Box/Messagebox2.png")
  self.g = anim8.newGrid(710, 90, self.image:getWidth(), self.image:getHeight())
  self.animation = anim8.newAnimation(self.g('1-2', 1), 0.5)

  self.width, self.height = self.image:getWidth(), self.image:getHeight()
  self.x, self.y = WINDOW_WIDTH / 2 - self.width / 4, WINDOW_HEIGHT - 150

  -- Message text
  self.message = {}
  self.message.font = love.graphics.newFont("Font/Pixel.ttf", 14)
  love.graphics.setFont(self.message.font)
  self.message.x = self.x + 15
  self.message.y = self.y + 10
  self.message.inputStrings = {}
  self.message.current = 1

  for line in love.filesystem.lines('Contents/Scene 1/Text.txt') do
    table.insert(self.message.inputStrings, line)
  end
end

function Message:render()
  if (not MouSe.isLocked) then
    currentMessage =  self.message.inputStrings[self.message.current]
  else currentMessage = Entities[currentEntity].message[currentEntityMessage] end

  if (currentMessage ~= nil) then
    -- Message box render
    self.animation:draw(self.image, self.x, self.y)

    -- Text display
    love.graphics.printf(currentMessage, self.message.x, self.message.y, 640, 'left')
  end
end

function Message:update(dt)
  self.animation:update(dt)

  if (love.keyboard.isPressed('space')) then
    if (not MouSe.isLocked) then
      self.message.current = self.message.current + 1
    else currentEntityMessage = currentEntityMessage + 1 end
    if (Entities[currentEntity] ~= nil) then
      if (currentEntityMessage > #Entities[currentEntity].message - 1) then
        MouSe.isLocked = false
        itemString = Entities[currentEntity].message[currentEntityMessage]
        isItem, itemName = string.match(itemString, '(%d) (%a)')
        if (tonumber(isItem) == 1) then Inventory:getItem(tostring(itemName)) end
      end
    end
  end
end
