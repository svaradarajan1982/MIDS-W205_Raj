-- Transform the hospital data

DROP TABLE IF EXISTS hospital_data;

CREATE TABLE hospital_data as 
SELECT 
cast(prvdr_id as varchar(255)) as prvdr_id,
cast(hospital_name as varchar(255)) as hospital_name,
cast(address as varchar(255)) as address,
cast(city as varchar(50)) as city,
cast(state as varchar(25)) as state,
cast(zip as varchar(10)) as zip,
cast(phn_num as varchar(10)) as phn_num

FROM hospital_info;


-- Transform the effective care data. Convert score into a float.

DROP TABLE IF EXISTS high_quality_care;

CREATE TABLE high_quality_care as
SELECT
cast(prvdr_id as varchar(255)) as prvdr_id,
cast(hospital_name as varchar(255)) as hospital_name,
cast(address as varchar(255)) as address,
cast(city as varchar(50)) as city,
cast(state as varchar(25)) as state,
cast(zip as varchar(10)) as zip,
cast(measure_id as varchar(100)) as measure_id,
cast(measure_nm  as varchar(100)) as measure_name,
cast(score as float) as score,
case when length(score) > 10 then null  else cast(score as float) end as score2

FROM eff_care;


-- Transform readmissions data. Convert denominator and score into a float value.

DROP TABLE IF EXISTS readmission_data;

CREATE TABLE readmission_data as
SELECT
cast(prvdr_id as varchar(255)) as prvdr_id,
cast(hospital_name as varchar(255)) as hospital_name,
cast(address as varchar(255)) as address,
cast(city as varchar(50)) as city,
cast(state as varchar(25)) as state,
cast(zip as varchar(10)) as zip,
cast(county as varchar(20)) as county,
measure_nm,
measure_id,
comp_to_ntnl,
cast(denominator as float) as denominator,
cast(score as float) as score 

from readmission;


-- Transform survey data. Survey scores are in text format. convert survey scores into a numeric format using the SQL LIKE 
-- statement


DROP TABLE IF EXISTS survey_transform;

CREATE TABLE survey_transform as
SELECT
CAST(prvdr_nm as varchar(255)) as prvdr_id,
CAST(hospital_nm as varchar(255)) as hospital_nm,
cast(state as varchar(50)) as state,
CASE 
WHEN comm_nurse_achv_points LIKE "%0 out of%" then 0
WHEN comm_nurse_achv_points LIKE "%1 out of%" then 1
WHEN comm_nurse_achv_points LIKE "%2 out of%" then 2
WHEN comm_nurse_achv_points LIKE "%3 out of%" then 3
WHEN comm_nurse_achv_points LIKE "%4 out of%" then 4
WHEN comm_nurse_achv_points LIKE "%5 out of%" then 5
WHEN comm_nurse_achv_points LIKE "%6 out of%" then 6
WHEN comm_nurse_achv_points LIKE "%7 out of%" then 7
WHEN comm_nurse_achv_points LIKE "%8 out of%" then 8
WHEN comm_nurse_achv_points LIKE "%9 out of%" then 9
WHEN comm_nurse_achv_points LIKE "%10 out of%" then 10
END as points1,

CASE 
WHEN comm_nurse_imprv_points LIKE "%0 out of%" then 0
WHEN comm_nurse_imprv_points LIKE "%1 out of%" then 1
WHEN comm_nurse_imprv_points LIKE "%2 out of%" then 2
WHEN comm_nurse_imprv_points LIKE "%3 out of%" then 3
WHEN comm_nurse_imprv_points LIKE "%4 out of%" then 4
WHEN comm_nurse_imprv_points LIKE "%5 out of%" then 5
WHEN comm_nurse_imprv_points LIKE "%6 out of%" then 6
WHEN comm_nurse_imprv_points LIKE "%7 out of%" then 7
WHEN comm_nurse_imprv_points LIKE "%8 out of%" then 8
WHEN comm_nurse_imprv_points LIKE "%9 out of%" then 9
WHEN comm_nurse_imprv_points LIKE "%10 out of%" then 10
END as points2,


