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

```
# Rankings based on aggregated survey, base and consistency scores

state Avg_across_hospitals hosp_rank
WI	0.5766287857304898	1
SD	0.5746092962290785	2
ME	0.5693570612354641	3
LA	0.5668819446039804	4
VT	0.5621534079451502	5
IN	0.5510338085554559	6
KS	0.5466360825435236	7
SC	0.5373333449671923	8
AL	0.5372211131276468	9
MN	0.5366021690360959	10
MS	0.5336970813733841	11
NE	0.528492003998001	12
HI	0.5270575537590058	13
NC	0.5207653652810188	14
NH	0.5155341104751268	15
TX	0.515189632810054	16
MO	0.5073015512920231	17
KY	0.5059283745762875	18
CO	0.5057378457900237	19
OK	0.5056947403491238	20
-------------------------------------------------------------------------------------
# Rankings based on readmission and mortality rates

state adj_score denom weighted_score
ID	741168.7017059326	56087.0	13.214625522954208
SD	779410.2988739014	58578.0	13.30551228915124
CO	2009568.2094955444	150599.0	13.343835015475165
UT	941789.4035186768	70150.0	13.425365695205656
MT	786085.8990631104	58274.0	13.489478996861557
AK	271794.09689331055	19797.0	13.729054750381904
NE	1631675.6999511719	118448.0	13.775460117107691
OR	1767713.09740448	128117.0	13.79764666207045
AZ	3561776.900657654	255852.0	13.921239234626478
WA	3738820.5077209473	268327.0	13.933821448161934
HI	439238.1022262573	31443.0	13.96934459899683
WI	3820371.9064941406	273093.0	13.989270711787341
IA	2880264.3079299927	205600.0	14.009067645573895
NH	1246364.6019744873	88939.0	14.013701547965317
ND	706167.3992462158	50239.0	14.056159542312065
DE	980241.3122253418	69535.0	14.09709228770176
KS	2589917.0927505493	183600.0	14.106302248096673
MN	2198425.803024292	155602.0	14.128518933074716
ME	1331708.5995941162	93988.0	14.168921560136573
VT	553156.8992004395	38651.0	14.311580533503388
```

