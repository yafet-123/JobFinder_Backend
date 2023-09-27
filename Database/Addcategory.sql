INSERT INTO 
    "Category" ("CategoryName","user_id")
VALUES
    ('Accounting and Finance',1),
    ('Admin, Secretarial and Clerical',2),
    ('Advertising and Media',2),
    ('Agriculture',2),
    ('Architecture and Construction',2),
    ('Automotive',1),
    ('Banking and Insurance',2),
    ('Business Development',2),
    ('Business and Administration',1),
    ('Civil Service and Government',2),
    ('Communications, PR and Journalism ',2),
    ('Community Service',1),
    ('Consultancy and Training',2),
    ('Creative Arts',1),
    ('Customer Service',)
    ('Development and Project Management',2),
    ('Economics',1),
    ('Education',1),
    ('Engineering',1),
    ('Entertainment',1),
    ('Environment and Natural Resource',1),
    ('Event Management',1),
    ('Health Care',2),
    ('Hotel and Hospitality',1),
    ('Human Resource and Recruitment ',2),
    ('Information Technology',1),
    ('Inventory and Stock',1),
    ('Languages',2),
    ('Legal',1),
    ('Logistics, Transport and Supply Chain ',2),
    ('Maintenance',2),
    ('Management',1),
    ('Manufacturing',1),
    ('Media and Journalism',2),
    ('Natural Sciences',2),
    ('Pharmaceutical',1),
    ('Purchasing and Procurement',2),
    ('Quality Assurance',1),
    ('Research and Development',1),
    ('Retail, Wholesale and Distribution',2),
    ('Sales and Marketing',1),
    ('Science and Technology',1)
RETURNING *;

INSERT INTO 
    "Items" ("name","Description","price","Image","profile","Condition","user_id")
VALUES
    ('I phone ','128Gb storage 6 gb ram', '300000','{"https://res.cloudinary.com/df7hlpjcj/image/upload/v1690976469/Ecommerce/2ee00c23-3b7e-45e4-b3f5-483a8f55c718_hi6xi4.jpg"}','Image','Good condition',3),
    ('Samsung','256Gb storage 8 Gb ram', '4000000','{"https://res.cloudinary.com/df7hlpjcj/image/upload/v1690976438/Ecommerce/24bb1ef2-53d7-44de-8db2-4606fa744fe1_mnb8pr.jpg"}','Image','New',4)
RETURNING *;

INSERT INTO 
    "User" ("UserName","phonenumber", "email","Image","Password")
VALUES
    ('yafet','+251934781038', 'yafetaddisu563@gmail.com','https://petapixel.com/assets/uploads/2022/08/fdfs19-800x533.jpg','12345'),
    ('biniyam','+251934781030', 'abimarshall6066@gmail.com','https://petapixel.com/assets/uploads/2022/08/fdfs11-800x533.jpg','12345')
RETURNING *;


    

