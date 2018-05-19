Inventory = Class{}

function Inventory:init()
  self.container = {}
end

function Inventory:getItem(itemName)
  table.insert(self.container, itemName)
end
