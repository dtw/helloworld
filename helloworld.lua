_addon.name = 'HelloWorld'
_addon.author = 'dtw'
_addon.version = '1'
_addon.command = 'hw'
_addon.commands = {'show', 'hide','update'}

require('tables')

config = require('config')
texts = require ('texts')

local defaults = T{}

defaults = {}
defaults.pos = {}
defaults.pos.x = 0
defaults.pos.y = 0
defaults.color = {}
defaults.color.alpha = 200
defaults.color.red = 200
defaults.color.green = 200
defaults.color.blue = 200
defaults.bg = {}
defaults.bg.alpha = 200
defaults.bg.red = 30
defaults.bg.green = 30
defaults.bg.blue = 30

settings = config.load(defaults)

window = texts.new('Hello world!', settings)
window:show()

windower.register_event('addon command', function(command, ...)
  command = command and command:lower()
  local args = {...}

  if command == 'show' then
    window:show()
  elseif command == 'hide' then
    window:hide()
  elseif command == 'update' then
    window:text(args[1])
  end
end)
