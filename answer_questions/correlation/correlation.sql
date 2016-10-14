-- CORRELATION BETWEEN HOSPITAL LEVEL PROCEDURAL VARIABILITY AND SURVEY SCORES --


SELECT CORR(B.scaled_survey_score, hosp_proc_variance) AS corr_proc_survey_score
FROM
(
SELECT prvdr_id, STDDEV(score) as hosp_proc_variance
FROM high_quality_care
group by prvdr_id) A
INNER JOIN
survey_scaled B
on A.prvdr_id = B.prvdr_id;


exit;

