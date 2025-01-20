logger = {}

local resource <const> = GetCurrentResourceName()

---Send a debug log in the console
---@param message string | table
function logger.debug(message)
  if not Config.log then return end

  if type(message) == "table" then
    return print(("[%s] ^3[DEBUG]^7: %s"):format(resource, json.encode(message, { indent=true })))
  end
  
  return print(("[%s] ^3[DEBUG]^7: %s"):format(resource, message))
end

---Send an error log in the console
---@param message string
function logger.error(message)
  if not Config.log then return end

  return print(("[%s] ^1[ERROR]^7: %s"):format(resource, message))
end