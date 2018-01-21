-- Easy
-- concatenate(a1, a2)

function concatenate(a1, a2)
  local a = {}

  for k, v in pairs(a1) do
    a[#a + 1] = v
  end

  for k, v in pairs(a2) do
    a[#a + 1] = v
  end

  return a
end

-- Modify strict_write() to allow deleting keys

local _private = {}

function strict_read(table, key)
  if _private[key] then
    return _private[key]
  else
    error("Invalid key: " .. key)
  end
end

function strict_write(table, key, value)
  if value and _private[key] then
    error("Duplicate key: " .. key)
  else
    _private[key] = value
  end
end

local strict_mt = {
  __index = strict_read,
  __newindex = strict_write
}
treasure = {}
setmetatable(treasure, strict_mt)

-- Medium
setmetatable(_G, {
  __newindex = function (table, key, value)
    if type(value) == "table" then
      -- Override + for any tables set as global variables
      rawset(table, key, setmetatable(value, {
        __add = concatenate,

        -- Hook up value's original metatable for any other lookups
        __index = getmetatable(value)
      }))
    else
      rawset(table, key, value)
    end
  end
})

Queue = { queue = {} }

function Queue:new()
  local obj = { queue = self.queue }

  setmetatable(obj, self)
  self.__index = self

  return obj
end

function Queue:add(item)
  self.queue[#self.queue + 1] = item
end

function Queue:remove()
  return table.remove(self.queue, 1)
end

-- Hard
function retry(count, body)
  local f = coroutine.create(body)

  while count > 0 do
    local _, result = coroutine.resume(f)

    if type(result) == "string" then
      count = count - 1
      f = coroutine.create(body)
    else
      return result
    end
  end

  error("Retried too many times!")
end
