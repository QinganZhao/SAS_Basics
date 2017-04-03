/* Convert numerical into date format */
data test;
date_issuance = 20130205;
run;

data test;
set test;
newdate = input(put(date_issuance,8.),yymmdd8.);
format newdate date10.;
y = year(newdate);
m = month(newdate);
d = day(newdate);
run;
