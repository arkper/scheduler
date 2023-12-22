package com.modern.office.forms.domain;

import java.time.LocalDate;
import java.util.List;

public record CorrespondenceReportRequest(
    LocalDate fromLastExamDate,
    LocalDate toLastExamDate,
    LocalDate fromBirthDate,
    LocalDate toBirthDate,
    LocalDate fromRecallDate,
    LocalDate toRecallDate,
    List<Integer> insurances,
    Integer recallType) {}
