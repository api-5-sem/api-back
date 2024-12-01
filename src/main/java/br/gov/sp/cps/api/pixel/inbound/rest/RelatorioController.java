package br.gov.sp.cps.api.pixel.inbound.rest;

import br.gov.sp.cps.api.pixel.core.domain.dto.command.GerarRelatorioCommand;
import br.gov.sp.cps.api.pixel.core.usecase.GerarRelatorioUC;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.io.InputStream;

@RestController
@RequestMapping("/relatorio")
@RequiredArgsConstructor
public class RelatorioController {

    private final GerarRelatorioUC gerarRelatorioUC;

    private static final String NOME_RELATORIO = "Relatorio.xlsx";

    @PostMapping
    public ResponseEntity<Resource> download(@RequestBody GerarRelatorioCommand command) throws IOException {
        InputStreamResource file = gerarRelatorioUC.executar(command);
        ResponseEntity<Resource> body = ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + NOME_RELATORIO)
                .contentType(MediaType.parseMediaType("application/vnd.ms-excel"))
                .body(file);
        return body;
    }
}
