package com.modern.office.forms.domain;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public enum FormType {
    EDocs(81),
    HIPAA(93);

    private final int value;
}
