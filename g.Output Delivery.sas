/* ==================================================== */
/* REFERENCES */
/* https://www.tutorialspoint.com/sas/sas_macros.htm */
/* ==================================================== */




/* HTML Output -----------------*/
ODS HTML PATH='/folders/myfolders/' FILE='CARS.html' STYLE=EGDefault;

proc SQL ;
	select make, model, invoice from sashelp.cars where make in ('Audi', 'BMW') 
		and type='Sports';
quit;

proc SQL ;
	select make, mean(horsepower)as meanhp from sashelp.cars where make 
		in ('Audi', 'BMW') group by make;
quit;

ODS HTML CLOSE;





/* PDF Output -----------------*/
ODS PDF FILE='/folders/myfolders/CAR.pdf' 
	STYLE=EGDefault;

proc SQL ;
	select make, model, invoice from sashelp.cars where make in ('Audi', 'BMW') 
		and type='Sports';
quit;

proc SQL ;
	select make, mean(horsepower)as meanhp from sashelp.cars where make 
		in ('Audi', 'BMW') group by make;
quit;

ODS PDF CLOSE;