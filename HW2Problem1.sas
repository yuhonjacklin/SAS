/*beginning of 1) */
FILENAME tennis '/folders/myfolders/tennis.txt';
DATA tennis;
	INFILE tennis firstobs=3;
	INPUT name $21. matches wins losses bagels_served bagels_eaten male;
RUN;
PROC PRINT data=tennis;
RUN;
/*end of 1) */

/*beginning of 2) */
DATA tennis1;
	set tennis;
	keep name matches wins losses male;
RUN;
PROC PRINT data=tennis1;
RUN;
/*end of 2) */

/*beginning of 3) */
DATA tennis2;
	set tennis1;
	pct=wins/matches;
	if male=1 then tour='ATP';
	if male=0 then tour='WTA';
RUN;
PROC PRINT data=tennis2;
RUN;
/*end of 3) */

/*beginning of 4) */

PROC SORT DATA=tennis2 OUT=tennis3;
	BY DESCENDING pct;
RUN;

PROC PRINT DATA=tennis3;
RUN;
/*end of 4) */

/*beginning of 5) */
DATA atpdata wtadata;
	SET tennis3;
	IF male=1 then OUTPUT atpdata;
	ELSE output wtadata;
RUN;

PROC PRINT data=atpdata;
RUN;

PROC PRINT data=wtadata;
RUN;
/* end of 5) */

/*beginning of 6) */
DATA atp_rankings;
	SET atpdata;
	FILE '/folders/myfolders/atp_rankings.txt';
	KEEP name pct;
RUN;

PROC PRINT data=atp_rankings;
RUN;
