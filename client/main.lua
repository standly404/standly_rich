local appId <const> = Config.discord.appId

if #appId <= 0 then return end

local isAppInitilized = false

function updatePresence(presence)
  if not isAppInitilized then 
    logger.debug("Could not update presence when the app is not setup")
    return 
  end

  assert(presence, ("Invalid Arguments - presence: "):format(presence))

  SetRichPresence(presence)
end

---Setup function for the rich presence
---@param appId string
---@param displayOptions table
function setupApp(appId, displayOptions)
  local displayOptions <const> = displayOptions

  SetDiscordAppId(appId)

  if #displayOptions["small-asset"] > 0 then
    SetDiscordRichPresenceAssetSmall(displayOptions["small-asset"])
  end

  if #displayOptions["small-text"] > 0 then
    SetDiscordRichPresenceAssetSmallText(displayOptions["small-text"])
  end

  if #displayOptions["asset"] > 0 then
    SetDiscordRichPresenceAsset(displayOptions["asset"])
  end

  if #displayOptions["text"] > 0 then
    SetDiscordRichPresenceAssetText(displayOptions["text"])
  end

  SetRichPresence("test")

  isAppInitilized = true
end
updatePresence()
setupApp(Config.discord.appId, Config.discord.displayOptions)