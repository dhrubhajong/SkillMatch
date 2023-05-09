CREATE TABLE `demographics` (
  `SEN` VARCHAR PRIMARY KEY,
  `Name` VARCHAR,
  `Education` VARCHAR,
  `Batch_No` integer,
  `Gender` CHAR(1),
  `Location` VARCHAR,
  `Age` integer,
  `Passed_out_Year` integer,
  `Marital_Status` VARCHAR,
  `Dependents` CHAR(3),
  `Years_of_exp` integer,
  `Domain` VARCHAR
);

CREATE TABLE `trainer_alloted` (
  `Batch_No` integer PRIMARY KEY,
  `Trainer` VARCHAR,
  `Expertise` VARCHAR
);

CREATE TABLE `Course_duration` (
  `Batch_No` integer PRIMARY KEY,
  `Class_Commencement_Date` DATE,
  `Course_Duration_in_Months` INT(2),
  `Total_course_weeks` INT(2),
  `Total_course_days` INT(3),
  `Total_time_duration` INT(3)
);

CREATE TABLE `lms_engagement_monthly` (
  `SEN` VARCHAR,
  `Batch_id` VARCHAR,
  `Batch_No` integer,
  `Class_Commencement_Date` DATE,
  `Dec_mnth` INT(2),
  `Jan_mnth` INT(2),
  `Feb_mnth` INT(2),
  `March_mnth` INT(2),
  `April_mnth` INT(2),
  `May_mnth` INT(2),
  `June_mnth` INT(2),
  `July_mnth` INT(2),
  `Aug_mnth` INT(2),
  `Sept_mnth` INT(2),
  `Oct_mnth` INT(2),
  `Nov_mnth` INT(2),
  `Total_hrs_spent` INT(3),
  PRIMARY KEY (`SEN`, `Batch_id`, `Batch_No`)
);

CREATE TABLE `lms_engagement_throughout` (
  `SEN` VARCHAR PRIMARY KEY,
  `Batch_No` integer,
  `lms_engagement_throughout_throughout_course` integer,
  `Class_Commencement_Date` DATE,
  `Class_End_Date` DATE,
  `Total_time_enrolled` INT(3),
  `Total_observed_time` integer,
  `Retention_Rate` PERCENTAGE
);

CREATE TABLE `batch_subject_id` (
  `Batch_id` VARCHAR PRIMARY KEY,
  `Subject_id` VARCHAR
);

CREATE TABLE `subject_id_name` (
  `Subject_id` VARCHAR PRIMARY KEY,
  `Subject_Name` VARCHAR
);

CREATE TABLE `assessment_progress_monthly` (
  `SEN` VARCHAR,
  `Batch_id` VARCHAR,
  `Batch_No` integer,
  `Class_Commencement_Date` DATE,
  `Py_assessment_Date` DATE,
  `Python` INT(2),
  `Python_Score` PERCENTAGE,
  `Nlp_assessment_Date` DATE,
  `NLP` INT(2),
  `NLP_Score` PERCENTAGE,
  `Pbi_assessment_Date` DATE,
  `Power_BI` INT(2),
  `Power_BI_Score` PERCENTAGE,
  `Excl_assessment_Date` DATE,
  `Excel` INT(2),
  `Excel_Score` PERCENTAGE,
  `Dl_assessment_Date` DATE,
  `Deep_Learning` INT(2),
  `Deep_Learning_Score` PERCENTAGE,
  `Ml_assessment_Date` DATE,
  `Machine_Learning` INT(2),
  `Machine_Learning_Score` PERCENTAGE,
  `Sql_assessment_Date` DATE,
  `SQL` INT(2),
  `SQL_Score` PERCENTAGE,
  `Stats_assessment_Date` DATE,
  `Statistics` INT(2),
  `Statistics_Score` PERCENTAGE,
  `Aws_assessment_Date` DATE,
  `AWS` INT(2),
  `AWS_Score` PERCENTAGE,
  `Total_marks` INT(2),
  `Pass_rate` INT(2),
  `Total_Avg_prcnt` PERCENTAGE,
  `Pass_Fail` CHAR(4)
);

ALTER TABLE `lms_engagement_throughout` ADD FOREIGN KEY (`Batch_No`) REFERENCES `lms_engagement_monthly` (`Batch_No`);

ALTER TABLE `lms_engagement_throughout` ADD FOREIGN KEY (`Class_Commencement_Date`) REFERENCES `Course_duration` (`Class_Commencement_Date`);

ALTER TABLE `subject_id_name` ADD FOREIGN KEY (`Subject_id`) REFERENCES `batch_subject_id` (`Subject_id`);

ALTER TABLE `assessment_progress_monthly` ADD FOREIGN KEY (`SEN`) REFERENCES `demographics` (`SEN`);

ALTER TABLE `assessment_progress_monthly` ADD FOREIGN KEY (`Batch_id`) REFERENCES `batch_subject_id` (`Batch_id`);

ALTER TABLE `assessment_progress_monthly` ADD FOREIGN KEY (`Batch_No`) REFERENCES `trainer_alloted` (`Batch_No`);

ALTER TABLE `assessment_progress_monthly` ADD FOREIGN KEY (`Class_Commencement_Date`) REFERENCES `Course_duration` (`Class_Commencement_Date`);

ALTER TABLE `demographics` ADD FOREIGN KEY (`Batch_No`) REFERENCES `trainer_alloted` (`Batch_No`);

ALTER TABLE `trainer_alloted` ADD FOREIGN KEY (`Batch_No`) REFERENCES `Course_duration` (`Batch_No`);

ALTER TABLE `demographics` ADD FOREIGN KEY (`SEN`) REFERENCES `lms_engagement_throughout` (`SEN`);

ALTER TABLE `trainer_alloted` ADD FOREIGN KEY (`Batch_No`) REFERENCES `lms_engagement_throughout` (`Batch_No`);
