function LoadoutReconTrait.OnNewGame(player)
    if not player:HasTrait("LoadoutRecon") then
        return
    end
	
	if not player:HasTrait("CovertOperative") then
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.MP5_Fixed", {"Base.Sight_Aimpoint","Base.Sling_3", "Base.Compensator", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.9mmExtClip", 6)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.9mmExtClip")
	else
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.MP5_Fixed", {"Base.Sight_Aimpoint", "Base.Sling_3", "Base.Suppressor_Rifle", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.9mmExtClip", 6)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.9mmExtClip")
	end
end