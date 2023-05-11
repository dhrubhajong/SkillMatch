CREATE TABLE `course_duration` (
  `Batch_No` int,
  `Class_Commencement_Date` date,
  `Course_Duration_in_Months` int,
  `Total_course_weeks` int,
  `Total_course_days` int,
  `Total_time_duration` int,
  PRIMARY KEY (`Batch_No`, `Class_Commencement_Date`)
);

CREATE TABLE `demographics` (
  `SEN` varchar(255) PRIMARY KEY,
  `Name` varchar(255),
  `Education` varchar(255),
  `Batch_No` int,
  `Gender` char,
  `Location` varchar(255),
  `Age` int,
  `Passed_out_Year` int,
  `Marital_Status` varchar(255),
  `Dependents` char,
  `Years_of_exp` int,
  `Domain` varchar(255)
);

CREATE TABLE `lms_engagement_monthly` (
  `SEN` varchar(255),
  `Batch_id` varchar(255),
  `Batch_No` int,
  `Class_Commencement_Date` date,
  `Dec_mnth` int,
  `Jan_mnth` int,
  `Feb_mnth` int,
  `March_mnth` int,
  `April_mnth` int,
  `May_mnth` int,
  `June_mnth` int,
  `July_mnth` int,
  `Aug_mnth` int,
  `Sept_mnth` int,
  `Oct_mnth` int,
  `Nov_mnth` int,
  `Total_hrs_spent` int,
  `unique` index(SEN)
);

CREATE TABLE `assessment_progress_monthly` (
  `SEN` varchar(255),
  `Batch_id` varchar(255),
  `Batch_No` int,
  `Class_Commencement_Date` date,
  `Py_assessment_Date` date,
  `Python` int,
  `Python_Score` decimal,
  `Nlp_assessment_Date` date,
  `NLP` int,
  `NLP_Score` decimal,
  `Pbi_assessment_Date` date,
  `Power_BI` int,
  `Power_BI_Score` decimal,
  `Excl_assessment_Date` date,
  `Excel` int,
  `Excel_Score` decimal,
  `Dl_assessment_Date` date,
  `Deep_Learning` int,
  `Deep_Learning_Score` decimal,
  `Ml_assessment_Date` date,
  `Machine_Learning` int,
  `Machine_Learning_Score` decimal,
  `Sql_assessment_Date` date,
  `SQL` int,
  `SQL_Score` decimal,
  `Stats_assessment_Date` date,
  `Statistics` int,
  `Statistics_Score` decimal,
  `Aws_assessment_Date` date,
  `AWS` int,
  `AWS_Score` decimal,
  `Total_marks` int,
  `Pass_rate` int,
  `Total_Avg_prcnt` decimal,
  `Pass_Fail` char
);

CREATE TABLE `lms_engagement_throughout` (
  `SEN` varchar(255),
  `Batch_No` int,
  `lms_engagement_throughout_throughout_course` int,
  `Class_Commencement_Date` date,
  `Class_End_Date` date,
  `Total_time_enrolled` int,
  `Total_observed_time` int,
  `Retention_Rate` decimal
);

ALTER TABLE `demographics` ADD FOREIGN KEY (`Batch_No`) REFERENCES `course_duration` (`Batch_No`);

ALTER TABLE `lms_engagement_monthly` ADD FOREIGN KEY (`SEN`) REFERENCES `demographics` (`SEN`);

ALTER TABLE `lms_engagement_monthly` ADD FOREIGN KEY (`Batch_No`) REFERENCES `course_duration` (`Batch_No`);

ALTER TABLE `assessment_progress_monthly` ADD FOREIGN KEY (`SEN`) REFERENCES `lms_engagement_monthly` (`SEN`);

ALTER TABLE `lms_engagement_throughout` ADD FOREIGN KEY (`SEN`) REFERENCES `lms_engagement_monthly` (`SEN`);
