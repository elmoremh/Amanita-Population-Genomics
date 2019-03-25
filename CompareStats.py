import os
import sys

def getStats(path):
    for pathname, dirnames, filenames in os.walk(path):
        for filename in ( os.path.join(pathname, x) for x in filenames ):
            stat = os.stat(filename)
            yield filename[len(path):], stat.st_mtime, stat.st_size

sys.exit(tuple(getStats(sys.argv[1])) != tuple(getStats(sys.argv[2])))