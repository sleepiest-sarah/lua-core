LCTimeUtils = {}

local m = LCTimeUtils

--seconds since epoch
function m.unixTime()
  return time()
end

--system uptime with millisecond precision
function m.systemTime()
  return GetTime()
end

return m