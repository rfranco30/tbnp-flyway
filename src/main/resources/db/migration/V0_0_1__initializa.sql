-- Table: testebnp.produto

-- DROP TABLE testebnp.produto;

CREATE TABLE  IF NOT EXISTS testebnp.produto
(
    des_produto character varying(30) COLLATE pg_catalog."default",
    cod_produto character(4) COLLATE pg_catalog."default" NOT NULL,
    sta_status character(1) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT produto_pkey PRIMARY KEY (cod_produto)
)
WITH (
    OIDS = FALSE
);


-- Table: testebnp.produto_cosif

-- DROP TABLE testebnp.produto_cosif;

CREATE TABLE  IF NOT EXISTS testebnp.produto_cosif
(
    cod_produto character(4) COLLATE pg_catalog."default" NOT NULL,
    cod_cosif character(11) COLLATE pg_catalog."default" NOT NULL,
    cod_clasificacao character(6) COLLATE pg_catalog."default",
    sta_status character(1) COLLATE pg_catalog."default",
    CONSTRAINT pk_produto_cod_cosif PRIMARY KEY (cod_produto, cod_cosif),
    CONSTRAINT fk_produto_cosif_produto FOREIGN KEY (cod_produto)
        REFERENCES testebnp.produto (cod_produto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

-- Table: testebnp.movimento_manual

-- DROP TABLE testebnp.movimento_manual;

CREATE TABLE  IF NOT EXISTS testebnp.movimento_manual
(
    dat_mes integer NOT NULL,
    dat_ano integer NOT NULL,
    num_lancamento bigint NOT NULL,
    cod_produto character(4) COLLATE pg_catalog."default" NOT NULL,
    cod_cosif character(11) COLLATE pg_catalog."default" NOT NULL,
    dat_movimento timestamp without time zone,
    val_valor numeric(18,2),
    des_descricao character varying(50) COLLATE pg_catalog."default",
    cod_usuario character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT pk_movimento_manual PRIMARY KEY (dat_mes, dat_ano, num_lancamento, cod_produto, cod_cosif),
    CONSTRAINT fk_movimento_manual_produto_cosif FOREIGN KEY (cod_cosif, cod_produto)
        REFERENCES testebnp.produto_cosif (cod_cosif, cod_produto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)