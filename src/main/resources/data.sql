insert into provider(provider_no, provider_last_name, provider_first_name, is_provider, provider_active) values(8, 'Givner',  'Steven', 1, 1);
insert into provider(provider_no, provider_last_name, provider_first_name, is_provider, provider_active) values(20, 'Lakovitsky',  'Diana', 1, 1);
insert into provider(provider_no, provider_last_name, provider_first_name, is_provider, provider_active) values(11, 'Optika',  'Modern', 1, 1);

insert into insurance(insurance_no, insurance_name) values(1, 'National Government Services');
insert into insurance(insurance_no, insurance_name) values(2, 'New York Medicaid');
insert into insurance(insurance_no, insurance_name) values(3, 'AmeriChoice of New York');
insert into insurance(insurance_no, insurance_name) values(4, 'HIP - Health Health Plan Of New York');

insert into insurance_plans(insurance_no, plan_no, plan_name) values(1, 1, 'National Government Services');
insert into insurance_plans(insurance_no, plan_no, plan_name) values(2, 2, 'New York Medicaid');
insert into insurance_plans(insurance_no, plan_no, plan_name) values(3, 3, 'AmeriChoice of New York');
insert into insurance_plans(insurance_no, plan_no, plan_name) values(4, 4, 'HIP - Health Health, Plan Of New York');

insert into AppSch_Provider_Blocks(prb_no, pro_no, LocationID, prb_block_type, prb_start_date_time, prb_end_date_time, prb_duration, prb_day_of_week)
values (140,8,2,2,'11:00:00','17:00:00',360,0);

insert into AppSch_Provider_Blocks(prb_no, pro_no, LocationID, prb_block_type, prb_start_date_time, prb_end_date_time, prb_duration, prb_day_of_week)
values (141,8,2,2,'10:00:00','19:00:00',540,1);

insert into AppSch_Provider_Blocks(prb_no, pro_no, LocationID, prb_block_type, prb_start_date_time, prb_end_date_time, prb_duration, prb_day_of_week)
values (142,8,2,1,'09:00:00','13:00:00',240,2);

insert into Appsch_Appointment(appt_no,serv_no,pro_no,LocationID,ins_no,appt_name,appt_phone,appt_address,appt_notes,appt_date,appt_start_time,appt_end_time,appt_dayofweek,appt_color)
values (549,-1,2,2,1,'Feliks Gilman','(718) 891-9836','1245 Ave X 5k, Brn, NY  11235','tran','2009-07-15','01:45','02:00',3,14182472);
insert into Appsch_Appointment(appt_no,appt_Om_no,serv_no,pro_no,LocationID,ins_no,appt_name,appt_phone,appt_address,appt_notes,appt_date,appt_start_time,appt_end_time,appt_dayofweek,appt_color)
values (1,111,-1,8,2,1,'Arkady Perepelyuk','(718) 339-1581','1463 east 3 rd street, 6a, Brooklyn, NY  11230','trans','2023-12-18','09:00','09:15',4,14733488);

insert into code(code_category_cd, code, user_code, description) values (32, 56, 'CA', 'California');
insert into code(code_category_cd, code, user_code, description) values (32, 65, 'NY', 'New York');
insert into code(code_category_cd, code, user_code, description) values (32, 86, 'NJ', 'New Jersey');
insert into code(code_category_cd, code, user_code, description) values (5, 2, 'PPO', 'PPO');
insert into code(code_category_cd, code, user_code, description) values (5, 3, 'VSP', 'VSP');
insert into code(code_category_cd, code, user_code, description) values (59, 335, '01', 'Self');
insert into code(code_category_cd, code, user_code, description) values (59, 336, '02', 'Spouse');
insert into code(code_category_cd, code, user_code, description) values (59, 337, '03', 'Child');

insert into AppSch_Provider_Exception(pro_exception_no, pro_no, LocationID, pro_available_ind, pro_start_time, pro_end_time, pro_exception_date, pro_notes, pro_delete_ind)
values (1, 8, 2, 1, '13:45', '19:00', '2022-11-28', 'Wednesday, February 16, 2011', 0); 
insert into AppSch_Provider_Exception(pro_exception_no, pro_no, LocationID, pro_available_ind, pro_start_time, pro_end_time, pro_exception_date, pro_notes, pro_delete_ind)
values (2, 8, 2, 1, '10:00', '18:00', '2022-11-29', 'Wednesday, February 16, 2011', 0); 

insert into patient(patient_no, last_name, first_name, birth_date, salutation, address_no, sex, ss_no) values(111, 'Perepelyuk', 'Arkady', '1962-09-27', 'Dear Arkady:', 1, 1, '067-80-1212');
insert into patient(patient_no, last_name, first_name, birth_date, salutation, address_no, sex, ss_no) values(112, 'Perepelyuk', 'Dina', '1962-09-07', 'Dear Dina:', 1, 0, '067-80-4335');

insert into address(address_no, address1, city, state, zip, phone1) values(1, '123 E 12-th St', 'Brooklyn', 65, '11223','(347) 222-3322');

insert into patient_insurances(PatInsID, patient_no, ins_seq, insurance_no, insured_no, relation_to_insured, insured_id, inactive) values(1, 111, 1, 2, 111, 335, 'ABC123456', 0);