CASE
WHEN comm_nurse_dim_score LIKE "%0 out of%" then 0
WHEN comm_nurse_dim_score LIKE "%1 out of%" then 1
WHEN comm_nurse_dim_score LIKE "%2 out of%" then 2
WHEN comm_nurse_dim_score LIKE "%3 out of%" then 3
WHEN comm_nurse_dim_score LIKE "%4 out of%" then 4
WHEN comm_nurse_dim_score LIKE "%5 out of%" then 5
WHEN comm_nurse_dim_score LIKE "%6 out of%" then 6
WHEN comm_nurse_dim_score LIKE "%7 out of%" then 7
WHEN comm_nurse_dim_score LIKE "%8 out of%" then 8
WHEN comm_nurse_dim_score LIKE "%9 out of%" then 9
WHEN comm_nurse_dim_score LIKE "%10 out of%" then 10
END as points3,

CASE
WHEN comm_doc_achv_points LIKE "%0 out of%" then 0
WHEN comm_doc_achv_points LIKE "%1 out of%" then 1
WHEN comm_doc_achv_points LIKE "%2 out of%" then 2
WHEN comm_doc_achv_points LIKE "%3 out of%" then 3
WHEN comm_doc_achv_points LIKE "%4 out of%" then 4
WHEN comm_doc_achv_points LIKE "%5 out of%" then 5
WHEN comm_doc_achv_points LIKE "%6 out of%" then 6
WHEN comm_doc_achv_points LIKE "%7 out of%" then 7
WHEN comm_doc_achv_points LIKE "%8 out of%" then 8
WHEN comm_doc_achv_points LIKE "%9 out of%" then 9
WHEN comm_doc_achv_points LIKE "%10 out of%" then 10
END as points4,

CASE
WHEN comm_doc_imprv_points LIKE "%0 out of%" then 0
WHEN comm_doc_imprv_points LIKE "%1 out of%" then 1
WHEN comm_doc_imprv_points LIKE "%2 out of%" then 2
WHEN comm_doc_imprv_points LIKE "%3 out of%" then 3
WHEN comm_doc_imprv_points LIKE "%4 out of%" then 4
WHEN comm_doc_imprv_points LIKE "%5 out of%" then 5
WHEN comm_doc_imprv_points LIKE "%6 out of%" then 6
WHEN comm_doc_imprv_points LIKE "%7 out of%" then 7
WHEN comm_doc_imprv_points LIKE "%8 out of%" then 8
WHEN comm_doc_imprv_points LIKE "%9 out of%" then 9
WHEN comm_doc_imprv_points LIKE "%10 out of%" then 10
END as points5,

CASE
WHEN comm_doc_dim_score LIKE "%0 out of%" then 0
WHEN comm_doc_dim_score LIKE "%1 out of%" then 1
WHEN comm_doc_dim_score LIKE "%2 out of%" then 2
WHEN comm_doc_dim_score LIKE "%3 out of%" then 3
WHEN comm_doc_dim_score LIKE "%4 out of%" then 4
WHEN comm_doc_dim_score LIKE "%5 out of%" then 5
WHEN comm_doc_dim_score LIKE "%6 out of%" then 6
WHEN comm_doc_dim_score LIKE "%7 out of%" then 7
WHEN comm_doc_dim_score LIKE "%8 out of%" then 8
WHEN comm_doc_dim_score LIKE "%9 out of%" then 9
WHEN comm_doc_dim_score LIKE "%10 out of%" then 10
END as points6,

