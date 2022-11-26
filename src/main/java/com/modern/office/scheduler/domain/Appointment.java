package com.modern.office.scheduler.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "Appsch_Appointment")
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="appt_no")
	private int apptNo;

	@Column(name="serv_no")
	private int servNo;
	
	@Column(name="pro_no")
	private int providerNo;

	@Column(name="LocationID")
	private int locationId;
	
	@Column(name="ins_no")
	private Integer insuranceNo;

	@Column(name="appt_name")
	private String apptName;

	@Column(name="appt_phone")
	private String apptPhone;

	@Column(name="appt_address")
	private String apptAddress;

	@Column(name="appt_notes")
	private String apptNotes;

	@Column(name="appt_date")
	private LocalDate apptDate;

	@Column(name="appt_start_time")
	private String apptStartTime;

	@Column(name="appt_end_time")
	private String apptEndTime;

	@Column(name="appt_dayofweek")
	private Integer apptDayofWeek;

	@Column(name="appt_color")
	private Integer apptColor;
	
	@Column(name = "appt_Om_no")
	private int patientNo;

	@Column(name = "appt_cancel_ind")
	private int apptCancelIndc;
	
	@Column(name = "appt_confirmed_ind")
	private int apptConfirmedInd = 0;
	
	@Column(name = "appt_left_msg_ind")
	private int apptLeftMsgInd = 0;
	
	@Column(name = "appt_no_answer_ind")
	private int apptNoAnswerInd = 0;
	
	@Column(name = "appt_show_ind")
	private int apptShowInd = 0;
	
	@Column(name = "appt_new_pat_ind")
	private int apptNewPatientInd = 0;
}
