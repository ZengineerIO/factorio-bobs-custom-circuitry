local recipe = {
  {settings.startup["bobs-custom-circuitry-cable"].value, 1},
  {settings.startup["bobs-custom-circuitry-circuit"].value, 1}
}

data.raw.recipe["red-wire"].ingredients = recipe
data.raw.recipe["green-wire"].ingredients = recipe

if settings.startup["bobs-custom-circuitry-combinators"].value then

  data.raw.recipe["constant-combinator"].ingredients = {
    {"copper-cable", 5},
    {"basic-circuit-board", 2}
  }

  data.raw.recipe["arithmetic-combinator"].ingredients = {
    {"copper-cable", 5},
    {"basic-circuit-board", 5}
  }

  data.raw.recipe["decider-combinator"].ingredients = {
    {"copper-cable", 5},
    {"basic-circuit-board", 2}
  }

  data.raw.recipe["power-switch"].ingredients = {
    {"copper-cable", 5},
    {"iron-plate", 5},
    {"basic-circuit-board", 2}
  }

  data.raw.recipe["programmable-speaker"].ingredients = {
    {"copper-cable", 5},
    {"iron-plate", 3},
    {"iron-stick", 4},
    {"basic-circuit-board", 4}
  }

end