use humanresourcesmanagement;

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
	(null,'1-р хороо','БЗД'),
	(null,'7-р баг','ДЗС'),
	(null,'6-р баг','ДАС'),
	(null,'5-р баг','СБС'),
	(null,'4-р баг','ЭРС'),
	(null,'3-р баг','ЧБС'),
	(null,'2-р баг','МӨС'),
	(null,'1-р баг','ЗМС'),
	(null,'8-р баг','АРС'),
	(null,'9-р баг','ЦЭС'),
    (null,'7-р хороо','БЗД'),
    (null,'7-р хороо','ДАС');
insert into uramshuulallavlah values
	(null, 'Илүү цаг'),
    (null, 'Нэмэлт ажил'),
    (null, 'Шөнийн ээлж'),
    (null, 'Төрсөн өдөр'),
    (null, 'Үр бүтээмж'),
    (null, 'Тэмцээн уралдаан'),
    (null, ''),
    (null, ''),
    (null, ''),
    (null, '');
insert into surgaltlavlah values
	(null, 'Ангил хэлний ахисан шат'),
    (null, 'Ангил хэлний дунд шат'),
    (null, 'Ангил хэлний анхан шат'),
    (null, 'Санхүүгийн мэдлэг олгох'),
    (null, 'Хуримтлалийн мэдлэг олгох'),
    (null, 'Мэргэжил дээшлүүлэх'),
    (null, 'Япон хэлний ахисан шат'),
    (null, 'Япон хэлний дунд шат'),
    (null, 'Япон хэлний анхан шат'),
    (null, 'Эрүүл мэндийн мэдлэг олгох');
insert into gadaadhelniilavlah values
	('ENG', 'English'),
    ('MON', 'Mongolian'),
    ('JPN', 'Japanese'),
    ('KOR', 'Korean'),
    ('NOR', 'Norwegian'),
    ('CHI', 'Chinese'),
    ('GER', 'German'),
    ('RUS', 'Russian'),
    ('FRE', 'French'),
    ('ARA', 'Arabic'),
    ('EST', 'Estonian'),
    ('GEO', 'Georgian');
insert into helteslavlah values
	(null, '1-р хэлтэс'),
    (null, '2-р хэлтэс'),
    (null, '3-р хэлтэс'),
    (null, '4-р хэлтэс'),
    (null, '5-р хэлтэс'),
    (null, '6-р хэлтэс'),
    (null, '7-р хэлтэс'),
    (null, '8-р хэлтэс'),
    (null, '9-р хэлтэс'),
    (null, '10-р хэлтэс');
insert into turshlagalavlah values
	(null, '1 жил ажилсан'),
    (null, '2 жил ажилсан'),
    (null, '3 жил ажилсан'),
    (null, '4 жил ажилсан'),
    (null, '5 жил ажилсан'),
    (null, '6 жил ажилсан'),
    (null, '7 жил ажилсан'),
    (null, '8 жил ажилсан'),
    (null, '9 жил ажилсан'),
    (null, '10 жил ажилсан');
insert into eruulmendlavlah values
	(null, 'Ханиад хүрсэн'),
    (null, 'Эдгэрсэн'),
    (null, 'Хөлөө хугалсан'),
    (null, 'Гараа хугалсан'),
    (null, 'Осолд орсон'),
    (null, 'Эрүүл'),
    (null, 'Хорт хавдар'),
    (null, 'Хүнд өвдсөн'),
    (null, 'Корона туссан'),
    (null, 'Хоолой өвдсөн');
insert into amraltlavlah values
	(null, 'Жирэмсний амралт'),
    (null, 'Ээлжийн амралт'),
    (null, 'Улирлын амралт'),
    (null, 'Шинэ жилийн амралт'),
    (null, 'Цагаан сарын амралт'),
    (null, 'Хүүхдийн баяр'),
    (null, 'Үндэсний их баяр наадам'),
    (null, 'Чингэс хааны өдөр'),
    (null, 'Бүгд найрамдах улс тунхагласан өдөр'),
    (null, 'Үндэсний эрх чөлөө тусгаар тогтнолоо сэргээсний баярын өдөр');
