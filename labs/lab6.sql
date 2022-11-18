use humanresourcesmanagement;

-- utas procedures 
delimiter //
create procedure insertUtas(in utas varchar(8), in acode int) begin 
	insert into utas values(null, utas, acode);
end;
create procedure updateUtas(in ucode int, in phone varchar(8), in acode int) begin
	update utas set utas = phone,ajiltan_code = acode where utas_code = ucode;
end;
create procedure deleteUtas(in ucode int) begin
	delete from utas where utas_code = ucode;
end;
// delimiter ;

-- ajiltan angilal procedures
delimiter //
create procedure insertAjiltanAngilal(in ner varchar(45)) begin
	insert into ajiltanangilal values (null, ner);
end;
create procedure updateAjiltanAngilal(in acode int, in ner varchar(45)) begin 
	update ajiltanangilal set angilal_ner = ner where ajiltan_angilal_code = acode;
end;
create procedure deleteAjiltanAngilal(in acode int) begin 
	delete from ajiltanangilal where ajiltan_angilal_code = acode; 
end;
// delimiter ;

-- ajiltan procedures
delimiter //
create procedure insertAjiltan(in lastname varchar(255), in firstname varchar(255), in gender varchar(2), in phone varchar(8), in register varchar(10), in username varchar(40), in pass varchar(16), in angilal int) begin 
	insert into ajiltan values(null,lastname, firstname, gender, phone, register, username, pass, angilal);
end;
create procedure updateAjiltan(in acode int, in lastname varchar(255), in firstname varchar(255), in gender varchar(2), in phone varchar(8), in register varchar(10), in username varchar(40), in pass varchar(16), in angilal int) begin
	update ajiltan set ovog=lastname,ner=firstname,huis=gender,utas=phone,register_dugaar=register,nevtreh_ner=username,nuuts_ug=pass,angilal_code=angilal where ajiltan_code=acode;
end;
create procedure deleteAjiltan(in acode int) begin
	delete from ajiltan where ajiltan_code = acode;
end; 
// delimiter ; 

-- hotaimgiinlavlah procedures
delimiter //
create procedure insertHotaimgiinlavlah(in hcode varchar(2),in hotner varchar(45)) begin
	insert into hotaimgiinlavlah values(hcode, hotner);
end;
create procedure updateHotaimgiinlavlah(in hcode varchar(2), in hotner varchar(45)) begin
	update hotaimgiinlavlah set hot_aimgiin_ner = hotner where hot_aimgiin_lavlah_code = hcode;
end;
create procedure deleteHotaimgiinlavlah(in hcode varchar(2)) begin
	delete from hotaimgiinlavlah where hot_aimgiin_lavlah_code = hcode;
end;
// delimiter ;

-- duureg sumiin lavlah
delimiter //
create procedure insertDuuregsumiinlavlah(in dcode varchar(3), in dner varchar(45), in hcode varchar(2)) begin 
	insert into duuregsumiinlavlah values(dcode, dner, hcode);
end;
create procedure updateDuuregsumiinlavlah(in dcode varchar(3), in dner varchar(45), in hcode varchar(2)) begin 
	update duuregsumiinlavlah set duureg_sumiin_lavlah_ner = dner, hot_aimgiin_lavlah_code = hcode where duureg_sumiin_lavlah_code = dcode;
end;
create procedure deleteDuuregsumiinlavlah(in dcode varchar(3)) begin
	delete from duuregsumiinlavlah where duureg_sumiin_lavlah_code = dcode;
end;
//delimiter ;

-- horoo lavlah
delimiter //
create procedure insertHoroolavlah(in hner varchar(45), in dcode varchar(3)) begin
	insert into horoolavlah values(null, hner, dcode);
end;
create procedure updateHoroolavlah(in horcode int, in hner varchar(45), in dcode varchar(3)) begin
	update horoolavlah set horoo_ner = hner, duureg_sumiin_lavlah_code = dcode where horoo_lavlah_code = horcode;
end;
create procedure deleteHoroolavlah(in horcode int) begin
	delete from horoolavlah where horoo_lavlah_code = horcode;
end;
//delimiter ;

-- geriinhayg
delimiter //
create procedure insertgeriinhayag(in del varchar(45), in d date, in acode int, in hcode int) begin 
	insert into geriinhayag values(null, del, d, acode, hcode);
end;
create procedure updategeriinhayag(in gcode int, in del varchar(45), in d date, in acode int, in hcode int) begin
	update geriinhayag set geriin_hayag = del, ognoo = d, ajiltan_code = acode, horoo_lavlah_code = hcode where geriin_hayag_code = gcode;
end;
create procedure deletegeriinhayag(in gcode int) begin 
	delete from geriinhayag where geriin_hayag_code = gcode;
end;
// delimiter ;
select * from geriinhayag;
desc geriinhayag;
call insertgeriinhayag('test',now(), 1,11);
call updategeriinhayag(11,'test2',now(),2,1);
call deletegeriinhayag(11);
-- ===================================================================================================================  
select * from horoolavlah;
desc horoolavlah;
call inserthoroolavlah('test','БЗД');
call updatehoroolavlah(12,'test','ДАС');
call deletehoroolavlah(12);
-- ===================================================================================================================  
select * from duuregsumiinlavlah;
desc duuregsumiinlavlah;
call insertDuuregsumiinlavlah('tst','testDuureg','УБ');
call updateduuregsumiinlavlah('tst','test2','УБ');
call deleteduuregsumiinlavlah('tst');
-- =================================================================================================================== 
select * from hotaimgiinlavlah;
desc hotaimgiinlavlah;
call inserthotaimgiinlavlah('tt','testHot');
call updateHotaimgiinlavlah('tt','test');
call deletehotaimgiinlavlah('tt');
-- =================================================================================================================== 
select * from ajiltan;
desc ajiltan;
call insertAjiltan('testovog','testNer','M','11111111','ts11111111','testUsername','testPassword',1);
call updateAjiltan(11,'tes2tovog','test2Ner','FM','22222222','ts22222222','test2Username','test2Password',2);
call deleteAjiltan(11);
-- =================================================================================================================== 
select * from ajiltanangilal;
desc ajiltanangilal;
call insertAjiltanAngilal('test');
call updateAjiltanAngilal(11, 'testAniglal');
call deleteAjiltanAngilal(11);
-- =================================================================================================================== 
select * from utas;
desc utas;
call insertUtas('99999999', 1);
call updateUtas(21, '11111111', 2);
call deleteUtas(21);
