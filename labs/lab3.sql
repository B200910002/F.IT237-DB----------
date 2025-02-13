show databases;
drop database lib;
create database lib
default character set utf8
collate utf8_general_ci;
use lib;
create table Zohiolch
(
	ZohiolchCode varchar(6) not null primary key,
    ZohiolchNer varchar(45) null
);
create table HotAimgiinLavlah
(
	HotAimgiinCode varchar(2) not null primary key,
    HotAimgiinNer varchar(45) null
);
create table DuuregSumiinLavlah
(
	DuuregSumiinCode varchar(3) not null primary key,
    DuuregSumiinNer varchar(45) null,
    HotAimgiinLavlah_HotAimgiinCode varchar(2) not null,
    foreign key(HotAimgiinLavlah_HotAimgiinCode) references HotAimgiinLavlah(HotAimgiinCode)
);
create table HorooLavlah
(
	HorooCode integer not null primary key,
    HorooNer varchar(45) null,
    DuuregSumiinLavlah_DuuregSumiinCode varchar(3) not null,
    foreign key(DuuregSumiinLavlah_DuuregSumiinCode) references DuuregSumiinLavlah(DuuregSumiinCode)
);

create table Zahialagch
(
	ZahialagchID integer not null primary key,
    ZahialagchNer varchar(45) null,
    ZahialagchHuis tinyint null,
    ZahialagchRegister varchar(10) null,
    ZahialagchUtas varchar(15) null,
    ZahialagchBairGudamjToot varchar(45) null,
    ZahialagchNemeltMedeelel varchar(45) null,
    HorooLavlah_HorooCode integer not null,
    foreign key(HorooLavlah_HorooCode) references HorooLavlah(HorooCode)
);
create table Zahialga
(
	ZahialgaNo integer not null primary key,
    ZahialgaOgnoo date null,
    ZahialgaTulbur decimal(13,2),
    ZahialgaTuluv varchar(45),
    Zahialagch_ZahialagchID integer not null,
    foreign key(Zahialagch_ZahialagchID) references Zahialagch(ZahialagchID)
);
create table TulburTulult
(
	TulburHuudasNo integer not null primary key,
	TulburHemjee decimal(13,2) null,
    TulburHelber varchar(45) null,
    TulburTulsunOgnoo date null,
    Zahialga_ZahialgaNo integer not null,
    foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo)
);
create table Ajiltanangilal
(
	AngilalCode integer not null,
    AngilalNer varchar(45) null
);
create table AlbanTushaal
(
	AlbanTushaalCode varchar(2) not null,
    AlbanTushaalNer varchar(25) null
);
create table Ajiltan
(
	AjiltanCode varchar(4) not null ,
    AjiltanOvogNer varchar(45) null,
    AjiltanHuis varchar(2) null,
    AjiltanUts varchar(25) null,
    AjiltanHayag varchar(45) null,
    AjiltanRegNo varchar(10) null,
    Ajiltan_nevtreh_ner varchar(30) null,
    Ajiltan_nuuts_ug varchar(65) null,
    AlbanTushaal_AlbanTushaalCode  varchar(2) not null,
    Angilal_AngilalCode integer not null,
    primary key(AjiltanCode)
);
create table Hurgelt
(
	HurgeltNo integer not null primary key,
    HurgeltHurgesenOgnoo date null,
    Ajiltan_AjiltanCode varchar(4) not null,
    Zahialga_ZahialgaNo integer not null,
    foreign key(Ajiltan_AjiltanCode) references Ajiltan(AjiltanCode),
    foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo)
);
create table NomiinAngilal
(
	NomAngilalCode varchar(2) not null primary key,
    NomAngilalNer varchar(45) null
);
create table DedAngilal
(
	DedAngilalCode varchar(2) not null primary key,
    DedAngilalNer varchar(45) null,
    NomiinAngilal_NomAngilalCode varchar(2) not null,
    foreign key(NomiinAngilal_NomAngilalCode) references NomiinAngilal(NomAngilalCode)
);
create table HavtasniiHelberLavlah
(
	HavtasHelberCode varchar(1) not null primary key,
    HavtasHelberNer varchar(10) null
); 
create table HevlelGazriinLavlah
(
	HevlelGazarCode varchar(4) not null primary key,
    HevlelGazarNer varchar(45) null,
    HevlelGazarHayag varchar(45) null
);
create table HelniiLavlah
(
	HelCode varchar(3) not null primary key,
    HelNer varchar(20) null
);
create table nasnii_angilal
(
	Nasnii_angilalCode integer not null primary key,
    Nasnii_angilal_ner varchar(20) null
);
create table Nom_lavlah
(
	NomCode varchar(20) not null primary key,
    NomNer varchar(45) null,
    HevlegdsenOn date null,
    HuudasToo integer null,
    Une decimal(13, 2) null,
    ISBN varchar(20) null,
    HevleliinGazariinLavlah_HevleliinGazariinCode varchar(4) not null,
    HelniiLavlah_HelCode varchar(3) not null,
    HavtasniiHelberLavlah_HavtasHelberCode varchar(1) not null,
    DedAngilal_DedAngilalCode varchar(2) not null,
    nasnii_angilal_Nasnii_angilalCode integer not null,
    foreign key(HevleliinGazariinLavlah_HevleliinGazariinCode) references HevlelGazriinLavlah(HevlelGazarCode),
    foreign key(HelniiLavlah_HelCode) references HelniiLavlah(HelCode),
    foreign key(HavtasniiHelberLavlah_HavtasHelberCode) references HavtasniiHelberLavlah(HavtasHelberCode),
    foreign key(DedAngilal_DedAngilalCode) references DedAngilal(DedAngilalCode),
    foreign key(nasnii_angilal_Nasnii_angilalCode) references nasnii_angilal(Nasnii_angilalCode)
);
create table Nom
(
	NomDansNo integer not null primary key,
    NomDans varchar(45) null,
    Ognoo date null,
    Nom_lavlah_NomCode varchar(20) not null,
    foreign key(Nom_lavlah_NomCode) references Nom_lavlah(NomCode)
);
create table ZahialgiinDelgerengui
(
	ZahialgiinDelegrenguiID integer not null primary key,
    Zahialga_ZahialgaNo integer not null,
    Nom_NomDansNo integer not null,
    foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo),
    foreign key(Nom_NomDansNo) references Nom(NomDansNo)
);
create table ShaltgaanLavlah
(
	ShaltgaanCode varchar(1) not null primary key,
    ShaltgaanTailbar varchar(45) null
);
create table butsaalt
(
	ButsaaltDugaar integer not null primary key,
    ButsaasanOgnoo date null,
    ShaltgaanLavlah_ShaltgaanCode varchar(1) not null,
    Zahialga_ZahialgaNo integer not null,
    foreign key(ShaltgaanLavlah_ShaltgaanCode) references ShaltgaanLavlah(ShaltgaanCode),
    foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo)
);
create table Zohiolchid
(
	Zohiolchid integer not null primary key,
    Nom_lavlah_NomCode varchar(20) not null,
    Zohiolch_ZohiolchCode varchar(6) not null,
    foreign key(Nom_lavlah_NomCode) references Nom_lavlah(NomCode),
    foreign key(Zohiolch_ZohiolchCode) references Zohiolch(ZohiolchCode)
);

