CREATE TABLE provider(
	provider_no int auto_increment NOT NULL,
	provider_last_name nvarchar(20) NULL,
	provider_first_name nvarchar(20) NULL,
	provider_middle_initial nvarchar(20) NULL,
	provider_phone nvarchar(40) NULL,
	provider_fax nvarchar(20) NULL,
	provider_license nvarchar(255) NULL,
	provider_tax_id nvarchar(255) NULL,
	provider_UPIN_no nvarchar(255) NULL,
	provider_degrees nvarchar(30) NULL,
	provider_TPA_no nvarchar(255) NULL,
	provider_sub_id nvarchar(255) NULL,
	provider_specialty int NULL,
	provider_pcid nvarchar(20) NULL,
	provider_password nvarchar(255) NULL,
	provider_business_cd int NULL,
	provider_business_type smallint NULL,
	provider_specialty_cd int NULL,
	provider_tax_type_cd int NULL,
	provider_type_cd int NULL,
	provider_signature image NULL,
	provider_signature_cd smallint NULL,
	provider_signature_date datetime NULL,
	provider_code nvarchar(3) NULL,
	provider_reccomm bit NULL,
	provider_comm_method smallint NULL,
	provider_comm_rate float NULL,
	provider_active bit NULL,
	is_provider smallint NULL,
	access_all bit NULL,
	delete_patient bit NULL,
	record_fee_slip bit NULL,
	patient_creditcard bit NULL,
	print_reports bit NULL,
	setup_bus_cust_pref bit NULL,
	maintain_product bit NULL,
	record_receipt bit NULL,
	user_maint bit NULL,
	electronic_claims bit NULL,
	commission bit NULL,
	NPI_Num nvarchar(255) NULL,
	EIN_Num nvarchar(255) NULL,
	HIPAA_PrivacyOfficer bit NULL,
	HIPAA_PrivacyTrainingDate datetime NULL,
	Archive_data bit NULL,
	Inventory bit NULL,
	FormalSignature nvarchar(60) NULL,
	SignatureGraphicLink nvarchar(255) NULL,
	Patient_EMRExam bit NULL,
	provider_DEA_no nvarchar(255) NULL,
	med_rx bit NULL,
	edit_text bit NULL,
	default_Location int NULL,
	HL7Provider nvarchar(50) NULL,
	changeTemplates bit NULL,
	Cat1Security smallint NULL,
	Cat2Security smallint NULL,
	Cat3Security smallint NULL,
	Cat4Security smallint NULL,
	Cat5Security smallint NULL,
	Cat6Security smallint NULL,
	Cat7Security smallint NULL,
	Cat8Security smallint NULL,
	Cat9Security smallint NULL,
	Cat10Security smallint NULL,
	Cat11Security smallint NULL,
	CodeExam bit NULL,
	CloseExam bit NULL,
	PrintExam bit NULL,
	PrintAutoLetter bit NULL,
	AccessEDocs bit NULL,
	AccessCorresHx bit NULL,
	MaintainPatDemo smallint NULL,
	VSP_DocID nvarchar(255) NULL,
	pro_schedule_ind bit NULL,
	RestrictLocation bit NULL,
	CloseOpenCharges bit NULL,
	AccessHomeOffice bit NULL,
	EndOfDay bit NULL,
	VoidFeeSlip bit NULL,
	DeletePayment bit NULL,
	recorded_by_computer nvarchar(255) NULL,
	recorded_date datetime NULL,
	ChangeProdFee bit NULL,
	Redo bit NULL,
	PasswordedDiscounts bit NULL,
	Cat12Security smallint NULL,
	PrintRx bit NULL,
	Cat13Security smallint NULL,
	FullAccessTaskMgr bit NULL,
	OverridePayRestriction bit NULL,
	EditFeeslip bit NULL,
	EditBilledOrder bit NULL,
	AccessReportWriter bit NULL,
	EmergencyAccess bit NULL,
	provider_SS_no nvarchar(255) NULL,
	provider_DPS nvarchar(255) NULL
);

CREATE TABLE insurance(
	insurance_no int auto_increment NOT NULL,
	insurance_name nvarchar(40) NULL
);

CREATE TABLE Appsch_Provider_Blocks(
	prb_no int auto_increment NOT NULL,
	range_no int NULL,
	pro_no int NULL,
	LocationID int NULL,
	prb_block_type smallint NULL,
	prb_start_date_time nvarchar(11) NULL,
	prb_end_date_time nvarchar(11) NULL,
	prb_duration int NULL,
	prb_day_of_week smallint NULL
);

