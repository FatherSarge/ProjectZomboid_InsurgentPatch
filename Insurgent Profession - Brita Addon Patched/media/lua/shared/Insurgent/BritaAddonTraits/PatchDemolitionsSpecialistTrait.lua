require "Insurgent/Traits/DemolitionsSpecialistTrait"

function DemolitionsSpecialistTrait.OnNewGame(player)
    if player:HasTrait("DemolitionsSpecialist") then
        local itemsTable = {
            {name = "Base.PipeBomb", count = 3},
			{name = "Base.FlameTrap", count = 3},
			{name = "Base.Base.SmokeBomb", count = 3},
        }
        addItemsToBag(player, itemsTable)
    end
end
