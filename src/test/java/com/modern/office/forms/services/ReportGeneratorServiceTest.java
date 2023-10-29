package com.modern.office.forms.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.forms.domain.ReleaseInfoReport;
import io.netty.handler.codec.base64.Base64Encoder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Paths;
import java.util.Base64;

import static org.junit.jupiter.api.Assertions.*;

class ReportGeneratorServiceTest {

    @Test
    void generateReleaseInfoReport() throws IOException {
        byte[] toEncode = Files.readAllBytes(Paths.get("/home/arkady/Downloads/signature.bmp"));
        var sig = Base64.getEncoder().encodeToString(toEncode);

        ObjectMapper objectMapper = new ObjectMapper();
        ReleaseInfoReport releaseInfoReport = objectMapper.readValue(this.getClass().getClassLoader().getResourceAsStream("release_report.json"), ReleaseInfoReport.class);
        releaseInfoReport.getData().get(0).setSignature(sig);
        byte[] bytes = new ReportGeneratorService().generateReleaseInfoReport(releaseInfoReport);
        Assertions.assertTrue(bytes.length > 0);
        Files.write(Paths.get("/home/arkady/Downloads/signed.pdf"), bytes);
    }
}