CREATE TABLE Appsch_Provider_Exception(
	pro_exception_no int auto_increment NOT NULL,
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
	appt_no int auto_increment NOT NULL,
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
	appt_color int NULL,
	appt_cancel_ind bit NULL,
	appt_confirmed_ind bit NULL,
	appt_left_msg_ind bit NULL,
	appt_no_answer_ind bit NULL,
	appt_show_ind smallint NULL,
	appt_new_pat_ind bit NULL,
	appt_Om_no int NULL,
	APPT_DELETED_IND NULL,
	recorded_by int null,
	recorded_by_computer nvarchar(100) null,
	recorded_date datetime null
);

CREATE TABLE address(
	address_no int NOT NULL,
	address1 nvarchar(255) NULL,
	address2 nvarchar(255) NULL,
	city nvarchar(40) NULL,
	state smallint NULL,
	zip nvarchar(10) NULL,
	phone1 nvarchar(255) NULL,
	phone2 nvarchar(255) NULL,
	fax nvarchar(255) NULL,
	wrong_address_flg bit NULL,
	previous_address1 nvarchar(255) NULL,
	previous_address2 nvarchar(255) NULL,
	previous_city nvarchar(40) NULL,
	previous_state smallint NULL,
	previous_zip nvarchar(10) NULL,
	update_dt datetime NULL,
	pa_update_dt datetime NULL
);

CREATE TABLE patient_insurances(
	PatInsID int NOT NULL,
	patient_no int NULL,
	ins_seq smallint NULL,
	insurance_no int NULL,
	ins_group_no smallint NULL,
	insured_type smallint NULL,
	insured_no int NULL,
	ins_copay float NULL,
	ins_copay_type bit NULL,
	relation_to_insured int NULL,
	residence_type int NULL,
	ppo_hmo int NULL,
	data_count int NULL,
	policy_type int NULL,
	insurance_status bit NULL,
	Box9OnHCFA bit NULL,
	deceased smallint NULL,
	insured_retired smallint NULL,
	insured_spouse_retired smallint NULL,
	Inactive bit NULL,
	Notes ntext NULL,
	ExtInsID nvarchar(20) NULL,
	Auth_code nvarchar(20) NULL,
	Auth_date datetime NULL,
	insured_id nvarchar(255) NULL,
	policy_group_no nvarchar(29) NULL,
	ExtInsSetID nvarchar(50) NULL,
	AssumedCareDate datetime NULL,
	RelinquishedCareDate datetime NULL,
	Rep_Category1 nvarchar(2) NULL,
	Rep_Category2 nvarchar(2) NULL,
	Rep_Category3 nvarchar(2) NULL,
	Cond_ind1 nvarchar(2) NULL,
	Cond_ind2 nvarchar(2) NULL,
	Cond_ind3 nvarchar(2) NULL,
	Rep_Box32 bit NULL,
	Rep_FacNm nvarchar(40) NULL,
	Rep_Address nvarchar(40) NULL,
	Rep_City nvarchar(40) NULL,
	Rep_State smallint NULL,
	Rep_Zip nvarchar(10) NULL,
	Rep_NPINum nvarchar(17) NULL,
	Pat_Ref_phy int NULL,
	SurgeryDate1 datetime NULL,
	SurgeryDate2 datetime NULL,
	Rep_Address2 nvarchar(40) NULL,
	Rep_Qualifier int NULL,
	ref_dt datetime NULL,
	Rep_FacID nvarchar(14) NULL,
	VisionPlan bit NULL,
	ConsumerID nvarchar(50) NULL,
	SubscriberConsumerID nvarchar(50) NULL
);