-- lab3  
use lib;

select * from ajiltanangilal;
select * from albantushaal;
select * from ajiltan;

-- Багана нэмэх, засах, устгах 
alter table ajiltanangilal add column nemeltbagana varchar(1) null;
alter table ajiltanangilal modify column nemeltbagana int;
alter table ajiltanangilal drop column nemeltbagana;
desc ajiltanangilal;

alter table albantushaal add column nemeltbagana date null;
alter table albantushaal modify column nemeltbagana varchar(1);
alter table albantushaal drop column nemeltbagana;
desc albantushaal;

alter table ajiltan add column nas varchar(2) null;
alter table ajiltan modify column nas int;
alter table ajiltan drop column nas;
desc ajiltan;

-- Хязгаалалт, нэмэх, засах, устгах
alter table ajiltanangilal alter angilalner set default 'no angilal';
desc ajiltanangilal;
alter table albantushaal alter albantushaalner set default 'no alban tushaal';
desc albantushaal;
alter table ajiltan alter ajiltanovogner set default 'no ovog ner';
desc ajiltan;
alter table ajiltan alter ajiltanuts set default 'no utas';
alter table ajiltan alter ajiltanhayag set default 'no hayag';
alter table ajiltan alter ajiltanregno set default 'no register no';
alter table ajiltan alter ajiltan_nevtreh_ner set default 'no username';
alter table ajiltan alter ajiltan_nuuts_ug set default 'no password';

