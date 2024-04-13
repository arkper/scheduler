package com.modern.office;

import java.time.LocalDate;

public class Test {
    @org.junit.jupiter.api.Test
    void test(){
        var amount = 26512.83;
        var date = LocalDate.of(2023,6,27);
        while(date.isBefore(LocalDate.of(2024,3,18))){
            amount += amount * .07/365;
            date = date.plusDays(1);
        }
        System.out.println(amount);

        System.out.println((amount - 26512.83)/26512.83);
    }
}
