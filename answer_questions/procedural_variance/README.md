## Procedural Variance.

Procedural Variance has been computed using high quality care dataset. For each measure standard deviation has been calculated across all hospitals and measures have been rank ordered based the standard deviation values. The reason for using Standard Deviation is because all measures have different score ranges and STDDEV normalizes for those different ranges. Whereas variance just takes absolute squared deviation which may be higher for measures with large score values.

```
select A.*
from
(
SELECT measure_id, measure_name, STDDEV(score) as proc_variance
FROM high_quality_care
GROUP BY measure_id, measure_name
) A
ORDER by proc_variance DESC
LIMIT 20;
```
