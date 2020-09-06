/* Problem 1 */
/* Step a) */
data crudeoil;
infile '/folders/myfolders/Assignment 04/oil costs hw4.txt' firstobs=5;
input Date Domestic Imported Composite;
Domestic2 = Domestic - 20;
run;

proc means n mean std t prt;
title1 'One-sided t-Test';
var Domestic2;
run;

/*Null hypothesis: The average Domestic Crude Oil Refiner Acquistion cost is equal to $20 per Barrel.
Alternate hypotehsis: The average Domestic Crude Oil Refiner Acquisition
costs is smaller than $20 per barrel.

p-value = (.0001)/2 <= .05 

Reject null hypothesis.

Ans: Yes, the avearge Domestic Crude Oil Refiner Acquisition costs
is smaller than $20 per barrel. (end of Step a) */

/* Step b) */
data crudeoil2;
infile '/folders/myfolders/Assignment 04/oil costs hw4.txt' firstobs=5;
input Date Domestic Imported Composite;
Imported2 = Imported - 15;
run;

proc means n mean std t prt;
title1 'Two-sided t-Test';
var Imported2;
run;

/*Null hypothesis: The average Imported Crude Oil Refiner Acquisition costs equals $15 per barrel.
Alternate hypothesis: The avearge Imported Crude Oil Refiner Acquisition costs does not equal $15 per barrel.

p-value < 0.0001 < 0.05

Reject null hypothesis

Ans: Yes, the average Imported Crude Oil Refiner Acquisition costs
is different from $15 per barrel (end of Step b) */

/* Step c) */
data crudeoil3;
infile '/folders/myfolders/Assignment 04/oil costs hw4.txt' firstobs=5;
input Date Domestic Imported Composite;
	  Diff = (Domestic - Imported);
run;

proc means n mean stderr t prt;
title1 'Paired t-test';
var Diff;
run;

/*Null hypothesis: the average Domestic and Imported Crude Oil Refiner Acquisition costs are the same.
Alternate hypothesis: the average Domestic and Imported Crude Oil Refiner Acuqisition costs are different.

p-value = 0.1724 >= 0.05

Do not reject null hypothesis (end of Step c)

Ans: No, the average Domestic and avearge Imported Crude Oil Refiner Acquisition
costs are the same. */

/* Step d) */
data crudeoil4;
infile '/folders/myfolders/Assignment 04/oil costs hw4 part 2.txt';
input cost type;
run;
data crudeoil5;
set crudeoil4;
if type = 1 | type = 2;
run;
proc ttest data=crudeoil5;	/* Use PROC TTEST for analysis. */
class type;
var cost;
title 'Two-sample t-Test';
run;

/*Null hypothesis: The average Domestic and Imported Crude Oil Refiner Acquisition
costs are the same.
Alternate hypothesis: THe average Domestic and Imported Crude Oil Refiner Acquisition
costs are different.

equal variance: p-value = 0.8531 >= 0.05 (Do not reject null hypothesis)
unequal variance: p-value = 0.8531 >= 0.05 (Do not reject null hypothesis)

Ans: No, the average Domestic and Imported Crude Oil Refiner Acquisition
costs are the same.
(end of Step d) */

/* Step e) */
proc anova data=crudeoil5;
class type;
model cost=type;
means type;
title 'One-Way ANOVA';
run;

/* t-statistic in d): 0.19
   F-statistic in e): 0.03
   p-value in d): 0.8531
   p-value in e): 0.8531
   The p-values in d) and e) are identical; but the F statistic in e) is substantially smaller than the t statistic in d).
(end of Step e) */


