package com.modern.office.forms.domain;

import java.util.Date;

public record CorrespondenceReportRecord(
        Integer patientNo,
        String lastName,
        String firstName,
        String address1,
        String address2,
        String city,
        String state,
        String zip,
        String phone1,
        String phone2,
        String eMail,
        Date lastExamDate,
        Date birthDate,

        Integer age,
        String insuranceName

) {
}
