Entity = Class{}

-- Table of entities
Entities = {}

currentEntity = 0
currentEntityMessage = 0

function EntityTableInit(scene_path)
  local i = 1
  for line in love.filesystem.lines(tostring(scene_path)..'/Entities.txt') do
    table.insert(Entities, Entity())
    local name, x, y, w, h = string.match(line, '(%a+) (%d+) (%d+) (%d+) (%d+)')
    local message = {}
    for line in love.filesystem.lines(tostring(scene_path)..'/'..name..'.txt') do
      table.insert(message, line)
    end
    Entities[i]:init(name, message, tonumber(x), tonumber(y), tonumber(w), tonumber(h))
    i = i + 1
  end
end

function Entity:init(name, message, x, y, w, h)
  self.name, self.message = name, message
  self.x, self.y, self.width, self.height = x, y, w, h
  self.isClicked = false
end
