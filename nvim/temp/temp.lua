-- function to add even numbers up to 100
local function addEvenNumbers()
  local sum = 0
  for i = 0, 100, 2 do
    sum = sum + i
  end
  return sum
end
addEvenNumbers()
