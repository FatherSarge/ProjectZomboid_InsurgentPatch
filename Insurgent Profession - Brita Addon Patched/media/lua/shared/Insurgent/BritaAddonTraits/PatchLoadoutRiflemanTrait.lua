LoadoutRiflemanTrait.description  = "This is my rifle. There are many like it, but this one is mine. <LINE> You were a dedicated Rifleman throughout your military career. <LINE> +1 Reloading. <LINE> You start with: <LINE> M4A1 Rifle <LINE> 7x 5.56 30rnd Magazines"

function LoadoutRiflemanTrait.OnNewGame(player)
    if not player:HasTrait("LoadoutRifleman") then
        return
    end
	
	if not player:HasTrait("CovertOperative") then
	
        local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.M4A1", {"Base.Sight_Aimpoint", "Base.Sling_3", "Base.Compensator", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.556Clip", 6)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.556Clip")
		
    else
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.M4A1", {"Base.Sight_Aimpoint", "Base.Sling_3", "Base.Suppressor_Rifle", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.556Clip", 6)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.556Clip")
	
	end
end
