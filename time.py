import time
import pyttsx3
engine=pyttsx3.init()
tm=int(time.strftime('%H'))
print(tm)
if(tm>=0 and tm<=11):
    engine.say("good morning sir")
    print("good morning sir!!!!")
    engine.runAndWait()
elif(tm>=12 and tm<=16):
    engine.say("good afternoon")
    print("good afternoon sir!!!!!")
    engine.runAndWait()
elif(tm>=17 and tm<=19):
    engine.say("good evening")
    print("good evinig  sir!!!!!")
    engine.runAndWait()
elif(tm>=20 and tm<=24):
    engine.say("good night sir")
    print("good night sir!!!!!")
    engine.runAndWait()