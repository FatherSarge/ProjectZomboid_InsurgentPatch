function LoadoutMachinegunnerTrait.OnNewGame(player)
    if not player:HasTrait("LoadoutMachinegunner") then
        return
    end
	
	if not player:HasTrait("CovertOperative") then

		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.M249E3", {"Base.Sight_Aimpoint", "Base.Sling_3", "Base.Compensator", "Base.Bipod"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.556Belt", 2)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.556Belt")
		
	else
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.M249E3", {"Base.Sight_Aimpoint", "Base.Sling_3", "Base.Suppressor_BMG", "Base.Bipod"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.556Belt", 2)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.556Belt")
		
	end
end