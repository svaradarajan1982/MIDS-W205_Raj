-- VARIANCE IN PROCEDURES ACROSS HOSPITALS --

select A.*
from
(
SELECT measure_id, measure_name, variance(score) as proc_variance
FROM high_quality_care
GROUP BY measure_id, measure_name
) A
ORDER by proc_variance DESC
LIMIT 20;


exit;

