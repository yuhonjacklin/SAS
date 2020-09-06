data crudeoil;
infile '/folders/myfolders/Assignment 04/oil costs hw4.txt' firstobs=5;
input Date Domestic Imported Composite;
run;

proc univariate data=crudeoil;
run;

/* Domestic:  Mean	16.982	    Std Deviation	2.00037996
   Import:    Mean  16.888	    Std Deviation	1.91463763
   Composite: Mean  16.9336667	Std Deviation	1.94810515 */

proc standard data=crudeoil mean=17 std=2
out=stndoil;
var domestic imported composite;
run;

proc print data=crudeoil;
run;

proc print data=stndoil;
run;