package br.gov.sp.cps.api.pixel.core.service;

import br.gov.sp.cps.api.pixel.PixelApplication;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.InputStreamResource;
import org.springframework.test.context.ActiveProfiles;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest(classes = PixelApplication.class)
@ActiveProfiles("test")
class RelatorioServiceTest {

    @Test
    void deveExportarDadosParaExcel() throws IOException {
        List<Object[]> dadosRelatorios = Arrays.asList(
                new Object[]{"Dado 1.1", "Dado 1.2"},
                new Object[]{"Dado 2.1", "Dado 2.2"}
        );

        String primeiraColuna = "Coluna 1";
        String segundaColuna = "Coluna 2";

        InputStreamResource excelResource = RelatorioService.dataToExcel(dadosRelatorios, primeiraColuna, segundaColuna);

        assertNotNull(excelResource);

        var workbook = WorkbookFactory.create(excelResource.getInputStream());
        var sheet = workbook.getSheet(RelatorioService.SHEET_NAME);

        assertNotNull(sheet);
        assertEquals(primeiraColuna, sheet.getRow(0).getCell(0).getStringCellValue());
        assertEquals(segundaColuna, sheet.getRow(0).getCell(1).getStringCellValue());
        assertEquals("Dado 1.1", sheet.getRow(1).getCell(0).getStringCellValue());
        assertEquals("Dado 1.2", sheet.getRow(1).getCell(1).getStringCellValue());

        workbook.close();
    }
}
