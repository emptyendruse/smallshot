function HideCaster(keys)
	local hCaster = keys.caster
	ProjectileManager:ProjectileDodge(hCaster)
	hCaster:AddNoDraw()
end

function ShowCaster(keys)
	local hCaster = keys.caster
	hCaster:RemoveNoDraw()
end
