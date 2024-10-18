import math


def avr(*numbers):#variable length arguements
    sum=0
    for i in numbers:
        sum=sum+i
    return (sum/len(numbers))
c=avr(5,3)
print(c)

def dick(**name):#variable legth arguments
    print(type(dick))
    print(name["fname"],name["lname"])
dick(fname="luvis",lname="joston")

def hud(fname="olive",lname="oil"): #default agruements
    print("still a coool dude too smooth just a",fname,lname)
hud("mother","fucker")

def fuck():
    pass

def jos(a): #keyword aguements
    print("my mother is",a)
jos(a="god")



def fun(x):
    #return x**2
    return x
c=fun(5)
print(c)

print(int(math.sqrt((4))))
print(pow(2,2))