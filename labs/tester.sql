show databases;
drop database lab04;
CREATE DATABASE lab04;
USE lab04;
 
CREATE TABLE AJILTAN_TURUL
      (
      Ajiltan_turul_ID  INT NOT NULL,
      Ajiltan_turul_ner VARCHAR(45),
      Ajiltan_ID        VARCHAR(4),
	  PRIMARY KEY (Ajiltan_turul_ID)
      );
CREATE TABLE UNIIN_TURUL
      (
      Uniin_turul_ID VARCHAR(4),
      Uniin_turul    VARCHAR(45),
      PRIMARY KEY (Uniin_turul_ID)
      );
CREATE TABLE KINO_TURUL
      (
      Kino_turul_ID  VARCHAR(4),
      Kino_turul_ner VARCHAR(45),
      Kino_ID        VARCHAR(4),
      PRIMARY KEY (Kino_turul_ID)
      );
CREATE TABLE BONUS_LAVLAH
      (
      Bonus_turul_ID  INT NOT NULL,
      Bonus_turul_ner VARCHAR(45),
      Bonus_huvi      INT NOT NULL,
      PRIMARY KEY (Bonus_turul_ID)
      ); 
CREATE TABLE TULBUR_HELBER_LAVLAH
      (
      Tulbur_helber_ID  INT NOT NULL,
      Tulbur_helber_ner VARCHAR(45),
      PRIMARY KEY (Tulbur_helber_ID)
      );
CREATE TABLE SALBAR 
      (
      Salbar_ID       INT,
      Salbar_ner      VARCHAR(45),
      Salbar_bairshil VARCHAR(45),
      Tanhim_ID       INT NOT NULL,
	  PRIMARY KEY (Salbar_ID)
      );     
CREATE TABLE JUJIGCHIN
      (
      Jujigchin_ID          VARCHAR(4),
	  Jujigchin_ner         VARCHAR(45),
      Jujigchin_delgerengui VARCHAR(255),
      Kino_has_jujigchin_ID INT NOT NULL,
      PRIMARY KEY (Jujigchin_ID)
      );
CREATE TABLE NASNII_ANGILAL
      (
      Nasnii_angilal_ID  INT NOT NULL,
      Nasnii_angilal_ner VARCHAR(45),
      PRIMARY KEY (Nasnii_angilal_ID)
      );
CREATE TABLE TANHIM
      (
      Tanhim_ID        INT,
      Tanhim_ner       VARCHAR(45),
      Salbar_ID        INT,
      Suudal_ID        INT NOT NULL,
      PRIMARY KEY (Tanhim_ID),
      FOREIGN KEY (Salbar_ID) REFERENCES SALBAR(Salbar_ID)
      ); 
CREATE TABLE AJILTAN
      (
      Ajiltan_ID                     VARCHAR(4),
      Ajitlan_ner                    VARCHAR(45),
      Ajiltan_email                  VARCHAR(45),
      Ajiltan_utas_no                VARCHAR(25),
      Ajiltan_hayag                  VARCHAR(255),
      Ajiltan_login_name             VARCHAR(25),
      Ajiltan_login_password         VARCHAR(65),
      Ajiltan_turul_ID               INT NOT NULL,
      Zahialga_ID                    VARCHAR(4),
      PRIMARY KEY (Ajiltan_ID),
      FOREIGN KEY (Ajiltan_turul_ID) REFERENCES AJILTAN_TURUL(Ajiltan_turul_ID)
      ); 
CREATE TABLE SUUDAL
      (
      Suudal_ID        INT NOT NULL,
      Suudal_egneee    INT NOT NULL,
      Suudal_dugaar    VARCHAR(45),
      Tanhim_ID        INT NOT NULL,
      PRIMARY KEY (Suudal_ID),
      FOREIGN KEY (Tanhim_ID) REFERENCES TANHIM(Tanhim_ID)
      );
CREATE TABLE KINO
      (
      Kino_ID                  VARCHAR(4),
      Kino_ner                 VARCHAR(45),
      Kino_neelt_ognoo         DATE,
      Kino_zohiolch            VARCHAR(45),
      Kino_garah_helber        VARCHAR(45),
      Kino_urgeljleh_hugatsaa  INT NOT NULL,
      Kino_tailbar             VARCHAR(255),
      Kino_turul_ID            VARCHAR(4),
      PRIMARY KEY (Kino_ID),
      FOREIGN KEY (Kino_turul_ID) REFERENCES KINO_TURUL(Kino_turul_ID)
      );
