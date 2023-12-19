package com.modern.office.forms.services;

import com.modern.office.domain.SigninRecord;
import com.modern.office.repository.SigninRecordRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Service
@RequiredArgsConstructor
public class SigninSheetService {
    private static final String IMAGE_PREFIX = "data:image/png;base64,";
    private final SigninRecordRepository repository;

    public Iterable<SigninRecord> getSigninSheet(LocalDate fromDate) {
        LocalDateTime from = LocalDateTime.of(fromDate, LocalTime.of(0,0,0));
        LocalDateTime to = LocalDateTime.of(fromDate.plusDays(1), LocalTime.of(0,0,0));

        return this.repository.getSigninRecordsByDateTimeIn(from, to);
    }

    public SigninRecord save(SigninRecord signinRecord) {
        signinRecord.setDateTimeIn(LocalDateTime.now());
        return this.repository.save(signinRecord);
    }
}
