package com.modern.office.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDate;

@Entity
@Table(name="payment_comissions")
@Data
@Accessors(chain = true)
public class PaymentComission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    int id;

    @Column(name="payment_date")
    LocalDate paymentDate;

    @Column(name="payment_amount")
    double paymentAmount;

    @Column(name="insurance")
    String insurance;

    @Column(name="provider")
    String provider;
}