CREATE TABLE KINO_HAS_JUJIGCHIN
      (
      Kino_has_jujigchin_ID   INT NOT NULL,
      Kino_ID                 VARCHAR(4),
      Jujigchin_ID            VARCHAR(4),
      PRIMARY KEY (Kino_has_jujigchin_ID),
      FOREIGN KEY (Kino_ID)      REFERENCES KINO(Kino_ID),
      FOREIGN KEY (Jujigchin_ID) REFERENCES JUJIGCHIN(Jujigchin_ID)
      );
CREATE TABLE TSAGIIN_HUWAARI
      (
      Tsagiin_huvaari_ID  INT NOT NULL,
      Garah_ognoo         DATE,
      Garah_tsag          DATETIME,
      Tanhim_ID           INT NOT NULL,
      Kino_ID             VARCHAR(4),
      PRIMARY KEY (Tsagiin_huvaari_ID),
      FOREIGN KEY (Tanhim_ID) REFERENCES TANHIM(Tanhim_ID),
      FOREIGN KEY (Kino_ID)   REFERENCES KINO(Kino_ID)
      );
CREATE TABLE UILCHLUULEGCH
      (
      Uilchluulegch_ID       INT NOT NULL,
      Uilchluulegch_name     VARCHAR(45),
      Uilchluulegch_email    VARCHAR(45),
      Uilchluulegch_password VARCHAR(64),
      Uilchluulegch_utas_no  VARCHAR(25),
      Uilchluulegch_address  VARCHAR(255),
      PRIMARY KEY (Uilchluulegch_ID)
      );
CREATE TABLE UILCHLUULEGCH_BA_KART
      (
      Uilchluulegch_kart_ID VARCHAR(45),
      Uilchluulegch_ID      INT NOT NULL,
      Bonus_turul_ID        INT NOT NULL,
      Guilgee_ID            INT NOT NULL,
      PRIMARY KEY(Uilchluulegch_kart_ID),
      FOREIGN KEY (Uilchluulegch_ID) REFERENCES UILCHLUULEGCH(Uilchluulegch_ID),
      FOREIGN KEY (Bonus_turul_ID)  REFERENCES BONUS_LAVLAH(Bonus_turul_ID)
      );
CREATE TABLE TARIF
      (
      Tarif_ID                         INT NOT NULL,
      Une                              DECIMAL(13.2),
      Nasnii_angilal_ID                INT NOT NULL,
      Uniin_turul_ID                   VARCHAR(4),
      Tanhim_ID                        INT NOT NULL,
      PRIMARY KEY (Tarif_ID),
      FOREIGN KEY (Nasnii_angilal_ID) REFERENCES NASNII_ANGILAL(Nasnii_angilal_ID),
      FOREIGN KEY (Uniin_turul_ID)    REFERENCES UNIIN_TURUL(Uniin_turul_ID),
      FOREIGN KEY (Tanhim_ID)         REFERENCES TANHIM(Tanhim_ID)
      );
CREATE TABLE ZAHIALGA
      (
      Zahialga_ID                        VARCHAR(4),
      Zahialga_ognoo                     DATE,
      Uilchluulegch_ID                   INT NOT NULL,
      Tsagiin_huVaari_ID                 INT NOT NULL,
      Ajiltan_ID                         VARCHAR(4),
      PRIMARY KEY (Zahialga_ID),
      FOREIGN KEY (Uilchluulegch_ID)   REFERENCES UILCHLUULEGCH(Uilchluulegch_ID),
      FOREIGN KEY (Tsagiin_huvaari_ID) REFERENCES TSAGIIN_HUWAARI(Tsagiin_huVaari_ID),
      FOREIGN KEY (Ajiltan_ID)         REFERENCES AJILTAN(Ajiltan_ID)
      ); 
CREATE TABLE TSUTSLALT 
      (
      Tsutslalt_ID         INT NOT NULL,
      Tsutsalsan_ognoo     DATE,
      Tsutsalsan_shaltgaan VARCHAR(45),
      Zahialga_ID          VARCHAR(4),
      PRIMARY KEY (Tsutslalt_ID),
      FOREIGN KEY (Zahialga_ID) REFERENCES ZAHIALGA(Zahialga_ID)
      );