insert into bolovsrolgerchilgeelavlah values
	(null, 'doctor'),
    (null, 'magistr'),
    (null, 'bachelor'),
    (null, 'mergeshsen'),
    (null, 'tusgai dund'),
    (null, 'buren dund'),
    (null, 'buren bus dund'),
    (null, 'baga'),
    (null, ''),
    (null, '');
insert into bolovsrollavlah values
	(null, 'Gadaad helnii bagsh', 14123),
    (null, 'pizikiin bagsh', 123124),
    (null, 'Bag angiin bagsh', 15413),
    (null, 'Dund angiin bagsh', 14331),
    (null, 'eruulmendiin bagsh', 1231513),
    (null, 'biology bagsh', 1231),
    (null, 'Uran zohioliin bagsh', 123125),
    (null, 'Mathematiciin bagsh', 54324),
    (null, 'Niigemiin uhaanii bagsh', 12315),
    (null, 'Tuuhiin bagsh', 54592);
insert into albantushaallavlah values
	(null, 'Захирал'),
    (null, 'Сургалтын менежер'),
    (null, 'Хүний нөөцин ажилтан'),
    (null, 'Эрхлэгч'),
    (null, 'Багш'),
    (null, 'Нягтлан'),
    (null, 'Хуульч'),
    (null, 'Ахлах багш'),
    (null, 'Дадлагажигч багш'),
    (null, 'Хөгжлийн албаны дарга'),
    (null, 'Сургалтын хөтөлбөр хариуцсан дарга');
insert into gerbullavlah values
	(null, 'Bat'),
    (null, 'Dorj'),
    (null, 'Bold'),
    (null, 'Sumbuu'),
    (null, 'Khulan'),
    (null, 'Javkhlan'),
    (null, 'Amraa'),
    (null, 'Erdene'),
    (null, 'Tuguldur'),
    (null, 'Dulguun');
insert into urchadvarturul values
	(null, 'Урлаг, уран сайхан'),
    (null, 'Спорт'),
    (null, 'Сэтгэн бодох'),
    (null, 'И-спорт'),
    (null, ''),
    (null, ''),
    (null, ''),
    (null, ''),
    (null, ''),
    (null, '');
insert into urchadvarlavlah values
	(null, 'Сагсан бөмбөг тоглох', 2),
    (null, 'Хөл бөмбөг тоглох', 2),
    (null, 'Гар бөмбөг тоглох', 2),
    (null, 'Волейбол тоглох', 2),
    (null, 'Шатар тоглох', 3),
    (null, 'Ууланд авирах', 2),
    (null, 'Бүжиг бүжиглэх', 1),
    (null, 'Дуу дуулах', 1),
    (null, 'Рубик шоо эвлүүлэх', 3),
    (null, 'Цанаар гулгах', 2),
    (null, 'CSGO тоглох', 4);
insert into ajiltanangilal values
	(null, 'Admin'),
    (null, 'Moderator'),
    (null, 'Operator'),
    (null, 'Client'),
    (null, ''),
    (null, ''),
    (null, ''),
    (null, ''),
    (null, ''),
    (null, '');
