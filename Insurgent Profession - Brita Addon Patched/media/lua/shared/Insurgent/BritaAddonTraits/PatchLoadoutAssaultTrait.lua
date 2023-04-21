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
	
	local inv = player:getInventory();
	local bagFound = false;
	
	for i = 0, inv:getItems():size() - 1 do
        local item = inv:getItems():get(i)
        if item ~= nil then
            local itemFullType = item:getFullType()
            if itemFullType == "Insurgent.Bag_ALICEpack_Insurgent" or 
                itemFullType == "Base.Bag_ALICEpack_Army" or 
                itemFullType == "Base.Bag_ALICEpack" then
                bagFound = true
				
                local bagInv = item:getInventory();
				
                    bagInv:AddItems("Base.Sledgehammer", 1)
					
                break
            end
			
        end
    end
	
	
	if not bagFound then
	
			inv:AddItems("Base.Sledgehammer", 1)

	end
	
	
end