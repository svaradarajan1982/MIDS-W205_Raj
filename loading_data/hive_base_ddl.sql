DROP TABLE IF EXISTS hospital_info;

CREATE EXTERNAL TABLE IF NOT EXISTS hospital_info	
(
prvdr_id string,
hospital_name string,
address string,
city string,
state string,
zip string,
county string,
phn_num string,
hospital_type string,
hospital_ownership string,
emergency_srvcs string

)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospital';

DROP TABLE IF EXISTS eff_care;

CREATE EXTERNAL TABLE IF NOT EXISTS eff_care
(
prvdr_id string,
hospital_name string,
address string,
city string,
state string,
zip string,
county string,
phn_num string,
condition string,
measure_id string,
measure_nm string,
score string,
sample string,
footnote string,
measure_strt_dt string,
measure_end_dt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/eff_care';

DROP TABLE IF EXISTS readmission;

CREATE EXTERNAL TABLE IF NOT EXISTS readmission
(
prvdr_id string,
hospital_name string,
address string,
city string,
state string,
zip string,
county string,
phn_num string,
measure_nm string,
measure_id string,
comp_to_ntnl string,
denominator string,
score string,
lower_est string,
higher_est string,	
footnote string,
measure_strt_dt string,
measure_end_dt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmission';


DROP TABLE IF EXISTS measure;

CREATE EXTERNAL TABLE IF NOT EXISTS measure
(
measure_nm string,
measure_id string,
measure_strt_qtr string,
measure_strt_dt string,
measure_end_qtr string,
measure_end_dt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measure';


DROP TABLE IF EXISTS survey;

CREATE EXTERNAL TABLE IF NOT EXISTS survey
(
prvdr_nm string,
hospital_nm string,
address string,
city string,
state string,
zip string,
county string,
comm_nurse_achv_points string,
comm_nurse_imprv_points string,
comm_nurse_dim_score string,
comm_doc_achv_points string,
comm_doc_imprv_points string,
comm_doc_dim_score string,
resp_hspl_stff_achv_points string,
resp_hspl_stff_imprv_points string,
resp_hspl_stff_dim_score string,
pain_mgmt_achv_points string,
pain_mgmt_imprv_points string,
pain_mgmt_dim_score string,
comm_med_achv_points string,
comm_med_imprv_points string,
comm_med_dim_score string,
cln_quite_achv_points string,
cln_quite_imprv_points string,
cln_quite_dim_score string,
dschg_inf_achv_points string,
dschg_inf_imprv_points string,
dschg_inf_dim_score string,
ovrll_rating_hosp_achv_points string,
ovrll_rating_hosp_imprv_points string,
ovrll_rating_hosp_dim_score string,
hcahps_base_score string,
hcahps_consistency_score string

)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey';


exit;

