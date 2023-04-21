LoadoutGunslingerTrait.description  = "You can't beat the accuracy, power and reliability of a revolver. <LINE> You were dedicated to the old school art of revolvers. <LINE> +1 Aiming <LINE> Default G17 pistol and magazines are replaced with: <LINE> Ruger GP100 .357 Revolver <LINE> 10x .357 Speedloaders"

function LoadoutGunslingerTrait.OnNewGame(player)
    if not player:HasTrait("LoadoutGunslinger") then
        return
    end
	
	if not player:HasTrait("CovertOperative") then

		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.Revolver_Long_357", {"Base.Sight_MicroDot", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.357Speed", 10)
		
	else
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.Revolver_Long_357", {"Base.Sight_MicroDot", "Base.Suppressor_Pistol", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.357Speed", 10)
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