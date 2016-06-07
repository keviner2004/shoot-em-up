local lfs = require "lfs"
local sfx = {}

sfx.CHANNEL_BG = 1
sfx.CHANNEL_EFFECT = 2

sfx.boomSound = audio.loadSound( "audio/explosion2.wav" )

function sfx:init()
   audio.reserveChannels(5)
   sfx.masterVolume = audio.getVolume()  
   print( "volume "..masterVolume )
   audio.setVolume( 0.80, { channel = 1 } )  --music track
   audio.setVolume( 0.66, { channel = 2 } )  --boss sound
   audio.setVolume( 1.0,  { channel = 3 } )  --voice overs
   audio.setVolume( 1.0,  { channel = 4 } )  --alien voice
   audio.setVolume( 0.25, { channel = 5 } )  --weak explosion
end

function sfx:play(name, options)
    if mute then
        return false
    end
    return audsio.play(self[name], options)
end

function sfx:pause(channel)
    audio.pause(channel)
end

function sfx:stop(channel)
    audio.stop(channel)
end

return sfx