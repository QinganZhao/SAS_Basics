/* OBJECTIVE: Using Index to accelerate data retrieval */
/* REFERENCE:
          [1] http://www.ats.ucla.edu/stat/sas/library/index.htm */



/* STEP - 1: Generate A Fake Data for Testing*/

DATA TEST;
CALL streaminit(123);
a = -1; b = 1;
Min = 5; Max = 10;

DO i = 1 TO 5e7;
	u = rand("Uniform");            /* decimal values in (0,1)    */
    x = a + (b-a)*u;                /* decimal values (a,b)       */
    k = ceil( Max*u );              /* integer values in 1..Max   */
    n = floor( (1+Max)*u );         /* integer values in 0..Max   */
    m = min + floor((1+Max-Min)*u); /* integer values in Min..Max */
	OUTPUT;
END;
DROP a b Min Max;
RUN;


/* STEP - 2: Retrieval WITHOUT Index */
PROC SQL;
CREATE TABLE temp AS
SELECT * FROM test WHERE i=10098;
QUIT;


/* STEP - 3: Retrieval with Index */

/* Add Index */
PROC SQL;
CREATE INDEX i ON TEST (i);
QUIT;

/* Retrieval After Adding Index */
PROC SQL;
CREATE TABLE temp AS
SELECT * FROM test WHERE i=10098;
QUIT;

/*Drop Index*/
PROC SQL;
DROP INDEX i FROM TEST;
QUIT;


/* STEP - 4: Acceleration by Sorting */

PROC SORT DATA=test;
BY i;
RUN;

PROC SQL;
CREATE TABLE temp AS
SELECT * FROM test WHERE i=10098;
QUIT;


/* STEP - 4: Acceleration by Sorting Together with Index*/

/*Add Index*/
PROC SQL;
CREATE INDEX i ON TEST (i);
QUIT;

PROC SQL;
CREATE TABLE temp AS
SELECT * FROM test WHERE i=10098;
QUIT;
