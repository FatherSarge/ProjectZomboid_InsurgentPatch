require "Insurgent/Traits/CombatMedicTrait"

function CombatMedicTrait.OnNewGame(player)
    if player:HasTrait("CombatMedic") then
        local itemsTable = {
            {name = "Base.Scissors", count = 1},
			{name = "Base.SutureNeedle", count = 2},
			{name = "Base.SutureNeedleHolder", count = 1},
			{name = "Base.Pills", count = 2},
			{name = "Base.Tweezers", count = 1},
			{name = "Base.Antibiotics", count = 2},
			{name = "Base.AlcoholBandage", count = 5},
			{name = "Base.AlcoholWipes", count = 2},
        }
        addItemsToBag(player, itemsTable)
    end
end