--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-07 23:16:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16397)
-- Name: pgagent; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgagent;


ALTER SCHEMA pgagent OWNER TO postgres;

--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA pgagent; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';


--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 3 (class 3079 OID 16398)
-- Name: pgagent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;


--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgagent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';


--
-- TOC entry 320 (class 1255 OID 17449)
-- Name: adotante_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.adotante_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimAdontante" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimAdontante" 
		SET "IdUsuarioAdotante" = NEW."IdUsuarioAdotante" 
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimAdontante" ("Id","IdUsuarioAdotante")
		VALUES (NEW."Id",NEW."IdUsuarioAdotante");	
	END IF;
	RETURN NULL; 
END;

$$;


ALTER FUNCTION public.adotante_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 324 (class 1255 OID 17368)
-- Name: animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "FactAnimal" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "FactAnimal" 
		SET "Nome" = NEW."Nome" ,
			"NomeFinal" = NEW."NomeFinal" ,
			"IdTipoAnimal" = NEW."IdTipoAnimal" ,
			"IdCorPelo" = NEW."IdCorPelo" ,
			"IdadeAnos" = NEW."IdadeAnos" ,
			"IdadeMeses" = NEW."IdadeMeses" ,
			"Peso" = NEW."Peso" ,
			"IdPorte" = NEW."IdPorte" ,
			"Adestravel" = NEW."Adestravel" ,
			"Foto" = NEW."Foto" ,
			"Historia" = NEW."Historia" ,
			"IdProcedimentoPadrao" = NEW."IdProcedimentoPadrao" ,
			"DespesaMensal" = NEW."DespesaMensal" ,
			"Falecido" = NEW."Falecido" ,
			"IdCausaFalecimento" = NEW."IdCausaFalecimento" ,
			"IdLarTemporario" = NEW."IdLarTemporario" ,
			"IdGenero" = NEW."IdGenero" ,
			"DataResgate" = CAST(NEW."DataResgate" AS DATE) ,
			"DataCadastro" = CAST(NEW."DataCadastro" AS DATE) ,
			"DataDivulgacao" = CAST(NEW."DataDivulgacao" AS DATE) ,
			"DataFalecimento" = CAST(NEW."DataFalecimento" AS DATE)
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "FactAnimal" ("Id","Nome","NomeFinal","IdTipoAnimal","IdCorPelo","IdadeAnos","IdadeMeses","Peso","IdPorte","Adestravel","Foto","Historia","IdProcedimentoPadrao","DespesaMensal","Falecido","IdCausaFalecimento","IdLarTemporario","DataResgate","DataCadastro","DataDivulgacao","DataFalecimento","IdGenero")
		VALUES (NEW."Id",NEW."Nome",NEW."NomeFinal",NEW."IdTipoAnimal",NEW."IdCorPelo",NEW."IdadeAnos",NEW."IdadeMeses",NEW."Peso",NEW."IdPorte",NEW."Adestravel",NEW."Foto",NEW."Historia",NEW."IdProcedimentoPadrao",NEW."DespesaMensal",NEW."Falecido",NEW."IdCausaFalecimento",NEW."IdLarTemporario",CAST(NEW."DataResgate" AS DATE),CAST(NEW."DataCadastro" AS DATE),CAST(NEW."DataDivulgacao" AS DATE),CAST(NEW."DataFalecimento" AS DATE),NEW."IdGenero");
	END IF;
	RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$$;


ALTER FUNCTION public.animal_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 17419)
-- Name: causa_falecimento_animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.causa_falecimento_animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimCausaFalecimento" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimCausaFalecimento" 
		SET "CausaDesc" = NEW."CausaDesc" 
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimCausaFalecimento" ("Id","CausaDesc")
		VALUES (NEW."Id",NEW."CausaDesc");	
	END IF;
	RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$$;


ALTER FUNCTION public.causa_falecimento_animal_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 17444)
-- Name: controle_doacao_categoria_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.controle_doacao_categoria_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimControleDoacaoCategoria" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimControleDoacaoCategoria" 
		SET "Categoria" = NEW."Categoria" 
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimControleDoacaoCategoria" ("Id","Categoria")
		VALUES (NEW."Id",NEW."Categoria");		
	END IF;
	RETURN NULL; 
END;

$$;


ALTER FUNCTION public.controle_doacao_categoria_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 17456)
-- Name: controle_doacao_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.controle_doacao_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "FactControleDoacao" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "FactControleDoacao" 
		SET "IdPadrinhoDoador" = NEW."IdPadrinhoDoador",
			"DataEntrada" = CAST(NEW."DataEntrada" AS DATE),
			"ValorRealEntrada" = ROUND(NEW."ValorRealEntrada",2),
			"Recebido" = NEW."Recebido",
			"Cobranca" = NEW."Cobranca",
			"IdCategoria" = NEW."IdCategoria",
			"IdListaBanco" = NEW."IdListaBanco",
			"IdListaStatusDoacao" = NEW."IdListaStatusDoacao",
			"Observacao" = NEW."Observacao"
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "FactControleDoacao" ("Id","IdPadrinhoDoador","DataEntrada","ValorRealEntrada","Recebido",
		"Cobranca","IdCategoria","IdListaBanco","IdListaStatusDoacao","Observacao")
		VALUES (NEW."Id",NEW."IdPadrinhoDoador",CAST(NEW."DataEntrada" AS DATE),ROUND(NEW."ValorRealEntrada",2),NEW."Recebido",
		NEW."Cobranca",NEW."IdCategoria",NEW."IdListaBanco",NEW."IdListaStatusDoacao",NEW."Observacao");
	END IF;
	RETURN NULL; 
END;

$$;


ALTER FUNCTION public.controle_doacao_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 17411)
-- Name: cor_pelo_animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cor_pelo_animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimCorPelo" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimCorPelo" SET "CorPeloDesc" = NEW."CorPeloDesc" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimCorPelo" ("Id","CorPeloDesc")
		VALUES (NEW."Id",NEW."CorPeloDesc");	
	END IF;
	RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$$;


ALTER FUNCTION public.cor_pelo_animal_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 17409)
-- Name: despesa_fixa_animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.despesa_fixa_animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimDespesaFixa" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimDespesaFixa" 
		SET "TipoDespesa" = NEW."TipoDespesa",
			"ValorDespesa" = ROUND(NEW."ValorDespesa",2),
			"IdPorte" = NEW."IdPorte"
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimDespesaFixa" ("Id","TipoDespesa","ValorDespesa","IdPorte")
		VALUES (NEW."Id",NEW."TipoDespesa",NEW."ValorDespesa",NEW."IdPorte");		
	END IF;
	RETURN NULL; 
END;

$$;


ALTER FUNCTION public.despesa_fixa_animal_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 17439)
-- Name: lista_banco_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.lista_banco_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimListaBanco" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimListaBanco" 
		SET "NomeBanco" = NEW."NomeBanco" 
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimListaBanco" ("Id","NomeBanco")
		VALUES (NEW."Id",NEW."NomeBanco");	
	END IF;
	RETURN NULL; 
END;

$$;


ALTER FUNCTION public.lista_banco_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 17434)
-- Name: lista_status_doacao_animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.lista_status_doacao_animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimListaStatusDoacao" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimListaStatusDoacao" 
		SET "Status" = NEW."Status" 
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimListaStatusDoacao" ("Id","Status")
		VALUES (NEW."Id",NEW."Status");	
	END IF;
	RETURN NULL; 
END;

$$;


