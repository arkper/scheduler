package com.modern.office.forms.domain;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import java.util.Arrays;

@RequiredArgsConstructor

@Getter
public enum DocType {
    Unknown(0, "unknown", null, null, "Unknown"),
    Misc(1169, "misc", null, FormType.EDocs, "Miscellaneous"),
    Topography(1162, "topography", null, null, "Topography"),
    LabResults(1164, "lab", null, FormType.EDocs, "Lab Results"),
    ReleaseOfMedicalInfo(1279, "release", "/reports/release.jrxml", FormType.EDocs, "Release Of Medical Info"),
    TransportationApproval(1280, "transportation", "/reports/transportation.jrxml", FormType.EDocs, "Transportation Approval"),
    MedicaidEyeglasses(1281, "eyeglasses", "/reports/eyeglasses.jrxml", FormType.EDocs, "Medicaid Eyeglasses"),
    Privacy(1106, "privacy", null, FormType.HIPAA, "Privacy"),
    Consent(1107, "consent", "/reports/consent.jrxml", FormType.HIPAA, "Consent"),
    Complaint(1108, "complaint", null, FormType.HIPAA, "Complaint"),
    ConsentToExam(1282, "consent1", "/reports/consent.jrxml", FormType.HIPAA, "Consent To Examination"),
    Other(1109, "other", null, FormType.HIPAA, "Other");

    private final int value;
    private final String key;
    private final String template;
    private final FormType formType;
    private final String displayName;

    public static DocType getByKey(@NonNull String targetKey)
    {
        return Arrays.stream(values()).filter(dt -> targetKey.equalsIgnoreCase(dt.getKey()))
                .findFirst()
                .orElse(DocType.Unknown);
    }
}
