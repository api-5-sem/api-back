package br.gov.sp.cps.api.pixel.inbound.rest;

import br.gov.sp.cps.api.pixel.core.usecase.GerarRelatorioUC;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/relatorio")
@RequiredArgsConstructor
public class RelatorioController {

    private final GerarRelatorioUC gerarRelatorioUC;

    private static final String NOME_RELATORIO = "Relatorio.xlsx";

    @PostMapping
    public ResponseEntity<Resource> download(){
        return null;
    }
}
