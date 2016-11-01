
/* ==================================================== */
/* REFERENCES */
/* http://www.ats.ucla.edu/stat/sas/library/SASTranMan_os.html */
/* ==================================================== */




/* ======================================= */
/* 1. Combine two data sets. */
/* ======================================= */
DATA DAT_part_1;
	INPUT id gender $ height weight;
	DATALINES;
1  F  170 75
2  M  170 67
3  F  164 60
4  M  188 95
5  F  175 80
;
RUN;

DATA DAT_part_2;
	INPUT id gender $ height weight;
	DATALINES;
6  M  178 65
7  F  161 70
8  M  151 55
9  F  181 80
10 M  169 57
;
RUN;

DATA DAT_part_2_missing;
	INPUT id gender $ height;
	DATALINES;
6  M  178
7  F  161
8  M  151
9  F  181
10 M  169
;
RUN;

DATA DAT;
	SET DAT_part_1 DAT_part_2;
RUN;

PROC PRINT data=dat;
RUN;

/* IF the variables in two data sets can't match, */
/* the combining can still be done, but missing values will present */
DATA DAT_missing;
	SET DAT_part_1 DAT_part_2_missing;
RUN;

PROC PRINT data=dat_missing;
RUN;

PROC DELETE DATA=DAT_missing;
RUN;

PROC DELETE DATA=DAT_part_2_missing;
RUN;




/* ======================================= */
/* 2. Merge two data sets. */
/* ======================================= */

/* Merging the two data sets in a DATA step combines the variables and observations horizontally.
If the first data set has n1 observations and v1 variables and the second data set has n2 observations and v2 variables,
the merged data set will have max(n1,n2) observations.
Observations not present in the smaller data set are patched with missing values.

The number of variables in the combined data set depends on whether the two data sets share some variables.
If variables are present in either data set,
they are retained from the data set in the merge list that contains the variable last. */
DATA DAT_to_merge;
	INPUT age;
	DATALINES;
22
18
52
39
17
;
RUN;

DATA merged_dat;
	MERGE dat_part_1 DAT_to_merge;
RUN;

PROC PRINT DATA=merged_dat;
RUN;




/* ======================================= */
/* 3. Sort a data set */
/* ======================================= */
PROC SORT DATA=DAT;
	BY height;
RUN;

/* If this list contains more than one variable, SAS sorts the data set by the variable listed first. 
Then, for each value of this variable, it sorts the data set by the second variable. */
PROC SORT DATA=DAT;
	BY height weight;
RUN;


/* By default, variables will be sorted in ascending order. 
To sort in descending order, add 'DESCENDING before' the name of the variable of  descending order. */
PROC SORT DATA=DAT;
	BY DESCENDING height weight;
RUN;

PROC SORT DATA=DAT;
	BY DESCENDING height DESCENDING weight;
RUN;


/* By default, the SORT operation will take place on the original data set. 
That is, the sorted data set will replace the original un-sorted data set. 
To prevent this, we can use "OUT" option.
*/

PROC SORT DATA=DAT OUT=NEW_DAT;
	BY height; 
RUN;