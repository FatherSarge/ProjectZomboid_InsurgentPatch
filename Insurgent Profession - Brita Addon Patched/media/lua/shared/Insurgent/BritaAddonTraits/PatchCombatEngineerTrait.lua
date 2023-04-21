require "Insurgent/Traits/CombatEngineerTrait"

function CombatEngineerTrait.OnNewGame(player)
    if player:HasTrait("CombatEngineer") then
        local itemsTable = {
            {name = "Base.NoiseTrap", count = 3},
            {name = "Base.SmokeBomb", count = 3},
            {name = "Base.BallPeenHammer", count = 1},
            {name = "Base.BlowTorch", count = 1},
            {name = "Base.WeldingMask", count = 1},
        }
        addItemsToBag(player, itemsTable)
    end
end