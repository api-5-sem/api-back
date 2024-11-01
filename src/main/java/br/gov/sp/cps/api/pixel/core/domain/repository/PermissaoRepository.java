package br.gov.sp.cps.api.pixel.core.domain.repository;

import br.gov.sp.cps.api.pixel.core.domain.entity.Indicador;
import br.gov.sp.cps.api.pixel.core.domain.entity.Permissao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

public interface PermissaoRepository {
    List<Permissao> listarTodos();

    Optional<Permissao> buscarPorId(int id);
}