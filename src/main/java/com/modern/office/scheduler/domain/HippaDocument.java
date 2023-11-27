package com.modern.office.scheduler.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
@Table(name = "HIPAAForms")
@Data
@Accessors(chain = true)
public class HippaDocument{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="SysID")
    private String sysId;
    @Column(name="ExpiresOn")
    private String expiresOn;
    @Column(name="RecordedOn")
    private String recordedOn;
    @Column(name="FormType")
    private String formType;
    @Column(name="Notes")
    private String notes;
    @Column(name="CodeId")
    private String codeId;
    @Column(name="patient_no")
    private Integer patientNo;
}
