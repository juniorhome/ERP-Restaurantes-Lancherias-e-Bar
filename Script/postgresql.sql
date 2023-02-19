-- Database: ERP_RESTAURANTE

-- DROP DATABASE "ERP_RESTAURANTE";

CREATE DATABASE "ERP_RESTAURANTE"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


-- DROP TABLE public."BANCO";

CREATE TABLE public."BANCO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 999999 CACHE 1 ),
    "NUM_BANCO" bit varying(5),
    "DIGITO_NUM_BANCO" bit varying(1),
    "NOME_BANCO" bit varying(50),
    "NOME_AGENCIA" bit varying(50),
    "NUMERO_AGENCIA" bit varying(10),
    "DIGITO_AGENCIA" bit varying(1),
    "NUM_CONTA" bit varying(20),
    "DIGITO_NUM_CONTA" bit varying(1),
    "CIDADE_AGENCIA" bit varying(80),
    "UF_AGENCIA" bit varying(2),
    "NOSSO_NUMERO" bit varying(50),
    "CEDENTE" bit varying(80),
    "COD_CEDENTE" bit varying(20),
    CONSTRAINT "BANCO_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."BANCO"
    OWNER to postgres;

-- Table: public.CAIXA

-- DROP TABLE public."CAIXA";

CREATE TABLE public."CAIXA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "DATA" daterange,
    "TIPO" bit varying(1),
    "VALOR" numeric(15,2),
    "VALOR_TOTAL" numeric(15,2),
    "SALDO_ATUAL" numeric(15,2),
    "DESCRICAO" bit varying(80),
    "IDRECEBER" bigint,
    "IDPAGAR" bigint,
    CONSTRAINT "CAIXA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_CAIXA_CONTA_PAGAR" FOREIGN KEY ("IDPAGAR")
        REFERENCES public."CONTA_PAGAR" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_CAIXA_CONTA_RECEBER" FOREIGN KEY ("IDRECEBER")
        REFERENCES public."CONTA_RECEBER" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CAIXA"
    OWNER to postgres;
-- Index: fki_FK_CAIXA_CONTA_PAGAR

-- DROP INDEX public."fki_FK_CAIXA_CONTA_PAGAR";

