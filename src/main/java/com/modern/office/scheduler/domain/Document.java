package com.modern.office.scheduler.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
@Table(name = "edocuments")
@Data
@Accessors(chain = true)
public class Document {
    private static final String SQL_GET_EDOCS = "SELECT SysID, ExpiresOn, RecordedOn, FormType, Notes, CodeId, EDocLink " +
            " FROM eDocuments where patient_no=? order by SysID";
    private static final String SQL_GET_HIPAA = "SELECT SysID, ExpiresOn, RecordedOn, FormType, Notes, 0 as CodeId, EDocLink " +
            "FROM HIPAAForms where patient_no=?";

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
