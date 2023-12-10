package com.modern.office.forms.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.modern.office.scheduler.domain.Address;
import lombok.Data;

@Data
public class ReleaseRecord implements ReportRecord {
    private Integer patientNo;
    private String company;
    private String companyAddress;
    private String companyCity;
    private String companyState;
    private String companyZip;
    private String companyPhone;
    private String lastName;
    private String firstName;
    private boolean sexMale;
    private String address;
    private String city;
    private String state;
    private String zip;
    private String phone;
    private String dob;
    private String ssn;
    private String carrier;
    private String memberId;
    private String memberDob;
    private String memberName;
    private boolean insuredSelf;
    private boolean insuredSpouse;
    private boolean insuredChild;
    private String signature;
    private boolean pcp;
    private boolean ophthalmologist;
    private boolean relativeFriend;
    private boolean radio;
    private boolean internet;
    private boolean noreferral;
}
