
/* log, exp, and sqrt */

DATA test_1;
DO i = 1 to 10;
var_log = log(i); /* the natural logarithm (base e)*/
var_log10 = log10(i); /* jthe log to base 10*/
var_exp = exp(i);
var_sqrt = sqrt(i);
OUTPUT;
END;
RUN;



/* Trigonometric functions */

DATA TEST_2;
DO i = 0 to 90;
sin = sin(i);
cos = cos(i);
tan = tan(i);
output;
end;
RUN;

/* Generate Random Numbers */

data test_3;
	do i=1 to 100;
	
		/* Generate a uniform random  number (0,1) */
		/* The number inside is the seed */
		/* If seed is less than or equal to 0, the time of day is used to initialize the seed stream. */
		uniform_random=ranuni(0);
		
		/* Generate a random number based on normal distribution */
		/* The number inside is the seed */
		/* If seed is less than or equal to 0, the time of day is used to initialize the seed stream. */
		normal_random_1 = rannor(0);
		
		
		/* A normal variate X with mean 10 and variance 2 can be generated with this code: */
		normal_random_2 = 10 + sqrt(2)*rannor(0);

		output; /* "output" statement is important. Otherwise only one row of observations will be kept */
	end;
run;