ALTER FUNCTION public.lista_status_doacao_animal_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 312 (class 1255 OID 17464)
-- Name: padrinho_doador_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.padrinho_doador_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "FactPadrinhoDoador" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "FactPadrinhoDoador" 
		SET "IdUsuarioPadrinhoDoador"  = NEW."IdUsuarioPadrinhoDoador",
		"Tipo" = NEW."Tipo",
		"Meio" = NEW."Meio",
		"IdCadastroAnimal" = NEW."IdCadastroAnimal",
		"ValorAcordado" = ROUND(NEW."ValorAcordado",2),
		"DoadorAtivo" = NEW."DoadorAtivo",
		"IdGrupoStatus" = NEW."IdGrupoStatus",
		"MotivoSaidaGrupo" = NEW."MotivoSaidaGrupo",
		"IntencaoRetorno" = NEW."IntencaoRetorno",
		"Observacao" = NEW."Observacao",
		"DataCadastro" = CAST(NEW."DataCadastro" AS DATE)
		WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "FactPadrinhoDoador" ("Id","IdUsuarioPadrinhoDoador","Tipo","Meio","IdCadastroAnimal","ValorAcordado","DoadorAtivo","IdGrupoStatus",
		"MotivoSaidaGrupo","IntencaoRetorno","Observacao","DataCadastro")
		VALUES (NEW."Id",NEW."IdUsuarioPadrinhoDoador",NEW."Tipo",NEW."Meio",NEW."IdCadastroAnimal",ROUND(NEW."ValorAcordado",2),NEW."DoadorAtivo",NEW."IdGrupoStatus",
		NEW."MotivoSaidaGrupo",NEW."IntencaoRetorno",NEW."Observacao",CAST(NEW."DataCadastro" AS DATE));
	END IF;
	RETURN NULL; 
END;
$$;


ALTER FUNCTION public.padrinho_doador_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 17397)
-- Name: porte_animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.porte_animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimPorte" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimPorte" SET "PorteDesc" = NEW."PorteDesc" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimPorte" ("Id","PorteDesc")
	VALUES (NEW."Id",NEW."PorteDesc");	
	END IF;
	RETURN NULL; 
END;

$$;


ALTER FUNCTION public.porte_animal_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 319 (class 1255 OID 17426)
-- Name: registro_adocao_animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.registro_adocao_animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "FactRegistroAdocao" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "FactRegistroAdocao" 
		SET "IdAnimal" = NEW."IdAnimal",
			"DataAdocao" = CAST(NEW."DataAdocao" AS DATE),
			"IdAdotante" = NEW."IdAdotante",
			"MotivoAdocao" = NEW."MotivoAdocao",
			"Termo" = NEW."Termo",
			"Foto" = NEW."Foto",
			"DilvulgacaoGrupoApoiadores" = NEW."DilvulgacaoGrupoApoiadores",
			"TipoMeioAdocao" = NEW."TipoMeioAdocao",
			"AdocaoConcluida" = NEW."AdocaoConcluida",
			"DataCadastro" = CAST(NEW."DataCadastro" AS DATE)
			WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "FactRegistroAdocao" ("Id","IdAnimal","DataAdocao","IdAdotante","MotivoAdocao","Termo","Foto","DilvulgacaoGrupoApoiadores","TipoMeioAdocao","AdocaoConcluida","DataCadastro")
		VALUES (NEW."Id",NEW."IdAnimal",CAST(NEW."DataAdocao" AS DATE),NEW."IdAdotante",NEW."MotivoAdocao",NEW."Termo",NEW."Foto",
		NEW."DilvulgacaoGrupoApoiadores",NEW."TipoMeioAdocao",NEW."AdocaoConcluida",CAST(NEW."DataCadastro" AS DATE));	
	END IF;
	RETURN NULL; 
END;
$$;


ALTER FUNCTION public.registro_adocao_animal_insert_trigger_fnc() OWNER TO postgres;

--
-- TOC entry 318 (class 1255 OID 17392)
-- Name: tipo_animal_insert_trigger_fnc(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tipo_animal_insert_trigger_fnc() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		DELETE FROM "DimTipoAnimal" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'UPDATE') THEN
		UPDATE "DimTipoAnimal" SET "TipoDesc" = NEW."TipoDesc" WHERE "Id" = OLD."Id";
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO "DimTipoAnimal" ("Id","TipoDesc")
		VALUES (NEW."Id",NEW."TipoDesc");	
	END IF;
	RETURN NULL; 
END;
$$;


ALTER FUNCTION public.tipo_animal_insert_trigger_fnc() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 260 (class 1259 OID 17152)
-- Name: Adontante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Adontante" (
    "Id" integer NOT NULL,
    "IdUsuarioAdotante" integer NOT NULL
);


ALTER TABLE public."Adontante" OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17217)
-- Name: Animal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Animal" (
    "Id" integer NOT NULL,
    "Nome" character varying(100) NOT NULL,
    "NomeFinal" character varying(100),
    "IdTipoAnimal" integer NOT NULL,
    "IdCorPelo" integer NOT NULL,
    "IdadeAnos" integer DEFAULT 0,
    "IdadeMeses" integer DEFAULT 0,
    "Peso" numeric NOT NULL,
    "IdPorte" integer NOT NULL,
    "Adestravel" boolean DEFAULT false,
    "Foto" character varying(255),
    "Historia" character varying(4000) NOT NULL,
    "IdProcedimentoPadrao" integer NOT NULL,
    "DespesaMensal" numeric,
    "Falecido" boolean DEFAULT false,
    "IdCausaFalecimento" integer,
    "IdLarTemporario" integer NOT NULL,
    "IdGenero" integer NOT NULL,
    "DataResgate" character varying,
    "DataCadastro" character varying,
    "DataDivulgacao" character varying,
    "DataFalecimento" character varying
);


ALTER TABLE public."Animal" OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 17200)
-- Name: CausaFalecimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CausaFalecimento" (
    "Id" integer NOT NULL,
    "CausaDesc" character varying(100) NOT NULL
);


ALTER TABLE public."CausaFalecimento" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17073)
-- Name: ControleDoacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ControleDoacao" (
    "Id" integer NOT NULL,
    "IdPadrinhoDoador" integer NOT NULL,
    "DataEntrada" date NOT NULL,
    "ValorRealEntrada" numeric NOT NULL,
    "Recebido" boolean NOT NULL,
    "Cobranca" character varying(100) NOT NULL,
    "IdCategoria" integer NOT NULL,
    "IdListaBanco" integer NOT NULL,
    "IdListaStatusDoacao" integer NOT NULL,
    "Observacao" character varying(4000)
);


ALTER TABLE public."ControleDoacao" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17082)
-- Name: ControleDoacaoCategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ControleDoacaoCategoria" (
    "Id" integer NOT NULL,
    "Categoria" character varying(100) NOT NULL
);


ALTER TABLE public."ControleDoacaoCategoria" OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 17216)
-- Name: public.CadastroAnimal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.CadastroAnimal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.CadastroAnimal_id_seq" OWNER TO postgres;

--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 273
-- Name: public.CadastroAnimal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.CadastroAnimal_id_seq" OWNED BY public."Animal"."Id";


--
-- TOC entry 278 (class 1259 OID 17261)
-- Name: CorPelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CorPelo" (
    "Id" integer DEFAULT nextval('public."public.CadastroAnimal_id_seq"'::regclass) NOT NULL,
    "CorPeloDesc" character varying(50) NOT NULL
);


ALTER TABLE public."CorPelo" OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17191)
-- Name: CustoPorResgate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustoPorResgate" (
    "Id" integer NOT NULL,
    "Acao" character varying(100) NOT NULL,
    "CustoMacho" numeric NOT NULL,
    "CustoFemea" numeric NOT NULL,
    "Ativo" boolean NOT NULL,
    "DataCadastro" character varying NOT NULL
);


ALTER TABLE public."CustoPorResgate" OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 17129)
-- Name: DespesaFixa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DespesaFixa" (
    "Id" integer NOT NULL,
    "TipoDespesa" character varying(100) NOT NULL,
    "ValorDespesa" numeric NOT NULL,
    "IdPorte" integer NOT NULL,
    "Onde" character varying
);


ALTER TABLE public."DespesaFixa" OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 17446)
-- Name: DimAdontante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimAdontante" (
    "Id" integer NOT NULL,
    "IdUsuarioAdotante" integer NOT NULL
);


ALTER TABLE public."DimAdontante" OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17416)
-- Name: DimCausaFalecimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimCausaFalecimento" (
    "Id" integer NOT NULL,
    "CausaDesc" character varying(100) NOT NULL
);