CREATE TABLE TASALBAR
      (
      Tasalbar_ID                      INT NOT NULL,
      Zahialga_ID                      VARCHAR(4),
      Nasnii_angilal_ID                INT NOT NULL,
      Suudal_ID                        INT NOT NULL,
      PRIMARY KEY (Tasalbar_ID),
      FOREIGN KEY (Zahialga_ID)       REFERENCES ZAHIALGA(Zahialga_ID),
      FOREIGN KEY (Nasnii_angilal_ID) REFERENCES NASNII_ANGILAL(Nasnii_angilal_ID),
      FOREIGN KEY (Suudal_ID)         REFERENCES SUUDAL(Suudal_ID)
      );
CREATE TABLE KARTIIN_GUILGEE
      (
      Guilgee_ID       INT NOT NULL,
      Guilgee_turul    VARCHAR(45),
      Guilgee_hemjee   DECIMAL(13,2),
      Bonus_hemjee     DECIMAL(13,2),
      Zahialga_ID      VARCHAR(4),
      Uilchluulegch_ID INT NOT NULL,
      PRIMARY KEY (Guilgee_ID),
      FOREIGN KEY (Zahialga_ID)      REFERENCES ZAHIALGA(Zahialga_ID),
      FOREIGN KEY (Uilchluulegch_ID) REFERENCES UILCHLUULEGCH_BA_KART(Uilchluulegch_ID)
      );
CREATE TABLE TULBUR
	  (
      Tulbur_ID                   INT NOT NULL,
      Tulbut_hemjee               DECIMAL(13,2),
      Tulbur_tulsun_ognoo         DATE,
      Tulbur_helber_ID            INT NOT NULL,
      Zahialga_ID                 VARCHAR(4),
      PRIMARY KEY (Tulbur_ID),
      FOREIGN KEY (Tulbur_helber_ID) REFERENCES TULBUR_HELBER_LAVLAH(Tulbur_helber_ID),
      FOREIGN KEY (Zahialga_ID)      REFERENCES ZAHIALGA(Zahialga_ID)
      );
/*Uniin_turul_ID-VARCHAR, Kino_turul_ID-VARCHAR, Salbar_ID-VARCHAR, Jujigchin_ID-VARCHAR, Ajiltan_ID-VARCHAR, Kino_ID-VARCHAR, Zahialga_ID-VARCHAR */
INSERT INTO AJILTAN_TURUL VALUES 
      ("1", "ADMIN", "A01"),
      ("2", "MANAGER", "A02"),
      ("3", "OPERATOR", "A03"),
      ("4", "MANAGER", "A04"),
      ("5", "MANAGER", "A05"),
      ("6", "OPERATOR", "A06"),
      ("7", "OPERATOR", "A07"),
      ("8", "MANAGER", "A08"),
      ("9", "OPERATOR", "A09"),
      ("10", "MANAGER", "A10");
INSERT INTO UNIIN_TURUL VALUES
      ("V01", "VIP"),
      ("V02", "ENGIIN"),
      ("V03", "VIP"),
      ("V04", "ENGIIN"),
      ("V05", "VIP"),
	  ("V06", "VIP"),
      ("V07", "ENGIIN"),
      ("V08", "VIP"),
      ("V09", "ENGIIN"),
      ("V10", "VIP");
INSERT INTO KINO_TURUL VALUES
      ("T01", "ACTION", "K01"),
      ("T02", "DRAMA",  "K02"),
      ("T03", "HORROR", "K03"),
      ("T04", "COMEDY", "K04"),
      ("T05", "FANTASY","K05"),
      ("T06", "ACTION", "K06"),
      ("T07", "DRAMA", "K07"),
      ("T08", "HORROR", "K08"),
      ("T09", "COMEDY", "K09"),
      ("T10", "FANTASY", "K10");
INSERT INTO BONUS_LAVLAH VALUES
      ("1", "NEELTIIN", "10"),
      ("2", "TURSUN UDRIIN", "10"),
      ("3", "BAYRIIN", "10"),
      ("4", "NEELTIIN", "10"),
      ("5", "URAMSHUULALIIN", "10"),
	  ("6", "NEELTIIN", "10"),
      ("7", "TURSUN UDRIIN", "10"),
      ("8", "BAYRIIN", "10"),
      ("9", "NEELTIIN", "10"),
      ("10", "URAMSHUULALIIN", "10");
