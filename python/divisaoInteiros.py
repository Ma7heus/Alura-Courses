a, b = map(int, input().split())
q = a // abs(b)
if b < 0: 
    q = q * -1    
r = a % abs(b)
print(q, r)