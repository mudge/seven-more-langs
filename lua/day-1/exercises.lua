-- Easy

function ends_in_3(num)
  return string.sub(num, -1) == "3"
end

print(ends_in_3(123))
print(ends_in_3(321))

function is_prime(num)
  for i = 2, num - 1 do
    if num % i == 0 then
      return false
    end
  end

  return true
end

function first_n_primes_ending_in_3(n)
  local count = 0
  local i = 3

  while count < n do
    if ends_in_3(i) and is_prime(i) then
      print(i)
      count = count + 1
    end

    i = i + 10
  end
end

-- Medium

function for_loop(a, b, f)
  while a <= b do
    f(a)
    a = a + 1
  end
end

-- Hard

function add(previous, next)
  return previous + next
end

function reduce(max, init, f)
  for i = 1, max do
    init = f(init, i)
  end

  return init
end

function factorial(n)
  return reduce(n, 1, function (a, b) return a * b end)
end