INSERT INTO TULBUR_HELBER_LAVLAH VALUES
      ("1", "BELNEER"),
	  ("2", "KARTAAR"),
	  ("3", "BELNEER"),
	  ("4", "KARTAAR"),
	  ("5", "SHILJUULNE"),
      ("6", "BELNEER"),
	  ("7", "KARTAAR"),
	  ("8", "BELNEER"),
	  ("9", "KARTAAR"),
	  ("10", "SHILJUULNE");
INSERT INTO  SALBAR VALUES
	  ("01", "URGOO1", "KHOROOLOL", "1"),
      ("02", "URGOO2", "IT PARK", "2"),
      ("03", "URGOO3", "SHANGRILLA", "3"),
      ("04", "URGOO4", "KHOROOLOL", "4"),
      ("05", "URGOO5", "IT PARK", "5"),
      ("06", "URGOO1", "KHOROOLOL", "6"),
      ("07", "URGOO2", "IT PARK", "7"),
      ("08", "URGOO3", "SHANGRILLA", "8" ),
      ("09", "URGOO4", "KHOROOLOL","9"),
      ("10", "URGOO5", "IT PARK","10");
INSERT INTO JUJIGCHIN VALUES
      ("J01", "TIM ROBBINS", "Nominated for 5 academy awards ", "1"),
      ("J02", "MARLON BRANDO", "Nominated for 5 academy awards", "2"),
      ("J03", "CHRISTIAN BALE", "Nominated for 5 academy awards", "3"),
      ("J04", "AL PACINO", "Nominated for 5 academy awards", "4"),
      ("J05", "HENRY FONDA", "Nominated for 5 academy awards", "5"),
	  ("J06", "LIAM NEESON", "Nominated for 5 academy awards ", "6"),
      ("J07", "ELIJAH WOOD", "Nominated for 5 academy awards", "7"),
      ("J08", "JOHN TRAVOLTA", "Nominated for 5 academy awards", "8"),
      ("J09", "ELIJAH WOOD", "Nominated for 5 academy awards", "9"),
      ("J10", "CLINT EASTWOOD", "Nominated for 5 academy awards", "10");
INSERT INTO NASNII_ANGILAL VALUES 
      ("1", "HUUHED"),
      ("2", "TOM HUN"),
      ("3", "HUUHED"),
      ("4", "TOM HUN"),
      ("5", "HUUHED"),
	  ("6", "HUUHED"),
      ("7", "TOM HUN"),
      ("8", "HUUHED"),
      ("9", "TOM HUN"),
      ("10", "HUUHED");
INSERT INTO TANHIM VALUES
      ("1", "TANHIM-1", "01", "1"),
      ("2", "TANHIM-2", "02", "2"),
      ("3", "TANHIM-3", "03", "3"),
      ("4", "TANHIM-4", "04", "4"),
      ("5", "TANHIM-5", "05", "5"),
	  ("6", "TANHIM-1", "06", "6"),
      ("7", "TANHIM-2", "07", "7"),
      ("8", "TANHIM-3", "08", "8"),
      ("9", "TANHIM-4", "09", "9"),
      ("10", "TANHIM-5","10", "10");
INSERT INTO AJILTAN VALUES
      ("A01", "TUSHIG", "tushig123@gmail.com", "99475271", "BZD", "TUSHIG123", "TUSHIG123", "1", "Z01"),
      ("A02", "JIJGE", "jijge123@gmail.com", "99475272", "SHD", "JIJGE123", "JIJGE123", "2", "Z02"),
      ("A03", "BALJAA", "baljaa123@gmail.com", "99475273", "CHD", "BALJAA123", "BALJAA123", "3", "Z03"),
      ("A04", "TENGIS", "tengis123@gmail.com", "99475274", "BZD", "TENGIS123", "TENGIS123", "4", "Z04"),
      ("A05", "USUKHUU", "usukhuu123@gmail.com", "99475275", "SHD", "USUKHUU123", "USUKHUU123", "5", "Z05"),
      ("A06", "HASUK", "hasuk123@gmail.com", "99475276", "CHD", "HASUK123", "HASUK123", "6", "Z06"),
      ("A07", "KHOSOO", "khosoo123@gmail.com", "99475277", "SHD", "KHOSOO123", "KHOSOO123", "7", "Z07"),
      ("A08", "TENGIS", "tengis123@gmail.com", "99475278", "CHD", "TENGIS123", "TENGIS123", "8", "Z08"),
      ("A09", "SODOO", "sodoo123@gmail.com", "99475279", "BZD", "SODOO123", "SODOO123", "9", "Z09"),
      ("A10", "BULGAA", "bulgaa123@gmail.com", "99475280", "SHD", "BULGAA123", "BULGAA123", "10", "Z10");
