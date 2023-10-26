package com.modern.office.forms.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class ReleaseInfo {
    private String lastName;
    private String firstName;

    @JsonProperty("sex_true")
    private boolean sexTrue;
    @JsonProperty("sex_false")
    private boolean sexFalse;

    private String address1;
    private String city;
    private String state;
    private String zip;
    private String phone1;
    private String dob;
    private String ssn;
    private String carrier;
    @JsonProperty("insured_self")
    private boolean insuredSelf;
    @JsonProperty("insured_spouse")
    private boolean insuredSpouse;
    @JsonProperty("insured_child")
    private boolean insuredChild;

    private String memberName;
    @JsonProperty("memberID")
    private String memberId;
    @JsonProperty("memberDOB")
    private String memberDob;

    private String signature;
    private boolean pcp;
    private boolean ophthalmologist;
    @JsonProperty("relative_friend")
    private boolean relativeFriend;
    private boolean radio;
    private boolean internet;
    private boolean noreferral;
}
