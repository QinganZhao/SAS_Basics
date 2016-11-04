
/* ==================================================== */
/* REFERENCES */
/* https://www.tutorialspoint.com/sas/sas_macros.htm */
/* ==================================================== */



/* 1. Using Macro Variables */

/* Example of Global Macro Variable: SYSDAY, SYSDATE */
/* Example of Local Macro Variable: make_name, type_name */


%LET make_name = 'Audi';
%LET type_name = 'Sports';

proc print data=sashelp.cars;
	where make=&make_name and type=&type_name;
	TITLE "Sales as of &SYSDAY &SYSDATE";
run;



/* 2. Declare a Macro Prpgram */

%MACRO report(make_, type_);
PROC PRINT DATA=sashelp.cars;
WHERE make = &make_ and type = &type_;
TITLE "Sales as of &SYSDAY &SYSDATE";
RUN;
%MEND;

%report("Audi", "Sports");
%report("BMW", "SUV");





/* 3. Use %RETURN to terminate a macro properly */
%MACRO check_condition(value);
   %if &value = 10 %then %return;

    data p;
       x=100;
    run;  

%mend check_condition;  

%check_condition(11);




/* 4. Control Flow within Macro */
%macro test(finish);
   %let i=1;
   %let sum_result=0;
   
   %do %while (&i <= &finish);
      %let sum_result=%eval(&sum_result + &i);   
      %let i=%eval(&i+1);
   %end;
   
   %put The sum of 1 to %&finish is &sum_result;  /* %PUT will write text or variable to the SAS log*/
%mend test;
%test(100);


