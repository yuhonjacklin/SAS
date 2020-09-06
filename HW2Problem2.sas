DATA One;
	INPUT ID age name $;
	DATALINES;
	1001 21 Jone
	1002 20 Peter
	1003 22 Mary
	1004 19 Joe
	1005 21 Mark
	1006 23 Sue
	1007 19 Harry
	1008 18 Tom
	1009 22 Andy
	1020 21 Larry
	;
RUN;
PROC PRINT DATA=One;
RUN;

DATA Two;
	INPUT ID gender $ department $;
	DATALINES;
	1006 F Econ
	1007 M Econ
	1008 M Math
	1009 M Stat
	1010 M Stat
	1001 M Econ
	1002 M Stat
	1003 F Econ
	1004 F Econ
	1005 M Fina
	;
RUN;

PROC PRINT DATA=Two;
RUN;

/* concatenating, interleaving, one-to-one merge, match merge */

/*concatenating */
DATA combined1;
	SET One Two;
RUN;

PROC PRINT data=combined1;
RUN;

/* interleaving */
PROC SORT data=One;
	BY ID;
RUN;
PROC SORT data=Two;
	By ID;
RUN;

Data combined2;
	SET One Two;
	BY ID;
RUN;

PROC PRINT data=combined2;
RUN;

/* one-to-one merge */
Data combined3;
	MERGE One Two;
RUN;

PROC PRINT data=combined3;
RUN;

/* match merge */
DATA combined4;
	MERGE One Two;
	By ID;
RUN;

PROC PRINT data=combined4;
RUN;

DATA combined1;
	SET One Two;
RUN;

PROC PRINT data=combined1;
RUN;

/* Question 1) 
Concatenating and one-to-one merge does not require sorting. */


/* Question 2) 
Interleaving and match merge do require sorting. */

/* Question 3)
The top half (first 10 entries) remain the same, but the
second attempt has its bottom half sorted by ID. This is
because data Two was sorted by ID during interleaving
combination; whereas the top half was already sorted by ID. */