ALTER TABLE public."DimCausaFalecimento" OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 17441)
-- Name: DimControleDoacaoCategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimControleDoacaoCategoria" (
    "Id" integer NOT NULL,
    "Categoria" character varying(100) NOT NULL
);


ALTER TABLE public."DimControleDoacaoCategoria" OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 17413)
-- Name: DimCorPelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimCorPelo" (
    "Id" integer NOT NULL,
    "CorPeloDesc" character varying(50) NOT NULL
);


ALTER TABLE public."DimCorPelo" OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 17404)
-- Name: DimDespesaFixa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimDespesaFixa" (
    "Id" integer NOT NULL,
    "TipoDespesa" character varying(100) NOT NULL,
    "ValorDespesa" numeric NOT NULL,
    "IdPorte" integer NOT NULL
);


ALTER TABLE public."DimDespesaFixa" OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 17436)
-- Name: DimListaBanco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimListaBanco" (
    "Id" integer NOT NULL,
    "NomeBanco" character varying(100) NOT NULL
);


ALTER TABLE public."DimListaBanco" OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 17428)
-- Name: DimListaStatusDoacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimListaStatusDoacao" (
    "Id" integer NOT NULL,
    "Status" character varying(100) NOT NULL
);


ALTER TABLE public."DimListaStatusDoacao" OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 17394)
-- Name: DimPorte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimPorte" (
    "Id" integer NOT NULL,
    "PorteDesc" character varying(50) NOT NULL
);


ALTER TABLE public."DimPorte" OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 17387)
-- Name: DimTipoAnimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DimTipoAnimal" (
    "Id" integer NOT NULL,
    "TipoDesc" character varying(50) NOT NULL
);


ALTER TABLE public."DimTipoAnimal" OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 17309)
-- Name: FactAnimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FactAnimal" (
    "Id" integer NOT NULL,
    "Nome" character varying(100) NOT NULL,
    "NomeFinal" character varying(100),
    "IdTipoAnimal" integer NOT NULL,
    "IdCorPelo" integer NOT NULL,
    "IdadeAnos" integer DEFAULT 0,
    "IdadeMeses" integer DEFAULT 0,
    "Peso" numeric NOT NULL,
    "IdPorte" integer NOT NULL,
    "Adestravel" boolean DEFAULT false,
    "Foto" character varying(255),
    "Historia" character varying(4000) NOT NULL,
    "IdProcedimentoPadrao" integer NOT NULL,
    "DespesaMensal" numeric,
    "Falecido" boolean DEFAULT false,
    "IdCausaFalecimento" integer,
    "IdLarTemporario" integer NOT NULL,
    "IdGenero" integer NOT NULL,
    "DataResgate" character varying,
    "DataCadastro" character varying,
    "DataDivulgacao" character varying,
    "DataFalecimento" character varying
);


ALTER TABLE public."FactAnimal" OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 17451)
-- Name: FactControleDoacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FactControleDoacao" (
    "Id" integer NOT NULL,
    "IdPadrinhoDoador" integer NOT NULL,
    "DataEntrada" date NOT NULL,
    "ValorRealEntrada" numeric NOT NULL,
    "Recebido" boolean NOT NULL,
    "Cobranca" character varying(100) NOT NULL,
    "IdCategoria" integer NOT NULL,
    "IdListaBanco" integer NOT NULL,
    "IdListaStatusDoacao" integer NOT NULL,
    "Observacao" character varying(4000)
);


ALTER TABLE public."FactControleDoacao" OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 17459)
-- Name: FactPadrinhoDoador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FactPadrinhoDoador" (
    "Id" integer NOT NULL,
    "IdUsuarioPadrinhoDoador" integer NOT NULL,
    "Tipo" character varying(100),
    "Meio" character varying(255),
    "IdCadastroAnimal" integer NOT NULL,
    "ValorAcordado" numeric,
    "DoadorAtivo" boolean NOT NULL,
    "IdGrupoStatus" integer NOT NULL,
    "MotivoSaidaGrupo" character varying(1000),
    "IntencaoRetorno" boolean NOT NULL,
    "Observacao" character varying(4000),
    "DataCadastro" date NOT NULL
);


ALTER TABLE public."FactPadrinhoDoador" OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 17421)
-- Name: FactRegistroAdocao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FactRegistroAdocao" (
    "Id" integer NOT NULL,
    "IdAnimal" integer NOT NULL,
    "DataAdocao" date NOT NULL,
    "IdAdotante" integer NOT NULL,
    "MotivoAdocao" character varying(255) NOT NULL,
    "Termo" character varying(255),
    "Foto" bytea,
    "DilvulgacaoGrupoApoiadores" boolean NOT NULL,
    "TipoMeioAdocao" character varying(255) NOT NULL,
    "AdocaoConcluida" integer NOT NULL,
    "DataCadastro" date NOT NULL
);


ALTER TABLE public."FactRegistroAdocao" OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17236)
-- Name: Genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Genero" (
    "Id" integer NOT NULL,
    "GeneroDesc" character varying(100) NOT NULL
);


ALTER TABLE public."Genero" OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 17288)
-- Name: LarTemporario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LarTemporario" (
    "Id" integer NOT NULL,
    "NomeLarTemporario" character varying(200) NOT NULL,
    "IdResponsavelLarTemporario" integer NOT NULL,
    "IdStatusContato" integer NOT NULL,
    "PreviaComentario" character varying(4000),
    "DataCadastro" date NOT NULL,
    "Ativo" boolean NOT NULL,
    "DataArquivamento" date
);


ALTER TABLE public."LarTemporario" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17089)
-- Name: ListaBanco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ListaBanco" (
    "Id" integer NOT NULL,
    "NomeBanco" character varying(100) NOT NULL
);


ALTER TABLE public."ListaBanco" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17096)
-- Name: ListaStatusDoacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ListaStatusDoacao" (
    "Id" integer NOT NULL,
    "Status" character varying(100) NOT NULL
);


ALTER TABLE public."ListaStatusDoacao" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17064)
-- Name: PadrinhoDoador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PadrinhoDoador" (
    "Id" integer NOT NULL,
    "IdUsuarioPadrinhoDoador" integer NOT NULL,
    "Tipo" character varying(100),
    "Meio" character varying(255),
    "IdCadastroAnimal" integer NOT NULL,
    "ValorAcordado" numeric,
    "DoadorAtivo" boolean NOT NULL,
    "IdGrupoStatus" integer NOT NULL,
    "MotivoSaidaGrupo" character varying(1000),
    "IntencaoRetorno" boolean NOT NULL,
    "Observacao" character varying(4000),
    "DataCadastro" date NOT NULL
);


ALTER TABLE public."PadrinhoDoador" OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 17267)
-- Name: Porte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Porte" (
    "Id" integer DEFAULT nextval('public."public.CadastroAnimal_id_seq"'::regclass) NOT NULL,
    "PorteDesc" character varying(50) NOT NULL
);


ALTER TABLE public."Porte" OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 17255)
-- Name: Raca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Raca" (
    "Id" integer NOT NULL,
    "IdTipoAnimal" integer NOT NULL,
    "RacaDesc" character varying(50) NOT NULL
);


ALTER TABLE public."Raca" OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17159)
-- Name: RegistroAdocao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RegistroAdocao" (
    "Id" integer NOT NULL,
    "IdAnimal" integer NOT NULL,
    "DataAdocao" date NOT NULL,
    "IdAdotante" integer NOT NULL,
    "MotivoAdocao" character varying(255) NOT NULL,
    "Termo" character varying(255),
    "Foto" bytea,
    "DilvulgacaoGrupoApoiadores" boolean NOT NULL,
    "TipoMeioAdocao" character varying(255) NOT NULL,
    "AdocaoConcluida" integer NOT NULL,
    "DataCadastro" date NOT NULL
);


ALTER TABLE public."RegistroAdocao" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17104)
-- Name: TipoAnimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoAnimal" (
    "Id" integer NOT NULL,
    "TipoDesc" character varying(50) NOT NULL
);


