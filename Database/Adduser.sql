INSERT INTO 
    "User" ("UserName","Password", "email")
VALUES
    ('yafet','1234567', 'yafetaddisu123@gmail.com'),
    ('biniyam','1234567', 'abimarshall2022@gmail.com'),
    ('nati','1234567', 'nati@gmail.com'),
    ('dani','1234567','')
RETURNING *;


INSERT INTO 
    "Job" ("CompanyName","JobsType","Location","CareerLevel","EmploymentType","Salary","DeadLine","Apply","user_id")
VALUES
    ('hulu Media','Software developer','Addis abeba','0 year', 'Full time','10000', '2022-11-23 13:54:05.261739-08','go to bole', 2)
RETURNING *;

INSERT INTO 
    "Location" ("LocationName","Image", "user_id")
VALUES
    ('Addis Ababa','/images/Addis AbabaFlag.jpg', 17),
    ('Afar','/images/AfarFlag.jpg', 17),
    ('Amhara','/images/AmharaFlag.jpg', 17),
    ('Benishangul Gumuz','/images/Benishangul GumuzFlag.jpg',18),
    ('Dire Dewa','/images/Dire DawaFlag.jpg',18),
    ('Gambela','/images/GambelaFlag.jpg',18),
    ('Harari','/images/HarariFllag.jpg',18),
    ('Oromiya','/images/OromiaFlag.jpg',18),
    ('Sidama','/images/SidemaFlag.jpg',19),
    ('Somali','/images/SomaliFlag.jpg',19),
    ('SNNPR','/images/SNNPRFlag.jpg',20),
    ('Tigray','/images/TigrayFllag.jpg',20),
    ('South West Ethopian Region','/images/South West Ethopian RegionFlag.jpg',20)
RETURNING *;

INSERT INTO 
    "ClinicList" ("ClinicName","Description","CreatedBy","IsActive")
VALUES
    ('Cardiac','Cardiac Description',1,true),
    ('Central Triage','Central Triage',3,true),
    ('Chest','Chest Description',1,true),
    ('Dermatology','Dermatology Description',2,true),
    ('Diabetic', 'Diabetic Description',5,true),
    ('ENT','ENT Description',2,true),
    ('General Surgery','General Surgery Description',2,true),
    ('GI','GI Description',2,true),
    ('Gynecology','Gynecology Description',2,true),
    ('Hematology','Hematology Description',3,true),
    ('Maxillofacial','Maxillofacial Description',1,true),
    ('Minor OR','Minor OR Description',3,true),
    ('Neurology','Neurology Description',5,true),
    ('Neurosurgery','Neurosurgery Description',2,true),
    ('Orthopaedics','Orthopaedics Description',3,true),
    ('Physiotherapy','Physiotherapy Description',2,true),
    ('Psychiatry','Psychiatry Description',1,true),
    ('Renal','Renal Description',1,true),
    ('Rheumatology','Rheumatology Description',1,true),
    ('Staff Clinic','Staff Clinic Description',1,true)
RETURNING *;









