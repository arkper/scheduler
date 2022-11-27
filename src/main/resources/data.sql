insert into provider(provider_no, provider_last_name, provider_first_name, is_provider, provider_active) values(8, 'Givner',  'Steven', 1, 1);
insert into provider(provider_no, provider_last_name, provider_first_name, is_provider, provider_active) values(20, 'Lakovitsky',  'Diana', 1, 1);
insert into provider(provider_no, provider_last_name, provider_first_name, is_provider, provider_active) values(11, 'Optika',  'Modern', 1, 1);

insert into insurance(insurance_no, insurance_name) values(1, 'National Government Services');
insert into insurance(insurance_no, insurance_name) values(2, 'New York Medicaid');
insert into insurance(insurance_no, insurance_name) values(3, 'AmeriChoice of New York');
insert into insurance(insurance_no, insurance_name) values(4, 'HIP - Health Health Plan Of New York');

insert into AppSch_Provider_Blocks(prb_no, pro_no, LocationID, prb_block_type, prb_start_date_time, prb_end_date_time, prb_duration, prb_day_of_week)
values (140,8,2,2,'11:00:00','17:00:00',360,0);

insert into AppSch_Provider_Blocks(prb_no, pro_no, LocationID, prb_block_type, prb_start_date_time, prb_end_date_time, prb_duration, prb_day_of_week)
values (141,8,2,2,'10:00:00','19:00:00',540,1);

insert into AppSch_Provider_Blocks(prb_no, pro_no, LocationID, prb_block_type, prb_start_date_time, prb_end_date_time, prb_duration, prb_day_of_week)
values (142,8,2,1,'09:00:00','13:00:00',240,2);

insert into Appsch_Appointment(appt_no,serv_no,pro_no,LocationID,ins_no,appt_name,appt_phone,appt_address,appt_notes,appt_date,appt_start_time,appt_end_time,appt_dayofweek,appt_color)
values (549,-1,2,2,1,'Feliks Gilman','(718) 891-9836','1245 Ave X 5k, Brn, NY  11235','tran','2009-07-15','01:45','02:00',3,14182472);
insert into Appsch_Appointment(appt_no,serv_no,pro_no,LocationID,ins_no,appt_name,appt_phone,appt_address,appt_notes,appt_date,appt_start_time,appt_end_time,appt_dayofweek,appt_color)
values (2,-1,2,2,1,'Vera NOVAKHOVA','(718) 339-1581','1463 east 3 rd street, 6a, Brooklyn, NY  11230','trans','2010-05-27','09:00','09:15',4,14733488);
