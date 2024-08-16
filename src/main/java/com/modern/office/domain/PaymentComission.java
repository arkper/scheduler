package com.modern.office.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.StringUtils;

import java.time.LocalDate;
import java.util.Set;

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

    transient double commissionedAmount;

    public PaymentComission setCommissionedAmount(Set<String> exemptions) {
        this.commissionedAmount = StringUtils.startsWithAny(this.getBillingCode(), exemptions.toArray(new String[0]))
                ? 0
                : this.paymentAmount;
        return this;
    }
}
