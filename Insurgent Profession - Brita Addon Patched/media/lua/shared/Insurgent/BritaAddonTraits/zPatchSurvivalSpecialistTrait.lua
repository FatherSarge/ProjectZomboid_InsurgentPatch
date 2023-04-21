require "Insurgent/Traits/SurvivalSpecialistTrait"

function SurvivalSpecialistTrait.OnNewGame(player)
    if player:HasTrait("SurvivalSpecialist") then
        local itemsTable = {
            {name = "camping.CampingTentKit", count = 1},
			{name = "camping.CampfireKit", count = 1},
			{name = "Base.Matches", count = 1},
			{name = "Base.HandAxe", count = 1},
        }
        addItemsToBag(player, itemsTable)
    end
end