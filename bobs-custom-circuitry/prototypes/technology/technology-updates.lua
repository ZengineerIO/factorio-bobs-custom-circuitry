if settings.startup["bobs-custom-circuitry-tech"].value then

  local cable = settings.startup["bobs-custom-circuitry-cable"].value
  local circuit = settings.startup["bobs-custom-circuitry-circuit"].value

  local _seablock = mods["seablock"]  -- is SeaBlock installed?

  -- don't mess too much with ScienceCostTweakerMod, so the limit is processing-unit
  if circuit == "advanced-processing-unit" and mods["ScienceCostTweakerM"] then
    circuit = "processing-unit"
  end

  if not _seablock then
    -- remove resin prerequisite and rubber unlocks. SeaBlock already does that.
    bobmods.lib.tech.remove_prerequisite("circuit-network", "bio-wood-processing")
    bobmods.lib.tech.remove_recipe_unlock("circuit-network", "bob-rubber")
    bobmods.lib.tech.remove_recipe_unlock("circuit-network", "insulated-cable")

    -- add rubber and insulated cables somewhere else. SeaBlock does it's own thing.
    bobmods.lib.tech.add_recipe_unlock("bio-wood-processing", "bob-rubber")
    bobmods.lib.tech.add_recipe_unlock("electronics", "insulated-cable")
    bobmods.lib.tech.add_prerequisite("electronics", "bio-wood-processing") -- so it makes sense
  end

  -- aka cheap mode
  if circuit == "basic-circuit-board" or cable == "copper-cable" then
    -- remove green science pack
    bobmods.lib.tech.remove_science_pack("circuit-network", "logistic-science-pack")
    bobmods.lib.tech.remove_prerequisite("circuit-network", "logistic-science-pack")

    -- replace electronics with lowest logistics
    if data.raw.technology["logistics-0"] then
      bobmods.lib.tech.replace_prerequisite("circuit-network", "electronics", "logistics-0")
    else
      bobmods.lib.tech.replace_prerequisite("circuit-network", "electronics", "logistics")
    end
  end

  -- add metal tech as prerequisite and appropriate packs
  if cable == "angels-wire-silver" and data.raw.technology["angels-silver-smelting-1"] then
    bobmods.lib.tech.add_prerequisite("circuit-network", "angels-silver-smelting-1")

  elseif cable == "gilded-copper-cable" and data.raw.technology["angels-gold-smelting-1"] then
    bobmods.lib.tech.add_prerequisite("circuit-network", "angels-gold-smelting-1")
    bobmods.lib.tech.add_new_science_pack("circuit-network", "chemical-science-pack", 1)
  end

  -- add circuit tech as prerequisite and appropriate packs
  if circuit == "advanced-circuit" then
    if _seablock then
      bobmods.lib.tech.replace_prerequisite("circuit-network", "logistic-science-pack", "advanced-electronics")
    else
      bobmods.lib.tech.replace_prerequisite("circuit-network", "electronics", "advanced-electronics")
      bobmods.lib.tech.remove_prerequisite("circuit-network", "logistic-science-pack")
    end
    -- red circuit -> red belt!
    bobmods.lib.tech.add_prerequisite("circuit-network", "logistics-2")

  elseif circuit == "processing-unit" then
    if _seablock then
      bobmods.lib.tech.replace_prerequisite("circuit-network", "logistic-science-pack", "advanced-electronics-2")
    else
      bobmods.lib.tech.replace_prerequisite("circuit-network", "electronics", "advanced-electronics-2")
      bobmods.lib.tech.remove_prerequisite("circuit-network", "logistic-science-pack")
    end
    bobmods.lib.tech.add_new_science_pack("circuit-network", "chemical-science-pack", 1)
    -- blue circuit -> blue belt!
    bobmods.lib.tech.add_prerequisite("circuit-network", "logistics-3")

  elseif circuit == "advanced-processing-unit" then
    bobmods.lib.tech.replace_prerequisite("circuit-network", "electronics", "advanced-electronics-3")
    bobmods.lib.tech.remove_prerequisite("circuit-network", "logistic-science-pack")
    bobmods.lib.tech.add_new_science_pack("circuit-network", "chemical-science-pack", 1)
    bobmods.lib.tech.add_new_science_pack("circuit-network", "production-science-pack", 1)
    if mods["bobtech"] then
      bobmods.lib.tech.add_prerequisite("circuit-network", "advanced-logistic-science-pack")
      bobmods.lib.tech.add_new_science_pack("circuit-network", "advanced-logistic-science-pack", 1)
    end
    -- purple circuit -> purple belt
    if data.raw.technology["logistics-4"] then
      bobmods.lib.tech.add_prerequisite("circuit-network", "logistics-4")
    end
  end
end