CASE
WHEN resp_hspl_stff_achv_points LIKE "%0 out of%" then 0
WHEN resp_hspl_stff_achv_points LIKE "%1 out of%" then 1
WHEN resp_hspl_stff_achv_points LIKE "%2 out of%" then 2
WHEN resp_hspl_stff_achv_points LIKE "%3 out of%" then 3
WHEN resp_hspl_stff_achv_points LIKE "%4 out of%" then 4
WHEN resp_hspl_stff_achv_points LIKE "%5 out of%" then 5
WHEN resp_hspl_stff_achv_points LIKE "%6 out of%" then 6
WHEN resp_hspl_stff_achv_points LIKE "%7 out of%" then 7
WHEN resp_hspl_stff_achv_points LIKE "%8 out of%" then 8
WHEN resp_hspl_stff_achv_points LIKE "%9 out of%" then 9
WHEN resp_hspl_stff_achv_points LIKE "%10 out of%" then 10
END as points7,

CASE
WHEN resp_hspl_stff_imprv_points LIKE "%0 out of%" then 0
WHEN resp_hspl_stff_imprv_points LIKE "%1 out of%" then 1
WHEN resp_hspl_stff_imprv_points LIKE "%2 out of%" then 2
WHEN resp_hspl_stff_imprv_points LIKE "%3 out of%" then 3
WHEN resp_hspl_stff_imprv_points LIKE "%4 out of%" then 4
WHEN resp_hspl_stff_imprv_points LIKE "%5 out of%" then 5
WHEN resp_hspl_stff_imprv_points LIKE "%6 out of%" then 6
WHEN resp_hspl_stff_imprv_points LIKE "%7 out of%" then 7
WHEN resp_hspl_stff_imprv_points LIKE "%8 out of%" then 8
WHEN resp_hspl_stff_imprv_points LIKE "%9 out of%" then 9
WHEN resp_hspl_stff_imprv_points LIKE "%10 out of%" then 10
END as points8,

CASE
WHEN resp_hspl_stff_dim_score LIKE "%0 out of%" then 0
WHEN resp_hspl_stff_dim_score LIKE "%1 out of%" then 1
WHEN resp_hspl_stff_dim_score LIKE "%2 out of%" then 2
WHEN resp_hspl_stff_dim_score LIKE "%3 out of%" then 3
WHEN resp_hspl_stff_dim_score LIKE "%4 out of%" then 4
WHEN resp_hspl_stff_dim_score LIKE "%5 out of%" then 5
WHEN resp_hspl_stff_dim_score LIKE "%6 out of%" then 6
WHEN resp_hspl_stff_dim_score LIKE "%7 out of%" then 7
WHEN resp_hspl_stff_dim_score LIKE "%8 out of%" then 8
WHEN resp_hspl_stff_dim_score LIKE "%9 out of%" then 9
WHEN resp_hspl_stff_dim_score LIKE "%10 out of%" then 10
END as points9,

CASE
WHEN pain_mgmt_achv_points LIKE "%0 out of%" then 0
WHEN pain_mgmt_achv_points LIKE "%1 out of%" then 1
WHEN pain_mgmt_achv_points LIKE "%2 out of%" then 2
WHEN pain_mgmt_achv_points LIKE "%3 out of%" then 3
WHEN pain_mgmt_achv_points LIKE "%4 out of%" then 4
WHEN pain_mgmt_achv_points LIKE "%5 out of%" then 5
WHEN pain_mgmt_achv_points LIKE "%6 out of%" then 6
WHEN pain_mgmt_achv_points LIKE "%7 out of%" then 7
WHEN pain_mgmt_achv_points LIKE "%8 out of%" then 8
WHEN pain_mgmt_achv_points LIKE "%9 out of%" then 9
WHEN pain_mgmt_achv_points LIKE "%10 out of%" then 10
END as points10,