CREATE INDEX "fki_FK_CAIXA_CONTA_PAGAR"
    ON public."CAIXA" USING btree
    ("IDPAGAR" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_CAIXA_CONTA_RECEBER

-- DROP INDEX public."fki_FK_CAIXA_CONTA_RECEBER";

CREATE INDEX "fki_FK_CAIXA_CONTA_RECEBER"
    ON public."CAIXA" USING btree
    ("IDRECEBER" ASC NULLS LAST)
    TABLESPACE pg_default;


-- Table: public.CARTAO

-- DROP TABLE public."CARTAO";

CREATE TABLE public."CARTAO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "BANDEIRA" bit varying(80),
    "TAXA" numeric(15,3),
    CONSTRAINT "CARTAO_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CARTAO"
    OWNER to postgres;

-- Table: public.CEST

-- DROP TABLE public."CEST";

CREATE TABLE public."CEST"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CEST" bit varying(20),
    "DESCRICAO" bit varying(200),
    CONSTRAINT "CEST_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CEST"
    OWNER to postgres;

-- Table: public.CFOP

-- DROP TABLE public."CFOP";

CREATE TABLE public."CFOP"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CFOP" bigint,
    "DESCRICAO" bit varying(200),
    CONSTRAINT "CFOP_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CFOP"
    OWNER to postgres;

-- Table: public.CIDADE

-- DROP TABLE public."CIDADE";

CREATE TABLE public."CIDADE"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "COD_IBGE" bigint,
    "CIDADE" bit varying(100),
    "IDUF" bigint,
    CONSTRAINT "CIDADE_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_UF" FOREIGN KEY ("IDUF")
        REFERENCES public."UF" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CIDADE"
    OWNER to postgres;

-- Table: public.CLIENTE

-- DROP TABLE public."CLIENTE";

CREATE TABLE public."CLIENTE"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "RESTRICAO" character varying(1) COLLATE pg_catalog."default",
    "LIMITE" numeric(15,2),
    "IDPESSOA" bigint,
    CONSTRAINT "CLIENTE_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_CLIENTE_PESSOA" FOREIGN KEY ("IDPESSOA")
        REFERENCES public."PESSOA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CLIENTE"
    OWNER to postgres;

-- Table: public.COMPRA

-- DROP TABLE public."COMPRA";

CREATE TABLE public."COMPRA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "VALOR_TOTAL" numeric(15,2),
    "IDCOTACAO" bigint,
    "IDFUNCIONARO" bigint,
    "DATA" date,
    CONSTRAINT "COMPRA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_COMPRA_COTACAO" FOREIGN KEY ("IDCOTACAO")
        REFERENCES public."COTACAO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_COMPRA_FUNCIONARIO" FOREIGN KEY ("IDFUNCIONARO")
        REFERENCES public."FUNCIONARIO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."COMPRA"
    OWNER to postgres;

-- Table: public.COMPRA_ITEM

-- DROP TABLE public."COMPRA_ITEM";

CREATE TABLE public."COMPRA_ITEM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "VALOR_UN" numeric,
    "QUANTIDADE" numeric(15,3),
    "VALOR_TOTAL" numeric(15,2),
    "IDCOMPRA" bigint,
    "IDPRODUTO" bigint,
    CONSTRAINT "COMPRA_ITEM_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_COMPRA_ITEM_COMPRA" FOREIGN KEY ("IDCOMPRA")
        REFERENCES public."COMPRA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_COMPRA_ITEM_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."COMPRA_ITEM"
    OWNER to postgres;

-- Table: public.CONFIGURACAO

-- DROP TABLE public."CONFIGURACAO";

CREATE TABLE public."CONFIGURACAO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "PATH_XML" bit varying(150),
    "PATH_DANFE" bit varying(150),
    "PATH_REMESSA" bit varying(150),
    "PATH_RETORNO" bit varying(150),
    "PATH_LOGO" bit varying(150),
    "DIAS_PROTESTO" integer,
    "ESPECIE" bit varying(3),
    "MOEDA" bit varying(3),
    "ACEITE" bit varying(3),
    "CARTEIRA" bit varying(3),
    "LOCAL_PGTO" bit varying(100),
    "INSTRUCAO_1" bit varying(100),
    "INSTRUCAO_2" bit varying(100),
    "CONT_REMESSA" bigint,
    "PATH_PDF" bit varying(150),
    "CERTIFICADORA" bit varying(100),
    "TIPO_CERT" bit varying(3),
    "PATH_CERTIFICADO" bit varying(150),
    "RAZAO_SOCIAL" bit varying(200),
    "FANTASIA" bit varying(200),
    "CNPJ" bit varying(20),
    "IDCRT" bigint,
    CONSTRAINT "CONFIGURACAO_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_CRT" FOREIGN KEY ("ID")
        REFERENCES public."CRT" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CONFIGURACAO"
    OWNER to postgres;

-- Table: public.CONTA_PAGAR

-- DROP TABLE public."CONTA_PAGAR";

CREATE TABLE public."CONTA_PAGAR"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NUM_DOC" bit varying(20),
    "SERIE" bit varying(20),
    "VALOR_DOC" numeric(15,2),
    "JUROS" numeric(15,3),
    "VALOR_JUROS" numeric(15,2),
    "VALOR_DESCONTO" numeric(15,2),
    "MULTA" numeric(15,2),
    "NOSSO_NUMERO" bit varying(80),
    "BOLETO_IMPRESSO" boolean,
    "IDPLANO" bigint,
    "IDCOMPRA" bigint,
    "IDFORNECEDOR" bigint,
    "DATA_VENC" date,
    "DATA_PAG" date,
    CONSTRAINT "CONTA_PAGAR_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_CONTA_PAGAR_COMPRA" FOREIGN KEY ("IDCOMPRA")
        REFERENCES public."COMPRA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_CONTA_PAGAR_FORNECEDOR" FOREIGN KEY ("IDFORNECEDOR")
        REFERENCES public."FORNECEDOR" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_CONTA_PAGAR_PLANO" FOREIGN KEY ("IDPLANO")
        REFERENCES public."PLANO_CONTAS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CONTA_PAGAR"
    OWNER to postgres;
-- Index: fki_FK_CONTA_PAGAR_COMPRA

-- DROP INDEX public."fki_FK_CONTA_PAGAR_COMPRA";

CREATE INDEX "fki_FK_CONTA_PAGAR_COMPRA"
    ON public."CONTA_PAGAR" USING btree
    ("IDCOMPRA" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_CONTA_PAGAR_FORNECEDOR

-- DROP INDEX public."fki_FK_CONTA_PAGAR_FORNECEDOR";

CREATE INDEX "fki_FK_CONTA_PAGAR_FORNECEDOR"
    ON public."CONTA_PAGAR" USING btree
    ("IDFORNECEDOR" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_CONTA_PAGAR_PLANO

-- DROP INDEX public."fki_FK_CONTA_PAGAR_PLANO";

CREATE INDEX "fki_FK_CONTA_PAGAR_PLANO"
    ON public."CONTA_PAGAR" USING btree
    ("IDPLANO" ASC NULLS LAST)
    TABLESPACE pg_default;


-- Table: public.CONTA_RECEBER

-- DROP TABLE public."CONTA_RECEBER";

CREATE TABLE public."CONTA_RECEBER"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NUM_DOC" bit varying(80),
    "SERIE" bit varying(80),
    "VALOR_DOC" numeric(15,2),
    "DATA_RECEBIMENTO" daterange,
    "VALOR_DESC" numeric(15,2),
    "JUROS" numeric(15,3),
    "VALOR_JUROS" numeric(15,2),
    "MULTA" numeric(15,2),
    "VALOR_PAGO" numeric(15,2),
    "NOSSO_NUMERO" bit varying(80),
    "VALOR_TOTAL" numeric(15,2),
    "BOLETO_IMPRESSO" boolean,
    "IDVENDA" bigint,
    "IDCLIENTE" bigint,
    "IDPLANO" bigint,
    "DATA_VENC" date,
    "DATA_CONTA" date,
    CONSTRAINT "CONTA_RECEBER_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_CONTA_RECEBER_CLIENTE" FOREIGN KEY ("IDCLIENTE")
        REFERENCES public."CLIENTE" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_CONTA_RECEBER_PLANO" FOREIGN KEY ("IDPLANO")
        REFERENCES public."PLANO_CONTAS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_CONTA_RECEBER_VENDA" FOREIGN KEY ("IDVENDA")
        REFERENCES public."VENDA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CONTA_RECEBER"
    OWNER to postgres;
-- Index: fki_FK_CONTA_RECEBER_CLIENTE

-- DROP INDEX public."fki_FK_CONTA_RECEBER_CLIENTE";

CREATE INDEX "fki_FK_CONTA_RECEBER_CLIENTE"
    ON public."CONTA_RECEBER" USING btree
    ("IDCLIENTE" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_CONTA_RECEBER_PLANO

-- DROP INDEX public."fki_FK_CONTA_RECEBER_PLANO";

CREATE INDEX "fki_FK_CONTA_RECEBER_PLANO"
    ON public."CONTA_RECEBER" USING btree
    ("IDPLANO" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_CONTA_RECEBER_VENDA

-- DROP INDEX public."fki_FK_CONTA_RECEBER_VENDA";

CREATE INDEX "fki_FK_CONTA_RECEBER_VENDA"
    ON public."CONTA_RECEBER" USING btree
    ("IDVENDA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.COTACAO

-- DROP TABLE public."COTACAO";

CREATE TABLE public."COTACAO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "STATUS" bit varying(1),
    "PRAZO" bit varying(50),
    "COTADO" boolean,
    "VALOR_TOTAL" money,
    "IDFORNECEDOR" bigint,
    "IDFUNCIONARIO" bigint,
    "DATA" date,
    CONSTRAINT "COTACAO_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_COTACAO_FORNECEDOR" FOREIGN KEY ("IDFORNECEDOR")
        REFERENCES public."FORNECEDOR" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_COTACAO_FUNCIONARIO" FOREIGN KEY ("IDFUNCIONARIO")
        REFERENCES public."FUNCIONARIO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."COTACAO"
    OWNER to postgres;

-- Table: public.COTACAO_ITEM

-- DROP TABLE public."COTACAO_ITEM";

CREATE TABLE public."COTACAO_ITEM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "VALOR_UN" numeric(15,2),
    "QUANTIDADE" numeric(15,3),
    "VALOR_TOTAL" numeric(15,2),
    "IDCOTACAO" bigint,
    "IDPRODUTO" bigint,
    CONSTRAINT "COTACAO_ITEM_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_COTACAO_ITEM_COTACAO" FOREIGN KEY ("IDCOTACAO")
        REFERENCES public."COTACAO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_COTACAO_ITEM_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."COTACAO_ITEM"
    OWNER to postgres;

-- Table: public.CRT

-- DROP TABLE public."CRT";

CREATE TABLE public."CRT"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CRT" bigint,
    "DESCRICAO" bit varying(80),
    CONSTRAINT "CRT_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CRT"
    OWNER to postgres;

-- Table: public.CSOSN

-- DROP TABLE public."CSOSN";

CREATE TABLE public."CSOSN"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CSOSN" bigint,
    "DESCRICAO" bit varying(100),
    CONSTRAINT "CSOSN_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CSOSN"
    OWNER to postgres;

-- Table: public.CST_COFINS

-- DROP TABLE public."CST_COFINS";

CREATE TABLE public."CST_COFINS"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CST" bigint,
    "DESCRICAO" bit varying(100),
    CONSTRAINT "CST_COFINS_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CST_COFINS"
    OWNER to postgres;

-- Table: public.CST_ICMS

-- DROP TABLE public."CST_ICMS";

CREATE TABLE public."CST_ICMS"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CST" bit varying(20),
    "DESCRICAO" bit varying(100),
    CONSTRAINT "CST_ICMS_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CST_ICMS"
    OWNER to postgres;

-- Table: public.CST_ICMS_ST

-- DROP TABLE public."CST_ICMS_ST";

CREATE TABLE public."CST_ICMS_ST"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CST" bit varying(20),
    "DESCRICAO" bit varying(100),
    CONSTRAINT "CST_ICMS_ST_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CST_ICMS_ST"
    OWNER to postgres;

-- Table: public.CST_IPI

-- DROP TABLE public."CST_IPI";

CREATE TABLE public."CST_IPI"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CST" bit varying(20),
    "DESCRICAO" bit varying(100),
    CONSTRAINT "CST_IPI_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CST_IPI"
    OWNER to postgres;

-- Table: public.CST_PIS

-- DROP TABLE public."CST_PIS";

CREATE TABLE public."CST_PIS"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CST" bigint,
    "DESCRICAO" bit varying(100),
    CONSTRAINT "CST_PIS_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CST_PIS"
    OWNER to postgres;

-- Table: public.FORMA_PGTO

-- DROP TABLE public."FORMA_PGTO";

CREATE TABLE public."FORMA_PGTO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "DESCRICAO" bit varying(80),
    CONSTRAINT "FORMA_PGTO_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."FORMA_PGTO"
    OWNER to postgres;

-- Table: public.FORNECEDOR

-- DROP TABLE public."FORNECEDOR";

CREATE TABLE public."FORNECEDOR"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "EHFORNECEDOR" boolean,
    "IDPESSOA" bigint,
    CONSTRAINT "FORNECEDOR_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_FORNECEDOR_PESSOA" FOREIGN KEY ("IDPESSOA")
        REFERENCES public."PESSOA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."FORNECEDOR"
    OWNER to postgres;

-- Table: public.FORNECEDOR_PRODUTO

-- DROP TABLE public."FORNECEDOR_PRODUTO";

CREATE TABLE public."FORNECEDOR_PRODUTO"
(
    "IDFORNECEDOR" bigint NOT NULL,
    "IDPRODUTO" bigint NOT NULL,
    CONSTRAINT "FK_FORNECEDOR_PRODUTO_FORNECEDOR" FOREIGN KEY ("IDFORNECEDOR")
        REFERENCES public."FORNECEDOR" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_FORNECEDOR_PRODUTO_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."FORNECEDOR_PRODUTO"
    OWNER to postgres;

-- Table: public.FUNCIONARIO

-- DROP TABLE public."FUNCIONARIO";

CREATE TABLE public."FUNCIONARIO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "LOGIN" character varying(200) COLLATE pg_catalog."default",
    "SENHA" character varying(20) COLLATE pg_catalog."default",
    "SALARIO" numeric(15,2),
    "CARGO" character varying(80) COLLATE pg_catalog."default",
    "IDPESSOA" bigint,
    CONSTRAINT "PK_FUNCIONARIO" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_FUNCIONARIO_PESSOA" FOREIGN KEY ("IDPESSOA")
        REFERENCES public."PESSOA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."FUNCIONARIO"
    OWNER to postgres;

-- Table: public.GRUPO

-- DROP TABLE public."GRUPO";

CREATE TABLE public."GRUPO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "DESCRICAO" bit varying(80),
    CONSTRAINT "PK_ID_GRUPO" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."GRUPO"
    OWNER to postgres;

-- Table: public.KIT

-- DROP TABLE public."KIT";

CREATE TABLE public."KIT"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "DESCRICAO" character varying(150)[] COLLATE pg_catalog."default",
    "ATIVO" "char",
    "DATA_CAD" daterange,
    "VALOR_TOTAL" numeric(15,2),
    CONSTRAINT "KIT_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."KIT"
    OWNER to postgres;

-- Table: public.KIT_ITEM

-- DROP TABLE public."KIT_ITEM";

CREATE TABLE public."KIT_ITEM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "VALOR" numeric(15,2),
    "QUANTIDADE" integer,
    "DESCONTO" numeric(15,2),
    "VALOR_TOTAL" numeric(15,2),
    "IDKIT" bigint,
    "IDPRODUTO" bigint,
    "IDPRODCOMPOSTO" bigint,
    CONSTRAINT "KIT_ITEM_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_KIT_ITEM_KIT" FOREIGN KEY ("IDKIT")
        REFERENCES public."KIT" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "FK_KIT_ITEM_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "SEQ_KIT_ITEM_PROD_COMPOSTO" FOREIGN KEY ("IDPRODCOMPOSTO")
        REFERENCES public."PRODUTO_COMPOSTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."KIT_ITEM"
    OWNER to postgres;
-- Index: fki_FK_KIT_ITEM_KIT

-- DROP INDEX public."fki_FK_KIT_ITEM_KIT";

CREATE INDEX "fki_FK_KIT_ITEM_KIT"
    ON public."KIT_ITEM" USING btree
    ("IDKIT" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_KIT_ITEM_PRODUTO

-- DROP INDEX public."fki_FK_KIT_ITEM_PRODUTO";

CREATE INDEX "fki_FK_KIT_ITEM_PRODUTO"
    ON public."KIT_ITEM" USING btree
    ("IDPRODUTO" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_SEQ_KIT_ITEM_PROD_COMPOSTO

-- DROP INDEX public."fki_SEQ_KIT_ITEM_PROD_COMPOSTO";

CREATE INDEX "fki_SEQ_KIT_ITEM_PROD_COMPOSTO"
    ON public."KIT_ITEM" USING btree
    ("IDPRODCOMPOSTO" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.MESA

-- DROP TABLE public."MESA";

CREATE TABLE public."MESA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NUM_CADEIRA" integer,
    "TAMANHO" character varying(50) COLLATE pg_catalog."default",
    "STATUS" character varying(2) COLLATE pg_catalog."default",
    CONSTRAINT "MESA_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."MESA"
    OWNER to postgres;

-- Table: public.NCM

-- DROP TABLE public."NCM";

CREATE TABLE public."NCM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NCM" bit varying(20),
    "DESCRICAO" bit varying(200),
    CONSTRAINT "NCM_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NCM"
    OWNER to postgres;

-- Table: public.NCM_CEST

-- DROP TABLE public."NCM_CEST";

CREATE TABLE public."NCM_CEST"
(
    "IDNCM" bigint,
    "IDCEST" bigint,
    CONSTRAINT "FK_CEST" FOREIGN KEY ("IDCEST")
        REFERENCES public."CEST" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_NCM" FOREIGN KEY ("IDNCM")
        REFERENCES public."NCM" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NCM_CEST"
    OWNER to postgres;
-- Index: fki_FK_CEST

-- DROP INDEX public."fki_FK_CEST";

CREATE INDEX "fki_FK_CEST"
    ON public."NCM_CEST" USING btree
    ("IDCEST" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_NCM

-- DROP INDEX public."fki_FK_NCM";

CREATE INDEX "fki_FK_NCM"
    ON public."NCM_CEST" USING btree
    ("IDNCM" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.NFCE

-- DROP TABLE public."NFCE";

CREATE TABLE public."NFCE"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NUM_NOTA" character varying(20) COLLATE pg_catalog."default",
    "SERIE" character varying(20) COLLATE pg_catalog."default",
    "CHAVE_ACESSO" character varying(50) COLLATE pg_catalog."default",
    "DATA_ENVIO" date,
    "XML" xml[],
    "PATH_XML" character varying(200) COLLATE pg_catalog."default",
    "PATH_DANFE" character varying(200) COLLATE pg_catalog."default",
    "DADOS_ADICIONAIS" character varying(255) COLLATE pg_catalog."default",
    "OUTRAS_INFORMACOES" character varying(255) COLLATE pg_catalog."default",
    "IDVENDA" bigint,
    "IDNFCESTATUS" bigint,
    CONSTRAINT "NFCE_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_NFCE_NFCESTATUS" FOREIGN KEY ("IDNFCESTATUS")
        REFERENCES public."NFCE_STATUS" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_NFCE_VENDA" FOREIGN KEY ("IDVENDA")
        REFERENCES public."VENDA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFCE"
    OWNER to postgres;
-- Index: fki_FK_NFCE_NFCESTATUS

-- DROP INDEX public."fki_FK_NFCE_NFCESTATUS";

CREATE INDEX "fki_FK_NFCE_NFCESTATUS"
    ON public."NFCE" USING btree
    ("IDNFCESTATUS" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_NFCE_VENDA

-- DROP INDEX public."fki_FK_NFCE_VENDA";

CREATE INDEX "fki_FK_NFCE_VENDA"
    ON public."NFCE" USING btree
    ("IDVENDA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.NFCE_STATUS

-- DROP TABLE public."NFCE_STATUS";

CREATE TABLE public."NFCE_STATUS"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "STATUS" bit varying(20),
    "DESCRICAO" bit varying(80),
    CONSTRAINT "NFCE_STATUS_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFCE_STATUS"
    OWNER to postgres;

-- Table: public.NFE

-- DROP TABLE public."NFE";

CREATE TABLE public."NFE"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NUM_NOTA" character varying(20) COLLATE pg_catalog."default",
    "SERIE" character varying(20) COLLATE pg_catalog."default",
    "CHAVE_ACESSO" character varying(50) COLLATE pg_catalog."default",
    "DATA_ENVIO" date,
    "XML" xml[],
    "PATH_XML" character varying(200) COLLATE pg_catalog."default",
    "PATH_DANFE" character varying(200) COLLATE pg_catalog."default",
    "DADOS_ADICIONAIS" character varying(255) COLLATE pg_catalog."default",
    "OUTRAS_INFORMACOES" character varying(255) COLLATE pg_catalog."default",
    "IDVENDA" bigint,
    "IDNFESTATUS" bigint,
    CONSTRAINT "NFE_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_NFE_NFESTATUS" FOREIGN KEY ("IDNFESTATUS")
        REFERENCES public."NFE_STATUS" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_NFE_VENDA" FOREIGN KEY ("IDVENDA")
        REFERENCES public."VENDA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFE"
    OWNER to postgres;
-- Index: fki_FK_NFE_NFESTATUS

-- DROP INDEX public."fki_FK_NFE_NFESTATUS";

CREATE INDEX "fki_FK_NFE_NFESTATUS"
    ON public."NFE" USING btree
    ("IDNFESTATUS" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_NFE_VENDA

-- DROP INDEX public."fki_FK_NFE_VENDA";

CREATE INDEX "fki_FK_NFE_VENDA"
    ON public."NFE" USING btree
    ("IDVENDA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.NFEENTRADA

-- DROP TABLE public."NFEENTRADA";

CREATE TABLE public."NFEENTRADA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CHAVE_ACESSO" character varying(250)[] COLLATE pg_catalog."default",
    "NUMERO" integer,
    "SERIE" integer,
    "DATA_SAIDA" daterange,
    "DADOS_ADICIONAIS" text COLLATE pg_catalog."default",
    "HORA_SAIDA" time with time zone,
    "IDFORNECEDOR" bigint,
    "DATA_EMISSAO" date,
    CONSTRAINT "NFEENTRADA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_NFEENTRADA_FORNECEDOR" FOREIGN KEY ("IDFORNECEDOR")
        REFERENCES public."FORNECEDOR" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFEENTRADA"
    OWNER to postgres;
-- Index: fki_FK_NFEENTRADA_FORNECEDOR

-- DROP INDEX public."fki_FK_NFEENTRADA_FORNECEDOR";

CREATE INDEX "fki_FK_NFEENTRADA_FORNECEDOR"
    ON public."NFEENTRADA" USING btree
    ("IDFORNECEDOR" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.NFEENTRADA_IMPOSTO

-- DROP TABLE public."NFEENTRADA_IMPOSTO";

CREATE TABLE public."NFEENTRADA_IMPOSTO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "BASE_ICMS" numeric(15,3),
    "VALOR_ICMS" numeric(15,2),
    "BASE_ICMS_ST" numeric(15,3),
    "VALOR_ICMS_ST" numeric(15,2),
    "VALOR_TOTAL_PRODUTOS" numeric(15,2),
    "VALOR_FRETE" numeric(15,2),
    "VALOR_SEGURO" numeric(15,2),
    "VALOR_DESCONTO" numeric(15,2),
    "VALOR_OUT_DESP" numeric(15,2),
    "VALOR_IPI" numeric(15,2),
    "VALOR_TOTAL_NOTA" numeric(15,2),
    "IDNFEENTRADA" bigint,
    CONSTRAINT "NFEENTRADA_IMPOSTO_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_NFEENTRADA_IMPOSTO_NFEENTRADA" FOREIGN KEY ("IDNFEENTRADA")
        REFERENCES public."NFEENTRADA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFEENTRADA_IMPOSTO"
    OWNER to postgres;
-- Index: fki_FK_NFEENTRADA_IMPOSTO_NFEENTRADA

-- DROP INDEX public."fki_FK_NFEENTRADA_IMPOSTO_NFEENTRADA";

CREATE INDEX "fki_FK_NFEENTRADA_IMPOSTO_NFEENTRADA"
    ON public."NFEENTRADA_IMPOSTO" USING btree
    ("IDNFEENTRADA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.NFEENTRADA_TRANSPORTADORA

-- DROP TABLE public."NFEENTRADA_TRANSPORTADORA";

CREATE TABLE public."NFEENTRADA_TRANSPORTADORA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "RAZAO_SOCIAL" character varying(200) COLLATE pg_catalog."default",
    "ENDERECO" character varying(150) COLLATE pg_catalog."default",
    "FRETE_CONTA" "char",
    "ANTT" character varying(80) COLLATE pg_catalog."default",
    "PLACA" character varying(15) COLLATE pg_catalog."default",
    "UF_VEIC" character varying(2) COLLATE pg_catalog."default",
    "CNPJ" character varying(20) COLLATE pg_catalog."default",
    "MUNICIPIO" character varying(90) COLLATE pg_catalog."default",
    "UF_TRANS" character varying(2) COLLATE pg_catalog."default",
    "IE" character varying(20) COLLATE pg_catalog."default",
    "IDNFEENTRADA" bigint,
    CONSTRAINT "NFEENTRADA_TRANSPORTADORA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_NFEENTRADA_TRANSP_NFEENTRADA" FOREIGN KEY ("IDNFEENTRADA")
        REFERENCES public."NFEENTRADA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFEENTRADA_TRANSPORTADORA"
    OWNER to postgres;
-- Index: fki_FK_NFEENTRADA_TRANSP_NFEENTRADA

-- DROP INDEX public."fki_FK_NFEENTRADA_TRANSP_NFEENTRADA";

CREATE INDEX "fki_FK_NFEENTRADA_TRANSP_NFEENTRADA"
    ON public."NFEENTRADA_TRANSPORTADORA" USING btree
    ("IDNFEENTRADA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.NFEENTRADA_VOLUME

-- DROP TABLE public."NFEENTRADA_VOLUME";

CREATE TABLE public."NFEENTRADA_VOLUME"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "QTD" integer,
    "ESPECIE" character varying(10) COLLATE pg_catalog."default",
    "MARCA" character varying(50) COLLATE pg_catalog."default",
    "NUMERACAO" character varying(10) COLLATE pg_catalog."default",
    "PESO_BRUTO" numeric(15,2),
    "PESO_LIQUIDO" numeric(15,2),
    "IDNFEENTRADA" bigint,
    CONSTRAINT "NFEENTRADA_VOLUME_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_NFEENTRADA_VOLUME_NFEENTRADA" FOREIGN KEY ("IDNFEENTRADA")
        REFERENCES public."NFEENTRADA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFEENTRADA_VOLUME"
    OWNER to postgres;
-- Index: fki_FK_NFEENTRADA_VOLUME_NFEENTRADA

-- DROP INDEX public."fki_FK_NFEENTRADA_VOLUME_NFEENTRADA";

CREATE INDEX "fki_FK_NFEENTRADA_VOLUME_NFEENTRADA"
    ON public."NFEENTRADA_VOLUME" USING btree
    ("IDNFEENTRADA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.NFE_STATUS

-- DROP TABLE public."NFE_STATUS";

CREATE TABLE public."NFE_STATUS"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "STATUS" bit varying(20),
    "DESCRICAO" bit varying(80),
    CONSTRAINT "NFE_STATUS_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFE_STATUS"
    OWNER to postgres;

-- Table: public.NFSE

-- DROP TABLE public."NFSE";

CREATE TABLE public."NFSE"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NUM_RPS" character varying(30) COLLATE pg_catalog."default",
    "SERIE_RPS" character varying(30) COLLATE pg_catalog."default",
    "DATA_RPS" date,
    "NUM_NOTA" character varying(30) COLLATE pg_catalog."default",
    "DATA_EMISSAO" date,
    "CPF_CNPJ_TOMADOR" character varying(20) COLLATE pg_catalog."default",
    "IM_TOMADOR" character varying(20) COLLATE pg_catalog."default",
    "RAZAO_SOCIAL_TOMADOR" character varying(200) COLLATE pg_catalog."default",
    "FANTASIA_TOMADOR" character varying(200) COLLATE pg_catalog."default",
    "ENDERECO_TOMADOR" character varying(150) COLLATE pg_catalog."default",
    "NUMERO_TOMADOR" integer,
    "COMPLEMENTO_TOMADOR" character varying(80) COLLATE pg_catalog."default",
    "CIDADE_TOMADOR" character varying(100) COLLATE pg_catalog."default",
    "TELEFONE_TOMADOR" character varying(15) COLLATE pg_catalog."default",
    "EMAIL_TOMADOR" character varying(200) COLLATE pg_catalog."default",
    "SERVICO" character varying(200) COLLATE pg_catalog."default",
    "ALIQ_ISSQN" numeric(15,3),
    "TOTAL_ISSQN" numeric(15,2),
    "ISSQN_RETIDO" numeric(15,2),
    "PIS" numeric(15,2),
    "COFINS" numeric(15,2),
    "CSLL" numeric(15,2),
    "ISSQN_ST" numeric(15,2),
    "VALOR_TOTAL" numeric(15,2),
    "IDVENDA" bigint,
    CONSTRAINT "NFSE_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_NFSE_VENDA" FOREIGN KEY ("IDVENDA")
        REFERENCES public."VENDA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."NFSE"
    OWNER to postgres;
-- Index: fki_FK_NFSE_VENDA

-- DROP INDEX public."fki_FK_NFSE_VENDA";

CREATE INDEX "fki_FK_NFSE_VENDA"
    ON public."NFSE" USING btree
    ("IDVENDA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.PEDIDO

-- DROP TABLE public."PEDIDO";

CREATE TABLE public."PEDIDO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "DATA" date,
    "STATUS" character varying(2) COLLATE pg_catalog."default",
    "VALOR_TOTAL" numeric(15,2),
    "IDMESA" bigint,
    "IDFUNCIONARIO" bigint,
    CONSTRAINT "PEDIDO_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_PEDIDO_FUNCIONARIO" FOREIGN KEY ("IDFUNCIONARIO")
        REFERENCES public."FUNCIONARIO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_PEDIDO_MESA" FOREIGN KEY ("IDMESA")
        REFERENCES public."MESA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PEDIDO"
    OWNER to postgres;

-- Table: public.PEDIDO_ITEM

-- DROP TABLE public."PEDIDO_ITEM";

CREATE TABLE public."PEDIDO_ITEM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "QUANTIDADE" integer,
    "VALOR_UN" numeric(15,2),
    "VALOR_TOTAL" numeric(15,2),
    "VALOR_ICMS" numeric(15,2),
    "VALOR_PIS" numeric(15,2),
    "VALOR_IPI" numeric(15,2),
    "VALOR_ICMSST" numeric(15,2),
    "VALOR_COFINS" numeric(15,2),
    "IDPEDIDO" bigint,
    "IDPRODUTO" bigint,
    CONSTRAINT "PEDIDO_ITEM_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_PEDIDO_ITEM_PEDIDO" FOREIGN KEY ("IDPEDIDO")
        REFERENCES public."PEDIDO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_PEDIDO_ITEM_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PEDIDO_ITEM"
    OWNER to postgres;

-- Table: public.PERFIL_USUARIO

-- DROP TABLE public."PERFIL_USUARIO";

CREATE TABLE public."PERFIL_USUARIO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "PERFIL" character varying(80) COLLATE pg_catalog."default",
    "GERAL" character varying(80) COLLATE pg_catalog."default",
    "FINANCEIRO" character varying(80) COLLATE pg_catalog."default",
    "ESTOQUE" character varying(80) COLLATE pg_catalog."default",
    "VENDAS" character varying(80) COLLATE pg_catalog."default",
    "PEDIDO" character varying(80) COLLATE pg_catalog."default",
    "FISCAL" character varying(80) COLLATE pg_catalog."default",
    "DFE" character varying(80) COLLATE pg_catalog."default",
    "IDUSUARIO" bigint,
    CONSTRAINT "PERFIL_USUARIO_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_PERFIL_USUARIO" FOREIGN KEY ("IDUSUARIO")
        REFERENCES public."USUARIO" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PERFIL_USUARIO"
    OWNER to postgres;
-- Index: fki_FK_PERFIL_USUARIO

-- DROP INDEX public."fki_FK_PERFIL_USUARIO";

CREATE INDEX "fki_FK_PERFIL_USUARIO"
    ON public."PERFIL_USUARIO" USING btree
    ("IDUSUARIO" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.PESSOA

-- DROP TABLE public."PESSOA";

CREATE TABLE public."PESSOA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NOME" bit varying(200),
    "ENDERECO" bit varying(150),
    "NUMERO" bigint,
    "BAIRRO" bit varying(150),
    "COMPLEMENTO" bit varying(150),
    "CEP" bit varying(10),
    "EMAIL" bit varying(255),
    "DATA_NASC" date,
    "DATA_CAD" date,
    "TELEFONE" bit varying(20),
    "CELULAR" bit varying(20),
    "IDCIDADE" bigint,
    CONSTRAINT "PESSOA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_CIDADE" FOREIGN KEY ("IDCIDADE")
        REFERENCES public."CIDADE" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PESSOA"
    OWNER to postgres;
-- Index: fki_FK_CIDADE

-- DROP INDEX public."fki_FK_CIDADE";

CREATE INDEX "fki_FK_CIDADE"
    ON public."PESSOA" USING btree
    ("IDCIDADE" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.PESSOA_FISICA

-- DROP TABLE public."PESSOA_FISICA";

CREATE TABLE public."PESSOA_FISICA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "RG" bit varying(10),
    "CPF" bit varying(11),
    "IDPESSOA" bigint,
    CONSTRAINT "PESSOA_FISICA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_PESSOA" FOREIGN KEY ("IDPESSOA")
        REFERENCES public."PESSOA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PESSOA_FISICA"
    OWNER to postgres;
-- Index: fki_FK_PESSOA

-- DROP INDEX public."fki_FK_PESSOA";

CREATE INDEX "fki_FK_PESSOA"
    ON public."PESSOA_FISICA" USING btree
    ("IDPESSOA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.PESSOA_JURIDICA

-- DROP TABLE public."PESSOA_JURIDICA";

CREATE TABLE public."PESSOA_JURIDICA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CNPJ" bit varying(20),
    "RAZAO_SOCIAL" bit varying(200),
    "FANTASIA" bit varying(200),
    "IE" bit varying(20),
    "IM" bit varying(20),
    "IDPESSOA" bigint,
    CONSTRAINT "PESSOA_JURIDICA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_PESSOA" FOREIGN KEY ("IDPESSOA")
        REFERENCES public."PESSOA" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PESSOA_JURIDICA"
    OWNER to postgres;
-- Index: fki_FK_PESSOA_1

-- DROP INDEX public."fki_FK_PESSOA_1";

CREATE INDEX "fki_FK_PESSOA_1"
    ON public."PESSOA_JURIDICA" USING btree
    ("IDPESSOA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.PLANO_CONTAS

-- DROP TABLE public."PLANO_CONTAS";

CREATE TABLE public."PLANO_CONTAS"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "CODIGO" bigint,
    "DESCRICAO" bit varying(80),
    CONSTRAINT "PLANO_CONTAS_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PLANO_CONTAS"
    OWNER to postgres;

-- Table: public.PRODUTO

-- DROP TABLE public."PRODUTO";

CREATE TABLE public."PRODUTO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "DESCRICAO" character varying(100) COLLATE pg_catalog."default",
    "BARRAS" character varying(13) COLLATE pg_catalog."default",
    "QUANTIDADE" numeric(15,3),
    "ESTOQUE" numeric(15,3),
    "CRITICO" numeric(15,3),
    "PRECO_CUSTO" numeric(15,2),
    "PRECO_VENDA" numeric(15,2),
    "MARKUP" numeric(15,3),
    "UNIDADE" character varying(2) COLLATE pg_catalog."default",
    "IDNCM" bigint,
    "IDCEST" bigint,
    "IDCFOP" bigint,
    "IDGRUPO" bigint,
    CONSTRAINT "PRODUTO_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_PRODUTO_CEST" FOREIGN KEY ("IDCEST")
        REFERENCES public."CEST" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_PRODUTO_CFOP" FOREIGN KEY ("IDCFOP")
        REFERENCES public."CFOP" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_PRODUTO_GRUPO" FOREIGN KEY ("IDGRUPO")
        REFERENCES public."GRUPO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_PRODUTO_NCM" FOREIGN KEY ("IDNCM")
        REFERENCES public."NCM" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PRODUTO"
    OWNER to postgres;

-- Table: public.PRODUTO_COMPOSTO

-- DROP TABLE public."PRODUTO_COMPOSTO";

CREATE TABLE public."PRODUTO_COMPOSTO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "INGREDIENTES" character varying(250)[] COLLATE pg_catalog."default",
    "VALOR_TOTAL" numeric,
    "ATIVO" "char",
    CONSTRAINT "PRODUTO_COMPOSTO_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PRODUTO_COMPOSTO"
    OWNER to postgres;

-- Table: public.PRODUTO_COMPOSTO_ITEM

-- DROP TABLE public."PRODUTO_COMPOSTO_ITEM";

CREATE TABLE public."PRODUTO_COMPOSTO_ITEM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "VALOR" numeric(15,2),
    "QUANTIDADE" numeric(15,3),
    "DESCONTO" numeric(15,2),
    "VALOR_TOTAL" numeric(15,2),
    "IDPROD_COMPOSTO" bigint NOT NULL,
    "IDPRODUTO" bigint,
    CONSTRAINT "PRODUTO_COMPOSTO_ITEM_pkey" PRIMARY KEY ("IDPROD_COMPOSTO"),
    CONSTRAINT "FK_PROD_COMP_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "FK_PROD_COMP_PROD_COMP_ITEM" FOREIGN KEY ("IDPROD_COMPOSTO")
        REFERENCES public."PRODUTO_COMPOSTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PRODUTO_COMPOSTO_ITEM"
    OWNER to postgres;
-- Index: fki_FK_PROD_COMP_PRODUTO

-- DROP INDEX public."fki_FK_PROD_COMP_PRODUTO";

CREATE INDEX "fki_FK_PROD_COMP_PRODUTO"
    ON public."PRODUTO_COMPOSTO_ITEM" USING btree
    ("IDPRODUTO" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.PROMOCAO

-- DROP TABLE public."PROMOCAO";

CREATE TABLE public."PROMOCAO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "TITULO" character varying(80)[] COLLATE pg_catalog."default",
    "DATA_COMECA" date,
    "DATA_FIM" date,
    CONSTRAINT "PROMOCAO_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PROMOCAO"
    OWNER to postgres;

-- Table: public.PROMOCAO_ITEM

-- DROP TABLE public."PROMOCAO_ITEM";

CREATE TABLE public."PROMOCAO_ITEM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "VALOR" numeric(15,2),
    "DESCONTO" numeric(15,3),
    "VALOR_DESCONTO" numeric(15,2),
    "VALOR_TOTAL" numeric(15,2),
    "IDPROMOCAO" bigint,
    "IDPRODUTO" bigint,
    "IDPRODCOMPOSTO" bigint,
    CONSTRAINT "PROMOCAO_ITEM_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_PROMOCAO_ITEM_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "FK_PROMOCAO_ITEM_PROMOCAO" FOREIGN KEY ("IDPROMOCAO")
        REFERENCES public."PROMOCAO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_PROMO_ITEM_PROD_COMPOSTO" FOREIGN KEY ("IDPRODCOMPOSTO")
        REFERENCES public."PRODUTO_COMPOSTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PROMOCAO_ITEM"
    OWNER to postgres;
-- Index: fki_FK_PROMOCAO_ITEM_PRODUTO

-- DROP INDEX public."fki_FK_PROMOCAO_ITEM_PRODUTO";

CREATE INDEX "fki_FK_PROMOCAO_ITEM_PRODUTO"
    ON public."PROMOCAO_ITEM" USING btree
    ("IDPRODUTO" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_PROMOCAO_ITEM_PROMOCAO

-- DROP INDEX public."fki_FK_PROMOCAO_ITEM_PROMOCAO";

CREATE INDEX "fki_FK_PROMOCAO_ITEM_PROMOCAO"
    ON public."PROMOCAO_ITEM" USING btree
    ("IDPROMOCAO" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_PROMO_ITEM_PROD_COMPOSTO

-- DROP INDEX public."fki_FK_PROMO_ITEM_PROD_COMPOSTO";

CREATE INDEX "fki_FK_PROMO_ITEM_PROD_COMPOSTO"
    ON public."PROMOCAO_ITEM" USING btree
    ("IDPRODCOMPOSTO" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.RESERVA

-- DROP TABLE public."RESERVA";

CREATE TABLE public."RESERVA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "STATUS" character varying(1) COLLATE pg_catalog."default",
    "DATA" date,
    "HORARIO" time(6) without time zone,
    "NOME_CLIENTE" character varying(80) COLLATE pg_catalog."default",
    "TEL_CLIENTE" character varying(20) COLLATE pg_catalog."default",
    "IDMESA" bigint,
    CONSTRAINT "RESERVA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_RESERVA_MESA" FOREIGN KEY ("IDMESA")
        REFERENCES public."MESA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."RESERVA"
    OWNER to postgres;

-- Table: public.TRANSPORTADORA

-- DROP TABLE public."TRANSPORTADORA";

CREATE TABLE public."TRANSPORTADORA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "PLACA" character varying(20) COLLATE pg_catalog."default",
    "ANTT" character varying(20) COLLATE pg_catalog."default",
    "IDPESSOA" bigint,
    CONSTRAINT "TRANSPORTADORA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_TRANSPORTADORA_PESSOA" FOREIGN KEY ("IDPESSOA")
        REFERENCES public."PESSOA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."TRANSPORTADORA"
    OWNER to postgres;

-- Table: public.TRIBUTACAO

-- DROP TABLE public."TRIBUTACAO";

CREATE TABLE public."TRIBUTACAO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NCM" character varying(20) COLLATE pg_catalog."default",
    "CEST" character varying(20) COLLATE pg_catalog."default",
    "VALOR_ICMS" numeric(15,2),
    "VALOR_ICMSST" numeric(15,2),
    "VALOR_IPI" numeric(15,2),
    "VALOR_PIS" numeric(15,2),
    "VALOR_COFINS" numeric(15,2),
    "BC_ICMS" numeric(15,3),
    "BC_ICMSST" numeric(15,3),
    "BC_IPI" numeric(15,3),
    "BC_PIS" numeric(15,3),
    "BC_COFINS" numeric(15,3),
    "ALIQ_ICMS" numeric(15,3),
    "ALIQ_ICMSST" numeric(15,3),
    "ALIQ_IPI" numeric(15,3),
    "ALIQ_PIS" numeric(15,3),
    "ALIQ_COFINS" numeric(15,3),
    "IDNCM" bigint,
    "IDCEST" bigint,
    "IDICMS" bigint NOT NULL,
    "IDIPI" bigint,
    "IDICMSST" bigint,
    "IDCOFINS" bigint,
    "IDPIS" bigint,
    "IDCSOSN" bigint,
    CONSTRAINT "TRIBUTACAO_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_TRIBUTACAO_CEST" FOREIGN KEY ("IDCEST")
        REFERENCES public."CEST" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_TRIBUTACAO_COFINS" FOREIGN KEY ("IDCOFINS")
        REFERENCES public."CST_COFINS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_TRIBUTACAO_CSOSN" FOREIGN KEY ("IDCSOSN")
        REFERENCES public."CSOSN" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_TRIBUTACAO_CST_ICMS" FOREIGN KEY ("IDICMS")
        REFERENCES public."CST_ICMS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_TRIBUTACAO_CST_ICMSST" FOREIGN KEY ("IDICMSST")
        REFERENCES public."CST_ICMS_ST" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_TRIBUTACAO_CST_IPI" FOREIGN KEY ("IDIPI")
        REFERENCES public."CST_IPI" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_TRIBUTACAO_CST_PIS" FOREIGN KEY ("IDPIS")
        REFERENCES public."CST_PIS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_TRIBUTACAO_NCM" FOREIGN KEY ("IDNCM")
        REFERENCES public."NCM" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."TRIBUTACAO"
    OWNER to postgres;
-- Index: fki_FK_TRIBUTACAO_COFINS

-- DROP INDEX public."fki_FK_TRIBUTACAO_COFINS";

CREATE INDEX "fki_FK_TRIBUTACAO_COFINS"
    ON public."TRIBUTACAO" USING btree
    ("IDCOFINS" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_TRIBUTACAO_CSOSN

-- DROP INDEX public."fki_FK_TRIBUTACAO_CSOSN";

CREATE INDEX "fki_FK_TRIBUTACAO_CSOSN"
    ON public."TRIBUTACAO" USING btree
    ("IDCSOSN" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_TRIBUTACAO_CST_ICMS

-- DROP INDEX public."fki_FK_TRIBUTACAO_CST_ICMS";

CREATE INDEX "fki_FK_TRIBUTACAO_CST_ICMS"
    ON public."TRIBUTACAO" USING btree
    ("IDICMS" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_TRIBUTACAO_CST_ICMSST

-- DROP INDEX public."fki_FK_TRIBUTACAO_CST_ICMSST";

CREATE INDEX "fki_FK_TRIBUTACAO_CST_ICMSST"
    ON public."TRIBUTACAO" USING btree
    ("IDICMSST" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_TRIBUTACAO_CST_IPI

-- DROP INDEX public."fki_FK_TRIBUTACAO_CST_IPI";

CREATE INDEX "fki_FK_TRIBUTACAO_CST_IPI"
    ON public."TRIBUTACAO" USING btree
    ("IDIPI" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_TRIBUTACAO_CST_PIS

-- DROP INDEX public."fki_FK_TRIBUTACAO_CST_PIS";

CREATE INDEX "fki_FK_TRIBUTACAO_CST_PIS"
    ON public."TRIBUTACAO" USING btree
    ("IDPIS" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.UF

-- DROP TABLE public."UF";

CREATE TABLE public."UF"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "UF" bit varying(2)[],
    CONSTRAINT "UF_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."UF"
    OWNER to postgres;

-- Table: public.USUARIO

-- DROP TABLE public."USUARIO";

CREATE TABLE public."USUARIO"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NOME" character varying(100) COLLATE pg_catalog."default",
    "LOGIN" character varying(150) COLLATE pg_catalog."default",
    "SENHA" character varying(10) COLLATE pg_catalog."default",
    "FOTO" character varying(255) COLLATE pg_catalog."default",
    "ATIVO" "char",
    CONSTRAINT "USUARIO_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."USUARIO"
    OWNER to postgres;

-- Table: public.VENDA

-- DROP TABLE public."VENDA";

CREATE TABLE public."VENDA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "NUM_NOTA" bit varying(20),
    "CONTADOR" bigint,
    "VALOR_TOTAL" numeric(15,2),
    "IDCLIENTE" bigint,
    "IDFUNCIONARIO" bigint,
    "IDPGTO" bigint,
    "IDCARTAO" bigint,
    "DATA_VENDA" date,
    CONSTRAINT "VENDA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_VENDA_CARTAO" FOREIGN KEY ("IDCARTAO")
        REFERENCES public."CARTAO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_VENDA_CLIENTE" FOREIGN KEY ("IDCLIENTE")
        REFERENCES public."CLIENTE" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_VENDA_FUNCIONARIO" FOREIGN KEY ("IDFUNCIONARIO")
        REFERENCES public."FUNCIONARIO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_VENDA_TIPO_PGTO" FOREIGN KEY ("IDPGTO")
        REFERENCES public."FORMA_PGTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."VENDA"
    OWNER to postgres;

-- Table: public.VENDA_ITEM

-- DROP TABLE public."VENDA_ITEM";

CREATE TABLE public."VENDA_ITEM"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "QUANTIDADE" numeric(15,3),
    "VALOR_UN" numeric(15,2),
    "VALOR_TOTAL" numeric(15,2),
    "VALOR_DESCONTO" numeric(15,2),
    "VALOR_ICMS" numeric(15,2),
    "VALOR-IPI" numeric(15,2),
    "VALOR_PIS" numeric(15,2),
    "VALOR_COFINS" numeric(15,2),
    "VALOR_ICMSST" numeric(15,2),
    "BC_ICMS" numeric(15,3),
    "BC_IPI" numeric(15,2),
    "BC_PIS" numeric(15,2),
    "BC_COFINS" numeric(15,2),
    "BC_ICMSST" numeric(15,2),
    "IDVENDA" bigint,
    "IDPRODUTO" bigint,
    CONSTRAINT "VENDA_ITEM_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_VENDA_ITEM_PRODUTO" FOREIGN KEY ("IDPRODUTO")
        REFERENCES public."PRODUTO" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_VENDA_ITEM_VENDA" FOREIGN KEY ("IDVENDA")
        REFERENCES public."VENDA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."VENDA_ITEM"
    OWNER to postgres;
-- Index: fki_FK_VENDA_ITEM_PRODUTO

-- DROP INDEX public."fki_FK_VENDA_ITEM_PRODUTO";

CREATE INDEX "fki_FK_VENDA_ITEM_PRODUTO"
    ON public."VENDA_ITEM" USING btree
    ("IDPRODUTO" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_FK_VENDA_ITEM_VENDA

-- DROP INDEX public."fki_FK_VENDA_ITEM_VENDA";

CREATE INDEX "fki_FK_VENDA_ITEM_VENDA"
    ON public."VENDA_ITEM" USING btree
    ("IDVENDA" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.VENDA_TRANSPORTADORA

-- DROP TABLE public."VENDA_TRANSPORTADORA";

CREATE TABLE public."VENDA_TRANSPORTADORA"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "PLACA" bit varying(15),
    "VEICULO" bit varying(60),
    "ANTT" bit varying(20),
    "TIPO_FRETE" bit varying(1),
    "IDVENDA" bigint,
    "IDTRANSPORTADORA" bigint,
    CONSTRAINT "VENDA_TRANSPORTADORA_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_VENDA_TRANSPORTADORA_TRANSPORTADORA" FOREIGN KEY ("IDTRANSPORTADORA")
        REFERENCES public."TRANSPORTADORA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_VENDA_TRANSPORTADORA_VENDA" FOREIGN KEY ("IDVENDA")
        REFERENCES public."VENDA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."VENDA_TRANSPORTADORA"
    OWNER to postgres;

-- Table: public.VENDA_VOLUME

-- DROP TABLE public."VENDA_VOLUME";

CREATE TABLE public."VENDA_VOLUME"
(
    "ID" bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 0 MINVALUE 0 MAXVALUE 9999999 CACHE 1 ),
    "QUANTIDADE" integer,
    "PESO_BRUTO" numeric(15,3),
    "PESO_LIQUIDO" numeric(15,3),
    "ESPECIE" character varying(80) COLLATE pg_catalog."default",
    "MARCA" bit varying(80),
    "NUMERO" bit varying(20),
    "IDVENDA" bigint,
    CONSTRAINT "VENDA_VOLUME_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "FK_VENDA_VOLUME_VENDA" FOREIGN KEY ("IDVENDA")
        REFERENCES public."VENDA" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."VENDA_VOLUME"
    OWNER to postgres;


