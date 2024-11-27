package br.gov.sp.cps.api.pixel.core.service;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

@Service
public class RelatorioService {

    public static String SHEET_NAME="data";

    public static InputStreamResource dataToExcel(List<?> dadosRelatorios, String primeiraColuna, String segundaColuna) throws IOException {
        String[] HEADERS={
                primeiraColuna,
                segundaColuna
        };

        Workbook workbook = new XSSFWorkbook();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try{
            Sheet sheet = workbook.createSheet(SHEET_NAME);

            Row row = sheet.createRow(0);

            for (int i = 0;  i < HEADERS.length; i++) {
                Cell cell = row.createCell(i);
                cell.setCellValue(HEADERS[i]);
            }

            int rowIndex = 1;
            for (Object dadosRelatorio : dadosRelatorios) {
                Object[] linha = (Object[]) dadosRelatorio;
                Row dataRow = sheet.createRow(rowIndex);
                rowIndex++;

                dataRow.createCell(0).setCellValue(linha[0].toString());
                dataRow.createCell(1).setCellValue(linha[1].toString());
            }
            workbook.write(out);
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(out.toByteArray());
            InputStreamResource file = new InputStreamResource(byteArrayInputStream);
            return file;

        } catch (IOException e){
            e.printStackTrace();
            System.out.println("Erro ao exportar o arquivo.");
            return null;
        } finally{
            workbook.close();
            out.close();
        }
    }
}
