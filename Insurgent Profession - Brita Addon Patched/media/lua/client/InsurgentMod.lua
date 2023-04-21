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
	
    local inv = player:getInventory();
	local bagFound = false;
	
    local ration = 1;
    if player:HasTrait("LoadoutExtraRations") then	
        ration = 2;
    elseif	player:HasTrait("LoadoutNoRations") then	
        ration = 0;
    end	
    
	inv:AddItems("Insurgent.DeployedParachute", 1)
    inv:AddItems("Base.WaterBottleFull", 1)
	inv:AddItems("Base.SlingA", 1)
    inv:AddItems("Base.KnifeSheath", 1)
    inv:AddItems("Base.HuntingKnife", 1)
	
	--Adds items to backpack if player has one, to inv if they do not
	local itemsTable = {
		{name = "Base.Screwdriver", count = 1},
		{name = "Base.AlcoholBandage", count = 3},
		{name = "Base.AlcoholWipes", count = 1},
		{name = "Susceptible.GasmaskFilter", count = 2},
		{name = "Base.WaterBottleFull", count = 1 * ration},
		{name = "Base.OatsRaw", count = 2 * ration},
		{name = "Radio.WalkieTalkie5", count = 1},
    }
    addItemsToBag(player, itemsTable)

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