package com.modern.office.scheduler;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.Canvas;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.pdfcleanup.PdfCleaner;
import com.itextpdf.pdfcleanup.autosweep.CompositeCleanupStrategy;
import com.itextpdf.pdfcleanup.autosweep.RegexBasedCleanupStrategy;
import org.junit.jupiter.api.Disabled;


public class PdfEditor {

    @Disabled
    void test() throws Exception {
        PdfReader reader = new PdfReader("C:\\Users\\arkady\\Downloads\\consent_to_examination.pdf");

        PdfWriter writer = new PdfWriter("C:\\Users\\arkady\\Downloads\\consent_to_examination_1.pdf");
        PdfDocument pdfDocument = new PdfDocument(reader, writer);


        CompositeCleanupStrategy strategy1 = new CompositeCleanupStrategy();
        strategy1.add(new RegexBasedCleanupStrategy("I herewith authorize the Optometric Center \"Modern Optical\" retain photographs or other imagesfrom the").setRedactionColor(null));

        PdfCleaner.autoSweepCleanUp(pdfDocument, strategy1);

        CompositeCleanupStrategy strategy2 = new CompositeCleanupStrategy();
        strategy2.add(new RegexBasedCleanupStrategy("consent to such care including diagnostic and therapeutic procedures and medical treatment to be provided").setRedactionColor(null));

        PdfCleaner.autoSweepCleanUp(pdfDocument, strategy2);

        strategy2.getResultantLocations().forEach(location -> {
            PdfPage page = pdfDocument.getPage(location.getPageNumber() + 1);
            PdfCanvas pdfCanvas = new PdfCanvas(page.newContentStreamAfter(), page.getResources(), page.getDocument());
            Rectangle old = location.getRectangle();
            Canvas canvas = new Canvas(pdfCanvas, old);
            Paragraph p = new Paragraph("consent to such care including diagnostic and therapeutic procedures and medical treatment to be provided");
            canvas.add(p).setFontSize(12);
            canvas.close();
            Rectangle r = new Rectangle(old.getX(), old.getY() - 14, old.getWidth(), old.getHeight());
            canvas = new Canvas(pdfCanvas, r);
            p = new Paragraph("by the clinical and professional staff of the Optical Gallery.");
            canvas.add(p).setFontSize(12);
            canvas.close();
        });

        strategy1.getResultantLocations().forEach(location -> {
            Rectangle r = location.getRectangle();
            PdfPage page = pdfDocument.getPage(location.getPageNumber() + 1);
            PdfCanvas pdfCanvas = new PdfCanvas(page.newContentStreamAfter(), page.getResources(), page.getDocument());
            Canvas canvas = new Canvas(pdfCanvas, location.getRectangle());
            canvas.add(new Paragraph("I herewith authorize the Optometric Center Optical Gallery retain photographs or other images from the").setFontSize(12));
            canvas.close();
            r = new Rectangle(r.getX(), r.getY() - 14, r.getWidth(), r.getHeight());
            canvas = new Canvas(pdfCanvas, r);
            canvas.add(new Paragraph("procedure, examination or treatment.")).setFontSize(12);
            canvas.close();
        });

        pdfDocument.close();
    }

}
