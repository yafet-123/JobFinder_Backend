INSERT INTO 
    "User" ("UserName","Password")
VALUES
    ('yafet','1234567'),
    ('biniyam','1234567'),
    ('nati','1234567'),
    ('dani','1234567')
RETURNING *;


INSERT INTO 
    "Job" ("CompanyName","JobsType","Location","CareerLevel","EmploymentType","Salary","DeadLine","Apply","user_id")
VALUES
    ('hulu Media','Software developer','Addis abeba','0 year', 'Full time','10000', '2022-11-23 13:54:05.261739-08','go to bole', 2)
RETURNING *;









