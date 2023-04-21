LoadoutMarksmanTrait.description  = "You see anything and everything within your crosshairs. Nothing escapes you. <LINE> You were a dedicated Marksman throughout your military career. <LINE> +1 Aiming. <LINE> You start with: <LINE> FN SCAR20 <LINE> 8x.308 20rnd Magazines"

function LoadoutMarksmanTrait.OnNewGame(player)
    if not player:HasTrait("LoadoutMarksman") then
        return
    end
	
	if not player:HasTrait("CovertOperative") then
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.SCAR20", {"Base.Sight_G28_Scope", "Base.Laser_Red", "Base.Sling_3", "Base.Compensator"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.308ExtClip", 8)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.308ExtClip")

	else

		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.SCAR20", {"Base.Sight_G28_Scope", "Base.Laser_Red", "Base.Sling_3", "Base.Suppressor_Rifle"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.308ExtClip", 8)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.308ExtClip")
	
	end
end
