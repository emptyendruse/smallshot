if modifier_disappearing_cloak == nil then
	modifier_disappearing_cloak = class({})
end

function modifier_disappearing_cloak:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_TAKEDAMAGE
	}

	return funcs
end

function modifier_disappearing_cloak:OnTakeDamage(kv)
	local caster = self:GetCaster()
	local attacked = kv.unit
	local cloak = self:GetAbility()
	local cd = cloak:GetCooldownTimeRemaining()
	if (cd == 0 and caster == attacked) then
		caster:AddNewModifier(caster, kv.item, "modifier_invisible", {duration = cloak:GetSpecialValueFor("duration")})
		cloak:StartCooldown(cloak:GetSpecialValueFor("cooldown"))
	end
end