alter table ajiltanangilal add constraint angilalcheck check (angilalner <> '%no%');
alter table ajiltanangilal drop constraint angilalcheck;
select * from information_schema.table_constraints where Table_name = 'ajiltanangilal';

alter table albantushaal add constraint albantushaalcheck check (albantushaalner <> '%no%');
alter table albantushaal drop constraint albantushaalcheck;
select * from information_schema.table_constraints where Table_name = 'albantushaal';
-- alter table ajiltan add constraint checkusername check (ajiltan_nevtreh_ner like '[a-z]');
-- alter table ajiltan drop constraint checkusername;
-- alter table ajiltan add constraint checkpassword check (ajiltan_nuuts_ug like '[1-9]');
-- alter table ajiltan drop constraint checkpassword;

alter table ajiltanangilal add constraint PK_angilal primary key(angilalcode);
alter table ajiltanangilal drop constraint PK_angilal;
select * from information_schema.table_constraints where Table_name = 'ajiltanangilal';

alter table albantushaal add constraint PK_albantushaal primary key(albantushaalcode);
alter table albantushaal drop constraint PK_albantushaal;
select * from information_schema.table_constraints where Table_name = 'albantushaal';

alter table ajiltan add constraint FK_ajiltantushaal foreign key(albantushaal_albantushaalcode) references albantushaal(albantushaalcode);
alter table ajiltan drop constraint FK_ajiltantushaal;

select * from information_schema.table_constraints where Table_name = 'ajiltan';
alter table ajiltan add constraint FK_ajiltanalban foreign key(angilal_angilalcode) references ajiltanangilal(angilalcode);
alter table ajiltan drop constraint FK_ajiltanalban;

alter table ajiltan add constraint UN_ajiltanRegist unique key(ajiltanregno);
alter table ajiltan drop constraint UN_ajiltanRegist;
alter table ajiltan add constraint UN_ajiltanUsername unique key(ajiltan_nevtreh_ner);
alter table ajiltan drop constraint UN_ajiltanUsername;
alter table ajiltan add constraint UN_ajiltanNumber unique key(ajiltanuts);
alter table ajiltan drop constraint UN_ajiltanNumber;

select * from information_schema.table_constraints where Table_name = 'ajiltanangilal';
select * from information_schema.table_constraints where Table_name = 'albantushaal';
select * from information_schema.table_constraints where Table_name = 'ajiltan';

-- insert hiih 
insert into hotaimgiinlavlah values
	('УБ', 'Улаанбаатар'),
	('ӨМ', 'Өмнөговь'),
	('ДА', 'Дархан-Уул'),
	('СЭ', 'Сэлэнгэ'),
	('ОР', 'Орхон'),
	('ДО', 'Дорнод'),
	('ХӨ', 'Хөвсгөл'),
	('ТӨ', 'Төв'),
	('ӨВ', 'Өвөрхангай'),
	('АР', 'Архангай');
insert into duuregsumiinlavlah values
	('БЗД','Баянзүрх','УБ'),
	('ДЗС','Даланзадгад','ӨМ'),
	('ДАС','Дархан','ДА'),
	('СБС','Сүхбаатар','СЭ'),
	('ЭРС','Эрдэнэт','ОР'),
	('ЧБС','Чойбалсан','ДО'),
	('МӨС','Мөрөн','ХӨ'),
	('ЗМС','Зуунмод','ТӨ'),
	('АРС','Арвайхээр','ӨВ'),
	('ЦЭС','Цэцэрлэг','АР');
insert into horoolavlah values
	(1,'1-р хороо','БЗД'),
	(2,'7-р баг','ДЗС'),
	(3,'6-р баг','ДАС'),
	(4,'5-р баг','СБС'),
	(5,'4-р баг','ЭРС'),
	(6,'3-р баг','ЧБС'),
	(7,'2-р баг','МӨС'),
	(8,'1-р баг','ЗМС'),
	(9,'8-р баг','АРС'),
	(10,'9-р баг','ЦЭС');