ALTER TABLE public."TipoAnimal" OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17145)
-- Name: TipoUsuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoUsuario" (
    "Id" integer NOT NULL,
    "TipoUsuarioDesc" character varying(100) NOT NULL
);


ALTER TABLE public."TipoUsuario" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17055)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Id" integer NOT NULL,
    "NomeCompleto" character varying(200) NOT NULL,
    "RegistroGeral" character varying(20) NOT NULL,
    "Cpf" character varying(20) NOT NULL,
    "Telefone" character varying(50) NOT NULL,
    "Endereco" character varying(200) NOT NULL,
    "NumeroCasaApartamento" integer NOT NULL,
    "Complemento" character varying(20),
    "Cep" integer NOT NULL,
    "Bairro" character varying(100) NOT NULL,
    "Cidade" character varying(100) NOT NULL,
    "Estado" character varying(50) NOT NULL,
    "IdTipoUsuario" integer NOT NULL,
    "Ativo" boolean NOT NULL,
    "LinkRedeSocial" character varying,
    "DataCadastro" character varying NOT NULL,
    "NomeUsuario" character varying(100) NOT NULL,
    "Senha" character varying(100) NOT NULL,
    "Email" character varying(100) NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 17322)
-- Name: idseq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.idseq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.idseq OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17138)
-- Name: pf.ControleLarTemporarioPorAnimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."pf.ControleLarTemporarioPorAnimal" (
    id integer NOT NULL,
    id_cadastro_animal integer NOT NULL,
    id_responsavel_ong integer NOT NULL,
    id_responsavel_lar_temporario integer NOT NULL,
    status_lar_temporario integer NOT NULL,
    data_registro date NOT NULL,
    id_despesa_fixa integer NOT NULL,
    data_vencimento date NOT NULL,
    ativo boolean NOT NULL
);


ALTER TABLE public."pf.ControleLarTemporarioPorAnimal" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17111)
-- Name: pf.CustoPorResgatePorAnimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."pf.CustoPorResgatePorAnimal" (
    id integer NOT NULL,
    id_cadastro_animal integer NOT NULL,
    custo numeric NOT NULL,
    status_check_list boolean NOT NULL
);


ALTER TABLE public."pf.CustoPorResgatePorAnimal" OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17184)
-- Name: pf.FuncionarioOng; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."pf.FuncionarioOng" (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    login character varying(100) NOT NULL,
    senha character varying(100) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public."pf.FuncionarioOng" OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17120)
-- Name: pf.LarTemporarioListaContato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."pf.LarTemporarioListaContato" (
    id integer NOT NULL,
    nome_lar_temporario character varying(200) NOT NULL,
    id_responsavel_lar_temporario integer NOT NULL,
    id_status_contato integer NOT NULL,
    previa_comentario character varying(4000),
    data_cadastro date NOT NULL,
    ativo boolean NOT NULL,
    data_arquivamento date NOT NULL,
    foto bytea
);


ALTER TABLE public."pf.LarTemporarioListaContato" OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17168)
-- Name: pf.Status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."pf.Status" (
    id integer NOT NULL,
    status_contato character varying(100) NOT NULL
);


ALTER TABLE public."pf.Status" OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17175)
-- Name: pf.TaxiListaContato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."pf.TaxiListaContato" (
    id integer NOT NULL,
    id_funcionario_ong integer NOT NULL,
    id_usuario_responsavel_taxi integer NOT NULL,
    valor numeric NOT NULL,
    id_status_contato integer NOT NULL,
    previa_comentario character varying(4000)
);


ALTER TABLE public."pf.TaxiListaContato" OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17151)
-- Name: public.Adontante_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.Adontante_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.Adontante_id_seq" OWNER TO postgres;

--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 259
-- Name: public.Adontante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.Adontante_id_seq" OWNED BY public."Adontante"."Id";


--
-- TOC entry 241 (class 1259 OID 17081)
-- Name: public.Categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.Categoria_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.Categoria_id_seq" OWNER TO postgres;

--
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 241
-- Name: public.Categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.Categoria_id_seq" OWNED BY public."ControleDoacaoCategoria"."Id";


--
-- TOC entry 271 (class 1259 OID 17199)
-- Name: public.CausaFalecimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.CausaFalecimento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.CausaFalecimento_id_seq" OWNER TO postgres;

--
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 271
-- Name: public.CausaFalecimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.CausaFalecimento_id_seq" OWNED BY public."CausaFalecimento"."Id";


--
-- TOC entry 239 (class 1259 OID 17072)
-- Name: public.ControleDoacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.ControleDoacao_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.ControleDoacao_id_seq" OWNER TO postgres;

--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 239
-- Name: public.ControleDoacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.ControleDoacao_id_seq" OWNED BY public."ControleDoacao"."Id";


--
-- TOC entry 255 (class 1259 OID 17137)
-- Name: public.ControleLarTemporarioPorAnimal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.ControleLarTemporarioPorAnimal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.ControleLarTemporarioPorAnimal_id_seq" OWNER TO postgres;

--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 255
-- Name: public.ControleLarTemporarioPorAnimal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.ControleLarTemporarioPorAnimal_id_seq" OWNED BY public."pf.ControleLarTemporarioPorAnimal".id;


--
-- TOC entry 249 (class 1259 OID 17110)
-- Name: public.CustoPorResgatePorAnimal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.CustoPorResgatePorAnimal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.CustoPorResgatePorAnimal_id_seq" OWNER TO postgres;

--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 249
-- Name: public.CustoPorResgatePorAnimal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.CustoPorResgatePorAnimal_id_seq" OWNED BY public."pf.CustoPorResgatePorAnimal".id;


--
-- TOC entry 269 (class 1259 OID 17190)
-- Name: public.CustoPorResgate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.CustoPorResgate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.CustoPorResgate_id_seq" OWNER TO postgres;

--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 269
-- Name: public.CustoPorResgate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.CustoPorResgate_id_seq" OWNED BY public."CustoPorResgate"."Id";


--
-- TOC entry 253 (class 1259 OID 17128)
-- Name: public.DespesaFixa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.DespesaFixa_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.DespesaFixa_id_seq" OWNER TO postgres;

--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 253
-- Name: public.DespesaFixa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.DespesaFixa_id_seq" OWNED BY public."DespesaFixa"."Id";


--
-- TOC entry 267 (class 1259 OID 17183)
-- Name: public.FuncionarioOng_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.FuncionarioOng_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.FuncionarioOng_id_seq" OWNER TO postgres;

--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 267
-- Name: public.FuncionarioOng_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.FuncionarioOng_id_seq" OWNED BY public."pf.FuncionarioOng".id;


--
-- TOC entry 251 (class 1259 OID 17119)
-- Name: public.LarTemporarioListaContato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.LarTemporarioListaContato_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.LarTemporarioListaContato_id_seq" OWNER TO postgres;

--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 251
-- Name: public.LarTemporarioListaContato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.LarTemporarioListaContato_id_seq" OWNED BY public."pf.LarTemporarioListaContato".id;


--
-- TOC entry 243 (class 1259 OID 17088)
-- Name: public.ListaBanco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.ListaBanco_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.ListaBanco_id_seq" OWNER TO postgres;

--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 243
-- Name: public.ListaBanco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.ListaBanco_id_seq" OWNED BY public."ListaBanco"."Id";


--
-- TOC entry 245 (class 1259 OID 17095)
-- Name: public.ListaStatusDoacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.ListaStatusDoacao_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.ListaStatusDoacao_id_seq" OWNER TO postgres;

--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 245
-- Name: public.ListaStatusDoacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.ListaStatusDoacao_id_seq" OWNED BY public."ListaStatusDoacao"."Id";


--
-- TOC entry 237 (class 1259 OID 17063)
-- Name: public.PadrinhoDoador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.PadrinhoDoador_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.PadrinhoDoador_id_seq" OWNER TO postgres;

