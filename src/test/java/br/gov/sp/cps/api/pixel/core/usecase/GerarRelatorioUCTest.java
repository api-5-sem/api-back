package br.gov.sp.cps.api.pixel.core.usecase;

import br.gov.sp.cps.api.pixel.PixelApplication;
import br.gov.sp.cps.api.pixel.core.domain.dto.Eixo;
import br.gov.sp.cps.api.pixel.core.domain.dto.command.GerarRelatorioCommand;
import br.gov.sp.cps.api.pixel.core.domain.repository.GraficoRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.InputStreamResource;
import org.springframework.test.context.ActiveProfiles;

import java.io.IOException;
import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest(classes = PixelApplication.class)
@ActiveProfiles("test")
class GerarRelatorioUCTest {
    private final GraficoRepository graficoRepository = command -> Arrays.asList(
            new Object[]{"Valor X1", "Valor Y1"},
            new Object[]{"Valor X2", "Valor Y2"}
    );

    private final GerarRelatorioUC gerarRelatorioUC = new GerarRelatorioUC(graficoRepository);

    @Test
    void deveGerarRelatorioExcel() throws IOException {
        Eixo eixoX = new Eixo();
        eixoX.setCampo("Campo X");

        Eixo eixoY = new Eixo();
        eixoY.setCampo("Campo Y");

        GerarRelatorioCommand command = new GerarRelatorioCommand();
        command.setEixoX(eixoX);
        command.setEixoY(eixoY);

        InputStreamResource excelResource = gerarRelatorioUC.executar(command);

        assertNotNull(excelResource);
    }
}
