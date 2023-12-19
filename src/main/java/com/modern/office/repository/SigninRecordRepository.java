package com.modern.office.repository;

import com.modern.office.domain.SigninRecord;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDateTime;

public interface SigninRecordRepository extends CrudRepository<SigninRecord, Integer> {
    @Query("from SigninRecord s where s.dateTimeIn between :fromDate and :endDate order by s.dateTimeIn")
    Iterable<SigninRecord> getSigninRecordsByDateTimeIn(LocalDateTime fromDate, LocalDateTime endDate);
}
