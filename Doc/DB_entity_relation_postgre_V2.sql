CREATE TABLE "course_duration" (
  "Batch_No" INTEGER,
  "Class_Commencement_Date" DATE,
  "Course_Duration_in_Months" INTEGER,
  "Total_course_weeks" INTEGER,
  "Total_course_days" INTEGER,
  "Total_time_duration" INTEGER,
  PRIMARY KEY ("Batch_No", "Class_Commencement_Date"),
  CONSTRAINT uc_course_duration UNIQUE ("Batch_No")
);

CREATE TABLE "demographics" (
  "SEN" VARCHAR PRIMARY KEY,
  "Name" VARCHAR,
  "Education" VARCHAR,
  "Batch_No" INTEGER,
  "Gender" CHAR(1),
  "Location" VARCHAR,
  "Age" INTEGER,
  "Passed_out_Year" INTEGER,
  "Marital_Status" VARCHAR,
  "Dependents" CHAR(3),
  "Years_of_exp" INTEGER,
  "Domain" VARCHAR,
  FOREIGN KEY ("Batch_No") REFERENCES "course_duration" ("Batch_No")
);

CREATE TABLE "lms_engagement_monthly" (
  "SEN" VARCHAR ,
  "Batch_id" VARCHAR,
  "Batch_No" INTEGER,
  "Class_Commencement_Date" DATE,
  "Dec_mnth" INTEGER,
  "Jan_mnth" INTEGER,
  "Feb_mnth" INTEGER,
  "March_mnth" INTEGER,
  "April_mnth" INTEGER,
  "May_mnth" INTEGER,
  "June_mnth" INTEGER,
  "July_mnth" INTEGER,
  "Aug_mnth" INTEGER,
  "Sept_mnth" INTEGER,
  "Oct_mnth" INTEGER,
  "Nov_mnth" INTEGER,
  "Total_hrs_spent" INTEGER,
  PRIMARY KEY ("SEN", "Batch_id"),
  CONSTRAINT uc_lms_mnthly UNIQUE ("SEN"),
 FOREIGN KEY ("Batch_No") REFERENCES "course_duration"("Batch_No"),
 FOREIGN KEY ("SEN") REFERENCES "demographics"("SEN")
);


CREATE TABLE "assessment_progress_monthly" (
  "SEN" VARCHAR,
  "Batch_id" VARCHAR,
  "Batch_No" INTEGER,
  "Class_Commencement_Date" DATE,
  "Py_assessment_Date" DATE,
  "Python" INTEGER,
  "Python_Score" DECIMAL,
  "Nlp_assessment_Date" DATE,
  "NLP" INTEGER,
  "NLP_Score" DECIMAL,
  "Pbi_assessment_Date" DATE,
  "Power_BI" INTEGER,
  "Power_BI_Score" DECIMAL,
  "Excl_assessment_Date" DATE,
  "Excel" INTEGER,
  "Excel_Score" DECIMAL,
  "Dl_assessment_Date" DATE,
  "Deep_Learning" INTEGER,
  "Deep_Learning_Score" DECIMAL,
  "Ml_assessment_Date" DATE,
  "Machine_Learning" INTEGER,
  "Machine_Learning_Score" DECIMAL,
  "Sql_assessment_Date" DATE,
  "SQL" INTEGER,
  "SQL_Score" DECIMAL,
  "Stats_assessment_Date" DATE,
  "Statistics" INTEGER,
  "Statistics_Score" DECIMAL,
  "Aws_assessment_Date" DATE,
  "AWS" INTEGER,
  "AWS_Score" DECIMAL,
  "Total_marks" INTEGER,
  "Pass_rate" INTEGER,
  "Total_Avg_prcnt" DECIMAL,
  "Pass_Fail" CHAR(4),
  PRIMARY KEY ("SEN","Batch_No"),
  FOREIGN KEY("SEN") REFERENCES "lms_engagement_monthly"("SEN")
);

CREATE TABLE "lms_engagement_throughout" (
  "SEN" VARCHAR PRIMARY KEY,
  "Batch_No" INTEGER,
  "lms_engagement_throughout_throughout_course" INTEGER,
  "Class_Commencement_Date" DATE,
  "Class_End_Date" DATE,
  "Total_time_enrolled" INTEGER,
  "Total_observed_time" INTEGER,
  "Retention_Rate" DECIMAL,
  FOREIGN KEY ("SEN") REFERENCES lms_engagement_monthly("SEN")
);


