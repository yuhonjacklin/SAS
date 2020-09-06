data corn;
	infile '/folders/myfolders/Assignment 03/corn.txt';
	input year yield rain;
	if yield<32 then catyield='poor';
	if yield>=32 then catyield='good';
	if rain<=9.7 then catrain='drought';
	if 9.7<rain<=12 then catrain='normal';
	if rain>12 then catrain='wet';
run;
/* step 1) */
proc freq data=corn;
tables catyield catrain;
run;

/* Analysis: There are 12 and 7 occurrences of 'good' and 'poor' corn yields, respecitvely.
63.16% of the years examined in the data set were 'good'; whereas 36.84% were 'poor'.

Among the 19 years examined in the data set, nine years (47.37%) were classified as 'drought';
seven years (36.84%) were classified as 'normal'; and three years (15.79%) were classified as
'wet'. */

/* step 2) */
proc freq data=corn;
tables catyield*catrain;
run;

/* Analysis: What appears unusual is that contrary to popular belief, drought does not
negatively affect corn yield. Among the nine years classified as "drought", four yielded
"good" corn production whereas five yielded "poor" corn production. */