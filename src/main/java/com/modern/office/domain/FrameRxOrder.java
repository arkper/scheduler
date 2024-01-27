package com.modern.office.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDate;

@Entity
@Table(name = "frame_rx")
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class FrameRxOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="rx_id")
    private int rxId;
    @Column(name="patient_id")
    private int patientId;
    @Column(name="Dispensed_By_Date")
    private LocalDate dispensedDate;
    @Column(name="Notified_By")
    private Integer notifiedBy;
    @Column(name="Rcvd_By_Date")
    private LocalDate rcvdDate;
    @Column(name="Notified_By_Date")
    private LocalDate notifiedDate;

    @Transient
    private String phone;
}
