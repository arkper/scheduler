package com.modern.office.forms.domain;

public interface ReportRecord {
    Integer getPatientNo();
    String getSignature();

    void setSignature(String signature);
    void setCompany(String company);
}
