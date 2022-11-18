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
	AngilalCode integer not null primary key,
    AngilalNer varchar(45) null
);
create table AlbanTushaal
(
	AlbanTushaalCode varchar(2) not null primary key,
    AlbanTushaalNer varchar(25) null
);
create table Ajiltan
(
	AjiltanCode varchar(4) not null primary key,
    AjiltanOvogNer varchar(45) null,
    AjiltanHuis varchar(2) null,
    AjiltanUts varchar(25) null,
    AjiltanHayag varchar(45) null,
    AjiltanRegNo varchar(10) null,
    Ajiltan_nevtreh_ner varchar(30) null,
    Ajiltan_nuuts_ug varchar(65) null,
    AlbanTushaal_AlbanTushaalCode  varchar(2) not null,
    Angilal_AngilalCode integer not null,
    foreign key(AlbanTushaal_AlbanTushaalCode) references AlbanTushaal(AlbanTushaalCode),
    foreign key(Angilal_AngilalCode) references Ajiltanangilal(AngilalCode)
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


