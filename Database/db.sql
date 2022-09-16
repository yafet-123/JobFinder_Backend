create table "User"(
	"user_id" SERIAL primary key,
	"UserName" varchar(255) UNIQUE not null,
	"Password" varchar(255) not null,
	"CreatedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	"ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

create table "Job"(
	"job_id" SERIAL primary key,
	"CompanyName" varchar(255) not null,
	"Image" varchar(255),
	"JobsType" varchar(255) not null,
	"Location" varchar(255) not null,
	"CareerLevel" varchar(255) not null,
	"EmploymentType" varchar(255) not null,
	"Salary" varchar(255) not null,
	"JobsDescreption" text,
	"JobsRequirement" text,
	"DeadLine" date not null,
	"Apply" varchar(255) not null,
	"CreatedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	"ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	"user_id" INT not null,
	FOREIGN KEY("user_id") REFERENCES "User"("user_id") ON DELETE SET NULL
);


create table "Category"(
	"category_id" SERIAL primary key,
	"CategoryName" varchar(255) not null,
	"user_id" INT,
	"CreatedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	"ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY("user_id") REFERENCES "User"("user_id") ON DELETE SET NULL
);

create table "JobCategory"(
	"user_id" INT,
	"category_id" INT,
	"job_id" INT,
	"CreatedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	"ModifiedDate" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	primary key("category_id","job_id"),
	FOREIGN KEY("user_id") REFERENCES "User"("user_id") ON DELETE SET Null,
	FOREIGN KEY("category_id") REFERENCES "Category"("category_id") ON DELETE CASCADE ,
	FOREIGN KEY("job_id") REFERENCES "Job"("job_id") ON DELETE CASCADE 
);








