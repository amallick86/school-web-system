CREATE TABLE "Subscription" (
  "id" SERIAL PRIMARY KEY,
  "price" int,
  "period" int
);

CREATE TABLE "FeatureList" (
  "id" SERIAL PRIMARY KEY,
  "subscription_id" id,
  "feature" varchar
);

CREATE TABLE "School" (
  "school_id" varchar PRIMARY KEY,
  "name" varchar,
  "school_pan" varchar,
  "subscription_id" int
);

CREATE TABLE "Logo" (
  "id" int,
  "school_id" int,
  "url" varchar,
  "created at" varchar,
  PRIMARY KEY ("id")
);

CREATE TABLE "NavBar" (
  "id" SERIAL PRIMARY KEY,
  "menu" varchar,
  "color" varchar,
  "on_clicked_color" varchar,
  "on_click" varchar,
  "created_at" timestamp
);

CREATE TABLE "Footer" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "name" varchar,
  "Details" varchar,
  "created_at" timestamp
);

CREATE TABLE "ConnectWITHUS" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "image_url" varchar,
  "link" varchar
);

CREATE TABLE "Banner" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "image_url" varchar
);

CREATE TABLE "BannerText" (
  "id" SERIAL PRIMARY KEY,
  "banner_id" int,
  "header" varchar,
  "sub_header" varchar,
  "link" varchar
);

CREATE TABLE "HomeCard" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "header" varchar,
  "sub_header" varchar,
  "link" varchar
);

CREATE TABLE "MessagesFromPrincipal" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "title" varchar,
  "header" varchar,
  "sub_header" varchar,
  "link" varchar,
  "created_at" timestamp
);

CREATE TABLE "SchoolFacilities" (
  "id" SERIAL PRIMARY KEY,
  "header" varchar,
  "sub_header" varchar,
  "link" varchar,
  "created_at" timestamp
);

CREATE TABLE "NewAndEvent" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "title" varchar,
  "description" varchar,
  "image_url" varchar,
  "link" varchar,
  "created_at" timestamp
);

CREATE TABLE "NoticeBoad" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "title" varchar,
  "description" varchar,
  "document_url" varchar,
  "link" varchar,
  "created_at" timestamp
);

CREATE TABLE "About" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "title" varchar,
  "description" varchar,
  "img_url" varchar,
  "created_at" timestamp
);

CREATE TABLE "Gallery" (
  "id" SERIAL PRIMARY KEY,
  "event_id" int,
  "img_url" varchar,
  "created_at" timestamp
);

CREATE TABLE "Class" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "class" string,
  "created_at" timestamp
);

CREATE TABLE "Subject" (
  "id" SERIAL PRIMARY KEY,
  "class" int,
  "subject_name" varchar,
  "full_mark" int,
  "pass_mark" int,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "StudentTeacherStatus" (
  "id" SERIAL PRIMARY KEY,
  "status" varchar
);

CREATE TABLE "Teacher" (
  "id" varchar PRIMARY KEY,
  "school_id" int,
  "name" varchar,
  "teacher_pan" varchar
);

CREATE TABLE "TeacherBankAccount" (
  "id" SERIAL PRIMARY KEY,
  "teacher_id" int,
  "bank_name" varchar,
  "account_number" varchar,
  "branch" varchar
);

CREATE TABLE "Students" (
  "rollnumber" varchar[pk],
  "school_id" int,
  "jonning_date" timestamp,
  "current_classes" int,
  "status" varchar,
  "contact" varchar,
  "date_of_birth" datetime,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Relation" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "StudentParent" (
  "id" SERIAL PRIMARY KEY,
  "student_rollnumber" int,
  "name" varchar,
  "relation" varchar,
  "contact" varchar,
  "address" varchar
);

CREATE TABLE "FeeStatus" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "status" varchar
);

CREATE TABLE "ClassFeeStructure" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "class" int,
  "charge_name" int,
  "amount" int
);

CREATE TABLE "StudentFeeBill" (
  "id" SERIAL PRIMARY KEY,
  "student_rollnumber" int,
  "class" int,
  "month" datetime,
  "amount" int,
  "status" int,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "FeeChargesName" (
  "id" SERIAL PRIMARY KEY,
  "school_id" int,
  "name" varchar
);

CREATE TABLE "FeeDiscount" (
  "int" SERIAL PRIMARY KEY,
  "bill_no" int,
  "charge_name" int,
  "amount" int,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "StudentMarks" (
  "id" SERIAL PRIMARY KEY,
  "student_rollnumber" int,
  "class" int,
  "subject" int,
  "obtained_mark" int,
  "created_at" timestamp
);

COMMENT ON COLUMN "BannerText"."banner_id" IS 'Its contains the banner id with one to one relation';

ALTER TABLE "FeatureList" ADD FOREIGN KEY ("subscription_id") REFERENCES "Subscription" ("id");

ALTER TABLE "School" ADD FOREIGN KEY ("subscription_id") REFERENCES "Subscription" ("id");

ALTER TABLE "Logo" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Footer" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "ConnectWITHUS" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Banner" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "BannerText" ADD FOREIGN KEY ("banner_id") REFERENCES "Banner" ("id");

ALTER TABLE "HomeCard" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "MessagesFromPrincipal" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "NewAndEvent" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "NoticeBoad" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "About" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Gallery" ADD FOREIGN KEY ("event_id") REFERENCES "NoticeBoad" ("id");

ALTER TABLE "Class" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Subject" ADD FOREIGN KEY ("class") REFERENCES "Class" ("id");

ALTER TABLE "Teacher" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "TeacherBankAccount" ADD FOREIGN KEY ("teacher_id") REFERENCES "Teacher" ("id");

ALTER TABLE "Students" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Students" ADD FOREIGN KEY ("current_classes") REFERENCES "Class" ("id");

ALTER TABLE "Students" ADD FOREIGN KEY ("status") REFERENCES "StudentTeacherStatus" ("id");

ALTER TABLE "StudentParent" ADD FOREIGN KEY ("student_rollnumber") REFERENCES "Students" ("rollnumber");

ALTER TABLE "StudentParent" ADD FOREIGN KEY ("relation") REFERENCES "Relation" ("name");

ALTER TABLE "FeeStatus" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "ClassFeeStructure" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "ClassFeeStructure" ADD FOREIGN KEY ("class") REFERENCES "Class" ("id");

ALTER TABLE "ClassFeeStructure" ADD FOREIGN KEY ("charge_name") REFERENCES "FeeChargesName" ("id");

ALTER TABLE "StudentFeeBill" ADD FOREIGN KEY ("student_rollnumber") REFERENCES "Students" ("rollnumber");

ALTER TABLE "StudentFeeBill" ADD FOREIGN KEY ("class") REFERENCES "Class" ("id");

ALTER TABLE "StudentFeeBill" ADD FOREIGN KEY ("status") REFERENCES "FeeStatus" ("id");

ALTER TABLE "FeeChargesName" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "FeeDiscount" ADD FOREIGN KEY ("bill_no") REFERENCES "StudentFeeBill" ("id");

ALTER TABLE "FeeDiscount" ADD FOREIGN KEY ("charge_name") REFERENCES "FeeChargesName" ("id");

ALTER TABLE "StudentMarks" ADD FOREIGN KEY ("student_rollnumber") REFERENCES "Students" ("rollnumber");

ALTER TABLE "StudentMarks" ADD FOREIGN KEY ("class") REFERENCES "Class" ("id");

ALTER TABLE "StudentMarks" ADD FOREIGN KEY ("subject") REFERENCES "Subject" ("id");