INSERT INTO SUUDAL VALUES
      ("1", "1", "1iin 1r suudal", "1"),
      ("2", "2", "2iin 2r suudal", "2"),
      ("3", "3", "3iin 3r suudal", "3"),
      ("4", "4", "4iin 4r suudal", "4"),
      ("5", "5", "5iin 5r suudal", "5"),
      ("6", "6", "1iin 1r suudal", "6"),
      ("7", "7", "2iin 2r suudal", "7"),
      ("8", "8", "3iin 3r suudal", "8"),
      ("9", "9", "4iin 4r suudal", "9"),
      ("10", "10", "5iin 5r suudal", "10");
INSERT INTO KINO VALUES
      ("K01", "THE SHAWSHANK REDEMPTION", "1994-9-11", "STEPHEN KING", "TEATR", "144", "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", "T01"),
	  ("K02", "THE GODFATHER", "1972-9-11", "MARIO PUZO", "TEATR", "175", "The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.", "T02"),
	  ("K03", "THE DARK KNIGHT", "2008-9-11", "JONATHAN NOLAN", "TEATR", "152", "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", "T03"),
	  ("K04", "THE GODFATHER 2", "1974-9-11", "FRANCIS FORD COPPOLA", "TEATR", "202", "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.", "T04"),
	  ("K05", "12 ANGRY MEN ", "1957-9-11", "REGINALD ROSE", "TEATR", "96", "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.", "T05"),
      ("K06", "SCHINDLER'S LIST", "1993-9-11", "THOMAS KENEALLY", "TEATR", "195", "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.", "T06"),
	  ("K07", "THE LORD OF THE RINGS ", "2003-9-11", "J.R.R TOLKIEN", "TEATR", "201", "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.", "T07"),
	  ("K08", "PULP FICTION", "1994-9-11", "JONATHAN NOLAN", "TEATR", "152", "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", "T08"),
	  ("K09", "THE LORD OF THE RINGS", "2001-9-11", "FRANCIS FORD COPPOLA", "TEATR", "202", "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.", "T09"),
	  ("K10", "THE GOOD THE BAD AND THE UGLY ", "1966-9-11", "REGINALD ROSE", "TEATR", "96", "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.", "T10");
INSERT INTO KINO_HAS_JUJIGCHIN VALUES
      ("1", "K01", "J01"),
      ("2", "K02", "J02"),
      ("3", "K03", "J03"),
      ("4", "K04", "J04"),
      ("5", "K05", "J05"),
      ("6", "K06", "J06"),
      ("7", "K07", "J07"),
      ("8", "K08", "J08"),
      ("9", "K09", "J09"),
      ("10","K10", "J10");
INSERT INTO TSAGIIN_HUWAARI VALUES
	  ("1", "2022-03-01", "2022-03-01 12:20:00", "1", "K01"),
      ("2", "2022-03-02", "2022-03-02 16:20:00", "2", "K02"),
      ("3", "2022-03-03", "2022-03-03 18:20:00", "3", "K03"),
      ("4", "2022-03-04", "2022-03-04 20:20:00", "4", "K04"),
      ("5", "2022-03-05", "2022-03-04 22:20:00", "5", "K05"),
      ("6", "2022-03-01", "2022-03-01 12:20:00", "6", "K06"),
      ("7", "2022-03-02", "2022-03-02 16:20:00", "7", "K07"),
      ("8", "2022-03-03", "2022-03-03 18:20:00", "8", "K08"),
      ("9", "2022-03-04", "2022-03-04 20:20:00", "9", "K09"),
      ("10", "2022-03-05","2022-03-04 22:20:00", "10","K10");
