package com.modern.office.forms.domain;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum FormType {
    EDocs(81, "eDocument Form Type"),
    HIPAA(93, "HIPAA Form Type");

    private final int value;
    private final String description;
}
