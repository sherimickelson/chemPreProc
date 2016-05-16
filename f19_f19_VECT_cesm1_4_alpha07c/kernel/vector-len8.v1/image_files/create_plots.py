import glob,os

files = glob.glob('*.gnuplot')
#print len(files)

for f in files:

    fn_split = f.split('.')
    t = fn_split[len(fn_split)-2]
    print t

    with open(f, 'a') as file:
        file.write('set terminal png size 800,600\n'+
                    'set output \"'+t+'.png\" \n'+
                    'replot\n')
    os.system('gnuplot '+f)
