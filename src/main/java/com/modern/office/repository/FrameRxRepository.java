package com.modern.office.repository;

import com.modern.office.domain.Document;
import com.modern.office.domain.FrameRxOrder;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDate;

public interface FrameRxRepository  extends CrudRepository<FrameRxOrder, Integer> {
    Iterable<FrameRxOrder> getFrameRxOrderByRcvdDateAfter(LocalDate date);
}
