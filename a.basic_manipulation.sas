/* ==================================================== */
/* REFERENCES */
/* 1. http://www.ats.ucla.edu/stat/sas/library/SASRead_os.htm */
/* 2. http://www.ats.ucla.edu/stat/sas/library/SASTranMan_os.html */
/* ==================================================== */


/* Load data from CSV file */

/* test.csv */
/* var_a,var_b,var_c */
/* 1,2,3 */
/* 4,5,6 */
PROC IMPORT DATAFILE='/folders/myfolders/test.csv'
	DBMS=CSV
	OUT=WORK.DAT_1;
	GETNAMES=YES;
RUN;


/* Create a data set by reading Data Inline */
DATA DAT_2; 
   INPUT id sex $ age inc r1 r2 r3 ;   /* $ sign here is to indicate that variable "sex" is character type. Without it, it's numeric by default and will assign a missing value if value given is not numeric*/
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



/* Use SQL to select data */
PROC SQL;
	SELECT 
	* 
	FROM 
	DAT_1
	WHERE 
	var_a=1;
QUIT;



/* Use SQL to insert new observation */
PROC SQL;
	INSERT INTO
	DAT_1
	VALUES(100, 200, 300);
QUIT;



/* Use SAS Syntax to manipulate data */
/* IF THEN...ELSE */
DATA DAT_1;
	SET DAT_1; /* SET will mke a copy of the existing data. */
	
	IF var_a=1 
	THEN var_a = SQRT(var_c);
	ELSE var_a=var_c**2;
RUN;



/* Export data into Excel file */
PROC EXPORT data=WORK.DAT_2
   OUTFILE="/folders/myfolders/DAT_2.xlsx"
   DBMS=xlsx;
RUN;



/* Create a libray so that the data can be saved permanantly. */
LIBNAME TEST_LIB "/folders/myfolders";
DATA TEST_LIB.DAT_3;
	INPUT id age;
	DATALINES;
	1 12
	2 24
	;
RUN;


/* Print data */
PROC PRINT DATA=TEST_LIB.DAT_3;
RUN;



/* Delete a table */
/* Method 1 */
PROC DELETE DATA = WORK.DAT_1;    *This will delete all datasets in temp;
RUN;

/* Method 2 */
PROC SQL;
DROP TABLE WORK.DAT_2;
DROP TABLE TEST_LIB.DAT_3;
QUIT;


