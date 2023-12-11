package com.modern.office.forms.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor

@Getter
public enum DocType {
    Unknown(0, null, null, "Unknown"),
    Misc(1169, null, FormType.EDocs, "Miscellaneous"),
    Topography(1162, null, null, "Topography"),
    LabResults(1164, null, FormType.EDocs, "Lab Results"),
    ReleaseOfMedicalInfo(1279, "/reports/release.jrxml", FormType.EDocs, "Release Of Medical Info"),
    TransportationApproval(1280, null, FormType.EDocs, "Transportation Approval"),
    MedicaidEyeglasses(1281, null, FormType.EDocs, "Medicaid Eyeglasses"),
    Privacy(1106, null, FormType.HIPAA, "Privacy"),
    Consent(1107, "/reports/consent.jrxml", FormType.HIPAA, "Consent"),
    Complaint(1108, null, FormType.HIPAA, "Complaint"),
    ConsentToExam(1282, "/reports/consent.jrxml", FormType.HIPAA, "Consent To Exam"),
    Other(1109, null, FormType.HIPAA, "Other");

    private final int value;
    private final String template;
    private final FormType formType;
    private final String displayName;
}
