require "Insurgent/Traits/CombatMedicTrait"

function CombatMedicTrait.OnNewGame(player)
    if player:HasTrait("CombatMedic") then
        local inv = player:getInventory()
        local bagFound = false
        
        for i = 0, inv:getItems():size() - 1 do
            local item = inv:getItems():get(i)
            if item ~= nil then
                local itemFullType = item:getFullType()
                if itemFullType == "Insurgent.Bag_ALICEpack_Insurgent" or 
                   itemFullType == "Base.Bag_ALICEpack_Army" or 
                   itemFullType == "Base.Bag_ALICEpack" then
                    bagFound = true
                    local bagInv = item:getInventory()
                    bagInv:AddItems("Base.Scissors", 1)
                    bagInv:AddItems("Base.SutureNeedle", 2)
                    bagInv:AddItems("Base.SutureNeedleHolder", 1)
                    bagInv:AddItems("Base.Pills", 1)
                    bagInv:AddItems("Base.Tweezers", 1)
                    bagInv:AddItems("Base.Antibiotics", 2)
                    bagInv:AddItems("Base.AlcoholBandage", 2)
                    bagInv:AddItems("Base.AlcoholWipes", 1)
                    break
                end
            end
        end
        
        if not bagFound then
            inv:AddItems("Base.Scissors", 1)
            inv:AddItems("Base.SutureNeedle", 2)
            inv:AddItems("Base.SutureNeedleHolder", 1)
            inv:AddItems("Base.Pills", 1)
            inv:AddItems("Base.Tweezers", 1)
            inv:AddItems("Base.Antibiotics", 2)
            inv:AddItems("Base.AlcoholBandage", 2)
            inv:AddItems("Base.AlcoholWipes", 1)
        end
    end
end
