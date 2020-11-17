import os
import sys
import subprocess

def getOutputFiles(folder):
    files = []
    for filename in os.listdir(folder):
        if filename.endswith('.sas7bdat'):
            files.append(filename)
    return files

def getCanonicalName(sasfile):
    components = sasfile.split('.')
    if len(components) == 2:
        return components[0]
    return ''

def runSasCommand(sasfilename):
    print('run the sas command')
    try:
        subprocess.run(["sas","appendsas.sas","-sysparam",sasfilename])
    except (RuntimeError, OSError) as err:
        print("Unexpected error: {}".format(err))
    except:
        print("Unexpected error:", sys.exc_info()[0])


def loadSasModule():
    try:
        subprocess.run(["module","load","sas/9.4/64"])
    except (RuntimeError, OSError) as err:
        print("Unexpected error: {}".format(err))
    except:
        print("Unexpected error:", sys.exc_info()[0])

def appendSasfiles(sasfiles):
    loadSasModule()
    for sasfile in sasfiles:
        print('processing file {}'.format(sasfile))
        canonicalName = getCanonicalName(sasfile)
        runSasCommand(canonicalName)

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('provide a folder name to find SAS files')
        exit(1)
    folder = sys.argv[1]
    sasfiles = getOutputFiles(folder)
