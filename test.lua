local a = {}

a[1] = 1
a[2] = 2
a[3] = 3
a[4] = 4

a[2] = nil
a[3] = nil

print(#a)