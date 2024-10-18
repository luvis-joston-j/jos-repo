marks=int(input("entet the marks:  "))
if(marks>=35):
    print(" just passs")
elif(marks>=40 and marks<=60):
    print("sencond class")
elif(marks>=61 and marks<=80):
    print("first classs")
elif(marks>=81 and marks<=100):
    print("distiction")
else:
    print("fail")
amt=0
if(amt>=100 and amt<=200):
    print("free")
elif(amt>=500):
    amt=500+(amt-100)