local a = {
    k1 = 1,
    k2 = 2

}

function b()
end

for k, v in pairs(a) do
    print(k, v)
end

print(type(b))