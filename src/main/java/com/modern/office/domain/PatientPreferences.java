package com.modern.office.domain;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
    @Table(name="patient_preferences")
@Data
@Accessors(chain = true)
public class PatientPreferences {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="patient_pref_no")
    private int patientPreferenceNo;

    @Column(name="patient_no")
    private int patientNo;

    @Column(name="language")
    private String language;
}
