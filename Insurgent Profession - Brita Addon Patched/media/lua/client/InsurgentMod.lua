--TestOverwrite for this file

require('NPCs/MainCreationMethods');
require('OptionScreens/CharacterCreationProfession');
require('XpSystem/XpUpdate');
require"ISUI/ISPanel"
require"ISUI/ISButton"
require"ISUI/ISInventoryPane"
require"ISUI/ISResizeWidget"
require"ISUI/ISMouseDrag"
require"defines"
require "Insurgent/ProfessionExclusiveTrait"

local function InsurgentBeginGame(player)
    if player:getDescriptor():getProfession() ~= "insurgent" then
        return
    end
	
	print("zzzPatchInsurgentMod.lua Check 1")
	
    local inv = player:getInventory();
	local bagFound = false;
	
    local ration = 1;
    if player:HasTrait("LoadoutExtraRations") then	
        ration = 2;
    elseif	player:HasTrait("LoadoutNoRations") then	
        ration = 0;
    end	
	
	print("zzzPatchInsurgentMod.lua Check 2")
    
	inv:AddItems("Insurgent.DeployedParachute", 1)
    inv:AddItems("Base.WaterBottleFull", 1)
	inv:AddItems("Base.SlingA", 1)
    inv:AddItems("Base.KnifeSheath", 1)
    inv:AddItems("Base.HuntingKnife", 1)
	
	print("zzzPatchInsurgentMod.lua Check 3")
	
	for i = 0, inv:getItems():size() - 1 do
        local item = inv:getItems():get(i)
        if item ~= nil then
            local itemFullType = item:getFullType()
            if itemFullType == "Insurgent.Bag_ALICEpack_Insurgent" or 
                itemFullType == "Base.Bag_ALICEpack_Army" or 
                itemFullType == "Base.Bag_ALICEpack" then
                bagFound = true
				
				print("zzzPatchInsurgentMod.lua Check 4")
				
                local bagInv = item:getInventory();
                    bagInv:AddItems("Base.Screwdriver", 1)
					bagInv:AddItems("Base.AlcoholBandage", 3)
					bagInv:AddItems("Base.AlcoholWipes", 1)
					bagInv:AddItems("Susceptible.GasmaskFilter", 2)
					bagInv:AddItems("Base.WaterBottleFull", 1 * ration)
					bagInv:AddItems("Base.OatsRaw", 2 * ration)
					bagInv:AddItems("Radio.WalkieTalkie5", 1)
                break
            end
			
			print("zzzPatchInsurgentMod.lua Check 5")
			
        end
    end
	
	print("zzzPatchInsurgentMod.lua Check 6")
	
	if not bagFound then
			print("zzzPatchInsurgentMod.lua Check bag not found")
			inv:AddItems("Base.Screwdriver", 1)
			inv:AddItems("Base.AlcoholBandage", 3)
			inv:AddItems("Base.AlcoholWipes", 1)
			inv:AddItems("Susceptible.GasmaskFilter", 2)
			inv:AddItems("Base.WaterBottleFull", 1 * ration)
			inv:AddItems("Base.OatsRaw", 2 * ration)
			inv:AddItems("Radio.WalkieTalkie5", 1)
	end
	
	print("zzzPatchInsurgentMod.lua Check 7")


    if player:HasTrait("Smoker") then
        inv:AddItems("Base.Lighter", 1)
        inv:AddItems("Base.Cigarettes", 1)
    end	

    -- Pistoleer gives the player a different pistol loadout
    if not player:HasTrait("LoadoutPistoleer") and not player:HasTrait("LoadoutGunslinger") and not player:HasTrait("LoadoutOSP") then
        InsurgentWeaponUtil.addBasicPistol(player)
    end

    local parachuteSound = "parachuteopening"
    if player:HasTrait("RoughLanding") then
        parachuteSound = player:isFemale() and "parachuteopeningroughfemale" or "parachuteopeningrough"
    end
    getSoundManager():PlaySound(parachuteSound, false, 5):setVolume(2.0)

end

local function RegisterEvents()
    for _, trait in pairs(InsurgentTraitDefinitions.traits) do
        if trait.RegisterEvents then
            trait:RegisterEvents()
        end
    end
end

Events.OnGameBoot.Add(RegisterEvents);
Events.OnNewGame.Add(InsurgentBeginGame);