-- Easy

-- Write a function called ends_in_3(num) that returns true if the final digit
-- of num is 3, and false otherwise.

function ends_in_3(num)
  return string.sub(num, -1) == "3"
end

print(ends_in_3(123))
print(ends_in_3(321))

-- Now, write a similar function called is_prime(num) to test if a number is
-- prime (that is, it’s divisible only by itself and 1).

function is_prime(num)
  for i = 2, num - 1 do
    if num % i == 0 then
      return false
    end
  end

  return true
end

-- Create a program to print the first n prime numbers that end in 3.

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

-- What if Lua didn’t have a for loop? Using if and while, write a function
-- for_loop(a, b, f) that calls f() on each integer from a to b (inclusive).

function for_loop(a, b, f)
  while a <= b do
    f(a)
    a = a + 1
  end
end

-- Hard

-- Write a function reduce(max, init, f) that calls a function f() over the
-- integers from 1 to max.

function add(previous, next)
  return previous + next
end

function reduce(max, init, f)
  for i = 1, max do
    init = f(init, i)
  end

  return init
end

-- Implement factorial() in terms of reduce().

function factorial(n)
  return reduce(n, 1, function (a, b) return a * b end)
end