INSERT INTO UILCHLUULEGCH VALUES
      ("1", "SANCHIR", "sanchir123@gmail.com", "SANCHIR123", 80803101, "SHAWSHANK REDEMPTION"),
      ("2", "IDREE", "idree123@gmail.com", "IDREE123", 80803102, "GOT FATHER"),
      ("3", "TSOOMOO", "tsoomoo123@gmail.com", "TSOOMOO123", 80803103, "THE DARK KNIGHT"),
      ("4", "UUNUU", "uunuu123@gmail.com", "UUNUU123", 80803104, "GOT FATHER 2"),
      ("5", "TERGEL", "tergel123@gmail.com", "TERGEL123", 80803105, "12 ANGRY MEN"),
	  ("6", "BATKHISHIG", "batkhishig123@gmail.com", "BATKHISHIG123", 80803106, "SHAWSHANK REDEMPTION"),
      ("7", "SUGAR", "sugar123@gmail.com", "SUGAR123", 80803107, "GOT FATHER"),
      ("8", "BATJIN", "batjin123@gmail.com", "BATJIN123", 80803108, "THE DARK KNIGHT"),
      ("9", "DASHNYAM", "dashnyam123@gmail.com", "DASHNYAM123", 80803109, "GOT FATHER 2"),
      ("10", "PUREW", "purew123@gmail.com", "PUREW123", 80803110, "12 ANGRY MEN");
INSERT INTO UILCHLUULEGCH_BA_KART VALUES
      ("VISA01", "1", "1", "1"),
      ("VISA02", "2", "2", "2"),
      ("VISA03", "3", "3", "3"),
      ("VISA04", "4", "4", "4"),
      ("VISA05", "5", "5", "5"),
      ("VISA06", "6", "6", "6"),
      ("VISA07", "7", "7", "7"),
      ("VISA08", "8", "8", "8"),
      ("VISA09", "9", "9", "9"),
      ("VISA10", "10", "10", "10");
INSERT INTO TARIF VALUES
      ("1", "15000", "1", "V01", "1"),
      ("2", "10000", "2", "V02", "2"),
      ("3", "15000", "3", "V03", "3"),
      ("4", "10000", "4", "V04", "4"),
      ("5", "15000", "5", "V05", "5"),
	  ("6", "15000", "6", "V06", "6"),
      ("7", "10000", "7", "V07", "7"),
      ("8", "15000", "8", "V08", "8"),
      ("9", "10000", "9", "V09", "9"),
      ("10", "15000","10","V10", "10");
INSERT INTO ZAHIALGA VALUES
	  ("Z01", "2022-02-21", "1", "1", "A01"),
      ("Z02", "2022-02-22", "2", "2", "A02"),
      ("Z03", "2022-02-23", "3", "3", "A03"),
      ("Z04", "2022-02-24", "4", "4", "A04"),
      ("Z05", "2022-02-25", "5", "5", "A05"),
      ("Z06", "2022-02-21", "6", "6", "A06"),
      ("Z07", "2022-02-22", "7", "7", "A07"),
      ("Z08", "2022-02-23", "8", "8", "A08"),
      ("Z09", "2022-02-24", "9", "9", "A09"),
      ("Z10", "2022-02-25", "10", "10","A10");
INSERT INTO TSUTSLALT VALUES
      ("1", "2022-02-23", "ZAWGUI BOLSON", "Z01"),
      ("2", "2022-02-24", "AJILTAI BOLSON", "Z02"),
      ("3", "2022-02-25", "UUR ZUIL HIIH BOLSON", "Z03"),
      ("4", "2022-02-26", "AMJHAARGUI BOLSON", "Z04"),
      ("5", "2022-02-27", "ZAWGUI BOLSON", "Z05"),
      ("6", "2022-02-23", "ZAWGUI BOLSON", "Z06"),
      ("7", "2022-02-24", "AJILTAI BOLSON", "Z07"),
      ("8", "2022-02-25", "UUR ZUIL HIIH BOLSON", "Z08"),
      ("9", "2022-02-26", "AMJHAARGUI BOLSON", "Z09"),
      ("10", "2022-02-27", "ZAWGUI BOLSON", "Z10");