--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 237
-- Name: public.PadrinhoDoador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.PadrinhoDoador_id_seq" OWNED BY public."PadrinhoDoador"."Id";


--
-- TOC entry 276 (class 1259 OID 17254)
-- Name: public.RacaAnimal_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.RacaAnimal_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.RacaAnimal_Id_seq" OWNER TO postgres;

--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 276
-- Name: public.RacaAnimal_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.RacaAnimal_Id_seq" OWNED BY public."Raca"."Id";


--
-- TOC entry 261 (class 1259 OID 17158)
-- Name: public.RegistroAdocao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.RegistroAdocao_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.RegistroAdocao_id_seq" OWNER TO postgres;

--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 261
-- Name: public.RegistroAdocao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.RegistroAdocao_id_seq" OWNED BY public."RegistroAdocao"."Id";


--
-- TOC entry 263 (class 1259 OID 17167)
-- Name: public.Status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.Status_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.Status_id_seq" OWNER TO postgres;

--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 263
-- Name: public.Status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.Status_id_seq" OWNED BY public."pf.Status".id;


--
-- TOC entry 265 (class 1259 OID 17174)
-- Name: public.TaxiListaContato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.TaxiListaContato_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.TaxiListaContato_id_seq" OWNER TO postgres;

--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 265
-- Name: public.TaxiListaContato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.TaxiListaContato_id_seq" OWNED BY public."pf.TaxiListaContato".id;


--
-- TOC entry 247 (class 1259 OID 17103)
-- Name: public.TipoAnimal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.TipoAnimal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.TipoAnimal_id_seq" OWNER TO postgres;

--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 247
-- Name: public.TipoAnimal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.TipoAnimal_id_seq" OWNED BY public."TipoAnimal"."Id";


--
-- TOC entry 257 (class 1259 OID 17144)
-- Name: public.TipoUsuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.TipoUsuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.TipoUsuario_id_seq" OWNER TO postgres;

--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 257
-- Name: public.TipoUsuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.TipoUsuario_id_seq" OWNED BY public."TipoUsuario"."Id";


--
-- TOC entry 235 (class 1259 OID 17054)
-- Name: public.Usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."public.Usuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."public.Usuario_id_seq" OWNER TO postgres;

--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 235
-- Name: public.Usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."public.Usuario_id_seq" OWNED BY public."Usuario"."Id";


--
-- TOC entry 4970 (class 2604 OID 17155)
-- Name: Adontante Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adontante" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.Adontante_id_seq"'::regclass);


--
-- TOC entry 4977 (class 2604 OID 17220)
-- Name: Animal Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Animal" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.CadastroAnimal_id_seq"'::regclass);


--
-- TOC entry 4976 (class 2604 OID 17203)
-- Name: CausaFalecimento Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CausaFalecimento" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.CausaFalecimento_id_seq"'::regclass);


--
-- TOC entry 4960 (class 2604 OID 17076)
-- Name: ControleDoacao Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ControleDoacao" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.ControleDoacao_id_seq"'::regclass);


--
-- TOC entry 4961 (class 2604 OID 17085)
-- Name: ControleDoacaoCategoria Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ControleDoacaoCategoria" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.Categoria_id_seq"'::regclass);


--
-- TOC entry 4975 (class 2604 OID 17194)
-- Name: CustoPorResgate Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustoPorResgate" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.CustoPorResgate_id_seq"'::regclass);


--
-- TOC entry 4967 (class 2604 OID 17132)
-- Name: DespesaFixa Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DespesaFixa" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.DespesaFixa_id_seq"'::regclass);


--
-- TOC entry 4962 (class 2604 OID 17092)
-- Name: ListaBanco Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ListaBanco" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.ListaBanco_id_seq"'::regclass);


--
-- TOC entry 4963 (class 2604 OID 17099)
-- Name: ListaStatusDoacao Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ListaStatusDoacao" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.ListaStatusDoacao_id_seq"'::regclass);


--
-- TOC entry 4959 (class 2604 OID 17067)
-- Name: PadrinhoDoador Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PadrinhoDoador" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.PadrinhoDoador_id_seq"'::regclass);


--
-- TOC entry 4982 (class 2604 OID 17258)
-- Name: Raca Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Raca" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.RacaAnimal_Id_seq"'::regclass);


--
-- TOC entry 4971 (class 2604 OID 17162)
-- Name: RegistroAdocao Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RegistroAdocao" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.RegistroAdocao_id_seq"'::regclass);


--
-- TOC entry 4964 (class 2604 OID 17107)
-- Name: TipoAnimal Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoAnimal" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.TipoAnimal_id_seq"'::regclass);


--
-- TOC entry 4969 (class 2604 OID 17148)
-- Name: TipoUsuario Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoUsuario" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.TipoUsuario_id_seq"'::regclass);


--
-- TOC entry 4958 (class 2604 OID 17058)
-- Name: Usuario Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN "Id" SET DEFAULT nextval('public."public.Usuario_id_seq"'::regclass);


--
-- TOC entry 4968 (class 2604 OID 17141)
-- Name: pf.ControleLarTemporarioPorAnimal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.ControleLarTemporarioPorAnimal" ALTER COLUMN id SET DEFAULT nextval('public."public.ControleLarTemporarioPorAnimal_id_seq"'::regclass);


--
-- TOC entry 4965 (class 2604 OID 17114)
-- Name: pf.CustoPorResgatePorAnimal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.CustoPorResgatePorAnimal" ALTER COLUMN id SET DEFAULT nextval('public."public.CustoPorResgatePorAnimal_id_seq"'::regclass);


--
-- TOC entry 4974 (class 2604 OID 17187)
-- Name: pf.FuncionarioOng id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.FuncionarioOng" ALTER COLUMN id SET DEFAULT nextval('public."public.FuncionarioOng_id_seq"'::regclass);


--
-- TOC entry 4966 (class 2604 OID 17123)
-- Name: pf.LarTemporarioListaContato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.LarTemporarioListaContato" ALTER COLUMN id SET DEFAULT nextval('public."public.LarTemporarioListaContato_id_seq"'::regclass);


--
-- TOC entry 4972 (class 2604 OID 17171)
-- Name: pf.Status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.Status" ALTER COLUMN id SET DEFAULT nextval('public."public.Status_id_seq"'::regclass);


--
-- TOC entry 4973 (class 2604 OID 17178)
-- Name: pf.TaxiListaContato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.TaxiListaContato" ALTER COLUMN id SET DEFAULT nextval('public."public.TaxiListaContato_id_seq"'::regclass);


--
-- TOC entry 4920 (class 0 OID 16399)
-- Dependencies: 220
-- Data for Name: pga_jobagent; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobagent (jagpid, jaglogintime, jagstation) FROM stdin;
10692	2023-12-07 05:34:29.867141+01	DESKTOP-LQJO3H8
\.


--
-- TOC entry 4921 (class 0 OID 16408)
-- Dependencies: 222
-- Data for Name: pga_jobclass; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobclass (jclid, jclname) FROM stdin;
\.


--
-- TOC entry 4922 (class 0 OID 16418)
-- Dependencies: 224
-- Data for Name: pga_job; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_job (jobid, jobjclid, jobname, jobdesc, jobhostagent, jobenabled, jobcreated, jobchanged, jobagentid, jobnextrun, joblastrun) FROM stdin;
\.


--
-- TOC entry 4924 (class 0 OID 16466)
-- Dependencies: 228
-- Data for Name: pga_schedule; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_schedule (jscid, jscjobid, jscname, jscdesc, jscenabled, jscstart, jscend, jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths) FROM stdin;
\.


--
-- TOC entry 4925 (class 0 OID 16494)
-- Dependencies: 230
-- Data for Name: pga_exception; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_exception (jexid, jexscid, jexdate, jextime) FROM stdin;
\.


--
-- TOC entry 4926 (class 0 OID 16508)
-- Dependencies: 232
-- Data for Name: pga_joblog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_joblog (jlgid, jlgjobid, jlgstatus, jlgstart, jlgduration) FROM stdin;
\.