insert into ajiltan values
	(null, 'Batbaatar', 'Namjildorj', 'm', '99081572', 'bn99081572', 'Namjildorj123', '99081572', 1),
    (null, 'Batjargal', 'Dolgorsuren', 'fm', '88019499', 'bd88019499', 'Dolgorsuren123', '88019499', 2),
    (null, 'Ariya', 'Elbegjargal', 'm', '88997790', 'ae88997790', 'Elbegjargal123', '88997790', 3),
    (null, 'Altangerel', 'Khuder', 'm', '99068710', 'ak99068710', 'Khuder123', '99068710', 4),
    (null, 'Bold', 'Gundsambuu', 'fm', '91657099', 'bg91657099', 'Gundsambuu123', '91657099', 5),
    (null, 'Khalzaa', 'Khulan', 'fm', '70152333', 'kh70152333', 'Khulan123', '70152333', 6),
    (null, 'Damiran', 'Zolboo', 'fm', '99081951', 'dd99081951', 'Zolboo123', '99081951', 7),
    (null, 'Tsagaanchuluun', 'Sugir', 'fm', '70162111', 'cf70162111', 'Sugir123', '70162111', 8),
    (null, 'Gansukh', 'Tsend-Ayush', 'm', '99380740', 'dt99380740', 'Tsend-Ayush123', '99380740', 9),
    (null, 'Narantuya', 'Gankhuyag', 'm', '70152333', 'kl70152333', 'Gankhuyag123', '70152333', 10);
insert into geriinhayag values
	(null, '1-р байр 2-р орц 12 тоот', '2022-1-1',1,11),
    (null, '2-р байр 1-р орц 13 тоот', '2022-1-1',2,1),
    (null, '3-р байр 3-р орц 14 тоот', '2022-1-1',3,11),
    (null, '40-р байр 1-р орц 15 тоот', '2022-1-1',4,11),
    (null, '11-р байр 2-р орц 16 тоот', '2022-1-1',5,1),
    (null, '13-р байр 3-р орц 17 тоот', '2022-1-1',6,11),
    (null, '17-р байр 1-р орц 18 тоот', '2022-1-1',7,1),
    (null, '31-р байр 2-р орц 19 тоот', '2022-1-1',8,1),
    (null, '10-р байр 3-р орц 10 тоот', '2022-1-1',9,11),
    (null, '21-р байр 2-р орц 11 тоот', '2022-1-1',10,1);
insert into uramshuulal values
	(null, 200000, '2022-11-13', 1, 1),
    (null, 300000, '2022-11-13', 1, 2),
    (null, 400000, '2022-11-13', 1, 3),
    (null, 500000, '2022-11-13', 1, 4),
    (null, 100000, '2022-11-13', 1, 5),
    (null, 150000, '2022-11-13', 1, 6),
    (null, 250000, '2022-11-13', 1, 7),
    (null, 350000, '2022-11-13', 1, 8),
    (null, 700000, '2022-11-13', 1, 9),
    (null, 600000, '2022-11-13', 1, 10);
insert into surgalt values 
    (null, now(), '2022-11-30', 1, 1),
    (null, now(), '2022-11-30', 2, 1),
    (null, now(), '2022-11-30', 3, 1),
    (null, now(), '2022-11-30', 4, 1),
    (null, now(), '2022-11-30', 5, 1),
    (null, now(), '2022-11-20', 1, 2),
    (null, now(),' 2022-11-20', 2, 2),
    (null, now(), '2022-11-20', 3, 2),
    (null, now(), '2022-11-20', 4, 2),
    (null, now(), '2022-11-20', 5, 2);
insert into gadaadhel values 
	(null, '1', now(), 1, 'ENG'),
    (null, '2', now(), 2, 'ENG'),
    (null, '3', now(), 3, 'ENG'),
    (null, '4', now(), 4, 'ENG'),
    (null, '5', now(), 5, 'ENG'),
    (null, '1', now(), 1, 'ENG'),
    (null, '2', now(), 2, 'ENG'),
    (null, '3', now(), 3, 'ENG'),
    (null, '4', now(), 4, 'ENG'),
    (null, '5', now(), 5, 'ENG');
insert into albantushaal  values 
	(null, '2012-2-2', now(), 1, 1),
    (null, '2012-2-2', now(), 2, 2),
    (null, '2012-2-2', now(), 3, 3),
    (null, '2012-2-2', now(), 4, 4),
    (null, '2012-2-2', now(), 5, 5),
    (null, '2012-2-2', now(), 6, 6),
    (null, '2012-2-2', now(), 7, 7),
    (null, '2012-2-2', now(), 8, 8),
    (null, '2012-2-2', now(), 9, 9),
    (null, '2012-2-2', now(), 10, 10);
