local isAppInitialized = false

---Setup function for the rich presence
---@param appId string -- The App ID to setup
---@param displayOptions table -- The display options to show in presence
function setupApp(appId, displayOptions)
  if not appId or #appId <= 0 then
    return logger.error("Invalid Discord App ID"), false
  end

  if not displayOptions then
    return logger.error("Display options are required"), false
  end

  local displayOptions <const> = displayOptions

  SetDiscordAppId(appId)
  
  if #displayOptions["mainText"] > 0 then
    SetRichPresence(displayOptions["mainText"])
  end

  if #displayOptions["smallImageText"] > 0 then
    SetDiscordRichPresenceAssetSmallText(displayOptions["smallImageText"])
  end

  if #displayOptions["imageText"] > 0 then
    SetDiscordRichPresenceAssetText(displayOptions["imageText"])
  end

  if #displayOptions["smallImage"] > 0 then
    SetDiscordRichPresenceAssetSmall(displayOptions["smallImage"])
  end

  if #displayOptions["bigImage"] > 0 then
    SetDiscordRichPresenceAsset(displayOptions["bigImage"])
  end

  local buttons <const> = displayOptions["buttons"]

  if not buttons then goto initialize end

  if #buttons > 2 then
    logger.error("Discord Rich Presence only supports up to 2 buttons")
  else
    for i = 1, #buttons do
      local button = buttons[i]

      SetDiscordRichPresenceAction(i - 1, button.label, button.url)
    end
  end

  ::initialize::
  isAppInitialized = true

  return true
end

---Update the rich presence
---@param mainText string | nil -- The text displayed in the main rich presence
---@param smallImageText string | nil -- The text displayed in the small image
---@param imageText string | nil -- The text displayed in the big image
---@param smallImage string | nil -- The image displayed in the small image
---@param bigImage string | nil -- The image displayed in the big image
function updateDiscordPresence(mainText, smallImageText, imageText, smallImage, bigImage)
  if not isAppInitialized then
    return logger.error("Could not update presence when the app is not set up.")
  end

  if mainText then
    SetRichPresence(mainText)
  end

  if smallImageText then
    SetDiscordRichPresenceAssetSmallText(smallImageText)
  end

  if imageText then
    SetDiscordRichPresenceAssetText(imageText)
  end

  if smallImage then
    SetDiscordRichPresenceAssetSmall(smallImage)
  end

  if bigImage then
    SetDiscordRichPresenceAsset(bigImage)
  end
end

setupApp(Config.discord.appId, Config.discord.displayOptions)
Wait(10000)

updateDiscordPresence(nil, nil, nil, "other", "other")

---Exports
exports("updateDiscordPresence", updateDiscordPresence)