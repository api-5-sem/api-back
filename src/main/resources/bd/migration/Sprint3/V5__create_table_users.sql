DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id       BIGSERIAL PRIMARY KEY,
    login    VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role     VARCHAR(50)  NOT NULL,
    grupo_id BIGINT,
    FOREIGN KEY (grupo_id) REFERENCES grupo (id)
);

INSERT INTO users (login, password, role)
VALUES ('admin', '$2a$10$gaOy.MDhI9OpKlDnANirv.0ygEGVyYvA4a2pamPXKK37k/I/SED5i', 'ADMIN');

UPDATE users
SET grupo_id = 1
WHERE id = 1;