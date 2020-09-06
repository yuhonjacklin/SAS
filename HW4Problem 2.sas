/*Step a) */
data crudeoil;
infile '/folders/myfolders/Assignment 04/oil costs hw4.txt' firstobs=5;
input Date Domestic Imported Composite;
run;

proc plot data=crudeoil;
plot domestic*date;
run;

/*Step b) */
proc plot data=crudeoil;
plot imported*date='%';
run;

/*Step c) */
proc plot data=crudeoil;
plot domestic*date='D' imported*date='I' /overlay;
run;