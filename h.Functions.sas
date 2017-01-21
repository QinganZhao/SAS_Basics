/* REFERENCE:
   [1] http://stackoverflow.com/questions/7402327/macro-returning-a-value
*/

PROC FCMP outlib=work.funcs_1.funcs_1_1;
	/* In the function below, if action equals to 0, we return -x*2; otherwise we return x*2 */
	function test(x, action);
		if action=0 then
			return(-x*2);
		else
		 	return(x*2);
	endsub;
	
	function trunc_test(x);
		 	return(int(x*100)/100);
	endsub;
RUN;


OPTIONS CMPLIB=work.funcs_1;

DATA X;
	a=test(3, 1);
	b=test(7, 0);
	c=trunc_test(3.126);
RUN;
