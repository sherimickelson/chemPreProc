X_LIMIT=66.64 # Do not touch this
FACTOR=1 # Do not touch this

# set term postscript eps solid color;
# set term pdfcairo solid color lw 2 font ",9";
# set term png size 800,600;
set datafile separator ";";
set key bottom outside center horizontal samplen 1;
set x2range [0:1];
set yrange [0:*];
set x2tics nomirror format "%.02f";
set xlabel 'Time (in ms)';
set xtics nomirror format "%.02f";
set xtics ( 0.0 , 1./5.*X_LIMIT, 2./5.*X_LIMIT, 3./5.*X_LIMIT, 4./5.*X_LIMIT, 5./5.*X_LIMIT);
set xrange [0:X_LIMIT*1./FACTOR];
set ylabel 'Counter ratio per instruction';
set y2label 'MIPS';
set ytics nomirror;
set y2tics nomirror;
set title "Appl * Task * Thread * - Group_0 - kgen_kernel"
# Breakpoints

# Unneeded phases separators, nb. breakpoints = 2
slope_PAPI_L1_TCM(ret,c,r,g) = (c eq 'PAPI_L1_TCM' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;
ratio_PAPI_L1_TCM(ret,c,r,g) = (c eq 'PAPI_L1_TCM_per_ins' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;
slope_PAPI_L2_TCM(ret,c,r,g) = (c eq 'PAPI_L2_TCM' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;
ratio_PAPI_L2_TCM(ret,c,r,g) = (c eq 'PAPI_L2_TCM_per_ins' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;
slope_PAPI_TOT_CYC(ret,c,r,g) = (c eq 'PAPI_TOT_CYC' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;
ratio_PAPI_TOT_CYC(ret,c,r,g) = (c eq 'PAPI_TOT_CYC_per_ins' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;
slope_PAPI_TOT_INS(ret,c,r,g) = (c eq 'PAPI_TOT_INS' && r eq 'kgen_kernel' && g == 0 ) ? ret : NaN;

plot \
'vector.v1.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_L1_TCM($5, strcol(3), strcol(1), $2)) ti 'PAPI_L1_TCM/ins' axes x2y1 w lines lw 3,\
'vector.v1.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_L2_TCM($5, strcol(3), strcol(1), $2)) ti 'PAPI_L2_TCM/ins' axes x2y1 w lines lw 3,\
'vector.v1.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_TOT_CYC($5, strcol(3), strcol(1), $2)) ti 'PAPI_TOT_CYC/ins' axes x2y1 w lines lw 3,\
'vector.v1.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(slope_PAPI_TOT_INS($5, strcol(3), strcol(1), $2)) ti 'MIPS' axes x2y2 w lines lw 3;

unset label;
unset arrow;
pause -1