insert into turshlaga values
	(null, '2012-2-2', now(), 1, 1),
    (null, '2012-2-2', now(), 2, 2),
    (null, '2012-2-2', now(), 3, 3),
    (null, '2012-2-2', now(), 4, 4),
    (null, '2012-2-2', now(), 5, 5),
    (null, '2012-2-2', now(), 6, 6),
    (null, '2012-2-2', now(), 7, 7),
    (null, '2012-2-2', now(), 8, 8),
    (null, '2012-2-2', now(), 9, 9),
    (null, '2012-2-2', now(), 10, 10);
insert into heltes values
	(null, '2012-2-2',1, 1),
    (null,  '2012-2-2',2, 2),
    (null,  '2012-2-2',3, 3),
    (null,  '2012-2-2',4, 4),
    (null,  '2012-2-2',5, 5),
    (null,  '2012-2-2',6, 6),
    (null,  '2012-2-2',7, 7),
    (null,  '2012-2-2',8, 8),
    (null,  '2012-2-2',9, 9),
    (null,  '2012-2-2',10, 10);
insert into amralt values 
	(null, '2022-2-2',now(), 1, 1),
    (null, '2022-2-2',now(), 2, 2),
    (null, '2022-2-2',now(), 3, 3),
    (null, '2022-2-2',now(), 4, 4),
    (null, '2022-2-2',now(), 5, 5),
    (null, '2022-2-2',now(), 6, 6),
    (null, '2022-2-2',now(), 7, 7),
    (null, '2022-2-2',now(), 8, 8),
    (null, '2022-2-2',now(), 9, 9),
    (null, '2022-2-2',now(), 10, 10);
insert into urchadvar values
	(null, 1, 1),
    (null, 2, 2),
    (null, 3, 3),
    (null, 4, 4),
    (null, 5, 5),
    (null, 6, 6),
    (null, 7, 7),
    (null, 8, 8),
    (null, 9, 9),
    (null, 10, 10);
insert into bolovsrol values
	(null, '4676322628155337', '2000-1-1', 1,1,1),
    (null, '8576351620179580', '2000-1-1', 2,2,2),
    (null, '9597168300040035', '2000-1-1', 3,3,3),
    (null, '2641344037404375', '2000-1-1', 4,4,4),
    (null, '5827646439520135', '2000-1-1', 5,5,5),
    (null, '7831765313106394', '2000-1-1', 6,6,6),
    (null, '5327278667314770', '2000-1-1', 7,7,7),
    (null, '4241253608901487', '2000-1-1', 8,8,8),
    (null, '5244074305146201', '2000-1-1', 9,9,9),
    (null, '9296075851002593', '2000-1-1', 10,10,10);
insert into eruulmend values
	(null, now(), 1, 6),
    (null, now(), 2, 6),
    (null, now(), 3, 6),
    (null, now(), 4, 6),
    (null, now(), 5, 6),
    (null, now(), 6, 6),
    (null, now(), 7, 6),
    (null, now(), 8, 6),
    (null, now(), 9, 6),
    (null, now(), 10, 6);
insert into utas values
	(null, '81833241', 1),
    (null, '81833242', 2),
    (null, '81833243', 3),
    (null, '81833214', 4),
    (null, '81833215', 5),
    (null, '81833216', 6),
    (null, '81833217', 7),
    (null, '81833218', 8),
    (null, '81833219', 9),
    (null, '81833210', 10),
	(null, '81833288', 1),
    (null, '81833287', 2),
    (null, '81833276', 3),
    (null, '81833254', 4),
    (null, '81833223', 5),
    (null, '81833255', 6),
    (null, '81833267', 7),
    (null, '81833256', 8),
    (null, '81833881', 9),
    (null, '81833226', 10);