CASE
WHEN pain_mgmt_imprv_points LIKE "%0 out of%" then 0
WHEN pain_mgmt_imprv_points LIKE "%1 out of%" then 1
WHEN pain_mgmt_imprv_points LIKE "%2 out of%" then 2
WHEN pain_mgmt_imprv_points LIKE "%3 out of%" then 3
WHEN pain_mgmt_imprv_points LIKE "%4 out of%" then 4
WHEN pain_mgmt_imprv_points LIKE "%5 out of%" then 5
WHEN pain_mgmt_imprv_points LIKE "%6 out of%" then 6
WHEN pain_mgmt_imprv_points LIKE "%7 out of%" then 7
WHEN pain_mgmt_imprv_points LIKE "%8 out of%" then 8
WHEN pain_mgmt_imprv_points LIKE "%9 out of%" then 9
WHEN pain_mgmt_imprv_points LIKE "%10 out of%" then 10
END as points11,

CASE
WHEN pain_mgmt_dim_score LIKE "%0 out of%" then 0
WHEN pain_mgmt_dim_score LIKE "%1 out of%" then 1
WHEN pain_mgmt_dim_score LIKE "%2 out of%" then 2
WHEN pain_mgmt_dim_score LIKE "%3 out of%" then 3
WHEN pain_mgmt_dim_score LIKE "%4 out of%" then 4
WHEN pain_mgmt_dim_score LIKE "%5 out of%" then 5
WHEN pain_mgmt_dim_score LIKE "%6 out of%" then 6
WHEN pain_mgmt_dim_score LIKE "%7 out of%" then 7
WHEN pain_mgmt_dim_score LIKE "%8 out of%" then 8
WHEN pain_mgmt_dim_score LIKE "%9 out of%" then 9
WHEN pain_mgmt_dim_score LIKE "%10 out of%" then 10
END as points12,

CASE
WHEN comm_med_achv_points LIKE "%0 out of%" then 0
WHEN comm_med_achv_points LIKE "%1 out of%" then 1
WHEN comm_med_achv_points LIKE "%2 out of%" then 2
WHEN comm_med_achv_points LIKE "%3 out of%" then 3
WHEN comm_med_achv_points LIKE "%4 out of%" then 4
WHEN comm_med_achv_points LIKE "%5 out of%" then 5
WHEN comm_med_achv_points LIKE "%6 out of%" then 6
WHEN comm_med_achv_points LIKE "%7 out of%" then 7
WHEN comm_med_achv_points LIKE "%8 out of%" then 8
WHEN comm_med_achv_points LIKE "%9 out of%" then 9
WHEN comm_med_achv_points LIKE "%10 out of%" then 10
END as points13,

CASE
WHEN comm_med_imprv_points LIKE "%0 out of%" then 0
WHEN comm_med_imprv_points LIKE "%1 out of%" then 1
WHEN comm_med_imprv_points LIKE "%2 out of%" then 2
WHEN comm_med_imprv_points LIKE "%3 out of%" then 3
WHEN comm_med_imprv_points LIKE "%4 out of%" then 4
WHEN comm_med_imprv_points LIKE "%5 out of%" then 5
WHEN comm_med_imprv_points LIKE "%6 out of%" then 6
WHEN comm_med_imprv_points LIKE "%7 out of%" then 7
WHEN comm_med_imprv_points LIKE "%8 out of%" then 8
WHEN comm_med_imprv_points LIKE "%9 out of%" then 9
WHEN comm_med_imprv_points LIKE "%10 out of%" then 10
END as points14,

CASE
WHEN comm_med_dim_score LIKE "%0 out of%" then 0
WHEN comm_med_dim_score LIKE "%1 out of%" then 1
WHEN comm_med_dim_score LIKE "%2 out of%" then 2
WHEN comm_med_dim_score LIKE "%3 out of%" then 3
WHEN comm_med_dim_score LIKE "%4 out of%" then 4
WHEN comm_med_dim_score LIKE "%5 out of%" then 5
WHEN comm_med_dim_score LIKE "%6 out of%" then 6
WHEN comm_med_dim_score LIKE "%7 out of%" then 7
WHEN comm_med_dim_score LIKE "%8 out of%" then 8
WHEN comm_med_dim_score LIKE "%9 out of%" then 9
WHEN comm_med_dim_score LIKE "%10 out of%" then 10
END as points15,

