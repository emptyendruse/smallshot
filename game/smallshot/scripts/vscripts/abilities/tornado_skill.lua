tornado_skill_lua = class ({})

function tornado_skill_lua:OnSpellStart()
	local vDirection = self:GetCursorPosition() - self:GetCaster():GetOrigin()
	vDirection = vDirection:Normalized()

	self.distance = self:GetSpecialValueFor("distance")
	self.cast_range = self:GetSpecialValueFor("cast_range")
	self.effect_radius = self:GetSpecialValueFor("effect_radius")
	self.effect_speed = self:GetSpecialValueFor("effect_speed")
	self.vision_radius = self:GetSpecialValueFor("vision_radius")
	self.cyclone_duration = self:GetSpecialValueFor("cyclone_duration")
	self.damage = self:GetSpecialValueFor("damage")

	local info = {
		EffectName = "particles/units/heroes/hero_invoker/invoker_tornado.vpcf",
		Ability = self,
		vSpawnOrigin = self:GetCaster():GetOrigin(),
		fStartRadius = self.effect_radius,
		fEndRadius = self.effect_radius,
		vVelocity = vDirection * self.effect_speed,
		fDistance = self.distance,
		Source = self:GetCaster(),
		iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
		iUnitTargetType = DOTA_UNIT_TARGET_HERO,
		iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
		bProvidesVision = true,
		iVisionTeamNumber = self:GetCaster():GetTeamNumber(),
		iVisionRadius = self.vision_radius,
	}

	self.flVisionTimer = self.effect_radius / self.effect_speed
	self.flLastThinkTime = GameRules:GetGameTime()
	self.nProjID = ProjectileManager:CreateLinearProjectile(info)
	EmitSoundOn("Hero_Invoker.Tornado.Cast", self:GetCaster())
end

function tornado_skill_lua:OnProjectileThink(vLocation)
	self.flVisionTimer = self.flVisionTimer - (GameRules:GetGameTime() - self.flLastThinkTime)

	if self.flVisionTimer <= 0.0 then
		local vVelocity = ProjectileManager:GetLinearProjectileVelocity(self.nProjID)
		AddFOWViewer(self:GetCaster():GetTeamNumber(), vLocation + vVelocity * (self.effect_radius / self.effect_speed), self.vision_radius, self.cyclone_duration, false)
		self.flVisionTimer = self.effect_radius / self.effect_speed
	end
end

function tornado_skill_lua:OnProjectileHit(hTarget, vLocation)
	if hTarget ~= nil then
		self.xCyclone = ParticleManager:CreateParticle("particles/units/heroes/hero_invoker/invoker_tornado_child.vpcf", )
	end
end