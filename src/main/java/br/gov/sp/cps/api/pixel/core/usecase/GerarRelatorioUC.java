package br.gov.sp.cps.api.pixel.core.usecase;

import br.gov.sp.cps.api.pixel.core.domain.repository.GraficoRepository;
import br.gov.sp.cps.api.pixel.core.service.RelatorioService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class GerarRelatorioUC {

    private final GraficoRepository graficoRepository;
    private final RelatorioService relatorioService;

    @Transactional
    public InputStreamResource executar() throws IOException {
        return null;
    }
}
