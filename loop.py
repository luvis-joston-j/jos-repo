import math

a=11
for i in range(1,21):
    print(a,"*",i,"=",a*i)
    if(i==20):
        print("its over")
list=["peter","lois","stwie","brain",'chris']
for li in list:
    print(li.swapcase())
    for m in li:
         print(m.lower())
#WRITE A PROGRAM TAHT ARE EVEN NUMBERS FROM 1 TO 10

for n in range(0,10):
     if (n%2!=0):
         print((n))

n=int(input("enter the user input\n"))
fac=1
for f in range(1,n+1): #cuz we need to strt from 1 it should be incremented to 1 every itration
    fac*=f #fac=fac*f
print(fac)

for i in range(1,10):
    print(i,"\t\t\t\t\t\t",int(math.sqrt(i)))