INSERT INTO TASALBAR VALUES
      ("1", "Z01", "1", "1"),
      ("2", "Z02", "2", "2"),
      ("3", "Z03", "3", "3"),
      ("4", "Z04", "4", "4"),
      ("5", "Z05", "5", "5"),
      ("6", "Z06", "6", "6"),
      ("7", "Z07", "7", "7"),
      ("8", "Z08", "8", "8"),
      ("9", "Z09", "9", "9"),
      ("10","Z10", "10", "10");
INSERT INTO KARTIIN_GUILGEE VALUES
      ("1", "BELNEER", "15000", "10", "Z01", "1"),
      ("2", "KARTAAR", "10000", "0", "Z02", "2"),
      ("3", "SHILJUULNE", "15000", "15", "Z03", "3"),
      ("4", "BELNEER", "10000", "5", "Z04", "4"),
      ("5", "KARTAAR", "15000", "10", "Z05", "5"),
	  ("6", "BELNEER", "15000", "10", "Z06", "6"),
      ("7", "KARTAAR", "10000", "0", "Z07", "7"),
      ("8", "SHILJUULNE", "15000", "15", "Z08", "8"),
      ("9", "BELNEER", "10000", "5", "Z09", "9"),
      ("10", "KARTAAR", "15000", "10", "Z10", "10");
INSERT INTO TULBUR VALUES
      ("1", "15000", "2022-02-21", "1", "Z01"),
      ("2", "10000", "2022-02-22", "2", "Z02"),
      ("3", "15000", "2022-02-23", "3", "Z03"),
      ("4", "10000", "2022-02-24", "4", "Z04"),
      ("5", "15000", "2022-02-25", "5", "Z05"),
      ("6", "15000", "2022-02-21", "6", "Z06"),
      ("7", "10000", "2022-02-22", "7", "Z07"),
      ("8", "15000", "2022-02-23", "8", "Z08"),
      ("9", "10000", "2022-02-24", "9", "Z09"),
      ("10", "15000", "2022-02-25", "10","Z10");

     
/*////////////////////////////////////////////ON UPDATE CASCADE///////////////////////////////////////////////////////////////////////////////////*/
ALTER TABLE TANHIM DROP CONSTRAINT tanhim_ibfk_1;
ALTER TABLE TANHIM ADD constraint Salbar_Salbar_ID    FOREIGN KEY (Salbar_ID)   REFERENCES SALBAR(Salbar_ID)    ON UPDATE CASCADE;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'TANHIM' AND CONSTRAINT_SCHEMA = "lab04";
			UPDATE SALBAR SET Salbar_ID = 111 WHERE Salbar_ID = 01;
SELECT * FROM TANHIM;
SELECT * FROM SALBAR;

ALTER TABLE AJILTAN DROP CONSTRAINT ajiltan_ibfk_1;
ALTER TABLE AJILTAN ADD constraint Ajiltan_turul_Ajiltan_turul_ID FOREIGN KEY (Ajiltan_turul_ID) REFERENCES AJILTAN_TURUL(Ajiltan_turul_ID) ON UPDATE CASCADE;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'AJILTAN' AND CONSTRAINT_SCHEMA = "lab04";
			UPDATE AJILTAN_TURUL SET Ajiltan_turul_ID = 222 WHERE Ajiltan_turul_ID = 2;
SELECT * FROM AJILTAN;
SELECT * FROM AJILTAN_TURUL;

ALTER TABLE KINO DROP CONSTRAINT kino_ibfk_1;
ALTER TABLE KINO ADD constraint Kino_turul_Kino_turul_ID FOREIGN KEY (Kino_turul_ID)   REFERENCES KINO_TURUL(Kino_turul_ID)    ON UPDATE CASCADE;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'SUUDAL' AND CONSTRAINT_SCHEMA = "lab04";
			UPDATE KINO_TURUL SET Kino_turul_ID = "T333" WHERE Kino_turul_ID = "T01";
