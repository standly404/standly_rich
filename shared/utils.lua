logger = {}

function logger.debug(message)
  local resource <const> = GetCurrentResourceName()

  if type(message) == "table" then
    return print(("[%s] [DEBUG]: %s"):format(resource, json.encode(message, { indent=true })))
  end
  
  return print(("[%s] [DEBUG]: %s"):format(resource, message))
end