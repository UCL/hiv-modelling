
options ps=1000 ls=220 cpucount=4 spool fullstimer ;

data z;

run = rand('uniform')*1000000000;  run=round(run,1);
										   
dataset_id=trim(left(run));
call symput('dataset_id',dataset_id);

* file "/home/rmjlaph/Scratch/dataset_&dataset_id";  
put   run; 
run;

