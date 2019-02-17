-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

require('internal/util')
require('gamemode')

function Precache( context )
--[[
  This function is used to precache resources/units/items/abilities that will be needed
  for sure in your game and that will not be precached by hero selection.  When a hero
  is selected from the hero selection screen, the game will precache that hero's assets,
  any equipped cosmetics, and perform the data-driven precaching defined in that hero's
  precache{} block, as well as the precache{} block for any equipped abilities.

  See GameMode:PostLoadPrecache() in gamemode.lua for more information
  ]]

  DebugPrint("[BAREBONES] Performing pre-load precache")

  -- Precache resources for tornado_skill_datadriven
  PrecacheResource("particle", "particles/units/heroes/hero_invoker/invoker_tornado.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_invoker/invoker_tornado_child.vpcf")

  -- Precache the particles our custom abilities and items use.
  PrecacheResource("particle", "particles/units/heroes/hero_meepo/meepo_earthbind.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_mirana/mirana_spell_arrow.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_puck/puck_phase_shift.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_tinker/tinker_machine.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_vengeful/vengeful_nether_swap.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_vengeful/vengeful_nether_swap_target.vpcf", context)

  -- Precache the sounds our custom abilities and items use.
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_mirana.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_rattletrap.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_meepo.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_puck.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_vengefulspirit.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/voscripts/game_sounds_vo_puck.vsndevts", context)

  -- Precache the abilities our heroes use.
  PrecacheItemByNameSync("pudge_meat_hook", context)
  PrecacheItemByNameSync("mirana_arrow", context)
  PrecacheItemByNameSync("rattletrap_hookshot", context)
  PrecacheItemByNameSync("invoker_sun_strike", context)
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:_InitGameMode()
end
