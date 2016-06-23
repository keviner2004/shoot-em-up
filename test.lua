local array = {}
list = nil
local l = list
while l do
  print(l.value)
  l = l.next
end


for i =1,1000000 do
    array[i] = i 
end

for i =1,1000000 do
    list = { next = list, value = i }
end

