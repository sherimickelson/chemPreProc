fn = "slurm-84623.out_sScalar"

f = open(fn, 'r')

for line in f:
    line = line.strip()
    words = line.split(' ')
    if len(words) > 3:
        print words[len(words)-1].strip()
