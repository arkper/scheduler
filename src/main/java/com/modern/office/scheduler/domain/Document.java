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
    @Column(name="sysid")
    private int sysId;
    @Column(name="expireson")
    private String expiresOn;
    @Column(name="recordedon")
    private String recordedOn;
    @Column(name="formtype")
    private String formType;
    @Column(name="notes")
    private String notes;
    @Column(name="codeid")
    private int codeId;
    @Column(name="patient_no")
    private int patientNo;
    @Column(name="doclink")
    private String docLink;
}
