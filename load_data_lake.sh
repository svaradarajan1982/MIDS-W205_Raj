if [ -d hospital ]
then 
   echo "hospital dir already exists"; 
   rm -R hospital
   mkdir hospital
   cd hospital
   wget "https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
   mv Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary\&filename\=Hospital_Revised_Flatfiles.zip hospitals.zip
   unzip hospitals.zip
   tail -n +2 'Hospital General Information.csv' > hospitals.csv
   tail -n +2 'Timely and Effective Care - Hospital.csv' > effective_care.csv
   tail -n +2 'Readmissions and Deaths - Hospital.csv' > readmissions.csv
   tail -n +2 'Measure Dates.csv' > Measures.csv
   tail -n +2 'hvbp_hcahps_05_28_2015.csv' > surveys_responses.csv
else 
   mkdir hospital 
   cd hospital
   wget "https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip" 
   mv Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary\&filename\=Hospital_Revised_Flatfiles.zip hospitals.zip
   unzip hospitals.zip
   tail -n +2 'Hospital General Information.csv' > hospitals.csv
   tail -n +2 'Timely and Effective Care - Hospital.csv' > effective_care.csv
   tail -n +2 'Readmissions and Deaths - Hospital.csv' > readmissions.csv
   tail -n +2 'Measure Dates.csv' > Measures.csv
   tail -n +2 'hvbp_hcahps_05_28_2015.csv' > surveys_responses.csv
fi
   
if $(hadoop fs -test -d /user/w205/hospital_compare); then echo "hospital compare dir already exists"; else hdfs dfs -mkdir /user/w205/hospital_compare; fi
pwd

hdfs dfs -put hospitals.csv /user/w205/hospital_compare/
if $(hadoop fs -test -d /user/w205/hospital_compare/hospital); then echo "hospital dir already exists"; else hdfs dfs -mkdir /user/w205/hospital_compare/hospital; fi

hdfs dfs -mv /user/w205/hospital_compare/hospitals.csv /user/w205/hospital_compare/hospital/

hdfs dfs -put effective_care.csv /user/w205/hospital_compare/

if $(hadoop fs -test -d /user/w205/hospital_compare/eff_care); then echo "effective care dir already exists"; else  hdfs dfs -mkdir /user/w205/hospital_compare/eff_care; fi
hdfs dfs -mv /user/w205/hospital_compare/effective_care.csv /user/w205/hospital_compare/eff_care/

hdfs dfs -put readmissions.csv /user/w205/hospital_compare/

if $(hadoop fs -test -d /user/w205/hospital_compare/readmission); then echo "readmission dir already exists"; else  hdfs dfs -mkdir /user/w205/hospital_compare/readmission; fi
hdfs dfs -mv /user/w205/hospital_compare/readmissions.csv /user/w205/hospital_compare/readmission/

hdfs dfs -put Measures.csv /user/w205/hospital_compare/

if $(hadoop fs -test -d /user/w205/hospital_compare/measure); then echo "measure dir already exists"; else  hdfs dfs -mkdir /user/w205/hospital_compare/measure; fi

hdfs dfs -mv /user/w205/hospital_compare/Measures.csv /user/w205/hospital_compare/measure/

hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/

if $(hadoop fs -test -d /user/w205/hospital_compare/survey); then echo "survey dir already exists"; else  hdfs dfs -mkdir /user/w205/hospital_compare/survey; fi

hdfs dfs -mv /user/w205/hospital_compare/surveys_responses.csv /user/w205/hospital_compare/survey/

