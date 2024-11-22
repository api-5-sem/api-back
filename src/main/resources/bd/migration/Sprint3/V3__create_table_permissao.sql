DROP TABLE IF EXISTS permissao;
CREATE TABLE permissao
(
    id_Permissao   SERIAL PRIMARY KEY,
    chave     VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

INSERT INTO permissao (chave, descricao)
VALUES ('VISUALIZAR_INDICADORES', 'Visualizar lista de indicadores chaves cadastrados');

INSERT INTO permissao (chave, descricao)
VALUES ('CRIAR_INDICADOR', 'Criar indicador chave');

INSERT INTO permissao (chave, descricao)
VALUES ('DELETAR_INDICADOR', 'Deletar indicador chave');

INSERT INTO permissao (chave, descricao)
VALUES ('DASHBOARD', 'Dashboard');

INSERT INTO permissao (chave, descricao)
VALUES ('VISUALIZAR_PERMISSOES', 'Visualizar Permissões');

INSERT INTO permissao (chave, descricao)
VALUES ('EDITAR_PERMISSAO', 'Editar Permissões');

INSERT INTO permissao (chave, descricao)
VALUES ('EXPORTAR_PDF', 'Exportar PDF');

INSERT INTO permissao (chave, descricao)
VALUES ('EXPORTAR_EXCEL', 'Exportar EXCEL');