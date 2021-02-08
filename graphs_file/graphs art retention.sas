
  proc printto   ; 

data b;
set y;

incidence1549_ = incidence1549;

keep cald incidence1549_ option;

* if option ne 1;

proc sort; by cald run ;
data b2;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b2;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  3    ;
run;
proc sort;by cald option ;run;


***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b2;
if option =1 then delete;


%let var =  

cald incidence1549_   ;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

%option_0;
run;


data option_1;
set b2;
if option =0 then delete;

proc print; run; 

%let var =  

cald incidence1549_   ;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p50_var = median_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;

%option_1;
run;


proc print data=h2; run;


data d;
merge 
g1   g2 /*  g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25  g26 
g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48   g49  g50 
g51  g52 g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71  g72  g73  g74  g75  g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100 g101 g102 g103 g104
g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 */

h1    h2 /*  h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52 h53   h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68 */
;
by cald;
run;

proc print; run;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2021.5 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 8) valueattrs=(size=10);

label p50_incidence1549__0 = "Option 0 (median) ";
  label p50_incidence1549__1 = "Option 1  (median) ";

series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
  series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";


run;

ods html close; 


