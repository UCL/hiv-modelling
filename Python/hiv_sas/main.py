from pandas import read_sas
import sys
# This is a sample Python script.

#SAS_file = '/Users/peterschmidt/VirtualBox VMs/SAS University Edition/myfolders/hiv-modelling/output/out_compressed.sas7bdat'

def openSasFile(sasfile):
    print('trying to open a SAS file')
    data = None
    try:
        data = read_sas(sasfile, format='sas7bdat')
        print('done reading SAS file')
        print(data)
    except ValueError as valueError:
        print('error = {}'.format(valueError))


def print_hi(name):
    print(f'Hi, {name}')


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('provide a filename/path for the SAS file')
        exit(1)

    openSasFile(sys.argv[1])

