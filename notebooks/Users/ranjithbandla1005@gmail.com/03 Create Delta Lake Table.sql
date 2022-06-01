-- Databricks notebook source
SHOW databases

-- COMMAND ----------

SET spark.databricks.hive.metastore.glueCatalog.enabled

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC * We need to make sure Glue Catalog is disabled to create tables using Delta format. Glue Catalog is not compatible yet with Delta format.
-- MAGIC * Glue Catalog can be enabled or disabled only at cluster level (not at session or notebook level). Hence below command will fail.

-- COMMAND ----------

SET spark.databricks.hive.metastore.glueCatalog.enabled=false

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS students_db

-- COMMAND ----------

-- MAGIC %fs ls /mnt/

-- COMMAND ----------

DROP TABLE IF EXISTS students_db.students

-- COMMAND ----------

CREATE TABLE students_db.students (
  student_id INT,
  student_first_name STRING,
  student_last_name STRING,
  student_email STRING,
  student_gender STRING,
  student_phone_numbers ARRAY<STRING>,
  student_address MAP<STRING, STRING>,
  action STRING
) USING DELTA
LOCATION '/mnt/Ranjithmounttest/students'

-- COMMAND ----------

USE students_db

-- COMMAND ----------

SHOW tables

-- COMMAND ----------

DESCRIBE FORMATTED students_db.students

-- COMMAND ----------

-- MAGIC %fs ls /mnt/Ranjithmounttest/students

-- COMMAND ----------

-- MAGIC %fs ls /mnt/Ranjithmounttest/students/_delta_log

-- COMMAND ----------

