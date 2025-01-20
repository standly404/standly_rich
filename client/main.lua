local appId <const> = Config.discord.appId

if #appId <= 0 then return end

local isAppInitialized = false

---Update the rich presence
---@param presence string
function updatePresence(presence)
  if not presence then
    return logger.error("Presence cannot be nil or empty")
  end

  if not isAppInitialized then
    return logger.error("Could not update presence when the app is not set up.")
  end

  SetRichPresence(presence)
end

---Setup function for the rich presence
---@param appId string
---@param displayOptions table
function setupApp(appId, displayOptions)
  if not appId or #appId <= 0 then
    return logger.error("Invalid Discord App ID"), false
  end

  if not displayOptions then
    return logger.error("Display options are required"), false
  end

  local displayOptions <const> = displayOptions

  SetDiscordAppId(appId)

  if #displayOptions["small-asset"] > 0 then
    SetDiscordRichPresenceAssetSmall(options["small-asset"])
  end

  if #displayOptions["small-text"] > 0 then
    SetDiscordRichPresenceAssetSmallText(options["small-text"])
  end

  if #displayOptions["asset"] > 0 then
    SetDiscordRichPresenceAsset(options["asset"])
  end

  if #displayOptions["text"] > 0 then
    SetDiscordRichPresenceAssetText(options["text"])
  end

  if displayOptions["buttons"] then
    if #displayOptions["buttons"] > 2 then
      logger.error("Discord Rich Presence only supports up to 2 buttons")
    else
      for i = 1, #displayOptions["buttons"] do
        local button = displayOptions["buttons"][i]

        if #button.label > 0 and #button.url > 0 then
          SetDiscordRichPresenceAction(i - 1, button.label, button.url)
        end
      end
    end
  end

  isAppInitialized = true

  return true
end

setupApp(Config.discord.appId, Config.discord.displayOptions)