--
-- TOC entry 4923 (class 0 OID 16442)
-- Dependencies: 226
-- Data for Name: pga_jobstep; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobstep (jstid, jstjobid, jstname, jstdesc, jstenabled, jstkind, jstcode, jstconnstr, jstdbname, jstonerror, jscnextrun) FROM stdin;
\.


--
-- TOC entry 4927 (class 0 OID 16524)
-- Dependencies: 234
-- Data for Name: pga_jobsteplog; Type: TABLE DATA; Schema: pgagent; Owner: postgres
--

COPY pgagent.pga_jobsteplog (jslid, jsljlgid, jsljstid, jslstatus, jslresult, jslstart, jslduration, jsloutput) FROM stdin;
\.


--
-- TOC entry 5255 (class 0 OID 17152)
-- Dependencies: 260
-- Data for Name: Adontante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Adontante" ("Id", "IdUsuarioAdotante") FROM stdin;
\.


--
-- TOC entry 5269 (class 0 OID 17217)
-- Dependencies: 274
-- Data for Name: Animal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Animal" ("Id", "Nome", "NomeFinal", "IdTipoAnimal", "IdCorPelo", "IdadeAnos", "IdadeMeses", "Peso", "IdPorte", "Adestravel", "Foto", "Historia", "IdProcedimentoPadrao", "DespesaMensal", "Falecido", "IdCausaFalecimento", "IdLarTemporario", "IdGenero", "DataResgate", "DataCadastro", "DataDivulgacao", "DataFalecimento") FROM stdin;
55	binteca	\N	1	16	1	1	1	10	t	~/Images/mouse.png	sss	0	\N	f	\N	1	1	\N	\N	\N	\N
\.


--
-- TOC entry 5267 (class 0 OID 17200)
-- Dependencies: 272
-- Data for Name: CausaFalecimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CausaFalecimento" ("Id", "CausaDesc") FROM stdin;
1	neoplasmas
2	doenças degenerativas
3	"doenças degenerativas"
4	cinomose
5	cirrose 
\.


--
-- TOC entry 5235 (class 0 OID 17073)
-- Dependencies: 240
-- Data for Name: ControleDoacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ControleDoacao" ("Id", "IdPadrinhoDoador", "DataEntrada", "ValorRealEntrada", "Recebido", "Cobranca", "IdCategoria", "IdListaBanco", "IdListaStatusDoacao", "Observacao") FROM stdin;
\.


--
-- TOC entry 5237 (class 0 OID 17082)
-- Dependencies: 242
-- Data for Name: ControleDoacaoCategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ControleDoacaoCategoria" ("Id", "Categoria") FROM stdin;
\.


--
-- TOC entry 5273 (class 0 OID 17261)
-- Dependencies: 278
-- Data for Name: CorPelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CorPelo" ("Id", "CorPeloDesc") FROM stdin;
66	Preto
67	Branco
68	Caramelo
69	Cinza
70	Marrom
\.


--
-- TOC entry 5265 (class 0 OID 17191)
-- Dependencies: 270
-- Data for Name: CustoPorResgate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustoPorResgate" ("Id", "Acao", "CustoMacho", "CustoFemea", "Ativo", "DataCadastro") FROM stdin;
1	Vacinação	100	100	t	2023-12-08
2	Banho	50	40	t	2023-12-07
\.


--
-- TOC entry 5249 (class 0 OID 17129)
-- Dependencies: 254
-- Data for Name: DespesaFixa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DespesaFixa" ("Id", "TipoDespesa", "ValorDespesa", "IdPorte", "Onde") FROM stdin;
1	Ração	12223445	9	Meu Pet
2	vacina anti-rabica	1000	9	PetVet
\.


--
-- TOC entry 5287 (class 0 OID 17446)
-- Dependencies: 292
-- Data for Name: DimAdontante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimAdontante" ("Id", "IdUsuarioAdotante") FROM stdin;
\.


--
-- TOC entry 5282 (class 0 OID 17416)
-- Dependencies: 287
-- Data for Name: DimCausaFalecimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimCausaFalecimento" ("Id", "CausaDesc") FROM stdin;
\.


--
-- TOC entry 5286 (class 0 OID 17441)
-- Dependencies: 291
-- Data for Name: DimControleDoacaoCategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimControleDoacaoCategoria" ("Id", "Categoria") FROM stdin;
\.


--
-- TOC entry 5281 (class 0 OID 17413)
-- Dependencies: 286
-- Data for Name: DimCorPelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimCorPelo" ("Id", "CorPeloDesc") FROM stdin;
66	Preto
67	Branco
68	Caramelo
69	Cinza
70	Marrom
\.


--
-- TOC entry 5280 (class 0 OID 17404)
-- Dependencies: 285
-- Data for Name: DimDespesaFixa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimDespesaFixa" ("Id", "TipoDespesa", "ValorDespesa", "IdPorte") FROM stdin;
1	Ração	12223445.00	9
2	vacina anti-rabica	1000.00	9
\.


--
-- TOC entry 5285 (class 0 OID 17436)
-- Dependencies: 290
-- Data for Name: DimListaBanco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimListaBanco" ("Id", "NomeBanco") FROM stdin;
\.


--
-- TOC entry 5284 (class 0 OID 17428)
-- Dependencies: 289
-- Data for Name: DimListaStatusDoacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimListaStatusDoacao" ("Id", "Status") FROM stdin;
\.


--
-- TOC entry 5279 (class 0 OID 17394)
-- Dependencies: 284
-- Data for Name: DimPorte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimPorte" ("Id", "PorteDesc") FROM stdin;
\.


--
-- TOC entry 5278 (class 0 OID 17387)
-- Dependencies: 283
-- Data for Name: DimTipoAnimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DimTipoAnimal" ("Id", "TipoDesc") FROM stdin;
\.


--
-- TOC entry 5276 (class 0 OID 17309)
-- Dependencies: 281
-- Data for Name: FactAnimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FactAnimal" ("Id", "Nome", "NomeFinal", "IdTipoAnimal", "IdCorPelo", "IdadeAnos", "IdadeMeses", "Peso", "IdPorte", "Adestravel", "Foto", "Historia", "IdProcedimentoPadrao", "DespesaMensal", "Falecido", "IdCausaFalecimento", "IdLarTemporario", "IdGenero", "DataResgate", "DataCadastro", "DataDivulgacao", "DataFalecimento") FROM stdin;
55	binteca	\N	1	16	1	1	1	10	t	~/Images/mouse.png	sss	0	\N	f	\N	1	1	\N	\N	\N	\N
\.


--
-- TOC entry 5288 (class 0 OID 17451)
-- Dependencies: 293
-- Data for Name: FactControleDoacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FactControleDoacao" ("Id", "IdPadrinhoDoador", "DataEntrada", "ValorRealEntrada", "Recebido", "Cobranca", "IdCategoria", "IdListaBanco", "IdListaStatusDoacao", "Observacao") FROM stdin;
\.


--
-- TOC entry 5289 (class 0 OID 17459)
-- Dependencies: 294
-- Data for Name: FactPadrinhoDoador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FactPadrinhoDoador" ("Id", "IdUsuarioPadrinhoDoador", "Tipo", "Meio", "IdCadastroAnimal", "ValorAcordado", "DoadorAtivo", "IdGrupoStatus", "MotivoSaidaGrupo", "IntencaoRetorno", "Observacao", "DataCadastro") FROM stdin;
\.


--
-- TOC entry 5283 (class 0 OID 17421)
-- Dependencies: 288
-- Data for Name: FactRegistroAdocao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FactRegistroAdocao" ("Id", "IdAnimal", "DataAdocao", "IdAdotante", "MotivoAdocao", "Termo", "Foto", "DilvulgacaoGrupoApoiadores", "TipoMeioAdocao", "AdocaoConcluida", "DataCadastro") FROM stdin;
\.


--
-- TOC entry 5270 (class 0 OID 17236)
-- Dependencies: 275
-- Data for Name: Genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Genero" ("Id", "GeneroDesc") FROM stdin;
1	Macho
2	Fêmea
\.


