DROP TABLE IF EXISTS grupo;
CREATE TABLE grupo
(
    id      SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO grupo (nome) VALUES ('ADMIN');

INSERT INTO grupo (nome) VALUES ('USER');

CREATE TABLE grupo_permissao
(
    grupo_id     BIGINT NOT NULL,
    permissao_id BIGINT NOT NULL,
    PRIMARY KEY (grupo_id, permissao_id),
    FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON DELETE CASCADE,
    FOREIGN KEY (permissao_id) REFERENCES permissao (id_Permissao) ON DELETE CASCADE
);


insert into grupo_permissao values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8);


