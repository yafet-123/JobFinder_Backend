INSERT INTO 
    "AiCategory" ("CategoryName", "user_id")
VALUES
    ('Writing',5),
    ('Art',6),
    ('Chatbot',5),
    ('Speech',5),
    ('Music',5),
    ('Video',6),
    ('Dating',6),
    ('Social Media',6),
    ('Marketing',6),
    ('Academic',6),
    ('Travel',6),
    ('Investing',5),
    ('Coding',5),
    ('Studying',5),
    ('Automation',6),
    ('Health',6),
    ('Anime',6),
    ('Productivity',5),
    ('Language',5),
    ('AI Detection',5)
RETURNING *;

INSERT INTO 
    "User" ("UserName","role", "email")
VALUES
    ('yafet','admin', 'yafetaddisu563@gmail.com'),
    ('biniyam','admin', 'abimarshall6066@gmail.com')
RETURNING *;


INSERT INTO 
    "Job" ("CompanyName","JobsType","Location","CareerLevel","EmploymentType","Salary","DeadLine","Apply","user_id")
VALUES
    ('hulu Media','Software developer','Addis abeba','0 year', 'Full time','50000', '','go to bole', 6)
RETURNING *;

INSERT INTO 
    "Location" ("LocationName","Image", "user_id")
VALUES
    ('Addis Ababa','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675182038/my_upload/ka2u8lvwb3qbc0qexwed.jpg', 1),
    ('Afar','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675182160/my_upload/wbxr1yxweccq1gmcmsp0.jpg', 1),
    ('Amhara','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675183630/my_upload/fn4fq8tto7f0m13gpjz7.jpg', 1),
    ('Benishangul Gumuz','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675183884/my_upload/ppdq12cjdk2prdqyabco.jpg',1),
    ('Dire Dewa','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675183988/my_upload/my3owlv4lprwmg2ow3dx.jpg',1),
    ('Gambela','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184011/my_upload/lmrsjenxc90esgthrq9i.jpg',1),
    ('Harari','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184088/my_upload/vidt33nqq67ceukzi1cs.jpg',1),
    ('Oromiya','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184161/my_upload/nrcx11xrqna48f9nvbpy.jpg',1),
    ('Sidama','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184222/my_upload/ktradeei0ewf1ycrmejd.jpg',1),
    ('Somali','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184260/my_upload/yahy60rzrejtqo4jb52s.jpg',1),
    ('SNNPR','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184286/my_upload/mk0rcuelmsdeietotmsb.jpg',1),
    ('Tigray','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184332/my_upload/r5aha0tyaelkzfezejp3.jpg',1),
    ('South West Ethopian Region','https://res.cloudinary.com/df7hlpjcj/image/upload/v1675184378/my_upload/iiyontxqztoiq7i7kbq2.png',1)
RETURNING *;

INSERT INTO 
    "ClinicList" ("ClinicName","Description","CreatedBy","IsActive")
VALUES
    ('Cardiac','Cardiac Description',5,true),
    ('Central Triage','Central Triage',3,true),
    ('Chest','Chest Description',5,true),
    ('Dermatology','Dermatology Description',6,true),
    ('Diabetic', 'Diabetic Description',5,true),
    ('ENT','ENT Description',6,true),
    ('General Surgery','General Surgery Description',6,true),
    ('GI','GI Description',6,true),
    ('Gynecology','Gynecology Description',6,true),
    ('Hematology','Hematology Description',3,true),
    ('Maxillofacial','Maxillofacial Description',5,true),
    ('Minor OR','Minor OR Description',3,true),
    ('Neurology','Neurology Description',5,true),
    ('Neurosurgery','Neurosurgery Description',6,true),
    ('Orthopaedics','Orthopaedics Description',3,true),
    ('Physiotherapy','Physiotherapy Description',6,true),
    ('Psychiatry','Psychiatry Description',5,true),
    ('Renal','Renal Description',5,true),
    ('Rheumatology','Rheumatology Description',5,true),
    ('Staff Clinic','Staff Clinic Description',5,true)
RETURNING *;


INSERT INTO 
    "Exhibition" ("title","description", "date", "type", "view" ,"Image", "user_id")