--
-- TOC entry 5275 (class 0 OID 17288)
-- Dependencies: 280
-- Data for Name: LarTemporario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LarTemporario" ("Id", "NomeLarTemporario", "IdResponsavelLarTemporario", "IdStatusContato", "PreviaComentario", "DataCadastro", "Ativo", "DataArquivamento") FROM stdin;
1	test	1	1	test	2023-11-29	t	\N
\.


--
-- TOC entry 5239 (class 0 OID 17089)
-- Dependencies: 244
-- Data for Name: ListaBanco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ListaBanco" ("Id", "NomeBanco") FROM stdin;
\.


--
-- TOC entry 5241 (class 0 OID 17096)
-- Dependencies: 246
-- Data for Name: ListaStatusDoacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ListaStatusDoacao" ("Id", "Status") FROM stdin;
\.


--
-- TOC entry 5233 (class 0 OID 17064)
-- Dependencies: 238
-- Data for Name: PadrinhoDoador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PadrinhoDoador" ("Id", "IdUsuarioPadrinhoDoador", "Tipo", "Meio", "IdCadastroAnimal", "ValorAcordado", "DoadorAtivo", "IdGrupoStatus", "MotivoSaidaGrupo", "IntencaoRetorno", "Observacao", "DataCadastro") FROM stdin;
\.


--
-- TOC entry 5274 (class 0 OID 17267)
-- Dependencies: 279
-- Data for Name: Porte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Porte" ("Id", "PorteDesc") FROM stdin;
9	Pequeno
10	Médio
11	Grande
12	Gigante
\.


--
-- TOC entry 5272 (class 0 OID 17255)
-- Dependencies: 277
-- Data for Name: Raca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Raca" ("Id", "IdTipoAnimal", "RacaDesc") FROM stdin;
\.


--
-- TOC entry 5257 (class 0 OID 17159)
-- Dependencies: 262
-- Data for Name: RegistroAdocao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RegistroAdocao" ("Id", "IdAnimal", "DataAdocao", "IdAdotante", "MotivoAdocao", "Termo", "Foto", "DilvulgacaoGrupoApoiadores", "TipoMeioAdocao", "AdocaoConcluida", "DataCadastro") FROM stdin;
\.


--
-- TOC entry 5243 (class 0 OID 17104)
-- Dependencies: 248
-- Data for Name: TipoAnimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoAnimal" ("Id", "TipoDesc") FROM stdin;
1	Gato
2	Cão
\.


--
-- TOC entry 5253 (class 0 OID 17145)
-- Dependencies: 258
-- Data for Name: TipoUsuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoUsuario" ("Id", "TipoUsuarioDesc") FROM stdin;
1	Funcionário ONG
2	Padrinho - Doador
3	Adotante
4	Taxi
5	Lar Temporário
\.


--
-- TOC entry 5231 (class 0 OID 17055)
-- Dependencies: 236
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("Id", "NomeCompleto", "RegistroGeral", "Cpf", "Telefone", "Endereco", "NumeroCasaApartamento", "Complemento", "Cep", "Bairro", "Cidade", "Estado", "IdTipoUsuario", "Ativo", "LinkRedeSocial", "DataCadastro", "NomeUsuario", "Senha", "Email") FROM stdin;
4	Sara Vidal de Souza	11	11	11	11	1	1	1	1	1	1	1	t	1	2023-12-07	Sara.Vidal2023	1234567891	saravidal@puc.br
\.


--
-- TOC entry 5251 (class 0 OID 17138)
-- Dependencies: 256
-- Data for Name: pf.ControleLarTemporarioPorAnimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."pf.ControleLarTemporarioPorAnimal" (id, id_cadastro_animal, id_responsavel_ong, id_responsavel_lar_temporario, status_lar_temporario, data_registro, id_despesa_fixa, data_vencimento, ativo) FROM stdin;
\.


--
-- TOC entry 5245 (class 0 OID 17111)
-- Dependencies: 250
-- Data for Name: pf.CustoPorResgatePorAnimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."pf.CustoPorResgatePorAnimal" (id, id_cadastro_animal, custo, status_check_list) FROM stdin;
\.


--
-- TOC entry 5263 (class 0 OID 17184)
-- Dependencies: 268
-- Data for Name: pf.FuncionarioOng; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."pf.FuncionarioOng" (id, email, login, senha, id_usuario) FROM stdin;
\.


--
-- TOC entry 5247 (class 0 OID 17120)
-- Dependencies: 252
-- Data for Name: pf.LarTemporarioListaContato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."pf.LarTemporarioListaContato" (id, nome_lar_temporario, id_responsavel_lar_temporario, id_status_contato, previa_comentario, data_cadastro, ativo, data_arquivamento, foto) FROM stdin;
\.


--
-- TOC entry 5259 (class 0 OID 17168)
-- Dependencies: 264
-- Data for Name: pf.Status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."pf.Status" (id, status_contato) FROM stdin;
\.


--
-- TOC entry 5261 (class 0 OID 17175)
-- Dependencies: 266
-- Data for Name: pf.TaxiListaContato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."pf.TaxiListaContato" (id, id_funcionario_ong, id_usuario_responsavel_taxi, valor, id_status_contato, previa_comentario) FROM stdin;
\.


--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 282
-- Name: idseq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.idseq', 1, false);


--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 259
-- Name: public.Adontante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.Adontante_id_seq"', 1, false);


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 273
-- Name: public.CadastroAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.CadastroAnimal_id_seq"', 71, true);


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 241
-- Name: public.Categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.Categoria_id_seq"', 1, false);


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 271
-- Name: public.CausaFalecimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.CausaFalecimento_id_seq"', 5, true);


--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 239
-- Name: public.ControleDoacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.ControleDoacao_id_seq"', 1, false);


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 255
-- Name: public.ControleLarTemporarioPorAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.ControleLarTemporarioPorAnimal_id_seq"', 1, false);


--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 249
-- Name: public.CustoPorResgatePorAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.CustoPorResgatePorAnimal_id_seq"', 1, false);


--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 269
-- Name: public.CustoPorResgate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.CustoPorResgate_id_seq"', 3, true);


--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 253
-- Name: public.DespesaFixa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.DespesaFixa_id_seq"', 4, true);


--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 267
-- Name: public.FuncionarioOng_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.FuncionarioOng_id_seq"', 1, false);


--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 251
-- Name: public.LarTemporarioListaContato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.LarTemporarioListaContato_id_seq"', 1, false);


--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 243
-- Name: public.ListaBanco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.ListaBanco_id_seq"', 1, false);


--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 245
-- Name: public.ListaStatusDoacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.ListaStatusDoacao_id_seq"', 1, false);


--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 237
-- Name: public.PadrinhoDoador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.PadrinhoDoador_id_seq"', 1, false);


--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 276
-- Name: public.RacaAnimal_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.RacaAnimal_Id_seq"', 1, false);


--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 261
-- Name: public.RegistroAdocao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.RegistroAdocao_id_seq"', 1, false);


--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 263
-- Name: public.Status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.Status_id_seq"', 1, false);


--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 265
-- Name: public.TaxiListaContato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.TaxiListaContato_id_seq"', 1, false);


--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 247
-- Name: public.TipoAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.TipoAnimal_id_seq"', 2, true);


--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 257
-- Name: public.TipoUsuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.TipoUsuario_id_seq"', 5, true);


--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 235
-- Name: public.Usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."public.Usuario_id_seq"', 4, true);


--
-- TOC entry 5048 (class 2606 OID 17157)
-- Name: Adontante Adontante_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adontante"
    ADD CONSTRAINT "Adontante_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5062 (class 2606 OID 17225)
-- Name: Animal CadastroAnimal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Animal"
    ADD CONSTRAINT "CadastroAnimal_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5030 (class 2606 OID 17087)
-- Name: ControleDoacaoCategoria Categoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ControleDoacaoCategoria"
    ADD CONSTRAINT "Categoria_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5060 (class 2606 OID 17205)
