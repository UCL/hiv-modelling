from pandas import read_sas, read_csv
# This is a sample Python script.

SAS_file = '/Users/peterschmidt/VirtualBox VMs/SAS University Edition/myfolders/output_id.sas7bdat'

def openSasFile():
    print('trying to open a SAS file')
    try:
        read_sas(SAS_file, format='sas7bdat')
        print('done reading SAS file')
    except ValueError as valueError:
        print('error = {}'.format(valueError))

    data = read_csv(SAS_file)
    print('Did we get the data? {}'.format(data))

    with open(SAS_file, 'r') as sas_file:
        print ('opening file')

def print_hi(name):
    print(f'Hi, {name}')


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    openSasFile()

