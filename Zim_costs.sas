/* COSTS FOR HIV CONTROL PROJECT - ZIMBABWE */

* Use costs provided in spreadsheet unit_cost-kp_cvg-2025-07-14_draft;
* Original model costs in 000s of USD;
* HIV control model costs in USD;
* Updated Dec 25;

* HIV testing;
* Per person tested;
%let cost_per_facility_test=19.68;
%let cost_per_contact_tracing=27.52;
%let cost_per_self_test=12.75;

* ART;
%let cost_art_pppy=111.92;			* Ingredients-based, pppy;
%let cost_pmtct_per_test=19.68;		* Per woman tested at ANC;

* Condoms;
* Quoted cost is $0.027 per condom. We add a fixed annual cost instead;
%let cost_condom_py=1030350;	* Fixed annual cost $1030350 (MIHPSA Zim - CMMC intervention);

* PrEP;
* Pppy, includes drug, procurement, service delivery;
%let cost_prep_oral_pppy=76.88;
%let cost_prep_cab_pppy=89.89;	
%let cost_prep_len_pppy=73.60;	

* VMMC;
%let cost_VMMC_per_procedure=60.24;

* Key pop programs;
* Per person reached;
%let cost_FSW_services_pppy=234;
%let cost_MSM_services_pppy=234;

* ART adherence support;
%let cost_AdhSupp_pppy=7.89;		* This cost is from MIHPSA Zim and is per client per year - apply to all on ART? ;