SELECT * FROM KINO;
SELECT * FROM KINO_TURUL;
/*////////////////////////////////////////////ON DELETE CASCADE///////////////////////////////////////////////////////////////////////////////////*/
ALTER TABLE UILCHLUULEGCH_BA_KART DROP CONSTRAINT kartiin_guilgee_kartiin_guilgee_ID;
ALTER TABLE UILCHLUULEGCH_BA_KART ADD  CONSTRAINT kartiin_guilgee_kartiin_guilgee_ID FOREIGN KEY (Uilchluulegch_ID) REFERENCES KARTIIN_GUILGEE(uilchluulegch_id) ON DELETE CASCADE;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'UILCHLUULEGCH_BA_KART' AND CONSTRAINT_SCHEMA = "lab04";
			DELETE FROM KARTIIN_GUILGEE WHERE guilgee_id = 3;
SELECT * FROM KARTIIN_GUILGEE;
SELECT * FROM UILCHLUULEGCH_BA_KART;
use lab04;
ALTER TABLE JUJIGCHIN DROP CONSTRAINT jujigchin_jujigchin_ID;
ALTER TABLE JUJIGCHIN ADD constraint jujigchin_jujigchin_ID  FOREIGN KEY (Jujigchin_ID) REFERENCES KINO_HAS_JUJIGCHIN(Jujigchin_ID) ON DELETE CASCADE;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'JUJIGCHIN' AND CONSTRAINT_SCHEMA = "lab04";
			DELETE FROM KINO_HAS_JUJIGCHIN WHERE Jujigchin_ID = "J02";
SELECT * FROM KINO_HAS_JUJIGCHIN;
SELECT * FROM JUJIGCHIN;

/*////////////////////////////////////////////RESTRICT///////////////////////////////////////////////////////////////////////////////////*/
ALTER TABLE TANHIM DROP CONSTRAINT Salbar_Salbar_ID;
ALTER TABLE TANHIM ADD constraint tanhim_ibfk_1    FOREIGN KEY (Salbar_ID)   REFERENCES SALBAR(Salbar_ID)    ON UPDATE RESTRICT;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'TANHIM' AND CONSTRAINT_SCHEMA = "lab04";
			UPDATE SALBAR SET Salbar_ID = 112 WHERE Salbar_ID = 111;
SELECT * FROM TANHIM;
SELECT * FROM SALBAR;

ALTER TABLE AJILTAN DROP CONSTRAINT Ajiltan_turul_Ajiltan_turul_ID;
ALTER TABLE AJILTAN ADD constraint ajiltan_ibfk_1 FOREIGN KEY (Ajiltan_turul_ID) REFERENCES AJILTAN_TURUL(Ajiltan_turul_ID) ON UPDATE RESTRICT;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'AJILTAN' AND CONSTRAINT_SCHEMA = "lab04";
			UPDATE AJILTAN_TURUL SET Ajiltan_turul_ID = 222 WHERE Ajiltan_turul_ID = 2;
SELECT * FROM AJILTAN;
SELECT * FROM AJILTAN_TURUL;

ALTER TABLE UILCHLUULEGCH_BA_KART DROP CONSTRAINT kartiin_guilgee_kartiin_guilgee_ID;
ALTER TABLE UILCHLUULEGCH_BA_KART ADD  CONSTRAINT uilchluulegch_ba_kart_ibfk_1 FOREIGN KEY (Uilchluulegch_ID) REFERENCES KARTIIN_GUILGEE(Uilchluulegch_ID) ON DELETE RESTRICT;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'UILCHLUULEGCH_BA_KART' AND CONSTRAINT_SCHEMA = "lab04";
			DELETE FROM KARTIIN_GUILGEE WHERE Uilchluulegch_ID = "1";
SELECT * FROM KARTIIN_GUILGEE;
SELECT * FROM UILCHLUULEGCH_BA_KART;
/*////////////////////////////////////////////SET NULL///////////////////////////////////////////////////////////////////////////////////*/
ALTER TABLE TANHIM DROP CONSTRAINT tanhim_ibfk_1;
ALTER TABLE TANHIM ADD constraint Salbar_Salbar  FOREIGN KEY (Salbar_ID)   REFERENCES SALBAR(Salbar_ID)    ON UPDATE SET NULL;
	        SELECT * FROM information_schema.table_constraints WHERE TABLE_NAME = 'TANHIM' AND CONSTRAINT_SCHEMA = "lab04";
			UPDATE SALBAR SET Salbar_ID = 1 WHERE Salbar_ID = 01;
SELECT * FROM TANHIM;
SELECT * FROM SALBAR;
use lab04;