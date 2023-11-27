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
    @Column
    private String sysId;
    @Column
    private String expiresOn;
    @Column
    private String recordedOn;
    @Column
    private String formType;
    @Column
    private String notes;
    @Column
    private String codeId;
    @Column
    private Integer patientNo;
}
