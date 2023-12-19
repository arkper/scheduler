package com.modern.office.forms.controllers;

import com.modern.office.domain.SigninRecord;
import com.modern.office.forms.services.SigninSheetService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Iterator;

@RestController
@RequestMapping("/signin")
@RequiredArgsConstructor
@Slf4j
public class SigninSheetController {
    private final SigninSheetService signinSheetService;

    @GetMapping(value = "/{date}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Iterable<SigninRecord>> getSigninSheet(@PathVariable("date") String date) {
        try {
            return ResponseEntity.ok().body(this.signinSheetService.getSigninSheet(LocalDate.parse(date)));
        } catch (Exception e) {
            log.error("Failed getting signin sheet", e);
            return ResponseEntity.internalServerError().build();
        }
    }

    @PostMapping(value = "", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<SigninRecord> add(@RequestBody SigninRecord signinRecord) {
        try {
            return ResponseEntity.ok().body(this.signinSheetService.save(signinRecord));
        } catch (Exception e) {
            log.error("Failed saving signin sheet", e);
            return ResponseEntity.internalServerError().build();
        }

    }
}
