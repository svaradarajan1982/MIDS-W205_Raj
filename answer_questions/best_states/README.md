Identifying the best states for quality care has been done in two ways:

1. Survey scores from patients which are the best indicators of high quality care is used to determine the best hospitals, but .In addition the HCAHPS base and consistency scores have been normalized and aggregated and the overall scores are aggregated across all hospitals in a given state to determine the best states.

2. Another indicator for best hospitals is 30 day readmission and mortality rates. Second script weight averages the hospital mortality and readmission scores based on denominator value and orders them based on the weighted score with lower weighted score indicating better hospitals. These scores have been averaged across all hospitals in a given state to arrive at best state rankings

Again we dont see a lot of overlap between the rankings created by the two measures.

```
-- STATE LEVEL RANKINGS BASED ON PATIENT SURVEY RESPONSES --


SELECT X.*
FROM
(SELECT A.*, rank() over (order by Avg_across_hospitals desc) as hosp_rank
FROM aggregate_survey_score_st A
WHERE Avg_across_hospitals is not null) X
order by hosp_rank ASC
LIMIT 20;


SELECT "-------------------------------------------------------------------------------------";



--STATE LEVEL RANKINGS BASED ON READMISSION AND MORTALITY RATE -- 

SELECT B.*
from
(
SELECT X.*, adj_score/denom as weighted_score
FROM
(
SELECT A.STATE, sum(score*denominator) as adj_score, sum(denominator) as denom
FROM readmission_data A
group by A.STATE
) X
) B
where B.weighted_score is not null
ORDER BY weighted_score ASC
LIMIT 20;


exit;

```

