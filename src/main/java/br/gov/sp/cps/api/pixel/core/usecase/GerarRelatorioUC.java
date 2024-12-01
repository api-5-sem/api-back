package br.gov.sp.cps.api.pixel.core.usecase;

import br.gov.sp.cps.api.pixel.core.domain.dto.command.GerarRelatorioCommand;
import br.gov.sp.cps.api.pixel.core.domain.repository.GraficoRepository;
import br.gov.sp.cps.api.pixel.core.service.RelatorioService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class GerarRelatorioUC {

    private final GraficoRepository graficoRepository;

    @Transactional
    public InputStreamResource executar(GerarRelatorioCommand command) throws IOException {
        List<?> dadosRelatorio = graficoRepository.getGrafico(command);
        return RelatorioService.dataToExcel(dadosRelatorio, command.getEixoX().getCampo(), command.getEixoY().getCampo());
    }
}
