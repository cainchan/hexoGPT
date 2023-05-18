import os
import sys

print(sys.argv[1])
f = open(sys.argv[1],'r')
titleList = f.read().split('\n')
print(titleList)
os.chdir(os.getcwd())
print(os.getcwd())
for title in titleList:
    print(title + 'start')
    os.system('./auto.sh flask '+title)
f.close()