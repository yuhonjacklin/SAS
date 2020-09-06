/* Final Project Problem 1 Part 1 */
data car;
infile '/folders/myfolders/Final Project/car final project.txt' firstobs=2;
input name $1-29 weight disp mileage fuel type $;
label 	name='Model name'
		weight='Weight'
		disp='Disposition'
		mileage='Mileage'
		fuel='Fuel'
		type='Type';
run;

proc glm data=car;
class type;
model mileage=weight disp fuel;
output out = outdata r = resid p = yhat;
title 'GLM with TYPE accounted for';
run;

/* Part 2 */
proc glm data=car;
model mileage=weight disp fuel;
output out = outdata r = resid p = yhat;
title 'GLM without TYPE accounted for';
run;

proc reg data=car;
model mileage=weight disp fuel / selection=backward;
title 'REG without TYPE accounted for (backward)';
run;

proc reg data=car;
model mileage=weight disp fuel / selection=forward;
title 'REG without TYPE accounted for (forward)';
run;

proc reg data=car;
model mileage=weight disp fuel / selection=stepwise;
title 'REG without TYPE accounted for (stepwise)';
run;

/* Part 3 */
proc reg data=car;
model mileage=weight disp fuel / collin influence tol vif;
output out = outdata r = resid p = yhat;
title 'REG without TYPE accounted for';
run;

proc plot data=outdata hpct=50 vpct=33;
plot resid*(weight disp fuel yhat)='*';
run;

proc univariate data=outdata plot;
var resid;
run;



