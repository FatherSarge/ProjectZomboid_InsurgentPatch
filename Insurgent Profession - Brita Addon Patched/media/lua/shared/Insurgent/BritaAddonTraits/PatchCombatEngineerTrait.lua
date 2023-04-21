require "Insurgent/Traits/CombatEngineerTrait"

function CombatEngineerTrait.OnNewGame(player)
    if player:HasTrait("CombatEngineer") then
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
                    bagInv:AddItems("Base.NoiseTrap", 3)
                    bagInv:AddItems("Base.Base.SmokeBomb", 3)
                    bagInv:AddItems("Base.BallPeenHammer", 1)
                    bagInv:AddItems("Base.BlowTorch", 1)
                    bagInv:AddItems("Base.WeldingMask", 1)
                    break
                end
            end
        end

        if not bagFound then
            inv:AddItems("Base.NoiseTrap", 3);
            inv:AddItems("Base.Base.SmokeBomb", 3);            
            inv:AddItems("Base.BallPeenHammer", 1);            
            inv:AddItems("Base.BlowTorch", 1);
            inv:AddItems("Base.WeldingMask", 1);
        end
    end
end