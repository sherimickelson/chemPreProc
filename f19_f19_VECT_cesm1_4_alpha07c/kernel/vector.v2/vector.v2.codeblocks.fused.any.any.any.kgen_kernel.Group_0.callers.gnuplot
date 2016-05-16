X_LIMIT=67.21 # Do not touch this
FACTOR=1 # Do not touch this

# set term postscript eps solid color;
# set term pdfcairo solid color lw 2 font ",9";
# set term png size 800,600;
set datafile separator ";";
set key bottom outside center horizontal samplen 1;
set x2range [0:1];
set yrange [0:*];
set xtics nomirror format "%.02f";
set x2tics nomirror format "%.02f";
set ylabel 'Performance counter rate (in Mevents/s)';
set ytics nomirror;
set y2label 'Callers referenced';
set xlabel 'Time (in ms)';
set title "Appl * Task * Thread * - Group_0 - kgen_kernel\nDuration = 67.21";"
set xtics ( 0.0 , 1./5.*X_LIMIT, 2./5.*X_LIMIT, 3./5.*X_LIMIT, 4./5.*X_LIMIT, 5./5.*X_LIMIT);
set xrange [0:X_LIMIT*1./FACTOR];
set y2tics nomirror;

# Unneeded phases separators, nb. breakpoints = 2
slope_PAPI_L3_TCM(ret,c,r,g) = (c eq 'PAPI_L3_TCM' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN
slope_PAPI_TOT_CYC(ret,c,r,g) = (c eq 'PAPI_TOT_CYC' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN
slope_PAPI_TOT_INS(ret,c,r,g) = (c eq 'PAPI_TOT_INS' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN
slope_RESOURCE_STALLS(ret,c,r,g) = (c eq 'RESOURCE_STALLS' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN
caller(ret,r,g,t) = (r eq 'kgen_kernel' && g == 0 && t eq 'c') ? ret : NaN;
plot \
'vector.v2.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(slope_PAPI_L3_TCM($5, strcol(3), strcol(1), $2)) ti 'PAPI_L3_TCM' axes x2y1 w lines lw 3,\
'vector.v2.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(slope_PAPI_TOT_CYC($5, strcol(3), strcol(1), $2)) ti 'PAPI_TOT_CYC' axes x2y1 w lines lw 3,\
'vector.v2.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(slope_PAPI_TOT_INS($5, strcol(3), strcol(1), $2)) ti 'MIPS' axes x2y1 w lines lw 3,\
'vector.v2.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(slope_RESOURCE_STALLS($5, strcol(3), strcol(1), $2)) ti 'RESOURCE_STALLS' axes x2y1 w lines lw 3,\
'vector.v2.codeblocks.fused.any.any.any.dump.csv' u ($4*FACTOR):(caller($5, strcol(2), $3, strcol(1))) ti 'Caller' axes x2y2 w lines lw 2;


unset label;
unset arrow;
