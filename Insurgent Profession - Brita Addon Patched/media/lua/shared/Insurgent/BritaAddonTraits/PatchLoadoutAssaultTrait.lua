LoadoutAssaultTrait.description  = "'Running at the speed of death!' is your motto. <LINE> You were a dedicated Assault Trooper throughout your military career. <LINE> You start with: <LINE> +1 Reloading. <LINE> USAS-12 Shotgun <LINE> 10x 12g Mags <LINE> Sledgehammer"

function LoadoutAssaultTrait.OnNewGame(player)
    if not player:HasTrait("LoadoutAssault") then
        return
    end

	if not player:HasTrait("CovertOperative") then

		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.USAS_12", {"Base.Sling_3", "Base.Sight_MicroDot", "Base.Choke_Full", "Base.Light_Large"})
		InsurgentWeaponUtil.addMagsToBag(player, "BBase.SPASClip", 10)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.SPASClip")
	
	else
	
		local weapon = InsurgentWeaponUtil.addWeapon(player, "Base.USAS_12", {"Base.Sling_3", "Base.Sight_MicroDot", "Base.Suppressor_Shotgun", "Base.Light_Large"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.SPASClip", 10)
		InsurgentWeaponUtil.equipAndFullyLoadWeapon(player, weapon, "Base.SPASClip")
	
	end
	
	local itemsTable = {
            {name = "Base.Sledgehammer", count = 1},
        }
        addItemsToBag(player, itemsTable)	
end