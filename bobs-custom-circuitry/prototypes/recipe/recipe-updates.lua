local cable = settings.startup["bobs-custom-circuitry-cable"].value
local circuit = settings.startup["bobs-custom-circuitry-circuit"].value

local function make_combinator_recipes(_cable, _circuit)
  -- bobmods.lib.recipe.replace_ingredient(recipe, old, new)
  bobmods.lib.recipe.set_ingredients("constant-combinator", {
    {_cable, 5},
    {_circuit, 2}
  })

  bobmods.lib.recipe.set_ingredients("arithmetic-combinator", {
    {_cable, 5},
    {_circuit, 5}
  })

  bobmods.lib.recipe.set_ingredients("decider-combinator", {
    {_cable, 5},
    {_circuit, 2}
  })

  bobmods.lib.recipe.set_ingredients("power-switch", {
    {_cable, 5},
    {"iron-plate", 5},
    {_circuit, 2}
  })

  bobmods.lib.recipe.set_ingredients("programmable-speaker", {
    {_cable, 5},
    {"iron-plate", 3},
    {"iron-stick", 4},
    {_circuit, 4}
  })
end

-- fallback to default value if selected component is unavailable
if not data.raw.item[cable] then
  log("WARNING: cable selection ["..cable.."] not found, using [insulated-cable] in recipes instead")
  cable = "insulated-cable"
end

if not data.raw.item[circuit] then
  log("WARNING: circuit selection ["..circuit.."] not found, using [electronic-circuit] in recipes instead")
  circuit = "electronic-circuit"
end

-- don't mess too much with ScienceCostTweakerMod, so the limit is processing-unit
if circuit == "advanced-processing-unit" and mods["ScienceCostTweakerM"] then
  circuit = "processing-unit"
end

-- change wire recipes
bobmods.lib.recipe.set_ingredients("green-wire", {{circuit, 1}, {cable, 1}})
bobmods.lib.recipe.set_ingredients("red-wire", {{circuit, 1}, {cable, 1}})

-- change combinator recipes
if settings.startup["bobs-custom-circuitry-align"].value then
  make_combinator_recipes(cable, circuit)
elseif settings.startup["bobs-custom-circuitry-combinators"].value then -- to be removed at some point!
  make_combinator_recipes("copper-cable", "basic-circuit-board")
end
