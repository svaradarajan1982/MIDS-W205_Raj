/data/spark15/bin/spark-sql -i loading_data/hive_base_ddl.sql
/data/spark15/bin/spark-sql -i transform_data/transform_data_spark.sql
/data/spark15/bin/spark-sql -i answer_questions/best_hospitals/best_hospitals.sql > answer_questions/best_hospitals/best_hospitals.txt
/data/spark15/bin/spark-sql -i answer_questions/best_states/best_states.sql > answer_questions/best_states/best_states.txt
/data/spark15/bin/spark-sql -i answer_questions/procedural_variance/procedural_variance.sql > answer_questions/procedural_variance/procedural_variance.txt
/data/spark15/bin/spark-sql -i answer_questions/correlation/correlation.sql > answer_questions/correlation/correlation.txt

