import os
import sys

print(sys.argv[1])
print(sys.argv[2])
f = open(sys.argv[2],'r')
titleList = f.read().split('\n')
print(titleList)
os.chdir(os.getcwd())
print(os.getcwd())
for title in titleList:
    print(title + 'start')
    if not title.strip(): continue
    os.system('/bin/zsh ./auto.sh '+sys.argv[1]+' '+title.strip())
f.close()
