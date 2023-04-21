function InsurgentWeaponUtil.addBasicPistol(player)
    if not player:HasTrait("CovertOperative") then
		InsurgentWeaponUtil.addWeapon(player, "Base.G17", {"Base.RedDot", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.9mmClip", 2)
	
	else
	
		InsurgentWeaponUtil.addWeapon(player, "Base.G17", {"Base.RedDot", "Base.Suppressor_Pistol", "Base.Laser_Red"})
		InsurgentWeaponUtil.addMagsToBag(player, "Base.9mmClip", 2)
	end
end

function InsurgentWeaponUtil.addMagsToBag(player, magName, count)
    local inv = player:getInventory()
    local ammoMulti = InsurgentWeaponUtil.getAmmoMult(player)
    local bagFound = false
    
    -- Check if any of the specified bags are in the player's inventory
    for i = 0, inv:getItems():size() - 1 do
        local item = inv:getItems():get(i)
        if item ~= nil then
            local itemFullType = item:getFullType()
            if itemFullType == "Insurgent.Bag_ALICEpack_Insurgent" or 
                itemFullType == "Base.Bag_ALICEpack_Army" or 
                itemFullType == "Base.Bag_ALICEpack" then
                bagFound = true
                local bagInv = item:getInventory()
                for j = 1, count * ammoMulti do
                    local mag = bagInv:AddItem(magName)
                    mag:setCurrentAmmoCount(mag:getMaxAmmo())
                end
                break
            end
        end
    end
    
    -- If no bag is found, add mags to the player inventory
    if not bagFound then
        for i = 1, count * ammoMulti do
            InsurgentWeaponUtil.addMag(player, magName)
        end
    end
end

function addItemsToBag(player, itemsTable)
    local inv = player:getInventory()
    local bagFound = false

    -- Check if any of the specified bags are in the player's inventory
    for i = 0, inv:getItems():size() - 1 do
        local item = inv:getItems():get(i)
        if item ~= nil then
            local itemFullType = item:getFullType()
            if itemFullType == "Insurgent.Bag_ALICEpack_Insurgent" or 
                itemFullType == "Base.Bag_ALICEpack_Army" or 
                itemFullType == "Base.Bag_ALICEpack" then
                bagFound = true
                local bagInv = item:getInventory()
                for j = 1, #itemsTable do
                    local itemData = itemsTable[j]
                    for k = 1, itemData.count do
                        local newItem = bagInv:AddItem(itemData.name)
                    end
                end
                break
            end
        end
    end
	
	-- If no bag is found, add items to the player inventory
	if not bagFound then
		for j = 1, #itemsTable do
			local itemData = itemsTable[j]
			for k = 1, itemData.count do
				player:getInventory():AddItem(itemData.name)
			end
		end
	end
end