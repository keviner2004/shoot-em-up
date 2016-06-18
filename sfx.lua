local lfs = require "lfs"
local sfx = {}

sfx.CHANNEL_BG = 1
sfx.CHANNEL_UI = 2

sfx.bg = {
  handle = audio.loadSound( "sounds/Juhani Junkala [Retro Game Music Pack] Level 1.wav" ),
  channel = 1
}

sfx.bgBoss = {
  handle = audio.loadSound( "sounds/Juhani Junkala [Retro Game Music Pack] Level 2.wav" ),
  channel = 1
}

sfx.bash ={
  handle = audio.loadSound( "sounds/sfx_sounds_falling6.wav" ),
}

sfx.title = {
  handle = audio.loadSound( "sounds/Juhani Junkala [Retro Game Music Pack] Title Screen.wav"),
  channel = 1
}

sfx.button = {
  handle = audio.loadSound("sounds/sfx_sounds_button7.wav"),
  channel = 2
}

sfx.shot = {
  handle = audio.loadSound("sounds/sfx_weapon_singleshot9.wav"),
}

sfx.laser = {
  handle = audio.loadSound("sounds/sfx_wpn_laser2.wav"),
  channel = 3
}

sfx.hurt = {
  handle = audio.loadSound("sounds/sfx_sounds_impact1.wav"),
}

sfx.explosion = {
  handle = audio.loadSound("sounds/sfx_exp_short_hard11.wav"),
}

sfx.scream = {
  handle = audio.loadSound("sounds/sfx_deathscream_human9.wav"),
}

sfx.start = {
  handle = audio.loadSound("sounds/sfx_sounds_pause7_in.wav"),
  channel = 2
}

sfx.split = {
  handle = audio.loadSound("sounds/sfx_sound_nagger2.wav"),
}


sfx.warning = {
  handle = audio.loadSound("sounds/sfx_alarm_loop3.wav"),
}

sfx.surround = {
  handle = audio.loadSound("sounds/sfx_sound_depressurizing.wav"),
}

sfx.seek = {
  handle = audio.loadSound("sounds/sfx_wpn_missilelaunch.wav"),
}

sfx.fallingLaser = {
  handle = audio.loadSound("sounds/sfx_sounds_falling11.wav"),
}

sfx.burst = {
  handle = audio.loadSound("sounds/sfx_sounds_impact9.wav"), 
}

sfx.explosion2 = {
  handle = audio.loadSound("sounds/sfx_exp_short_soft9.wav"), 
}


function sfx:initVolumn()
  --local masterVolume = audio.getVolume()  
  --print( "volume "..masterVolume )
  audio.setVolume( 0.7, { channel = self.CHANNEL_BG } )  --music track
  audio.setVolume( 0.8, { channel = self.CHANNEL_UI } )  --ui
  --audio.setVolume( 0.8,  { channel = 3 } )  --Lesser
end

function sfx:init()
  audio.reserveChannels(5)
  self:initVolumn()
end

function sfx:play(name, options)
    self:initVolumn()
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

function sfx:fadeOut(channel, time)
  audio.fadeOut(channel, time)
end

function sfx:pause(channel)
    audio.pause(channel)
end

function sfx:stop(channel)
    audio.stop(channel)
end

return sfx