CREATE TABLE "demographics" (
  "SEN" VARCHAR PRIMARY KEY,
  "Name" VARCHAR,
  "Education" VARCHAR,
  "Batch_No" integer,
  "Gender" CHAR(1),
  "Location" VARCHAR,
  "Age" integer,
  "Passed_out_Year" integer,
  "Marital_Status" VARCHAR,
  "Dependents" CHAR(3),
  "Years_of_exp" integer,
  "Domain" VARCHAR
);

CREATE TABLE "trainer_alloted" (
  "Batch_No" integer PRIMARY KEY,
  "Trainer" VARCHAR,
  "Expertise" VARCHAR
);

CREATE TABLE "Course_duration" (
  "Batch_No" integer PRIMARY KEY,
  "Class_Commencement_Date" DATE,
  "Course_Duration_in_Months" INT(2),
  "Total_course_weeks" INT(2),
  "Total_course_days" INT(3),
  "Total_time_duration" INT(3)
);

CREATE TABLE "lms_engagement" (
  "SEN" VARCHAR PRIMARY KEY,
  "Batch_No" integer,
  "Lms_engagement_throughout_course" integer,
  "Class_Commencement_Date" DATE,
  "Class_End_Date" DATE,
  "Total_time_enrolled" INT(3),
  "Total_observed_time" integer,
  "Retention_Rate" PERCENTAGE
);

CREATE TABLE "batch_subject_id" (
  "Batch_id" VARCHAR PRIMARY KEY,
  "Subject_id" VARCHAR
);

CREATE TABLE "subject_id_name" (
  "Subject_id" VARCHAR PRIMARY KEY,
  "Subject_Name" VARCHAR
);

CREATE TABLE "student_progress" (
  "SEN" VARCHAR,
  "Batch_id" VARCHAR,
  "Batch_No" integer,
  "Class_Commencement_Date" DATE,
  "Total_Marks" INT(2),
  "Pass_Rate" INT(2),
  "Python" INT(2),
  "Python_Score" PERCENTAGE,
  "NLP" INT(2),
  "NLP_Score" PERCENTAGE,
  "Power_BI" INT(2),
  "Power_BI_Score" PERCENTAGE,
  "Excel" INT(2),
  "Excel_Score" PERCENTAGE,
  "Deep_Learning" INT(2),
  "Deep_Learning_Score" PERCENTAGE,
  "Machine_Learning" INT(2),
  "Machine_Learning_Score" PERCENTAGE,
  "SQL" INT(2),
  "SQL_Score" PERCENTAGE,
  "Statistics" INT(2),
  "Statistics_Score" PERCENTAGE,
  "AWS" INT(2),
  "AWS_Score" PERCENTAGE,
  "Total_Avg_prcnt" PERCENTAGE,
  "Pass_Fail" CHAR(4)
);

ALTER TABLE "lms_engagement" ADD FOREIGN KEY ("Class_Commencement_Date") REFERENCES "Course_duration" ("Class_Commencement_Date");

ALTER TABLE "subject_id_name" ADD FOREIGN KEY ("Subject_id") REFERENCES "batch_subject_id" ("Subject_id");

ALTER TABLE "student_progress" ADD FOREIGN KEY ("SEN") REFERENCES "demographics" ("SEN");

ALTER TABLE "student_progress" ADD FOREIGN KEY ("Batch_id") REFERENCES "batch_subject_id" ("Batch_id");

ALTER TABLE "student_progress" ADD FOREIGN KEY ("Batch_No") REFERENCES "trainer_alloted" ("Batch_No");

ALTER TABLE "student_progress" ADD FOREIGN KEY ("Class_Commencement_Date") REFERENCES "Course_duration" ("Class_Commencement_Date");

ALTER TABLE "demographics" ADD FOREIGN KEY ("Batch_No") REFERENCES "trainer_alloted" ("Batch_No");

ALTER TABLE "trainer_alloted" ADD FOREIGN KEY ("Batch_No") REFERENCES "Course_duration" ("Batch_No");

ALTER TABLE "demographics" ADD FOREIGN KEY ("SEN") REFERENCES "lms_engagement" ("SEN");

ALTER TABLE "trainer_alloted" ADD FOREIGN KEY ("Batch_No") REFERENCES "lms_engagement" ("Batch_No");
