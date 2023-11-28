* access data file by using 'libname' with path of the data file;
libname path "C:\users\arobe\OneDrive\Documents\SAS_Data";
* read in data to temp set called 'Wound';
* create var agegp to categorize age groups;
data Wound; set path.wound;
		IF AGE<=4 THEN agegp = 'Toddler';
		IF AGE<=12 AND AGE>4 THEN agegp = 'Child';
		IF AGE>12 THEN agegp = 'Teen';
	format agegp $CHAR7.;
run;
*use proc frequency to get counts for subset of gender*agegp;
proc freq data=Wound;
	table GENDER*agegp;
run;
