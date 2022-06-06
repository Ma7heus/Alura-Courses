
from ast import Or

a, b = map(int,input().split())
r=0
i=0
if b<0:
    i=b*-1

while r<=i:
    q = (a-r)/b
    q=int(q)
    if a==(b*q)+r:
        r=a-(b/q)
        print(f"{q:.0f} {r}")
        break

    else:
        r=r+1

print("fim")

