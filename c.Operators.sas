
/* ==================================================== */
/* REFERENCES */
/* http://www.ats.ucla.edu/stat/sas/library/SASTranMan_os.html */
/* ==================================================== */




/* Create a sample data set names "DAT" */
DATA DAT;
	INPUT id gender $ height weight;
	DATALINES;
1  F  170 55
2  M  171 67
3  F  164 60
4  M  188 95
5  F  175 80
6  M  178 65
7  F  161 70
8  M  151 55
9  F  181 80
10 M  169 57
;
RUN;


/* We found the weighing machine is not working properly, and it overestimates the weight by 1 kg */
/* Hence we need to add 1 to each value of "weight" variable. */
DATA DAT;
SET DAT;
weight = weight + 1;
RUN;




/* Calculate the BMI */
DATA DAT;
SET DAT;
BMI = weight / ((height/100)**2);
RUN;




/* Concatenate String */
DATA DAT;
SET DAT;
weight_kg = weight || "kg";
RUN;




/* Filter Observations Using Operators */

/* We want to create a data set containing only observations of females */
DATA DAT_FEMALE;
SET DAT;
if gender = "F";
RUN;

/* We want to create a data set containing only observations from people higher than or equal to 170 */
DATA DAT_HIGHER;
SET DAT;
if height >=170;
RUN;

/* We want to create a data set containing only observations of specific ID */
DATA DAT_SPECIAL;
SET DAT;
IF id in (1, 3, 5);
RUN;