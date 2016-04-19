fn = "slurm-84620.out_h64"

f = open(fn, 'r')

for line in f:
    line = line.strip()
    words = line.split(' ')
    if len(words) > 3:
        print words[len(words)-1].strip()
