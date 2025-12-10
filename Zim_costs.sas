/* COSTS FOR HIV CONTROL PROJECT - ZIMBABWE */

* Use costs provided in spreadsheet unit_cost-kp_cvg-2025-07-14_draft;
* Original and HIV control model costs in 000s of USD;
* Updated Dec 25;

* HIV testing;
* Per person tested;
%let cost_facility_test=0.01968;
%let cost_contact_tracing=0.02752;
%let cost_self_test=0.01275;

* ART;
%let cost_art=0.11192;			* Ingredients-based, pppy;
%let cost_pmtct=0.01968;		* Per woman tested at ANC;

* Condoms;
* Quoted cost is $0.027 per condom. We add a fixed annual cost instead;
%let cost_condom_py=1030.35;	* Fixed annual cost $1030350 (MIHPSA Zim - CMMC intervention);

* PrEP;
* Pppy, includes drug, procurement, service delivery;
%let cost_prep_oral=0.07688;
%let cost_prep_cab=0.08989;	
%let cost_prep_len=0.07360;	

* VMMC;
%let cost_VMMC=0.06024;

* Key pop programs;
* Per person reached;
%let cost_FSW_services=234;
%let cost_MSM_services=234;

* ART adherence support;
%let cost_AdhSupp=7.89;
