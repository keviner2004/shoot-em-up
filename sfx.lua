local lfs = require "lfs"
local sfx = {}

sfx.CHANNEL_BG = 1
sfx.CHANNEL_EFFECT = 2

sfx.bg = {
  handle = audio.loadSound( "sounds/Juhani Junkala [Retro Game Music Pack] Level 1.wav" ),
  channel = 1
}

sfx.title = {
  handle = audio.loadSound( "sounds/Juhani Junkala [Retro Game Music Pack] Title Screen.wav"),
  channel = 1
}

sfx.button = {
  handle = audio.loadSound("sounds/sfx_sounds_button7.wav"),
  channel = 2
}

sfx.laser = {
  handle = audio.loadSound("sounds/sfx_wpn_laser2.wav"),
  channel = 3
}

function sfx:init()
   audio.reserveChannels(5)
   sfx.masterVolume = audio.getVolume()  
   print( "volume "..masterVolume )
   audio.setVolume( 0.80, { channel = 1 } )  --music track
   audio.setVolume( 0.80, { channel = 2 } )  --ui
   audio.setVolume( 0.8,  { channel = 3 } )  --Lesser
   audio.setVolume( 1.0,  { channel = 4 } )  --alien voice
   audio.setVolume( 0.25, { channel = 5 } )  --weak explosion
end

function sfx:play(name, options)
    if not options then
      options = {}
    end

    options.channel = self[name].channel

    if mute then
        return false
    end
    if options.channel then
      audio.stop(options.channel)
    end
    return audio.play(self[name].handle, options)
end

function sfx:pause(channel)
    audio.pause(channel)
end

function sfx:stop(channel)
    audio.stop(channel)
end

return sfx