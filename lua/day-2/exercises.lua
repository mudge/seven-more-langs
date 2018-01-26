-- Easy

-- Write a function called concatenate(a1, a2) that takes two arrays and
-- returns a new array with all the elements of a1 followed by all the elements
-- of a2.

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

-- Our strict table implementation in Reading and Writing doesn’t provide a way
-- to delete items from the table. If we try the usual approach, treasure.gold
-- = nil, we get a duplicate key error. Modify strict_write() to allow deleting
-- keys (by setting their values to nil).

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

-- Change the global metatable you discovered in the Find section earlier so
-- that any time you try to add two arrays using the plus sign (e.g., a1 + a2),
-- Lua concatenates them together using your concatenate() function.

function override_add(value)
  if type(value) ~= "table" then
    return value
  end

  local mt = getmetatable(value) or {}
  mt.__add = concatenate

  return setmetatable(value, mt)
end

setmetatable(_G, {
  __newindex = function (table, key, value)
    rawset(table, key, override_add(value))
  end
})

-- Using Lua’s built-in OO syntax, write a class called Queue that implements a
-- first-in, first-out (FIFO) queue as follows:
-- * q = Queue.new() returns a new object.
-- * q:add(item) adds item past the last one currently in the queue.
-- * q:remove() removes and returns the first item in the queue, or nil if the
--   queue is empty.

Queue = { queue = {} }

function Queue:new()
  local obj = { queue = self.queue }

  setmetatable(obj, { __index = self })

  return obj
end

function Queue:add(item)
  self.queue[#self.queue + 1] = item
end

function Queue:remove()
  return table.remove(self.queue, 1)
end

-- Hard

-- Using coroutines, write a fault-tolerant function retry(count, body) that works as follows:
-- * Call the body() function.
-- * If body() yields a string with coroutine.yield(), consider this an error
--   message and restart body() from its beginning.
-- * Don’t retry more than count times; if you exceed count, print an error message
--   and return.
-- * If body() returns without yielding a string, consider this a success.

function retry(count, body)
  local f = coroutine.create(body)

  for i = 1, count do
    local _, result = coroutine.resume(f)

    if type(result) ~= "string" then
      return result
    end

    f = coroutine.create(body)
  end

  error("Retried too many times!")
end
