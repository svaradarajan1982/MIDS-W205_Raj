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
```
## Measures with high variability

measure_id measure_nm proc_variance
ED_1b   ED1     92.83178787038688
ED_2b   ED2     62.1666505939829
OP_18b  OP 18   40.70077322337158
OP_3b   Median Time to Transfer to Another Facility for Acute Coronary Intervention     29.479326601050527
STK_4   Thrombolytic Therapy    21.954194561164023
OP_23   Head CT results 21.844653491103774
AMI_7a  Fibrinolytic Therapy Received Within 30 Minutes Of Hospital Arrival     18.7794213613377
OP_2    Fibrinolytic Therapy Received Within 30 Minutes of ED Arrival   18.048443797995763
OP_21   Median time to pain med 17.722358013930915
OP_20   Door to diagnostic eval 16.882052975576602
IMM_3_FAC_ADHPCT        Healthcare workers given influenza vaccination  16.348047889323595
VTE_5   Warfarin therapy discharge instructions 16.30300466996529
VTE_1   Venous thromboembolism prophylaxis      15.257401142298388
STK_8   Stroke Education        14.013262732452308
CAC_3   Home Management Plan of Care Document   12.71912110433212
IMM_2   Immunization for influenza      11.944885922069522
HF_1    Discharge instructions  11.827981182220096
HF_2    Evaluation of LVS Function      10.411823309201342
STK_6   Discharged on Statin Medication 10.037311540967659
PN_6    Initial antibiotic selection for CAP in immunocompetent patient 9.275894472939902

```