-- Name: CausaFalecimento CausaFalecimento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CausaFalecimento"
    ADD CONSTRAINT "CausaFalecimento_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5028 (class 2606 OID 17080)
-- Name: ControleDoacao ControleDoacao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ControleDoacao"
    ADD CONSTRAINT "ControleDoacao_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5044 (class 2606 OID 17143)
-- Name: pf.ControleLarTemporarioPorAnimal ControleLarTemporarioPorAnimal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.ControleLarTemporarioPorAnimal"
    ADD CONSTRAINT "ControleLarTemporarioPorAnimal_pk" PRIMARY KEY (id);


--
-- TOC entry 5068 (class 2606 OID 17266)
-- Name: CorPelo CorPelo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CorPelo"
    ADD CONSTRAINT "CorPelo_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5038 (class 2606 OID 17118)
-- Name: pf.CustoPorResgatePorAnimal CustoPorResgatePorAnimal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.CustoPorResgatePorAnimal"
    ADD CONSTRAINT "CustoPorResgatePorAnimal_pk" PRIMARY KEY (id);


--
-- TOC entry 5058 (class 2606 OID 17198)
-- Name: CustoPorResgate CustoPorResgate_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustoPorResgate"
    ADD CONSTRAINT "CustoPorResgate_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5042 (class 2606 OID 17136)
-- Name: DespesaFixa DespesaFixa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DespesaFixa"
    ADD CONSTRAINT "DespesaFixa_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5056 (class 2606 OID 17189)
-- Name: pf.FuncionarioOng FuncionarioOng_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.FuncionarioOng"
    ADD CONSTRAINT "FuncionarioOng_pk" PRIMARY KEY (id);


--
-- TOC entry 5064 (class 2606 OID 17242)
-- Name: Genero Genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genero"
    ADD CONSTRAINT "Genero_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 5040 (class 2606 OID 17127)
-- Name: pf.LarTemporarioListaContato LarTemporarioListaContato_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.LarTemporarioListaContato"
    ADD CONSTRAINT "LarTemporarioListaContato_pk" PRIMARY KEY (id);


--
-- TOC entry 5072 (class 2606 OID 17294)
-- Name: LarTemporario LarTemporario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LarTemporario"
    ADD CONSTRAINT "LarTemporario_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5032 (class 2606 OID 17094)
-- Name: ListaBanco ListaBanco_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ListaBanco"
    ADD CONSTRAINT "ListaBanco_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5034 (class 2606 OID 17101)
-- Name: ListaStatusDoacao ListaStatusDoacao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ListaStatusDoacao"
    ADD CONSTRAINT "ListaStatusDoacao_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5026 (class 2606 OID 17071)
-- Name: PadrinhoDoador PadrinhoDoador_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PadrinhoDoador"
    ADD CONSTRAINT "PadrinhoDoador_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5070 (class 2606 OID 17272)
-- Name: Porte Porte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Porte"
    ADD CONSTRAINT "Porte_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5066 (class 2606 OID 17260)
-- Name: Raca Raca_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Raca"
    ADD CONSTRAINT "Raca_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5050 (class 2606 OID 17166)
-- Name: RegistroAdocao RegistroAdocao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RegistroAdocao"
    ADD CONSTRAINT "RegistroAdocao_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5052 (class 2606 OID 17173)
-- Name: pf.Status Status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.Status"
    ADD CONSTRAINT "Status_pk" PRIMARY KEY (id);


--
-- TOC entry 5054 (class 2606 OID 17182)
-- Name: pf.TaxiListaContato TaxiListaContato_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."pf.TaxiListaContato"
    ADD CONSTRAINT "TaxiListaContato_pk" PRIMARY KEY (id);


--
-- TOC entry 5046 (class 2606 OID 17150)
-- Name: TipoUsuario TipoUsuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoUsuario"
    ADD CONSTRAINT "TipoUsuario_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5036 (class 2606 OID 17109)
-- Name: TipoAnimal Tipo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoAnimal"
    ADD CONSTRAINT "Tipo_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5024 (class 2606 OID 17062)
-- Name: Usuario Usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pk" PRIMARY KEY ("Id");


--
-- TOC entry 5081 (class 2620 OID 17450)
-- Name: Adontante adotante_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER adotante_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."Adontante" FOR EACH ROW EXECUTE FUNCTION public.adotante_insert_trigger_fnc();


--
-- TOC entry 5084 (class 2620 OID 17369)
-- Name: Animal animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."Animal" FOR EACH ROW EXECUTE FUNCTION public.animal_insert_trigger_fnc();


--
-- TOC entry 5083 (class 2620 OID 17420)
-- Name: CausaFalecimento causa_falecimento_animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER causa_falecimento_animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."CausaFalecimento" FOR EACH ROW EXECUTE FUNCTION public.causa_falecimento_animal_insert_trigger_fnc();


--
-- TOC entry 5076 (class 2620 OID 17445)
-- Name: ControleDoacaoCategoria controle_doacao_categoria_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER controle_doacao_categoria_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."ControleDoacaoCategoria" FOR EACH ROW EXECUTE FUNCTION public.controle_doacao_categoria_insert_trigger_fnc();


--
-- TOC entry 5075 (class 2620 OID 17457)
-- Name: ControleDoacao controle_doacao_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER controle_doacao_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."ControleDoacao" FOR EACH ROW EXECUTE FUNCTION public.controle_doacao_insert_trigger_fnc();


--
-- TOC entry 5085 (class 2620 OID 17412)
-- Name: CorPelo cor_pelo_animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER cor_pelo_animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."CorPelo" FOR EACH ROW EXECUTE FUNCTION public.cor_pelo_animal_insert_trigger_fnc();


--
-- TOC entry 5080 (class 2620 OID 17410)
-- Name: DespesaFixa despesa_fixa_animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER despesa_fixa_animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."DespesaFixa" FOR EACH ROW EXECUTE FUNCTION public.despesa_fixa_animal_insert_trigger_fnc();


--
-- TOC entry 5077 (class 2620 OID 17440)
-- Name: ListaBanco lista_banco_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER lista_banco_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."ListaBanco" FOR EACH ROW EXECUTE FUNCTION public.lista_banco_insert_trigger_fnc();


--
-- TOC entry 5078 (class 2620 OID 17435)
-- Name: ListaStatusDoacao lista_status_doacao_animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER lista_status_doacao_animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."ListaStatusDoacao" FOR EACH ROW EXECUTE FUNCTION public.lista_status_doacao_animal_insert_trigger_fnc();


--
-- TOC entry 5074 (class 2620 OID 17465)
-- Name: PadrinhoDoador padrinho_doador_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER padrinho_doador_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."PadrinhoDoador" FOR EACH ROW EXECUTE FUNCTION public.padrinho_doador_insert_trigger_fnc();


--
-- TOC entry 5086 (class 2620 OID 17398)
-- Name: Porte porte_animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER porte_animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."Porte" FOR EACH ROW EXECUTE FUNCTION public.porte_animal_insert_trigger_fnc();


--
-- TOC entry 5082 (class 2620 OID 17427)
-- Name: RegistroAdocao registro_adocao_animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER registro_adocao_animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."RegistroAdocao" FOR EACH ROW EXECUTE FUNCTION public.registro_adocao_animal_insert_trigger_fnc();


--
-- TOC entry 5079 (class 2620 OID 17393)
-- Name: TipoAnimal tipo_animal_insert_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tipo_animal_insert_trigger AFTER INSERT OR DELETE OR UPDATE ON public."TipoAnimal" FOR EACH ROW EXECUTE FUNCTION public.tipo_animal_insert_trigger_fnc();


--
-- TOC entry 5073 (class 2606 OID 17399)
-- Name: DespesaFixa IdPorte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DespesaFixa"
    ADD CONSTRAINT "IdPorte" FOREIGN KEY ("IdPorte") REFERENCES public."Porte"("Id") NOT VALID;


-- Completed on 2023-12-07 23:16:50

--
-- PostgreSQL database dump complete
--