CASE
WHEN cln_quite_achv_points LIKE "%0 out of%" then 0
WHEN cln_quite_achv_points LIKE "%1 out of%" then 1
WHEN cln_quite_achv_points LIKE "%2 out of%" then 2
WHEN cln_quite_achv_points LIKE "%3 out of%" then 3
WHEN cln_quite_achv_points LIKE "%4 out of%" then 4
WHEN cln_quite_achv_points LIKE "%5 out of%" then 5
WHEN cln_quite_achv_points LIKE "%6 out of%" then 6
WHEN cln_quite_achv_points LIKE "%7 out of%" then 7
WHEN cln_quite_achv_points LIKE "%8 out of%" then 8
WHEN cln_quite_achv_points LIKE "%9 out of%" then 9
WHEN cln_quite_achv_points LIKE "%10 out of%" then 10
END as points16,

CASE
WHEN cln_quite_imprv_points LIKE "%0 out of%" then 0
WHEN cln_quite_imprv_points LIKE "%1 out of%" then 1
WHEN cln_quite_imprv_points LIKE "%2 out of%" then 2
WHEN cln_quite_imprv_points LIKE "%3 out of%" then 3
WHEN cln_quite_imprv_points LIKE "%4 out of%" then 4
WHEN cln_quite_imprv_points LIKE "%5 out of%" then 5
WHEN cln_quite_imprv_points LIKE "%6 out of%" then 6
WHEN cln_quite_imprv_points LIKE "%7 out of%" then 7
WHEN cln_quite_imprv_points LIKE "%8 out of%" then 8
WHEN cln_quite_imprv_points LIKE "%9 out of%" then 9
WHEN cln_quite_imprv_points LIKE "%10 out of%" then 10
END as points17,

CASE
WHEN cln_quite_dim_score LIKE "%0 out of%" then 0
WHEN cln_quite_dim_score LIKE "%1 out of%" then 1
WHEN cln_quite_dim_score LIKE "%2 out of%" then 2
WHEN cln_quite_dim_score LIKE "%3 out of%" then 3
WHEN cln_quite_dim_score LIKE "%4 out of%" then 4
WHEN cln_quite_dim_score LIKE "%5 out of%" then 5
WHEN cln_quite_dim_score LIKE "%6 out of%" then 6
WHEN cln_quite_dim_score LIKE "%7 out of%" then 7
WHEN cln_quite_dim_score LIKE "%8 out of%" then 8
WHEN cln_quite_dim_score LIKE "%9 out of%" then 9
WHEN cln_quite_dim_score LIKE "%10 out of%" then 10
END as points18,

CASE
WHEN dschg_inf_achv_points LIKE "%0 out of%" then 0
WHEN dschg_inf_achv_points LIKE "%1 out of%" then 1
WHEN dschg_inf_achv_points LIKE "%2 out of%" then 2
WHEN dschg_inf_achv_points LIKE "%3 out of%" then 3
WHEN dschg_inf_achv_points LIKE "%4 out of%" then 4
WHEN dschg_inf_achv_points LIKE "%5 out of%" then 5
WHEN dschg_inf_achv_points LIKE "%6 out of%" then 6
WHEN dschg_inf_achv_points LIKE "%7 out of%" then 7
WHEN dschg_inf_achv_points LIKE "%8 out of%" then 8
WHEN dschg_inf_achv_points LIKE "%9 out of%" then 9
WHEN dschg_inf_achv_points LIKE "%10 out of%" then 10
END as points19,

CASE
WHEN dschg_inf_imprv_points LIKE "%0 out of%" then 0
WHEN dschg_inf_imprv_points LIKE "%1 out of%" then 1
WHEN dschg_inf_imprv_points LIKE "%2 out of%" then 2
WHEN dschg_inf_imprv_points LIKE "%3 out of%" then 3
WHEN dschg_inf_imprv_points LIKE "%4 out of%" then 4
WHEN dschg_inf_imprv_points LIKE "%5 out of%" then 5
WHEN dschg_inf_imprv_points LIKE "%6 out of%" then 6
WHEN dschg_inf_imprv_points LIKE "%7 out of%" then 7
WHEN dschg_inf_imprv_points LIKE "%8 out of%" then 8
WHEN dschg_inf_imprv_points LIKE "%9 out of%" then 9
WHEN dschg_inf_imprv_points LIKE "%10 out of%" then 10
END as points20,

