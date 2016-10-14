## Best Hospitals

Identifying the best hospitals has been done in two ways: 

1. Survey scores from patients which are the best indicators of high quality care is used to determine the best hospitals.In addition the HCAHPS base and consistency scores have been normalized and aggregated and the overall score is used to determine the best hospitals.

2. Another indicator for best hospitals is 30 day readmission and mortality rates. Second script weight averages the hospital mortality and readmission scores based on denominator value and orders them based on the weighted score with lower weighted score indicating better hospitals.

It is quite interesting to see there is not much overlap between the survey responses and mortality rate based rankings.


To find the best hospitals, average hospital/provider score across states is rank order desc and top 20 ranks are being pulled.

```
SELECT X.*
FROM
(SELECT A.*, rank() over (order by Avg_across_states desc) as hosp_rank
FROM aggregate_survey_score_hosp A
WHERE Avg_across_states is not null) X
order by hosp_rank ASC
LIMIT 20;


SELECT "-------------------------------------------------------------------------------------";


--HOSPITAL LEVEL RANKINGS BASED ON READMISSION AND MORTALITY RATE -- 

SELECT B.*
from
(
SELECT X.*, adj_score/denom as weighted_score
FROM
(
SELECT A.hospital_name, sum(score*denominator) as adj_score, sum(denominator) as denom
FROM readmission_data A
group by A.hospital_name
) X
) B
where B.weighted_score is not null
ORDER BY weighted_score ASC
LIMIT 20;

```
