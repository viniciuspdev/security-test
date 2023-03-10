DROP TABLE IF EXISTS permissao CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;

CREATE TABLE usuario (
                         id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
                         nome VARCHAR(255) NOT NULL,
                         telefone VARCHAR(11) NOT NULL,
                         email VARCHAR(255) NOT NULL,
                         senha VARCHAR(128) NOT NULL,
                         ativo BOOLEAN NOT NULL,
                         foto VARCHAR (512) NOT NULL,
                         criado_em TIMESTAMP NOT NULL,
                         atualizado_em TIMESTAMP,
                         token_recuperacao_senha VARCHAR(30)
);

ALTER TABLE usuario ADD CONSTRAINT pk_usuario PRIMARY KEY (id);
ALTER TABLE usuario ADD CONSTRAINT uk_usuario_email UNIQUE (email);
ALTER TABLE usuario ADD CONSTRAINT uk_usuario_telefone UNIQUE (telefone);

-----

CREATE TABLE permissao (
                           id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
                           funcao VARCHAR(100) NOT NULL,
                           usuario_id BIGINT NOT NULL
);

ALTER TABLE permissao ADD CONSTRAINT pk_permissao PRIMARY KEY (id);
ALTER TABLE permissao ADD CONSTRAINT uk_permissao UNIQUE (funcao, usuario_id);
ALTER TABLE permissao ADD CONSTRAINT fk_permissao_usuario FOREIGN KEY (usuario_id) REFERENCES usuario;

-----