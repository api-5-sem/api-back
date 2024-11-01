package br.gov.sp.cps.api.pixel.inbound.rest;


import br.gov.sp.cps.api.pixel.core.domain.entity.Grupo;
import br.gov.sp.cps.api.pixel.core.usecase.GrupoUC;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/usuarios/grupo")
public class GrupoController {

    private final GrupoUC grupoUC;

    public GrupoController(GrupoUC grupoUC){
        this.grupoUC = grupoUC;
    }

    @GetMapping
    public List<Grupo> listar() {
        return grupoUC.listar();
    }
}