insert into zahialagch values
	(1,'Jamts Budee', 1,'кю02252911','95512911','8-байр 1-р орц  3н тоот','',1),
	(2,'Ulziimaa BatBaatar', 0,'мз03222639','85799958','13-байр 2-р орц 32н тоот','',4),
	(3,'Temuujin Munkhjargal', 1,'нк02301311','80993686','19-байр 1-р орц 3н тоот','',6),
	(4,'Munkh-Ochir Ganbold', 1,'йю01270910','99607331','33-байр 2-р орц 3н тоот','',9),
	(5,'Munkh-erdene Enkhbold', 1,'та02282318','95341613','54-байр 1-р орц 3н тоот','',5),
	(6,'Bat-Amgalan Batbold', 1,'фд01310130','89126680','72-байр 2-р орц 3н тоот','',3),
	(7,'Unenkhuu Batsukh', 1,'йю02271412','95667761','1-байр 2-р орц 3н тоот','',2),
	(8,'Maralmaa Gansukh', 0,'мз02222639','99965711','31-байр 2-р орц 3н тоот','',7),
	(9,'Angarag-Erdene', 1,'фд02310131','94066000','47-байр 1-р орц 3н тоот','',8),
	(10,'Suvd Chimed-Ochir', 0,'мз01723634','99868926','15-байр 2-р орц 3н тоот','',10);
insert into zahialga values
	(1,'2020-03-13', 50000, 'дууссан', 10),
	(2,'2020-09-14', 50000, 'цуцлагдсан', 9),
	(3,'2020-10-15', 50000, 'дууссан', 8),
	(4,'2020-11-16', 50000, 'дууссан', 7),
	(5,'2020-01-17', 50000, 'дууссан', 6),
	(6,'2020-06-18', 50000, 'дууссан', 5),
	(7,'2020-05-19', 50000, 'цуцлагдсан', 4),
	(8,'2022-10-06', 50000, 'хүлээгдэж байна', 3),
	(9,'2022-03-05', 50000, 'дууссан', 2),
	(10,'2023-02-09', 50000, 'дууссан', 1);
insert into nasnii_angilal values
	(1,'0-5 насныхан'),
	(2,'5-8 насныхан'),
	(3,'8-12 насныхан'),
	(4,'12-15 насныхан'),
	(5,'15-18 насныхан'),
	(6,'18-22 насныхан'),
	(7,'22-25 насныхан'),
	(8,'25-35 насныхан'),
    (9,'35-50 насныхан'),
	(10,'50 дээш насныхан');
insert into helniilavlah values
	('MON','mongolia'),
	('ENG','english'),
	('JPN','japanese'),
	('ZHO','chinese'),
	('RUS','russian'),
	('GER','german'),
	('KOR','korean'),
	('NOR','norwegian'),
	('ITA','italian'),
	('LAT','latin');
insert into havtasniihelberlavlah values
	('t','tiny'),
	('s','small'),
	('n','normal'),
	('m','medium'),
    ('b','big'),
	('l','large'),
	('h','huge'),
	('g','giant');
alter table hevlelgazriinlavlah modify column HevlelGazarHayag varchar(200); 
insert into hevlelgazriinlavlah values
	('a001','ВМВ publishing','russia'),
	('a002','Цахим ном','Монгол улс, Улаанбаатар, Чингэлтэй дүүрэг. 4-р Хороо, Бага тойруу 18-1'),
	('a003','НЭПКО ХХК','Монгол улс, Улаанбаатар хот, Сүхбаатар дүүрэг, 1-р хороо, Чингисийн өргөн чөлөө-24, Парк Плэйс оффисын 13 давхар'),
	('a004','Монсудар хэвлэлийн газар','Монгол улс, Улаанбаатар хот, Сүхбаатар дүүрэг, Амарын гудамж-2, Адмон компанийн байр'),
	('a005','Соёмбо принтинг','Монгол улс, Улаанбаатар хот, Баянгол дүүрэг, 22-р хороо, Өргөөгийн гудамж-38'),
	('a006','Admon','Монгол улс, Улаанбаатар хот, Сүхбаатар дүүрэг, Амарын гудамж-2, Адмон компанийн байр'),
	('a007','Мөнхийн үсэг','Монгол улс, Улаанбаатар хот , Сүхбаатар дүүрэг , Тээвэрчдийн гудамж -27, Аз Хур ХХК байр, 2-р давхарт'),
	('a008','bestseller','Монгол улс, Улаанбаатар, Хан-уул дүүрэг, Zaisan Hill Complex, 7-р давхарт'),
	('a009','EM publishing','PO Box 123, Clunton, CRAVEN ARMS, SY7 7BP, UNITED KINGDOM'),
	('a010','Хөх Монгол Принтинг','Монгол улс, Баянгол дүүрэг, 1-р хороо, Замчны гудамж-39, Газар бизнес төв,Б корпус');
