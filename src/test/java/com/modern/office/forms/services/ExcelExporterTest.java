package com.modern.office.forms.services;

import com.modern.office.forms.domain.CorrespondenceReportRecord;
import org.eclipse.collections.api.factory.Lists;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class ExcelExporterTest {

    private ExcelExporter testObj = new ExcelExporter();

    @Test
    void testExcel() throws IOException {
        var records = Lists.mutable.of(
                new CorrespondenceReportRecord(
                        1,
                        "Perepelyuk",
                        "Arkady",
                         "123 Some St",
                        "Some City",
                        "Some City",
                        "NY",
                        "11223",
                        "123-321-1122",
                        null,
                        "aaabbb@gmail.com",
                        new Date(),
                        new Date(),
                        88,
                        "Anthem"
                ));
        var file = File.createTempFile("test", "xls");
        byte[] excelReport = this.testObj.createExcelReport(records);
        Files.write(file.toPath(), excelReport);
        Assertions.assertTrue(excelReport.length > 0);
        Assertions.assertTrue(file.exists());
    }

}