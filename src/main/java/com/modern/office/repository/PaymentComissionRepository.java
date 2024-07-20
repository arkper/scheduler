package com.modern.office.repository;

import com.modern.office.domain.PaymentComission;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDate;
import java.util.List;

public interface PaymentComissionRepository extends CrudRepository<PaymentComission, Integer> {
    @Query("select PaymentComission p where p.provider = :provider and p.paymentDate between :fromDate and :toDate")
    Iterable<PaymentComission> findByProviderAndPaymentDate(String provider, LocalDate fromDate, LocalDate toDate);

    @Query("select PaymentComission p where p.provider = :provider and p.insurance in :insurances and p.paymentDate between :fromDate and :toDate")
    Iterable<PaymentComission> findByProviderInsuranceAndPaymentDate(String provider, List<String> insurances, LocalDate fromDate, LocalDate toDate);
}
