fn = "slurm-84639.out_h_vec_len64"

f = open(fn, 'r')

for line in f:
    line = line.strip()
    words = line.split(' ')
    if len(words) > 3:
        print words[len(words)-1].strip()
