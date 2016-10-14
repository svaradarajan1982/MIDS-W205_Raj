## Correlation between survey scores and procedural variance

Data Shows negative correlation between survey scores and procedural variance i.e. greater the survey scores lower the procedural variance and vice-versa which sounds intuitive. Correlation Coefficient of -0.22 indicates a medium sized effect.

```

SELECT CORR(B.scaled_survey_score, hosp_proc_variance) AS corr_proc_survey_score
FROM
(
SELECT prvdr_id, STDDEV(score) as hosp_proc_variance
FROM high_quality_care
group by prvdr_id) A
INNER JOIN
survey_scaled B
on A.prvdr_id = B.prvdr_id;

```

```
Correlation Coefficient r = -0.22906763466525332
```
