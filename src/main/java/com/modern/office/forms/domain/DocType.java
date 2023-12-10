package com.modern.office.forms.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor

@Getter
public enum DocType {
        Unknown(0, null, null),
        Misc(1169, null, null),
        Topography(1162, null, null),
        LabResults(1164, null, null),
        ReleaseOfMedicalInfo(1279, "/reports/release.jrxml", FormType.HIPAA),
        TransportationApproval(1280, null, null),
        MedicaidEyeglasses(1281, null, null),
        Privacy(1106, null, null),
        Consent(1107, "/reports/consent.jrxml", FormType.EDocs),
        Complaint(1108, null, null),
        ConsentToExam(1282, "/reports/consent.jrxml", FormType.HIPAA),
        Other(1109, null, null);

    private final int value;
    private final String template;
    private final FormType formType;
}