CASE
WHEN dschg_inf_dim_score LIKE "%0 out of%" then 0
WHEN dschg_inf_dim_score LIKE "%1 out of%" then 1
WHEN dschg_inf_dim_score LIKE "%2 out of%" then 2
WHEN dschg_inf_dim_score LIKE "%3 out of%" then 3
WHEN dschg_inf_dim_score LIKE "%4 out of%" then 4
WHEN dschg_inf_dim_score LIKE "%5 out of%" then 5
WHEN dschg_inf_dim_score LIKE "%6 out of%" then 6
WHEN dschg_inf_dim_score LIKE "%7 out of%" then 7
WHEN dschg_inf_dim_score LIKE "%8 out of%" then 8
WHEN dschg_inf_dim_score LIKE "%9 out of%" then 9
WHEN dschg_inf_dim_score LIKE "%10 out of%" then 10
END as points21,

CASE
WHEN ovrll_rating_hosp_achv_points LIKE "%0 out of%" then 0
WHEN ovrll_rating_hosp_achv_points LIKE "%1 out of%" then 1
WHEN ovrll_rating_hosp_achv_points LIKE "%2 out of%" then 2
WHEN ovrll_rating_hosp_achv_points LIKE "%3 out of%" then 3
WHEN ovrll_rating_hosp_achv_points LIKE "%4 out of%" then 4
WHEN ovrll_rating_hosp_achv_points LIKE "%5 out of%" then 5
WHEN ovrll_rating_hosp_achv_points LIKE "%6 out of%" then 6
WHEN ovrll_rating_hosp_achv_points LIKE "%7 out of%" then 7
WHEN ovrll_rating_hosp_achv_points LIKE "%8 out of%" then 8
WHEN ovrll_rating_hosp_achv_points LIKE "%9 out of%" then 9
WHEN ovrll_rating_hosp_achv_points LIKE "%10 out of%" then 10
END as overall1,

CASE
WHEN ovrll_rating_hosp_imprv_points LIKE "%0 out of%" then 0
WHEN ovrll_rating_hosp_imprv_points LIKE "%1 out of%" then 1
WHEN ovrll_rating_hosp_imprv_points LIKE "%2 out of%" then 2
WHEN ovrll_rating_hosp_imprv_points LIKE "%3 out of%" then 3
WHEN ovrll_rating_hosp_imprv_points LIKE "%4 out of%" then 4
WHEN ovrll_rating_hosp_imprv_points LIKE "%5 out of%" then 5
WHEN ovrll_rating_hosp_imprv_points LIKE "%6 out of%" then 6
WHEN ovrll_rating_hosp_imprv_points LIKE "%7 out of%" then 7
WHEN ovrll_rating_hosp_imprv_points LIKE "%8 out of%" then 8
WHEN ovrll_rating_hosp_imprv_points LIKE "%9 out of%" then 9
WHEN ovrll_rating_hosp_imprv_points LIKE "%10 out of%" then 10
END as overall2,

CASE
WHEN ovrll_rating_hosp_dim_score LIKE "%0 out of%" then 0
WHEN ovrll_rating_hosp_dim_score LIKE "%1 out of%" then 1
WHEN ovrll_rating_hosp_dim_score LIKE "%2 out of%" then 2
WHEN ovrll_rating_hosp_dim_score LIKE "%3 out of%" then 3
WHEN ovrll_rating_hosp_dim_score LIKE "%4 out of%" then 4
WHEN ovrll_rating_hosp_dim_score LIKE "%5 out of%" then 5
WHEN ovrll_rating_hosp_dim_score LIKE "%6 out of%" then 6
WHEN ovrll_rating_hosp_dim_score LIKE "%7 out of%" then 7
WHEN ovrll_rating_hosp_dim_score LIKE "%8 out of%" then 8
WHEN ovrll_rating_hosp_dim_score LIKE "%9 out of%" then 9
WHEN ovrll_rating_hosp_dim_score LIKE "%10 out of%" then 10
END as overall3,

