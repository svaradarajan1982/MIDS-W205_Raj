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


