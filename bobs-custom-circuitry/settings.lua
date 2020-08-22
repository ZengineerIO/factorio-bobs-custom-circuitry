data:extend{
  {
    type = "string-setting",
    name = "bobs-custom-circuitry-cable",
    order = "aa",
    setting_type = "startup",
    default_value = "tinned-copper-cable",
    allowed_values =  {"tinned-copper-cable", "copper-cable"}
  },
  {
    type = "string-setting",
    name = "bobs-custom-circuitry-circuit",
    order = "ab",
    setting_type = "startup",
    default_value = "electronic-circuit",
    allowed_values =  {"electronic-circuit", "basic-circuit-board"}
  },
  {
    type = "bool-setting",
    name = "bobs-custom-circuitry-combinators",
    order = "ac",
    setting_type = "startup",
    default_value = false
  }
}