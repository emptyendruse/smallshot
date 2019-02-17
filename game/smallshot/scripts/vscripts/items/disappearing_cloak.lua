if item_disappearing_cloak == nil then
    item_disappearing_cloak = class({})
end

LinkLuaModifier("modifier_disappearing_cloak", "modifiers/modifier_disappearing_cloak.lua", LUA_MODIFIER_MOTION_NONE)
function item_disappearing_cloak:GetIntrinsicModifierName()
	return "modifier_disappearing_cloak"
end