require "Insurgent/Traits/LoadoutExplosives"

function LoadoutExplosivesTrait.OnNewGame(player)
    if player:HasTrait("LoadoutExplosives") then
        local itemsTable = {
            {name = "Base.PipeBomb", count = 3},
			{name = "Base.FlameTrap", count = 3},
			{name = "Base.Base.SmokeBomb", count = 3},
        }
        addItemsToBag(player, itemsTable)
    end
end