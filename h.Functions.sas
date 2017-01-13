PROC FCMP outlib=work.funcs.test;
	/* In the function below, if action equals to 0, we return -x*2; otherwise we return x*2 */
	function test(x, action);
		if action=0 then
			return(-x*2);
		else
		 	return(x*2);
	endsub;
RUN;


OPTIONS CMPLIB=work.funcs;

DATA X;
	a=test(3, 1);
	b=test(7, 0);
RUN;