insert into nomiinangilal values
	('b0', 'Сурах бичиг'),
	('b1', 'Зохиол'),
	('b2', 'Сэтгүүл'),
	('b3', 'Тууж'),
	('b4', 'Түүх'),
	('b5', 'Төсөл'),
	('b6', 'Манга'),
	('b7', 'Шинжлэх ухаан'),
	('b8', 'Үлгэр'),
	('b9', 'Хүүхдын'); 
insert into dedangilal values
	('a0','Монгол хэл','b0'),
	('a1','Утга зохиол','b1'),
	('a2','Мэдээ','b2'),
	('a3','Монгол','b3'),
	('a4','Дундад зууны','b4'),
	('a5','Диплом','b5'),
	('a6','Япон','b6'),
	('a7','Квант физик','b7'),
	('a8','Монгол ардын','b8'),
	('a9','Сургамжит','b9');
insert into nom_lavlah values
	('20149789996242656','Норвегийн ой','2014-01-01',270,25000,'9789996242656','a003','MON','m','a1',6),
	('20139789996242212','100 жилийн ганцаардал','2013-08-01',527,50000,'9789996242212','a004','MON','h','a1',8),
	('20119789992948','Оройгүй сүм','2011-01-01',336,65000,'9789992948','a005','MON','s','a1',9),
	('20199789919225650','Цойлогсод','2019-11-01',187,15000,'9789919225650','a009','MON','n','a2',7),
	('20089789992904801','Ногоон нүдэн лам','2008-01-01',544,19900,'9789992904801','a006','MON','t','a1',10),
	('20129996214923','Үзэхийн хязгаар','2012-01-01',310 ,21000,'9996214923','a007','MON','l','a1',5),
	('20169789997309','Манго жимстэй цай','2016-01-01',216,37000,'9789997309','a008','MON','g','a1',7),
	('20179789997376498','Цэцгэн титэм','2017-01-01',248,17000,'9789997376498','a010','MON','n','a1',8),
	('20139789996223846','Монголын нууц товчоо','2013-01-01',278,32000,'9789996223846','a002','MON','n','a4',7),
	('20179781591844563','Харизм','2017-01-01',272,69900,'9781591844563','a001','MON','m','a7',7);
insert into zohiolch values
	('au0001', 'Haruki Murakami'),
	('au0002', 'Габриель Гарсиа Маркес'),
	('au0003', 'Лондон Түдэв'),
	('au0004', 'Д.Бүжинлхам'),
	('au0005', 'Оюунгэрэл Цэдэвдамба'),
	('au0006', 'А.Пүрэвмаа'),
	('au0007', 'Yu Hua'),
	('au0008', 'Цэндийн Дамдинсүрэн'),
	('au0009', 'Л.ӨлзийТөгс'),
	('au0010', 'Olivia Fox Cabane');
insert into zohiolchid values
	(1,'20149789996242656','au0001'),
	(2,'20139789996242212','au0002'),
	(3,'20119789992948','au0003'),
	(4,'20199789919225650','au0004'),
	(5,'20089789992904801','au0005'),
	(6,'20129996214923','au0009'),
	(7,'20169789997309','au0006'),
	(8,'20179789997376498','au0006'),
	(9,'20139789996223846','au0008'),
	(10,'20179781591844563','au0010');
insert into nom values
	(1,'1105366060','2013-03-13','20149789996242656'),
	(2,'1105366051','2020-09-14','20139789996242212'),
	(3,'1105366052','2020-10-15','20119789992948'),
	(4,'1105366053','2020-11-16','20199789919225650'),
	(5,'1105366054','2020-01-17','20089789992904801'),
	(6,'1105366055','2020-06-18','20129996214923'),
	(7,'1105366056','2020-05-19','20169789997309'),
	(8,'1105366057','2022-10-06','20179789997376498'),
	(9,'1105366058','2022-03-05','20139789996223846'),
	(10,'1105366059','2023-02-09','20179781591844563');
