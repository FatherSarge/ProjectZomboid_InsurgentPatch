require "Insurgent/Traits/SurvivalSpecialistTrait"

function SurvivalSpecialistTrait.OnNewGame(player)
    if player:HasTrait("SurvivalSpecialist") then
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
						bagInv:AddItems("camping.CampingTentKit", 1)
						bagInv:AddItems("camping.CampfireKit", 1)
						bagInv:AddItems("Base.Matches", 1)
						bagInv:AddItems("Base.HandAxe", 1)
					break
				end
            end
        end
	
		if not bagFound then
	
			inv:AddItems("camping.CampingTentKit", 1);		
			inv:AddItems("camping.CampfireKit", 1);				
			inv:AddItems("Base.Matches", 1);
			inv:AddItems("Base.HandAxe", 1);
			
		end
    end	
end