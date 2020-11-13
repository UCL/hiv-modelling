import os
import sys
import pandas
import saspy

def getSASContent(sasfile):
    print('trying to open a SAS file')
    try:
        data = pandas.read_sas(sasfile, format='sas7bdat')
        print('done reading SAS file')
        print(data)
        return data
    except ValueError as valueError:
        print('error = {}'.format(valueError))
    return None

def findSASfiles(folder):
    files = []
    for filename in os.listdir(folder):
        path = folder + '/' + filename
        files.append(path)
    return files

def concatenateFiles(listOfFiles):
    alldata = pandas.DataFrame()

    for sasfile in listOfFiles:
        data = getSASContent(sasfile)
        if alldata.empty:
            alldata = data
        else:
            tmp = alldata
            tmp.append(data)
            alldata = tmp

    return alldata

def writeSasFile(alldata):
    sas = saspy.SASsession()
    path = os.getcwd()
    sas.saslib('merged', path=path)
    sas.dataframe2sasdata(df=alldata,table='merged',libref='alldata')


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('provide a folder name to find SAS files')
        exit(1)
    sasfiles = findSASfiles(sys.argv[1])
    alldata = concatenateFiles(sasfiles)
    writeSasFile(alldata)