insert into zahialgiindelgerengui values
	(1,1,1),
	(2,2,2),
	(3,3,3),
	(4,4,4),
	(5,5,5),
	(6,6,6),
	(7,7,7),
	(8,8,8),
	(9,9,9),
	(10,10,10);
insert into shaltgaanlavlah values
	('a', 'tulbur tulugduugui'),
	('b', 'buruu nom zahialsan'),
	('c', 'tsutsalsan'),
	('d', ''),
	('e', ''),
	('f', ''),
	('g', ''),
	('h', ''),
	('i', ''),
	('j', '');
insert into butsaalt values
	(1,'2020-01-01','a',1),
	(2,'2020-01-01','b',2),
	(3,'2020-01-01','a',3),
	(4,'2020-01-01','c',4),
	(5,'2020-01-01','a',5),
	(6,'2020-01-01','b',6),
	(7,'2020-01-01','c',7),
	(8,'2020-01-01','a',8),
	(9,'2020-01-01','b',9),
	(10,'2020-01-01','c',10);
insert into albantushaal values
	('a1','Захирал'),
	('a2','нягтлан'),
    ('a3','худалдагч'),
    ('a4','тайлбарлагч');
insert into ajiltanangilal values
	(1,'admin'),
	(2,'модератор'),
	(3,'оператор');
insert into ajiltan values
	('em01','Sukh Ganbaatar','M','55629142','УБ-БЗД 2-р хороо 12-р байр 1-н тоот','кд89261545','atoLACKb','55629142','a3',3),
	('em02','Tsolmon Sukhbataar','M','92031762','УБ-СХД 2-р хороо 13-р байр 11-н тоот','дл45396928','edoldEWl','92031762','a3',3),
	('em03','Maral Bayarmaa','FM','50472540','УБ-БГД 2-р хороо 15-р байр 21-н тоот','йю90830457','ulamPHeR','50472540','a1',1),
	('em04','Ganzorig Bolormaa','FM','93320402','УБ-ЧГД 2-р хороо 14-р байр 20-н тоот','йю78240384','uousHomp','93320402','a3',3),
	('em05','Delger Ganbold','M','83176552','УБ-ХУД 2-р хороо 16-р байр 41-н тоот','йю52887814','ghtMAcsn','83176552','a3',1),
	('em06','Esugen Bat','M','92014388','УБ-БЗД 2-р хороо 17-р байр 51-н тоот','йю74253568','OloRdWol','92014388','a1',1),
	('em07','Khulan Xangai','M','55922210','УБ-СХД 2-р хороо 18-р байр 4-н тоот','йю28486859','hErcUSen','55922210','a1',1),
	('em08','Enkhjargal Erdenechimeg','FM','89906260','УБ-БГД 2-р хороо 19-р байр 3-н тоот','йю85495264','ENtIbLeR','89906260','a1',1),
	('em09','Dulguun Altantsetseg','FM','92064779','УБ-ЧГД 2-р хороо 20-р байр 12-н тоот','йю29844973','teLaSUPL','92064779','a1',1),
	('em10','Gansukh Chuluun','M','55941304','УБ-ХУД 2-р хороо 40-р байр 31-н тоот','йю39039253','ITigHtne','55941304','a1',1);
insert into hurgelt values
	(1,'2020-03-14','em01',1),
	(2,'2020-09-15','em02',2),
	(3,'2020-10-16','em03',3),
	(4,'2020-11-17','em04',4),
	(5,'2020-01-18','em05',5),
	(6,'2020-06-19','em06',6),
	(7,'2020-05-20','em07',7),
	(8,'2022-10-06','em08',8),
	(9,'2022-03-06','em09',9),
	(10,'2023-02-10','em01',10);
insert into tulburtulult values
	(1,25000,'интернэт банк','2020-03-13',10),
	(2,50000,'интернэт банк','2020-09-14',9),
	(3,65000,'интернэт банк','2020-10-15',8),
	(4,15000,'интернэт банк','2020-11-16',7),
	(5,19900,'интернэт банк','2020-01-17',6),
	(6,21000,'интернэт банк','2020-06-18',5),
	(7,37000,'интернэт банк','2020-05-19',4),
	(8,17000,'интернэт банк','2022-10-06',3),
	(9,32000,'интернэт банк','2022-03-05',2),
	(10,69900,'карт','2023-02-09',1);