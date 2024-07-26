package com.modern.office.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
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

    @Column(name="billing_code")
    String billingCode;

    @Column(name="insurance")
    String insurance;

    @Column(name="provider")
    String provider;

    @Column(name="patient")
    String patient;

    public double getCommissionedAmount() {
        return this.getBillingCode().startsWith("92004") || this.getBillingCode().startsWith("92014")
                ? 0
                : this.paymentAmount;
    }
}
