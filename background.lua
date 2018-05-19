Background = Class{}

function Background:init()
  self.width = WINDOW_WIDTH
  self.height = WINDOW_HEIGHT

  --Background animation initialization
  self.image = love.graphics.newImage('Graphics/Background/Background.png')
  self.g = anim8.newGrid(800, 598, self.image:getWidth(), self.image:getHeight())
  self.animation = anim8.newAnimation(self.g('1-16', 1), 0.1)
end

function Background:music()
  self.music = love.audio.newSource('Sounds/lake.mp3')
  self.music:setVolume(0.1)
  self.music:setLooping(true)
  self.music:play()
end

function Background:render()
  self.animation:draw(self.image, 0, 0)
end

function Background:update(dt)
  self.animation:update(dt)
end
