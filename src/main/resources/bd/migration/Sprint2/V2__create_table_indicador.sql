DROP TABLE IF EXISTS config_Indicador;
CREATE TABLE config_Indicador
(
    id_Config_Indicador    SERIAL PRIMARY KEY,
    indicador_nome       VARCHAR(255) NOT NULL,
    indicador_campo      VARCHAR(255) NOT NULL,
    indicador_comparador VARCHAR(255) NOT NULL,
    indicador_valor      VARCHAR(255) NOT NULL,
    filtro_nome          VARCHAR(255) NOT NULL,
    filtro_campo         VARCHAR(255) NOT NULL,
    filtro_comparador    VARCHAR(255) NOT NULL,
    filtro_valor         VARCHAR(255) NOT NULL,
    usuario              VARCHAR(255) NOT NULL,
    descricao            VARCHAR(500) NOT NULL );