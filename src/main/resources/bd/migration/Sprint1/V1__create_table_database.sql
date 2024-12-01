DROP TABLE IF EXISTS dim_acao_seletiva;
CREATE TABLE dim_acao_seletiva
(
    id_dim_acao_seletiva int     NOT NULL,
    tipo                 varchar NOT NULL,
    dt_hora              date    NOT NULL,
    CONSTRAINT dim_acao_seletiva_pk PRIMARY KEY (id_dim_acao_seletiva)
);

DROP TABLE IF EXISTS dim_contratacao;
CREATE TABLE dim_contratacao
(
    id_dim_contratacao int     NOT NULL,
    dt_contratacao     date    NOT NULL,
    salario_inicial    decimal NOT NULL,
    tipo_contrato      int     NOT NULL,
    dt_aceite_oferta   date    NOT NULL,
    CONSTRAINT dim_contratacao_pk PRIMARY KEY (id_dim_contratacao)
);

DROP TABLE IF EXISTS dim_entrevista;
CREATE TABLE dim_entrevista
(
    id_dim_entrevista int     NOT NULL,
    dt_entrevista     date    NOT NULL,
    entrevistador     varchar NOT NULL,
    resultado         varchar NOT NULL,
    CONSTRAINT dim_entrevista_pk PRIMARY KEY (id_dim_entrevista)
);

DROP TABLE IF EXISTS dim_feedback;
CREATE TABLE dim_feedback
(
    id_dim_feedback int     NOT NULL,
    descricao       varchar NOT NULL,
    CONSTRAINT dim_feedback_pk PRIMARY KEY (id_dim_feedback)
);

DROP TABLE IF EXISTS dim_participante_rh;
CREATE TABLE dim_participante_rh
(
    id_dim_participante_rh int     NOT NULL,
    nome                   varchar NOT NULL,
    cargo                  varchar NOT NULL,
    CONSTRAINT dim_participante_rh_pk PRIMARY KEY (id_dim_participante_rh)
);


DROP TABLE IF EXISTS dim_periodo;
CREATE TABLE dim_periodo
(
    id_dim_periodo int  NOT NULL,
    dt_abertura    date NOT NULL,
    dt_fechamento  date NOT NULL,
    CONSTRAINT dim_periodo_pk PRIMARY KEY (id_dim_periodo)
);

DROP TABLE IF EXISTS dim_processo_seletivo;
CREATE TABLE dim_processo_seletivo
(
    id_dim_processo_seletivo int     NOT NULL,
    nome                     varchar NOT NULL,
    dt_inicio                date    NOT NULL,
    dt_fim                   date    NOT NULL,
    status                   varchar NOT NULL,
    criador                  varchar NOT NULL,
    descricao                varchar NOT NULL,
    CONSTRAINT dim_processo_seletivo_pk PRIMARY KEY (id_dim_processo_seletivo)
);

DROP TABLE IF EXISTS dim_vaga;
CREATE TABLE dim_vaga
(
    id_dim_vaga int     NOT NULL,
    titulo      varchar NOT NULL,
    nr_posicoes int     NOT NULL,
    requisitos  varchar NOT NULL,
    status      varchar NOT NULL,
    localizacao varchar NOT NULL,
    responsavel varchar NOT NULL,
    CONSTRAINT dim_vaga_pk PRIMARY KEY (id_dim_vaga)
);

DROP TABLE IF EXISTS fato_entrevista;
CREATE TABLE fato_entrevista
(
    id_fato_entrevista     int NOT NULL,
    id_dim_entrevista      int NOT NULL,
    id_dim_vaga            int NOT NULL,
    id_dim_feedback        int NULL,
    id_dim_acao_seletiva   int NULL,
    id_dim_participante_rh int NULL,
    pontuacao_candidato    int NULL,
    id_dim_contratacao     int NOT NULL,
    nr_entrevistas         int NOT NULL,
    nr_contratacoes        int NOT NULL,
    CONSTRAINT fato_entrevista_pk PRIMARY KEY (id_fato_entrevista)
);

DROP TABLE IF EXISTS fato_vaga;
CREATE TABLE fato_vaga
(
    id_fato_vaga             int     NOT NULL,
    id_dim_vaga              int     NOT NULL,
    id_dim_processo_seletivo int     NOT NULL,
    nr_posicoes_abertas      int     NOT NULL,
    nr_candidatos_inscritos  int     NOT NULL,
    salario_inicial_medio    decimal NOT NULL,
    tempo_medio_processo     int     NOT NULL,
    id_dim_periodo           int     NOT NULL,
    CONSTRAINT fato_vaga_pk PRIMARY KEY (id_fato_vaga)
);

-- foreign keys
-- Reference: fato_entrevista_dim_acao_seletiva_fk (table: fato_entrevista)
ALTER TABLE fato_entrevista ADD CONSTRAINT fato_entrevista_dim_acao_seletiva_fk
    FOREIGN KEY (id_dim_acao_seletiva)
        REFERENCES dim_acao_seletiva (id_dim_acao_seletiva)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_entrevista_dim_contratacao_fk (table: fato_entrevista)
ALTER TABLE fato_entrevista ADD CONSTRAINT fato_entrevista_dim_contratacao_fk
    FOREIGN KEY (id_dim_contratacao)
        REFERENCES dim_contratacao (id_dim_contratacao)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_entrevista_dim_entrevista_fk (table: fato_entrevista)
ALTER TABLE fato_entrevista ADD CONSTRAINT fato_entrevista_dim_entrevista_fk
    FOREIGN KEY (id_dim_entrevista)
        REFERENCES dim_entrevista (id_dim_entrevista)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_entrevista_dim_feedback_fk (table: fato_entrevista)
ALTER TABLE fato_entrevista ADD CONSTRAINT fato_entrevista_dim_feedback_fk
    FOREIGN KEY (id_dim_feedback)
        REFERENCES dim_feedback (id_dim_feedback)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_entrevista_dim_participante_rh_fk (table: fato_entrevista)
ALTER TABLE fato_entrevista ADD CONSTRAINT fato_entrevista_dim_participante_rh_fk
    FOREIGN KEY (id_dim_participante_rh)
        REFERENCES dim_participante_rh (id_dim_participante_rh)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_entrevista_dim_vaga_fk (table: fato_entrevista)
ALTER TABLE fato_entrevista ADD CONSTRAINT fato_entrevista_dim_vaga_fk
    FOREIGN KEY (id_dim_vaga)
        REFERENCES dim_vaga (id_dim_vaga)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_vaga_dim_periodo_fk (table: fato_vaga)
ALTER TABLE fato_vaga ADD CONSTRAINT fato_vaga_dim_periodo_fk
    FOREIGN KEY (id_dim_periodo)
        REFERENCES dim_periodo (id_dim_periodo)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_vaga_dim_processo_seletivo_fk (table: fato_vaga)
ALTER TABLE fato_vaga ADD CONSTRAINT fato_vaga_dim_processo_seletivo_fk
    FOREIGN KEY (id_dim_processo_seletivo)
        REFERENCES dim_processo_seletivo (id_dim_processo_seletivo)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: fato_vaga_dim_vaga_fk (table: fato_vaga)
ALTER TABLE fato_vaga ADD CONSTRAINT fato_vaga_dim_vaga_fk
    FOREIGN KEY (id_dim_vaga)
        REFERENCES dim_vaga (id_dim_vaga)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;