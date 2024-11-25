
-- copy_data.sql
COPY INTO DIRECT_SPEND
FROM @my_s3_stage/Direct_spend_data.csv
FILE_FORMAT = (FORMAT_NAME = my_csv_format)
ON_ERROR = 'CONTINUE';
