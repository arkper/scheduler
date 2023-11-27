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
    @Column(name="sysid")
    private String sysId;
    @Column(name="expireson")
    private String expiresOn;
    @Column(name="recordedon")
    private String recordedOn;
    @Column(name="formtype")
    private String formType;
    @Column(name="notes")
    private String notes;
    @Column(name="codeid")
    private String codeId;
    @Column(name="patient_no")
    private Integer patientNo;
}
