CREATE TABLE "Task" (
	"id" serial(11) NOT NULL,
	"name" varchar(155) NOT NULL,
	"description" TEXT NOT NULL,
	"deadline" DATETIME NOT NULL,
	"user_id" integer NOT NULL,
	"status" BOOLEAN NOT NULL,
	CONSTRAINT Task_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "User" (
	"id" serial(11) NOT NULL,
	"username" varchar(60) NOT NULL,
	"email" varchar(80) NOT NULL,
	"password" varchar(100) NOT NULL,
	CONSTRAINT User_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PivotUserTask" (
	"id" serial NOT NULL,
	"task_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"type" BOOLEAN NOT NULL,
	CONSTRAINT PivotUserTask_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Task" ADD CONSTRAINT "Task_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("id");


ALTER TABLE "PivotUserTask" ADD CONSTRAINT "PivotUserTask_fk0" FOREIGN KEY ("task_id") REFERENCES "Task"("id");
ALTER TABLE "PivotUserTask" ADD CONSTRAINT "PivotUserTask_fk1" FOREIGN KEY ("user_id") REFERENCES "User"("id");