cast(hcahps_base_score as float) as base_score,
cast(hcahps_consistency_score as float) as consistency_score

FROM survey;

-- Aggregate the numeric survey scores by calculating an average score per hospital. This is done by dividing the actual score by
-- by total possible score of 232 (8 of the surveys are only scores out of 9)

DROP TABLE IF EXISTS survey_score_agg;

CREATE TABLE survey_score_agg as
SELECT B.prvdr_id,
hospital_nm,
state,
(B.points1 +  B.points2 + B.points3 + B.points4 + B.points5 + B.points6 + B.points7 + B.points8 + B.points9 + B.points10 + B.points11 + B.points12 + + B.points13 + B.points14 + B.points15 + B.points16 + B.points17 + B.points18 + B.points19 + B.points20 + B.points21 + B.overall1 + B.overall2 + B.overall3)/232  as scaled_survey_score,
B.base_score,
B.consistency_score

FROM survey_transform B 
;

-- Base Score and Consistency scores have different scale than survey scores. Let's try to normalize these scores. First we 
-- calculate the min and max score values

DROP TABLE IF EXISTS other_score_mm;

CREATE TABLE other_score_mm as
SELECT  MIN(base_score) as min_base_score, MAX(base_score) as max_base_score, MIN(consistency_score) as min_cons_score, MAX(consistency_score) as max_cons_score

FROM survey_score_agg;

-- Min and Max score value table is merged with aggregate score table using cross join. Now all rows will have the min and max score values
DROP TABLE IF EXISTS survey_combined;

CREATE TABLE survey_combined as
SELECT A.*, B.max_base_score, B.min_base_score, B.min_cons_score, B.max_cons_score
FROM survey_score_agg A
CROSS JOIN
other_score_mm B
on 1 = 1
;


-- In this table we will leverage feature scaling to normalize for the different range of base and consistency score. Feature
-- scaling will make all scores to have a value between 0 and 1
DROP TABLE IF EXISTS survey_scaled;

CREATE TABLE survey_scaled as
SELECT prvdr_id, hospital_nm,state, scaled_survey_score, ((base_score - min_base_score)/(max_base_score - min_base_score)) as scaled_base_score, ((consistency_score - min_cons_score)/(max_cons_score - min_cons_score)) as scaled_cons_score 

FROM survey_combined;


-- Now take average of the 3 scores - Survey, Base and Consistsency per hospital

DROP TABLE IF EXISTS aggregate_survey_score;

CREATE TABLE aggregate_survey_score as
SELECT prvdr_id, hospital_nm, state, (scaled_survey_score + scaled_base_score + scaled_cons_score)/3 AS Avg_hosp_survey_score

FROM  survey_scaled
;

-- Now take mean of the aggregate score by hospital i.e. aggregate across same providers in several states

DROP TABLE IF EXISTS aggregate_survey_score_hosp;

CREATE TABLE aggregate_survey_score_hosp as
SELECT prvdr_id, hospital_nm,  AVG(Avg_hosp_survey_score) as Avg_across_states

FROM  aggregate_survey_score
group by prvdr_id, hospital_nm
;

-- Now take mean of the aggregate score by state i.e. aggregate across all providers within each of the states

DROP TABLE IF EXISTS aggregate_survey_score_st;

CREATE TABLE aggregate_survey_score_st as
SELECT state,  AVG(Avg_hosp_survey_score) as Avg_across_hospitals

FROM  aggregate_survey_score
group by state
;


exit;



