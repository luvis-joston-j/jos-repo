
print("welcome to the calculator \n select number according to the  operation \n")
print("1:-Sum \n 2:-Substact \n 3:-multiply \n 4:-divide")
userpass = int(input())
print(userpass)
if (userpass < 5) :
    print("enter your first number")
    a=int(input())
    print("enter your second number")
    b=int(input())
    match userpass:
     case 1:
        print(a + b);
     case 2:
        print(a - b);
     case 3:
        print(a * b);
     case 4:
        print(a / b);
     case other:
        print("select valid number")
