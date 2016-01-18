% Model of the queens problem
include "globals.mzn";

% parameters
int: n=;



% variables
array[1..n] of var 1..n: R;

% constraints
constraint all_different(R);
constraint all_different([R[i] + i | i in 1..n]);
constraint all_different([R[i] + i | i in 1..n]);

% objective
solve satisfy;

% output
output [show(R)];
