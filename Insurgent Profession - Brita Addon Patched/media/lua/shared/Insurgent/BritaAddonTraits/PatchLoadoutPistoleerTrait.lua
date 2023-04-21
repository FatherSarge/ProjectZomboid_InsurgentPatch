LoadoutPistoleerTrait.description  = "Although highly trained in many aspects of combat, your pistol has never let you down. <LINE> You were dedicated to the art of pistoleering. <LINE> +1 Reloading <LINE> Default G17 pistol and magazines are replaced with: <LINE> G21 Pistol <LINE> 5x.45 13rnd Magazines"

function LoadoutPistoleerTrait.OnNewGame(player)
    if not player:HasTrait("LoadoutPistoleer") then
        return
    end
	
	if not player:HasTrait("CovertOperative") then

		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.G21", {"Base.Sight_MicroDot", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.45DSClip", 5)
	
	else
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.G21", {"Base.Sight_MicroDot", "Base.Suppressor_Pistol", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.45DSClip", 5)
		
	end
end

function InsurgentWeaponUtil.addBasicPistol(player)
    if not player:HasTrait("CovertOperative") then
		InsurgentWeaponUtil.addWeapon(player, "Base.G17", {"Base.RedDot", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.9mmClip", 2)
	
	else
	
		InsurgentWeaponUtil.addWeapon(player, "Base.G17", {"Base.RedDot", "Base.Suppressor_Pistol", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.9mmClip", 2)
	end
end