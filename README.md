# MIDS-W205_Raj Exercise 1

## How to run the code:

1. Start an EC2 instance with CentOS UCB AMI

2. Mount the file system /data

3. Start hadoop /root/start-hadoop.sh, start postgres: /data/start_postgres.sh, start metastore: /data/start_metastore.sh

4. Create a user w205 by running: su - w205

5. Clone the repo by running git clone //path to the repo

6. Cloned repo should now be in /data/MIDS-W205_Raj

7. CD into this directory and run the following:

    a. bash load_data_lake.sh  # this will download the hospital compare dataset and load that into hdfs
    
    b. bash run_spark_sql.sh # this will ingest the data, transform the key variables and present outputs for problem questions.
    
