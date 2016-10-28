/* Create a data set names "DAT" */
DATA DAT;
	INPUT id sex $ age inc r1 r2 r3;

	/* $ sign here is to indicate that variable "sex" is character type. Without it, it's numeric by default and will assign a missing value if value given is not numeric*/
	DATALINES;
 1  F  35 17  7 2 2 
17  M  50 14 5 5 3 
33  F  45  6  7 2 7 
49  M  24 14  7 5 7 
65  F  52  9  4 7 7 
81  M  44 11  7 7 7 
2   F  34 17  6 5 3 
18  M  40 14  7 5 2 
34  F  47  6  6 5 6 
50  M  35 17  5 7 5 
;
RUN;


/* IF-THEN-ELSE Statement */
DATA TEST;
	SET DAT;

	/* SET will mke a copy of the existing data. */
	/* SET will mke a copy of the existing data. */
	IF age > 40 THEN
		r1=1;
	ELSE
		r1=0;
RUN;


/* DO Blocks */
/* Do block begens with "DO" and ends with "END". */
/* The statements enclosed between are called a "block". */
/* This statement can help us do multile tasks within one IF-THEN-DO statement */
DATA TEST;
	SET DAT;

	IF age > 40 THEN
		DO;
			r1=1;
			r2=2;
			r3=3;
		END;
	ELSE
		DO;
			r1=0;
			r2=0;
			r3=0;
		END;
RUN;


/* Do Loop */
/* Create a data set with Do Loop */
DATA Gauss;
	do i=1 to 100;
		z=rannor(8923);
		p=1 - Probnorm(z);
		x=z*Sqrt(3) + 12;
		output;
	end;
RUN;


/* Use Do Loop to calculate the sum of 1 to 100 */
DATA RESULT;
	i=0;

	DO j=1 TO 100;
		i=j+i;
	END;

	DROP j;
RUN;