CREATE TABLE patient(
	patient_no int auto_increment NOT NULL,
	LocationID int NULL,
	address_no int NULL,
	address_no_old int NULL,
	guarantor_no int NULL,
	use_guarantor_address bit NULL,
	patient_type smallint NULL,
	mid_name nvarchar(15) NULL,
	last_name nvarchar(30) NULL,
	suffix nvarchar(10) NULL,
	entry_date datetime NULL,
	sex smallint NULL,
	birth_date datetime NULL,
	ss_no nvarchar(255) NULL,
	title nvarchar(10) NULL,
	provider_cd int NULL,
	source_cd int NULL,
	head_of_household smallint NULL,
	mail_to smallint NULL,
	chart_no nvarchar(255) NULL,
	salutation nvarchar(30) NULL,
	nickname nvarchar(30) NULL,
	employer nvarchar(40) NULL,
	emp_status int NULL,
	marital_status int NULL,
	send_statement smallint NULL,
	statement_interval smallint NULL,
	financial_charge smallint NULL,
	ins_type_cd smallint NULL,
	account_type_cd nvarchar(1) NULL,
	courtesy_percent smallint NULL,
	hold_bill_until_date datetime NULL,
	signature_on_file smallint NULL,
	signature_date datetime NULL,
	creditcrd_no nvarchar(255) NULL,
	creditcrd_exp datetime NULL,
	creditcrd_type smallint NULL,
	creditcrd_holder nvarchar(30) NULL,
	driverlic_no nvarchar(255) NULL,
	driverlic_exp datetime NULL,
	driverlic_state smallint NULL,
	med_alert ntext NULL,
	notes ntext NULL,
	active smallint NULL,
	relation_to_guarantor_no int NULL,
	last_office_visit_date datetime NULL,
	race_cd smallint NULL,
	office_cd smallint NULL,
	last_pmt_date datetime NULL,
	last_referral datetime NULL,
	next_appointment datetime NULL,
	credit_limit smallint NULL,
	credit_limit_amount real NULL,
	cash_only smallint NULL,
	mail_to_guarantor smallint NULL,
	late_payment_only smallint NULL,
	send_to_collection smallint NULL,
	day_phone nvarchar(255) NULL,
	last_update datetime NULL,
	fee_type_no int NULL,
	mailing_list smallint NULL,
	unapplied_amt real NULL,
	last_exam_date datetime NULL,
	data_count int NULL,
	signature_source smallint NULL,
	Info_Release_Ind bit NULL,
	release_date datetime NULL,
	deceased bit NULL,
	deceased_date datetime NULL,
	patient_retired bit NULL,
	patient_retire_date datetime NULL,
	spouse_retired bit NULL,
	spouse_retire_date datetime NULL,
	birthday_no int NULL,
	appointment_no int NULL,
	pager_no nvarchar(255) NULL,
	eMail_address nvarchar(255) NULL,
	cell_phone nvarchar(255) NULL,
	OPISpatient_no int NULL,
	appointmentPatient bit NULL,
	ARBalance real NULL,
	HIPAA_ReadNotice bit NULL,
	HIPAA_ModifyForm bit NULL,
	Notes_Privacy_Security ntext NULL,
	HIPAA_ReadNoticeRecBy smallint NULL,
	HIPAA_ReadNoticeRecDate datetime NULL,
	first_name nvarchar(40) NULL,
	PhotographLink nvarchar(255) NULL,
	PriCarePhy int NULL,
	PriorRecordsExist nvarchar(1) NULL,
	HL7ChargeSlip nvarchar(50) NULL,
	HL7Facility nvarchar(50) NULL,
	HL7ExternalID2 nvarchar(50) NULL,
	HL7PatientGroup nvarchar(50) NULL,
	Pref_language int NULL,
	RFRNotification bit NULL,
	RFRCreditCard datetime NULL,
	RFRPatientId datetime NULL,
	RFRInsuranceCard datetime NULL,
	RFRNotes ntext NULL,
	RFRCrCardRecordedBy int NULL,
	RFRPIdRecordedBy int NULL,
	RFRInsCardRecordedBy int NULL,
	TargetIOP_OD nvarchar(10) NULL,
	TargetIOP_OS nvarchar(10) NULL,
	ReportExclude bit NULL,
	ethnicity_cd int NULL,
	TextingOK bit NULL,
	communication_preference_cd int NULL,
	birthTime datetime NULL,
	occupation nvarchar(50) NULL,
	EWLastExamDate datetime NULL,
	VSP_Dilation bit NULL,
	VSP_Diabetes bit NULL,
	VSP_DiabeticRetinopathy bit NULL,
	VSP_Hypertension bit NULL,
	VSP_HighCholesterol bit NULL,
	VSP_Glaucoma bit NULL,
	VSP_ARMD bit NULL,
	VSP_None bit NULL,
	Race_Description nvarchar(255) NULL,
	Mothers_Maiden_Name nvarchar(255) NULL,
	Next_of_Kin_Code int NULL,
	sex_snomed nvarchar(30) NULL,
	gender_snomed nvarchar(30) NULL,
	VSP_DiabeticComm bit NULL,
	VSP_PreDiabetes bit NULL,
	prior_first_name nvarchar(40) NULL,
	prior_mid_name nvarchar(15) NULL,
	prior_last_name nvarchar(30) NULL,
	prior_suffix nvarchar(10) NULL,
	prior_title nvarchar(10) NULL
);

CREATE TABLE code(
	code_category_cd smallint NULL,
	code int NOT NULL,
	user_code nvarchar(15) NULL,
	code_removed bit NULL,
	code_default bit NULL,
	code_calc smallint NULL,
	system_code bit NULL,
	code_dev int NULL,
	rje_code nvarchar(10) NULL,
	VSP_Code nvarchar(50) NULL,
	VSP_CODE_Category int NULL,
	VSP_Code_desc nvarchar(100) NULL,
	Warntime1 int NULL,
	Warntime2 int NULL,
	CDA_Code nvarchar(255) NULL,
	CDA_Code_Description nvarchar(255) NULL,
	Description nvarchar(255) NULL,
	DoNotShow bit NULL
);

