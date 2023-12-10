package com.modern.office.forms.domain;

import lombok.Data;

@Data
public class ConsentRecord implements ReportRecord {
    private String patientName;
    private Integer patientNo;
    private String company;
    private String signature;
}
