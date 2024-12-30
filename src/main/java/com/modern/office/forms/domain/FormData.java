package com.modern.office.forms.domain;

import lombok.Data;

import java.util.Map;

@Data
public class FormData {
    private String formType;
    private int patientNo;
    private Map<String, Object> data;
}