VALUES
    ('Ye tesfa kelmoch 5 at the national theatre','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '6054', 'Group' ,40,'{"https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670597/Portfolio/5678035577677_uvj6hw.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670596/Portfolio/5678034994066_wsfiim.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670596/Portfolio/5686446644765_o55ima.png"}',5),
    ('Ye tesfa kelmoch 6 at the national theatre','.', '6055', 'Group' ,50,'{"https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670589/Portfolio/5679393536675_brovgv.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670598/Portfolio/5684064940757_fac5j5.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670589/Portfolio/5684064996065_lfipfz.png"}',6),
    ('Ye tesfa kelmoch 3 at the national theatre','.','6055','Group' ,60,'{"https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670570/Portfolio/5679394565496_beiv67.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670566/Portfolio/5677856003880_wlb30g.png"}' ,5),
    ('World refugees day at Hyat Regency Hotel','.','6066','Group' ,60,'{"https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670570/Portfolio/5679394565496_beiv67.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670566/Portfolio/5677856003880_wlb30g.png"}' ,5),
    ('East African Art ans Culture at Entoto Art Gallery','.','6066','Group' ,60,'{"https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670570/Portfolio/5679394565496_beiv67.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670566/Portfolio/5677856003880_wlb30g.png"}' ,5),
    ('Idiomatic Expression at Hager Fiker Theatre ','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '6066-09-50', 'Solo', 30,'{"https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670565/Portfolio/5678035698536_tfqi06.png","https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670557/Portfolio/5678034906830_cniqik.png"}',6)
RETURNING *;


INSERT INTO 
    "SelectedWorks" ("title","description", "exhibitions", "Image", "view", "user_id")
VALUES
    ('Idiomatic expression','Size 65cm ×36cm Acrylic on paper', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670570/Portfolio/5679394565496_beiv67.png',5),
    ('Idiomatic expression','Size 40cm Square Acrylic on canvas', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670557/Portfolio/5678034906830_cniqik.png',6)
RETURNING *;




INSERT INTO 
    "Exhibition" ("title","place", "date", "type", "view" ,"Image", "user_id")
VALUES
    ('Ye tesfa kelmoch 5','national theatre', '6054', 'Group' ,40,'',5),
    ('Ye tesfa kelmoch 6','national theatre', '6055', 'Group' ,50,'',6),
    ('Ye tesfa kelmoch 3','national theatre','6055','Group' ,60,'' ,5),
    ('World refugees day',' Hyat Regency Hotel','6066','Group' ,60,'' ,5),
    ('East African Art and Culture','Entoto Art Gallery','6066','Group' ,60,'',5),
    ('Idiomatic Expression ','Hager Fiker Theatre', '6066', 'Solo', 30,'',6)
RETURNING *;

INSERT INTO 
    "news" ("title","description", "link" ,"Image", "user_id")
VALUES
    ('Idiomatic expression','Hager Fikir Theatre is hosting a four-day art exhibition titled idiomatic expression by Helen Zeray, starting from July 6 to July 6, 6066.', 'https://www.thereporterethiopia.com/64673/','https://res.cloudinary.com/df7hlpjcj/image/upload/f_auto,q_auto/v5/Portfolio/fzqga0fbtyephp6xb6qp',5),
    ('Idiomatic expression','Hager Fikir Theatre is hosting a four-day art exhibition titled idiomatic expression by Helen Zeray, starting from July 6 to July 6, 6066.', 'https://www.p6b-ethiopia.com/archives/event/idomatic-expression/','',6)
RETURNING *;

INSERT INTO 
    "SelectedWorks" ("title","description", "exhibitions", "Image", "view", "user_id")
VALUES
    ('Idiomatic expression 06','Size 30cm square Acrylic on canvas', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270570/Portfolio/1679394165496_beiv27.png',60,5),
    ('entry || ','Size 30cm square Acrylic on canvas', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270557/Portfolio/1678034902830_cniqik.png',40,6),
    ('Winter 06','Size 60cm × 60cm Acrylic on canvas', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270589/Portfolio/1679393536675_brovgv.png',50,5),
    ('Idiomatic expression','Size 65cm ×36cm Acrylic on paper', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670570/Portfolio/5679394565496_beiv67.png',40,5),
    ('Idiomatic expression','Size 40cm Square Acrylic on canvas', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670557/Portfolio/5678034906830_cniqik.png',40,6),
    ('Idiomatic expression 05','Size 65cm × 36cm Acrylic on paper', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670589/Portfolio/5679393536675_brovgv.png',40,5),
    ('Winter 05','Size 60cm×60cm Acrylic on canvas', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5687670597/Portfolio/5678035577677_uvj6hw.png',40,5),
    ('Idiomatic expression','Acrylic on canvas 60cm ×60cm', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5688769633/my_upload/sshvlyc0qeruogjuhwas.png',60,5),
    ('Idiomatic expression','Acrylic on canvas 30cm ×30cm', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5688769854/my_upload/ttoubwpmrzvmqv5rmrzy.png',40,6),
    ('Idiomatic expression','Acrylic on canvas 30cm ×30cm', '', 'https://res.cloudinary.com/df7hlpjcj/image/upload/v5688769939/my_upload/jqcn5l8h7mluzdueoxm3.png',50,5)
RETURNING *;



const SelectedWorks = [
    {
        "id":1,
        "title":'Idiomatic expression',
        "description":'Size 25cm ×32cm Acrylic on paper',
        "Image":'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270570/Portfolio/1679394165496_beiv27.png'
    },
    {
        "id":2,
        "title":'entry || ',
        "description":'Size 30cm square Acrylic on canvas',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270561/Portfolio/1678035298532_tfqi02.png'
    },
    {
        "id":3,
        "title":'Winter 01',
        "description":'Size 20cm × 20cm Acrylic on canvas',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270597/Portfolio/1678035177677_uvj2hw.png'
    },
    {
        "id":4,
        "title":'Idiomatic expression',
        "description":'Size 25cm × 32cm Acrylic on paper',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270589/Portfolio/1679393536675_brovgv.png'
    },
    {
        "id":5,
        "title":'Idiomatic expression',
        "description":'Size 30cm square Acrylic on canvas',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270596/Portfolio/1682442244761_o11ima.png'
    },
    {
        "id":6,
        "title":'Idiomatic expression',
        "description":'Size 40cm Square Acrylic on canvas',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270557/Portfolio/1678034902830_cniqik.png'
    },
    {
        "id":7,
        "title":'Winter 02',
        "description":'Size 20cm×20cm Acrylic on canvas',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270596/Portfolio/1678034994062_wsfiim.png'
    },
    {
        "id":8,
        "title":'Idiomatic expression',
        "description":'Acrylic on canvas 20cm ×20cm',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270562/Portfolio/1677856003880_wlb30g.png'
    },
    {
        "id":9,
        "title":'Idiomatic expression',
        "description":'Acrylic on canvas 30cm ×30cm',
        "Image": 'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270589/Portfolio/1684064996025_lfipfz.png'
    },
    {
        "id":10,
        "title":'Idiomatic expression',
        "description":'Acrylic on canvas 30cm ×30cm',
        "Image":'https://res.cloudinary.com/df7hlpjcj/image/upload/v1687270598/Portfolio/1684064940757_fac5j1.png'
    },
]

const news = [
    {
        "title":'Idiomatic expression',
        "description":'Hager Fikir Theatre is hosting a four-day art exhibition titled idiomatic expression by Helen Zeray, starting from July 6 to July 6, 6066.',
        "link":'https://www.thereporterethiopia.com/64673/',
        "Image"'https://res.cloudinary.com/df7hlpjcj/image/upload/f_auto,q_auto/v5/Portfolio/fzqga0fbtyephp6xb6qp'

    },
    {
        "title":'Idiomatic expression',
        "description":'Hager Fikir Theatre is hosting a four-day art exhibition titled idiomatic expression by Helen Zeray, starting from July 6 to July 6, 6066.',
        "link":'https://www.p6b-ethiopia.com/archives/event/idomatic-expression/',
        "Image":"",

    },
]

const Exhibition = [
    {
        "title":'Ye tesfa kelmoch 5',
        "place":'national theatre', 
        "date":'2014', 
        "type":'Group'
    },
    {
        "title":'Ye tesfa kelmoch 6',
        "place":'national theatre', 
        "date":'2015', 
        "type":'Group'
    },
    {
        "title":'Ye tesfa kelmoch 3',
        "place":'national theatre', 
        "date":'2015', 
        "type":'Group'
    },
    {
        "title":'World refugees day',
        "place":'Hyat Regency Hotel', 
        "date":'2022', 
        "type":'Group'
    },
    {
        "title":'East African Art and Culture',
        "place":'Entoto Art Gallery', 
        "date":'2022', 
        "type":'Group'
    },
    {
        "title":'Idiomatic Expression',
        "place":'Hager Fiker Theatre', 
        "date":'2022', 
        "type":'Solo'
    }
]