CREATE TABLE insurance_plans(
	insurance_no int NULL,
	plan_no int NOT NULL,
	plan_employer nvarchar(30) NULL,
	plan_coverage real NULL,
	form_to_use nvarchar(2) NULL,
	plan_group_no nvarchar(20) NULL,
	plan_elig_period smallint NULL,
	recall_type_no int NULL,
	plan_effective_dt datetime NULL,
	plan_expiration_dt datetime NULL,
	plan_type int NULL,
	ExtPlanId nvarchar(20) NULL,
	BundleAcc bit NULL,
	BundleContacts bit NULL,
	BundleFrames bit NULL,
	BundleLensTreat bit NULL,
	BundleOphth bit NULL,
	BundleOther bit NULL,
	BundlePlano bit NULL,
	BundleReady bit NULL,
	BundleService bit NULL,
	UsualandCustomary_Type int NULL,
	SplitFrame bit NULL,
	FramePriceType int NULL,
	SplitAt float NULL,
	DeluxeCPT_no int NULL,
	PrintDispensingFee bit NULL,
	Plan_Address1 nvarchar(40) NULL,
	Plan_Address2 nvarchar(40) NULL,
	Plan_City nvarchar(30) NULL,
	State_cd int NULL,
	Plan_Zip_cd nvarchar(10) NULL,
	Plan_Phone_No nvarchar(20) NULL,
	Plan_Fax_No nvarchar(20) NULL,
	Plan_Contact nvarchar(30) NULL,
	Job_Title nvarchar(30) NULL,
	Contact_Phone nvarchar(20) NULL,
	Contact_Email nvarchar(50) NULL,
	Attn nvarchar(30) NULL,
	Plan_Revision_dt nvarchar(10) NULL,
	PlanNotes ntext NULL,
	CreateClaim bit NULL,
	HoldClaimTillDelivered bit NULL,
	SupressEditsPOS bit NULL,
	PrintAddress nvarchar(1) NULL,
	IncludeAllSoldItems bit NULL,
	Sourcefor31 int NULL,
	PrintBusinessAddress32 bit NULL,
	Box33Entity int NULL,
	PricingMethod int NULL,
	NumberOfCopies nvarchar(10) NULL,
	Carrier_no int NULL,
	PreventDiscounts bit NULL,
	DiscOutOfPlan bit NULL,
	EligReq bit NULL,
	AllowCoPayOverride bit NULL,
	PrintBusinessAddress33 bit NULL,
	Plan_CoPay float NULL,
	Plan_CoPay_Type bit NULL,
	CLPriceType int NULL,
	plan_name nvarchar(40) NULL,
	payer_id nvarchar(15) NULL,
	payor_commid nvarchar(5) NULL,
	Payor_Commsub nvarchar(4) NULL,
	TxCopay bit NULL,
	AcceptCopay bit NULL,
	Box8a smallint NULL,
	Box24bPOS nvarchar(2) NULL,
	AllowCopay bit NULL,
	AuthReq bit NULL,
	DoNotPopulateBox32 bit NULL,
	DefaultValueFromVSPAssistant bit NULL
);

CREATE TABLE patient_preferences(
	patient_pref_no int NULL,
	patient_no int NOT NULL,
	language nvarchar(10) NOT NULL
);

CREATE TABLE EDOCUMENTS(
	sysid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	patient_no int NOT NULL,
	expireson nvarchar(10) NOT NULL,
	recordedon nvarchar(10) NOT NULL,
	formtype nvarchar(50) NULL,
	notes nvarchar(100) NULL,
	codeid int NULL,
	edoclink nvarchar(100) null
);

CREATE TABLE HIPAAFORMS(
	sysid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	patient_no int NOT NULL,
	expireson nvarchar(10) NOT NULL,
	recordedon nvarchar(10) NOT NULL,
	formtype nvarchar(50) NULL,
	notes nvarchar(100) NULL,
	codeid int NULL,
	edoclink nvarchar(100) null
);

create table SigninSheet(
	ID int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
	VisitorName varchar(100) not null,
	DateTimeIn datetime not null,
	DateTimeOut datetime null,
	SigninImage varBinary(MAX) null,
	ToBeSeenBy varchar(100) null);

create table PAYMENT_COMISSIONS(
    id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    payment_date datetime not null,
    payment_amount float not null,
    billing_code varchar(32) not null,
    insurance varchar(100) not null,
    provider varchar(100) not null);
