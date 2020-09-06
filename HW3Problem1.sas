/* Proble #1 steps 1) and 2)*/
data winedata;
	infile '/folders/myfolders/Assignment 03/wine.txt' delimiter=',';
	input iden alco mali ash alca magn tota flav nonf proa colo hue od28 prol;
	label	iden='Identifier'
			alco='Alcohol'
			mali='Malic acid'
			ash='Ash'
			alca='Alcalinity of ash'
			magn='Magnesium'
			tota='Total phenols'
			flav='Flavanoids'
			nonf='Nonflavanoid phenols'
			proa='Proanthocyanins'
			colo='Color intensity'
			hue='Hue'
			od28='OD280/OD315 of diluted wines'
			prol='Proline';
title 'Wine Summary Data';
run;
/* step 3) */
proc means data=winedata;
run;
/* step 4) */
proc univariate data=winedata normal plot;
	var mali;
RUN;
/* step 5) */
proc chart data=winedata;
vbar mali/subgroup=iden;
run;
/* step 6) */
proc plot data=winedata;
plot mali*ash;
by iden;
run;

