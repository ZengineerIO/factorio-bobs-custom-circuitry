data:extend{
  {
    type = "string-setting",
    name = "bobs-custom-circuitry-cable",
    order = "aa",
    setting_type = "startup",
    default_value = "insulated-cable",
    allowed_values =  {
      "copper-cable",
      "tinned-copper-cable",
      "insulated-cable",
      "angels-wire-silver",
      "gilded-copper-cable"
    }
  },
  {
    type = "string-setting",
    name = "bobs-custom-circuitry-circuit",
    order = "ab",
    setting_type = "startup",
    default_value = "electronic-circuit",
    allowed_values =  {
      "basic-circuit-board",
      "electronic-circuit",
      "advanced-circuit",
      "processing-unit",
      "advanced-processing-unit"
    }
  },
  {
    type = "bool-setting",
    name = "bobs-custom-circuitry-combinators",
    order = "ac",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "bobs-custom-circuitry-align",
    order = "ad",
    setting_type = "startup",
    default_value = false
  },
  {
    type = "bool-setting",
    name = "bobs-custom-circuitry-tech",
    order = "ae",
    setting_type = "startup",
    default_value = false
  }
}
