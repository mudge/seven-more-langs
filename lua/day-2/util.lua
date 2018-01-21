-- > You can actually use any data type as a table key

function print_table(t)
  for k, v in pairs(t) do
    print(k .. ": " .. v)
  end
end

-- Notice that, like mathematicans and civilians, Lua counts array indices starting at 1.
-- Arrays and dictionaries aren't mutually exclusive in Lua. (Unlike PHP.)

function table_to_string(t)
  local result = {}

  for k, v in pairs(t) do
    result[#result + 1] = k .. ": " .. v
  end

  return table.concat(result, "\n")
end
