package com.modern.office.forms.services;

import com.modern.office.forms.domain.CorrespondenceReportRecord;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.eclipse.collections.impl.factory.Lists;
import org.springframework.stereotype.Component;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Component
@Slf4j
public class ExcelExporter {
    public byte[] createExcelReport(Iterable<CorrespondenceReportRecord> records) throws IOException {
        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Correspondence");
        sheet.setColumnWidth(0, 6000);
        sheet.setColumnWidth(1, 4000);

        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        Row header = sheet.createRow(0);
        this.createCell(header, 0, "Patient ID", headerStyle);
        this.createCell(header, 1, "Last Name", headerStyle);
        this.createCell(header, 2, "First Name", headerStyle);
        this.createCell(header, 3, "Age", headerStyle);
        this.createCell(header, 4, "Last Exam Date", headerStyle);
        this.createCell(header, 5, "Insurance Name", headerStyle);

        Lists.mutable.withAll(records).forEachWithIndex(
                (record, index) -> {
                    int col = 0;
                    Row row = sheet.createRow(index + 1);
                    this.createCell(row, col++, record.patientNo(), null);
                    this.createCell(row, col++, record.lastName(), null);
                    this.createCell(row, col++, record.firstName(), null);
                    this.createCell(row, col++, record.age(), null);
                    this.createCell(row, col++, record.lastExamDate(), null);
                    this.createCell(row, col++, record.insuranceName(), null);
                }
        );

        var out = new ByteArrayOutputStream();

        workbook.write(out);

        var report = out.toByteArray();

        log.info("Returning report bytes {}",  report.length);

        return report;
    }

    private void createCell(Row row, int index, Object value, CellStyle style)
    {
        Cell cell = row.createCell(index);
        cell.setCellValue(value.toString());
        if (style != null)
        {
            cell.setCellStyle(style);
        }
    }
}
