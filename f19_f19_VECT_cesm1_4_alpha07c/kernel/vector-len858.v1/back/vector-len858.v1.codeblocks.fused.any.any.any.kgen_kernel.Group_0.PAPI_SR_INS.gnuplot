X_LIMIT=86.50 # Do not touch this
FACTOR=1 # Do not touch this

# set term postscript eps solid color;
# set term pdfcairo solid color lw 2 font ",9";
# set term png size 800,600;
set datafile separator ";";
set key bottom outside center horizontal samplen 1;
set x2range [0:1];
set yrange [0:1];
set y2range [0:*];
set ytics nomirror;
set y2tics nomirror;
set x2tics nomirror format "%.02f";
set ylabel 'Normalized PAPI_SR_INS';
set xlabel 'Time (in ms)';
set xtics nomirror format "%.02f";
set xtics ( 0.0 , 1./5.*X_LIMIT, 2./5.*X_LIMIT, 3./5.*X_LIMIT, 4./5.*X_LIMIT, 5./5.*X_LIMIT);
set xrange [0:X_LIMIT*1./FACTOR];
set y2label 'PAPI_SR_INS rate (in Mevents/s)';
set title "Appl * Task * Thread * - Group_0 - kgen_kernel\nDuration = 86.50 ms, Counter = 12.32 Mevents";
# Mean rate

set label "" at first X_LIMIT*1./FACTOR, second 142.42 point pt 3 ps 2 lc rgbcolor "#707070";
# Breakpoints

# Unneeded phases separators, nb. breakpoints = 2
# Data accessors to CSV

sampleexcluded(ret,c,r,g,t) = (c eq 'PAPI_SR_INS' && r eq 'kgen_kernel' && g == 0  && t eq 'e') ? ret : NaN;
sampleunused(ret,c,r,g,t) = (c eq 'PAPI_SR_INS' && r eq 'kgen_kernel' && g ==  0 && t eq 'un') ? ret : NaN;
sampleused(ret,c,r,g,t) = (c eq 'PAPI_SR_INS' && r eq 'kgen_kernel' && g == 0 && t eq 'u') ? ret : NaN;
interpolation(ret,c,r,g) = (c eq 'PAPI_SR_INS' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;
slope(ret,c,r,g) = (c eq 'PAPI_SR_INS' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;

# Plot command
plot \
NaN ti 'Mean PAPI_SR_INS rate' w points pt 3 lc rgbcolor "#707070" ,\
'vector-len858.v1.codeblocks.fused.any.any.any.dump.csv' u ($4*FACTOR):(sampleexcluded($6, strcol(5), strcol(2), $3, strcol(1))) ti 'Excluded samples (933)' axes x2y1 w points pt 3 lc rgbcolor '#A0A0A0',\
'vector-len858.v1.codeblocks.fused.any.any.any.dump.csv' u ($4*FACTOR):(sampleunused($6, strcol(5), strcol(2), $3, strcol(1))) ti 'Unused samples (433)' axes x2y1 w points pt 3 lc rgbcolor '#FFA0A0',\
'vector-len858.v1.codeblocks.fused.any.any.any.dump.csv' u ($4*FACTOR):(sampleused($6, strcol(5), strcol(2), $3, strcol(1))) ti 'Used samples (2000)' axes x2y1 w points pt 3 lc rgbcolor '#FF0000',\
'vector-len858.v1.codeblocks.fused.any.any.any.interpolate.csv' u ($4*FACTOR):(interpolation($5, strcol(3), strcol(1), $2)) ti 'Fitting [Kriger (nuget=1.0e-04)]' axes x2y1 w lines lw 3 lc rgbcolor '#00FF00',\
'vector-len858.v1.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(slope($5, strcol(3), strcol(1), $2)) ti 'Counter rate' axes x2y2 w lines lw 3 lc rgbcolor '#0000FF';

unset label;
unset arrow;
