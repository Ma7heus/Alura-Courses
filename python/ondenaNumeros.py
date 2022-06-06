a, b, c = map(float, input().split())
if a < c:
    a, c = c, a
if a < b:
    a, b = b, a
if b < c:
    b, c = c, b

print(a,b,c)