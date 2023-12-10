package com.modern.office.forms.domain;

import lombok.Data;

import java.util.List;

@Data
public class OfficeForm<T> {
    private List<T> data;
}
