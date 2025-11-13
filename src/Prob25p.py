fibonnaci = [1,1]
largedigits = []
i = 2
while i < 10000:
    new = fibonnaci[i-1] + fibonnaci[i-2]
    if len(str(new)) == 1000:
        break
    else:
        fibonnaci.append(new)
    i+=1
print i