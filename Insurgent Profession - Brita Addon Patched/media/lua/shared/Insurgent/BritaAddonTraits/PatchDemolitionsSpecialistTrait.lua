require "Insurgent/Traits/DemolitionsSpecialistTrait"

function DemolitionsSpecialistTrait.OnNewGame(player)
    if player:HasTrait("DemolitionsSpecialist") then
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
                    bagInv:AddItems("Base.PipeBomb", 3)
                    bagInv:AddItems("Base.FlameTrap", 3)
                    bagInv:AddItems("Base.Base.SmokeBomb", 3)
                    break
                end
            end
        end
		
        if not bagFound then
            inv:AddItems("Base.PipeBomb", 3);
            inv:AddItems("Base.FlameTrap", 3);
            inv:AddItems("Base.Base.SmokeBomb", 3);
        end
    end	
end
