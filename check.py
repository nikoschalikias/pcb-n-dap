from os import listdir
from os.path import isfile, join, getmtime
import time
import sys

now = time.time()
timeGap = now - 60*10
folder = ""#"gerber\\renamed"

if len(sys.argv) == 3:
    timeGap = now - 60*float(sys.argv[1])
    folder = sys.argv[2]

    
onlyfiles = [ f for f in listdir(folder) if isfile(join(folder,f)) ]

fileChanged_old = 0

for file in onlyfiles:
    fileChanged = getmtime(folder + "\\"+file)

    if fileChanged_old - fileChanged >= timeGap and fileChanged_old != 0:
        print file, " is OLDER than required - ", fileChanged_old-fileChanged
    elif fileChanged - fileChanged_old < timeGap:
        print file, " is OK - ", fileChanged_old-fileChanged
    else:
        print file, " is TOO NEW than the previous - ", fileChanged - fileChanged_old
    #print fileChanged_old-fileChanged
    if fileChanged_old == 0:
        fileChange_old = fileChanged
    

        
'''
    if fileChanged_old-fileChanged > timeGap:
        # print file, time.ctime(fileChanged), "OLD"
        print "OLD--------------------->", file, time.ctime(fileChanged)
    else:
    	#print file, time.ctime(fileChanged), "NEW"
        print file
    fileChanged_old = fileChanged
'''







