use lib;

select * from nom, nom_lavlah where nom.nom_lavlah_nomcode = nom_lavlah.nomcode;
select * from ajiltan;
select * from ajiltanangilal;

select ajiltan.ajiltancode, ajiltan.ajiltanovogner, ajiltanangilal.angilalcode,ajiltanangilal.angilalner 
from ajiltan inner join ajiltanangilal 
on ajiltan.angilal_angilalcode = ajiltanangilal.angilalcode;


(select * from nom_lavlah left join zohiolchid on nom_lavlah.nomcode = zohiolchid.nom_lavlah_nomcode
union
select * from nom_lavlah right join zohiolchid on nom_lavlah.nomcode = zohiolchid.nom_lavlah_nomcode);

(select * from zohiolchid left join zohiolch on zohiolchid.zohiolch_zohiolchcode = zohiolch.zohiolchcode
union all 
select * from zohiolchid right join zohiolch on zohiolchid.zohiolch_zohiolchcode = zohiolch.zohiolchcode);
select * from zohiolch;

select * from zahialagch;
select * from zahialgiindelgerengui;
select * from zahialga;
select * from nom;
select * from nom_lavlah;
-- 1.Хамгийн өндөр үнэтэй номыг худалдаж авах захиалга өгсөн захиалагчыг олох
select * from zahialagch 
	where zahialagchid = (select zahialagch_zahialagchid from zahialga 
		where zahialgano = (select zahialga_zahialgano from zahialgiindelgerengui 
			where nom_nomDansno = (select nomdansno from nom 
				where nom_lavlah_nomcode = (select nomcode from nom_lavlah order by une desc limit 1))));

select * from ajiltan;
select * from hurgelt;
select * from zahialga;
-- 2.2020 онд хийгдсэн ниит захиалгын хүргэлт хийсэн ажилтаны овог нэр, хүрэгсэн огноо, 
-- захиалгын төлбөрийг захиалгын төлбөрийг ихээс багаруу эрэмбэлэн харуул ажилтны нэр давхцаж болно.
select ajiltan.ajiltanovogner as ajitan_ner, hurgelt.hurgelthurgesenognoo as hurgesen_ognoo, zahialga1.zahialgatulbur as zahialga_tulbur
from ajiltan left join hurgelt on ajiltan.ajiltancode = hurgelt.ajiltan_ajiltancode
right join (select zahialgano,zahialgatulbur from zahialga where year(zahialgaognoo) = 2020) as zahialga1
on hurgelt.zahialga_zahialgano = zahialga1.zahialgano
order by zahialga_tulbur desc;

select * from nom;
select * from nom_lavlah;
select * from zohiolchid;
select * from zohiolch;
select * from nasnii_angilal;
select * from hevlelgazriinlavlah;
select * from helniilavlah;
-- 3. Байгаа бүх номнуудыг зохиолчийн нэр, үнэ, насны ангилал, 
-- хэвлэсэн газрын нэр зэргийг үнээр нь эрэмбэлэн зөвхөн монгол хэл дээр бичэгдсэн номуудыг жагсааж харуул.
select nom_lavlah.nomner, zohiolch.zohiolchner, nom_lavlah.une, nasnii_angilal.nasnii_angilal_ner, hevlelgazriinlavlah.hevlelgazarner
	from nom_lavlah 
		inner join zohiolchid 
			on nom_lavlah.nomcode = zohiolchid.nom_lavlah_nomcode 
		inner join zohiolch 
			on zohiolchid.zohiolch_zohiolchcode = zohiolch.zohiolchcode
		inner join nasnii_angilal
			on nom_lavlah.nasnii_angilal_nasnii_angilalcode = nasnii_angilal.Nasnii_angilalCode
		inner join hevlelgazriinlavlah
			on nom_lavlah.HevleliinGazariinLavlah_HevleliinGazariinCode = hevlelgazriinlavlah.hevlelgazarcode
	where nom_lavlah.helniilavlah_helcode = (select helcode from helniilavlah where helner = 'mongolia')
    order by nom_lavlah.une asc; 

select *from zahialga;
select *from zahialagch;
select *from horoolavlah;
select *from duuregsumiinlavlah;
select *from hotaimgiinlavlah;
-- 4.Дархан-уул аймгаас захиалга хийсэн захиалгын огноо, захиалгын төлбөр, захиалгын төлөв, 
-- захиалга өгсөн захиалагчийн овог нэр харуул. 
-- Харуулахдаа захиалгын төлбөрөөр нь ихээс бага руу эрэмбэл
select zahialga.zahialgaognoo, zahialga.zahialgatulbur, zahialga.zahialgatuluv, z.zahialagchner
from zahialga inner join (select zahialagchid,zahialagchner,horoolavlah_horoocode from zahialagch ) as z
on zahialga.zahialagch_zahialagchid = z.zahialagchid
inner join (select horoocode, duuregsumiinlavlah_duuregsumiincode from horoolavlah) as h
on z.horoolavlah_horoocode = h.horoocode
inner join (select duuregsumiincode, hotaimgiinlavlah_hotaimgiincode from duuregsumiinlavlah) as d
on h.duuregsumiinlavlah_duuregsumiincode = d.duuregsumiincode
inner join (select hotaimgiincode from hotaimgiinlavlah where hotaimgiinner = 'Дархан-Уул') as a
on d.hotaimgiinlavlah_hotaimgiincode = a.hotaimgiincode
order by zahialga.zahialgatulbur desc;

select *from ajiltanangilal;
select *from albantushaal;
select *from ajiltan; 
-- 5. Системд оператор хэрнээ худалдагч хийдэг ажилтнуудын овог нэр, утасны дугаар, гэрийн хаягийг харуул.
select a.ajiltanovogner, a.ajiltanuts, a.ajiltanhayag 
from ajiltan as a inner join (select albantushaalcode from albantushaal where albantushaalner = 'худалдагч') as alba
on a.AlbanTushaal_AlbanTushaalCode = alba.albantushaalcode
inner join (select angilalcode from ajiltanangilal where angilalner = 'оператор') as angi
on a.angilal_angilalcode = angi.angilalcode;