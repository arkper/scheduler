package com.modern.office.scheduler.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
@Table(name = "eDocuments")
@Data
@Accessors(chain = true)
public class Document {
    private static final String SQL_GET_EDOCS = "SELECT SysID, ExpiresOn, RecordedOn, FormType, Notes, CodeId, EDocLink " +
            " FROM eDocuments where patient_no=? order by SysID";
    private static final String SQL_GET_HIPAA = "SELECT SysID, ExpiresOn, RecordedOn, FormType, Notes, 0 as CodeId, EDocLink " +
            "FROM HIPAAForms where patient_no=?";

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
