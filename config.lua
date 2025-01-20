Config = {}

Config.log = true

Config.discord = {
  appId = "1294777031887814697",
  displayOptions = {
    ["mainText"] = "Main Text", -- The text displayed in the main rich presence
    ["smallImageText"] = "Small Image Text",-- The text displayed in the small image
    ["imageText"] = "Big Image Text", -- The text displayed in the big image
    ["smallImage"] = "", -- The image displayed in the small image, make sure its the asset name and not a image link
    ["bigImage"] = "", -- The image displayed in the big image, make sure its the asset name and not a image link
    ["buttons"] = { -- Button limit: 2
      { label = "", url = ""},
      -- { label = "", url = ""}
    }
  }
}

return Config
