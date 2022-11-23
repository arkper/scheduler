CREATE TABLE provider(
	provider_no int NOT NULL,
	provider_last_name nvarchar(20) NULL,
	provider_first_name nvarchar(20) NULL,
	provider_middle_initial nvarchar(20) NULL
);

CREATE TABLE insurance(
	insurance_no int NOT NULL,
	insurance_name nvarchar(40) NULL
);

CREATE TABLE Appsch_Provider_Blocks(
	prb_no int NOT NULL,
	pro_no int NULL,
	LocationID int NULL,
	prb_block_type smallint NULL,
	prb_start_date_time nvarchar(11) NULL,
	prb_end_date_time nvarchar(11) NULL,
	prb_duration int NULL,
	prb_day_of_week smallint NULL
);

CREATE TABLE Appsch_Provider_Exception(
	pro_exception_no int NOT NULL,
	pro_no int NULL,
	LocationID int NULL,
	pro_available_ind bit NULL,
	pro_start_time nvarchar(11) NULL,
	pro_end_time nvarchar(11) NULL,
	pro_exception_date datetime NULL,
	pro_notes nvarchar(255) NULL,
	pro_recur_enddate datetime NULL,
	pro_recur_pattern nvarchar(50) NULL,
	recorded_date datetime NULL,
	recorded_by_computer nvarchar(20) NULL,
	pro_recur_range nvarchar(50) NULL,
	pro_recur_end_Occurence int NULL,
	pro_recur_daily_pattern nvarchar(50) NULL,
	pro_recur_weekly_pattern nvarchar(50) NULL,
	pro_recur_monthly_pattern nvarchar(50) NULL,
	pro_recurs_every int NULL,
	pro_recur_month_day int NULL,
	pro_recur_day_type nvarchar(50) NULL,
	pro_recur_day_month_type nvarchar(50) NULL,
	pro_recur_weekly_day int NULL,
	pro_delete_ind bit NULL,
	exceptionRecurrenceID int NULL
);

CREATE TABLE Appsch_Appointment(
	appt_no int NOT NULL,
	serv_no int NULL,
	pro_no int NULL,
	LocationID int NULL,
	ins_no int NULL,
	appt_name nvarchar(80) NULL,
	appt_phone nvarchar(30) NULL,
	appt_address nvarchar(255) NULL,
	appt_notes nvarchar(255) NULL,
	appt_date datetime NULL,
	appt_start_time nvarchar(11) NULL,
	appt_end_time nvarchar(11) NULL,
	appt_dayofweek smallint NULL,
	appt_color int NULL
);
