package com.modern.office.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.StringUtils;

import java.time.LocalDate;

@Entity
@Table(name = "payment_comissions")
@Data
@Accessors(chain = true)
public class PaymentComission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;

    @Column(name = "payment_date")
    LocalDate paymentDate;

    @Column(name = "payment_amount")
    double paymentAmount;

    @Column(name = "billing_code")
    String billingCode;

    @Column(name = "insurance")
    String insurance;

    @Column(name = "provider")
    String provider;

    @Column(name = "patient")
    String patient;

    public double getCommissionedAmount() {
        return StringUtils.startsWithAny(this.getBillingCode(), "92004", "92014", "92002", "92012")
                ? 0
                : this.paymentAmount;
    }
}
