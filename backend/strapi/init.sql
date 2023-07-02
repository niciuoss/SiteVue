--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.2

-- Started on 2022-11-21 05:56:07

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: strapi
--

-- CREATE SCHEMA IF NOT EXISTS public;


ALTER SCHEMA public OWNER TO strapi;

--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: strapi
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16420)
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO strapi;

--
-- TOC entry 217 (class 1259 OID 16419)
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO strapi;

--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- TOC entry 240 (class 1259 OID 16553)
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer
);


ALTER TABLE public.admin_permissions_role_links OWNER TO strapi;

--
-- TOC entry 239 (class 1259 OID 16552)
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO strapi;

--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 239
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- TOC entry 222 (class 1259 OID 16442)
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO strapi;

--
-- TOC entry 221 (class 1259 OID 16441)
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO strapi;

--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- TOC entry 220 (class 1259 OID 16431)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO strapi;

--
-- TOC entry 219 (class 1259 OID 16430)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO strapi;

--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- TOC entry 242 (class 1259 OID 16562)
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.admin_users_roles_links OWNER TO strapi;

--
-- TOC entry 241 (class 1259 OID 16561)
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO strapi;

--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 241
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- TOC entry 258 (class 1259 OID 81944)
-- Name: categoria_materiais; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.categoria_materiais (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.categoria_materiais OWNER TO strapi;

--
-- TOC entry 257 (class 1259 OID 81943)
-- Name: categoria_materiais_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.categoria_materiais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_materiais_id_seq OWNER TO strapi;

--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 257
-- Name: categoria_materiais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.categoria_materiais_id_seq OWNED BY public.categoria_materiais.id;


--
-- TOC entry 268 (class 1259 OID 82112)
-- Name: destinos; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.destinos (
    id integer NOT NULL,
    nome character varying(255),
    rua character varying(255),
    numero character varying(255),
    cidade character varying(255),
    estado character varying(255),
    cep character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    bairro character varying(255)
);


ALTER TABLE public.destinos OWNER TO strapi;

--
-- TOC entry 267 (class 1259 OID 82111)
-- Name: destinos_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.destinos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.destinos_id_seq OWNER TO strapi;

--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 267
-- Name: destinos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.destinos_id_seq OWNED BY public.destinos.id;


--
-- TOC entry 280 (class 1259 OID 90174)
-- Name: entradas; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.entradas (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    observacao text
);


ALTER TABLE public.entradas OWNER TO strapi;

--
-- TOC entry 286 (class 1259 OID 90262)
-- Name: entradas_fornecedor_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.entradas_fornecedor_links (
    id integer NOT NULL,
    entrada_id integer,
    fornecedor_id integer
);


ALTER TABLE public.entradas_fornecedor_links OWNER TO strapi;

--
-- TOC entry 285 (class 1259 OID 90261)
-- Name: entradas_fornecedor_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.entradas_fornecedor_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entradas_fornecedor_links_id_seq OWNER TO strapi;

--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 285
-- Name: entradas_fornecedor_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.entradas_fornecedor_links_id_seq OWNED BY public.entradas_fornecedor_links.id;


--
-- TOC entry 279 (class 1259 OID 90173)
-- Name: entradas_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.entradas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entradas_id_seq OWNER TO strapi;

--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 279
-- Name: entradas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.entradas_id_seq OWNED BY public.entradas.id;


--
-- TOC entry 282 (class 1259 OID 90183)
-- Name: entradas_item_entradas_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.entradas_item_entradas_links (
    id integer NOT NULL,
    entrada_id integer,
    item_entrada_id integer
);


ALTER TABLE public.entradas_item_entradas_links OWNER TO strapi;

--
-- TOC entry 281 (class 1259 OID 90182)
-- Name: entradas_item_entradas_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.entradas_item_entradas_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entradas_item_entradas_links_id_seq OWNER TO strapi;

--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 281
-- Name: entradas_item_entradas_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.entradas_item_entradas_links_id_seq OWNED BY public.entradas_item_entradas_links.id;


--
-- TOC entry 228 (class 1259 OID 16484)
-- Name: files; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO strapi;

--
-- TOC entry 248 (class 1259 OID 16590)
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer
);


ALTER TABLE public.files_folder_links OWNER TO strapi;

--
-- TOC entry 247 (class 1259 OID 16589)
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO strapi;

--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 247
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- TOC entry 227 (class 1259 OID 16483)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO strapi;

--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 227
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 246 (class 1259 OID 16580)
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE public.files_related_morphs OWNER TO strapi;

--
-- TOC entry 245 (class 1259 OID 16579)
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO strapi;

--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 245
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- TOC entry 256 (class 1259 OID 57368)
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.fornecedores (
    id integer NOT NULL,
    nome character varying(255),
    tipo character varying(255),
    cnpjcpf character varying(255),
    email character varying(255),
    telefone character varying(255),
    cep character varying(255),
    rua character varying(255),
    numero character varying(255),
    bairro character varying(255),
    cidade character varying(255),
    estado character varying(255),
    horario_coleta character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    is_destinatario boolean,
    is_ativo boolean
);


ALTER TABLE public.fornecedores OWNER TO strapi;

--
-- TOC entry 255 (class 1259 OID 57367)
-- Name: fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.fornecedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedores_id_seq OWNER TO strapi;

--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 255
-- Name: fornecedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.fornecedores_id_seq OWNED BY public.fornecedores.id;


--
-- TOC entry 232 (class 1259 OID 16511)
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO strapi;

--
-- TOC entry 231 (class 1259 OID 16510)
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO strapi;

--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 231
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- TOC entry 278 (class 1259 OID 90134)
-- Name: itens_entradas; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.itens_entradas (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    quantidade numeric(10,2),
    is_disponivel_estoque boolean,
    data_saida date
);


ALTER TABLE public.itens_entradas OWNER TO strapi;

--
-- TOC entry 277 (class 1259 OID 90133)
-- Name: itens_entradas_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.itens_entradas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itens_entradas_id_seq OWNER TO strapi;

--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 277
-- Name: itens_entradas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.itens_entradas_id_seq OWNED BY public.itens_entradas.id;


--
-- TOC entry 284 (class 1259 OID 90237)
-- Name: itens_entradas_tipo_material_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.itens_entradas_tipo_material_links (
    id integer NOT NULL,
    item_entrada_id integer,
    tipo_material_id integer
);


ALTER TABLE public.itens_entradas_tipo_material_links OWNER TO strapi;

--
-- TOC entry 283 (class 1259 OID 90236)
-- Name: itens_entradas_tipo_material_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.itens_entradas_tipo_material_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itens_entradas_tipo_material_links_id_seq OWNER TO strapi;

--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 283
-- Name: itens_entradas_tipo_material_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.itens_entradas_tipo_material_links_id_seq OWNED BY public.itens_entradas_tipo_material_links.id;


--
-- TOC entry 264 (class 1259 OID 82070)
-- Name: maquinas; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.maquinas (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.maquinas OWNER TO strapi;

--
-- TOC entry 263 (class 1259 OID 82069)
-- Name: maquinas_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.maquinas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maquinas_id_seq OWNER TO strapi;

--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 263
-- Name: maquinas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.maquinas_id_seq OWNED BY public.maquinas.id;


--
-- TOC entry 270 (class 1259 OID 82135)
-- Name: motoristas; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.motoristas (
    id integer NOT NULL,
    nome character varying(255),
    cpf character varying(255),
    cnh character varying(255),
    telefone character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.motoristas OWNER TO strapi;

--
-- TOC entry 272 (class 1259 OID 82146)
-- Name: motoristas_fornecedor_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.motoristas_fornecedor_links (
    id integer NOT NULL,
    motorista_id integer,
    fornecedor_id integer
);


ALTER TABLE public.motoristas_fornecedor_links OWNER TO strapi;

--
-- TOC entry 271 (class 1259 OID 82145)
-- Name: motoristas_fornecedor_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.motoristas_fornecedor_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motoristas_fornecedor_links_id_seq OWNER TO strapi;

--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 271
-- Name: motoristas_fornecedor_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.motoristas_fornecedor_links_id_seq OWNED BY public.motoristas_fornecedor_links.id;


--
-- TOC entry 269 (class 1259 OID 82134)
-- Name: motoristas_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.motoristas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motoristas_id_seq OWNER TO strapi;

--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 269
-- Name: motoristas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.motoristas_id_seq OWNED BY public.motoristas.id;


--
-- TOC entry 266 (class 1259 OID 82091)
-- Name: produtos; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.produtos OWNER TO strapi;

--
-- TOC entry 265 (class 1259 OID 82090)
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO strapi;

--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 265
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- TOC entry 226 (class 1259 OID 16464)
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO strapi;

--
-- TOC entry 225 (class 1259 OID 16463)
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO strapi;

--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 225
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- TOC entry 244 (class 1259 OID 16571)
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO strapi;

--
-- TOC entry 243 (class 1259 OID 16570)
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO strapi;

--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 243
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- TOC entry 224 (class 1259 OID 16453)
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO strapi;

--
-- TOC entry 223 (class 1259 OID 16452)
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO strapi;

--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 223
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- TOC entry 214 (class 1259 OID 16402)
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO strapi;

--
-- TOC entry 213 (class 1259 OID 16401)
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO strapi;

--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 213
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- TOC entry 212 (class 1259 OID 16393)
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO strapi;

--
-- TOC entry 211 (class 1259 OID 16392)
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO strapi;

--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 211
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- TOC entry 210 (class 1259 OID 16386)
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO strapi;

--
-- TOC entry 209 (class 1259 OID 16385)
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO strapi;

--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 209
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- TOC entry 216 (class 1259 OID 16411)
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO strapi;

--
-- TOC entry 215 (class 1259 OID 16410)
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO strapi;

--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 215
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- TOC entry 260 (class 1259 OID 82008)
-- Name: tipos_materiais; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.tipos_materiais (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.tipos_materiais OWNER TO strapi;

--
-- TOC entry 262 (class 1259 OID 82049)
-- Name: tipos_materiais_categoria_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.tipos_materiais_categoria_links (
    id integer NOT NULL,
    tipo_material_id integer,
    categoria_material_id integer
);


ALTER TABLE public.tipos_materiais_categoria_links OWNER TO strapi;

--
-- TOC entry 261 (class 1259 OID 82048)
-- Name: tipos_materiais_categoria_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.tipos_materiais_categoria_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_materiais_categoria_links_id_seq OWNER TO strapi;

--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 261
-- Name: tipos_materiais_categoria_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.tipos_materiais_categoria_links_id_seq OWNED BY public.tipos_materiais_categoria_links.id;


--
-- TOC entry 259 (class 1259 OID 82007)
-- Name: tipos_materiais_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.tipos_materiais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_materiais_id_seq OWNER TO strapi;

--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipos_materiais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.tipos_materiais_id_seq OWNED BY public.tipos_materiais.id;


--
-- TOC entry 234 (class 1259 OID 16522)
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO strapi;

--
-- TOC entry 233 (class 1259 OID 16521)
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO strapi;

--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 233
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- TOC entry 252 (class 1259 OID 16608)
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer
);


ALTER TABLE public.up_permissions_role_links OWNER TO strapi;

--
-- TOC entry 251 (class 1259 OID 16607)
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO strapi;

--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 251
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- TOC entry 236 (class 1259 OID 16531)
-- Name: up_roles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO strapi;

--
-- TOC entry 235 (class 1259 OID 16530)
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO strapi;

--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 235
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- TOC entry 238 (class 1259 OID 16542)
-- Name: up_users; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    telefone character varying(255),
    cpf character varying(255)
);


ALTER TABLE public.up_users OWNER TO strapi;

--
-- TOC entry 237 (class 1259 OID 16541)
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO strapi;

--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- TOC entry 254 (class 1259 OID 16617)
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.up_users_role_links OWNER TO strapi;

--
-- TOC entry 253 (class 1259 OID 16616)
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO strapi;

--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 253
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- TOC entry 230 (class 1259 OID 16496)
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO strapi;

--
-- TOC entry 229 (class 1259 OID 16495)
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO strapi;

--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 229
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- TOC entry 250 (class 1259 OID 16599)
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer
);


ALTER TABLE public.upload_folders_parent_links OWNER TO strapi;

--
-- TOC entry 249 (class 1259 OID 16598)
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO strapi;

--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 249
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- TOC entry 274 (class 1259 OID 82177)
-- Name: veiculos; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.veiculos (
    id integer NOT NULL,
    nome character varying(255),
    placa character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.veiculos OWNER TO strapi;

--
-- TOC entry 276 (class 1259 OID 82188)
-- Name: veiculos_fornecedor_links; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.veiculos_fornecedor_links (
    id integer NOT NULL,
    veiculo_id integer,
    fornecedor_id integer
);


ALTER TABLE public.veiculos_fornecedor_links OWNER TO strapi;

--
-- TOC entry 275 (class 1259 OID 82187)
-- Name: veiculos_fornecedor_links_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.veiculos_fornecedor_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veiculos_fornecedor_links_id_seq OWNER TO strapi;

--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 275
-- Name: veiculos_fornecedor_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.veiculos_fornecedor_links_id_seq OWNED BY public.veiculos_fornecedor_links.id;


--
-- TOC entry 273 (class 1259 OID 82176)
-- Name: veiculos_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.veiculos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veiculos_id_seq OWNER TO strapi;

--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 273
-- Name: veiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.veiculos_id_seq OWNED BY public.veiculos.id;


--
-- TOC entry 3373 (class 2604 OID 16423)
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- TOC entry 3384 (class 2604 OID 16556)
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- TOC entry 3375 (class 2604 OID 16445)
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- TOC entry 3374 (class 2604 OID 16434)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- TOC entry 3385 (class 2604 OID 16565)
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- TOC entry 3393 (class 2604 OID 81947)
-- Name: categoria_materiais id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.categoria_materiais ALTER COLUMN id SET DEFAULT nextval('public.categoria_materiais_id_seq'::regclass);


--
-- TOC entry 3398 (class 2604 OID 82115)
-- Name: destinos id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.destinos ALTER COLUMN id SET DEFAULT nextval('public.destinos_id_seq'::regclass);


--
-- TOC entry 3404 (class 2604 OID 90177)
-- Name: entradas id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas ALTER COLUMN id SET DEFAULT nextval('public.entradas_id_seq'::regclass);


--
-- TOC entry 3407 (class 2604 OID 90265)
-- Name: entradas_fornecedor_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_fornecedor_links ALTER COLUMN id SET DEFAULT nextval('public.entradas_fornecedor_links_id_seq'::regclass);


--
-- TOC entry 3405 (class 2604 OID 90186)
-- Name: entradas_item_entradas_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_item_entradas_links ALTER COLUMN id SET DEFAULT nextval('public.entradas_item_entradas_links_id_seq'::regclass);


--
-- TOC entry 3378 (class 2604 OID 16487)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 3388 (class 2604 OID 16593)
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- TOC entry 3387 (class 2604 OID 16583)
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- TOC entry 3392 (class 2604 OID 57371)
-- Name: fornecedores id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.fornecedores ALTER COLUMN id SET DEFAULT nextval('public.fornecedores_id_seq'::regclass);


--
-- TOC entry 3380 (class 2604 OID 16514)
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- TOC entry 3403 (class 2604 OID 90137)
-- Name: itens_entradas id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas ALTER COLUMN id SET DEFAULT nextval('public.itens_entradas_id_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 90240)
-- Name: itens_entradas_tipo_material_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas_tipo_material_links ALTER COLUMN id SET DEFAULT nextval('public.itens_entradas_tipo_material_links_id_seq'::regclass);


--
-- TOC entry 3396 (class 2604 OID 82073)
-- Name: maquinas id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.maquinas ALTER COLUMN id SET DEFAULT nextval('public.maquinas_id_seq'::regclass);


--
-- TOC entry 3399 (class 2604 OID 82138)
-- Name: motoristas id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas ALTER COLUMN id SET DEFAULT nextval('public.motoristas_id_seq'::regclass);


--
-- TOC entry 3400 (class 2604 OID 82149)
-- Name: motoristas_fornecedor_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas_fornecedor_links ALTER COLUMN id SET DEFAULT nextval('public.motoristas_fornecedor_links_id_seq'::regclass);


--
-- TOC entry 3397 (class 2604 OID 82094)
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- TOC entry 3377 (class 2604 OID 16467)
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- TOC entry 3386 (class 2604 OID 16574)
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- TOC entry 3376 (class 2604 OID 16456)
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- TOC entry 3371 (class 2604 OID 16405)
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- TOC entry 3370 (class 2604 OID 16396)
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 16389)
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- TOC entry 3372 (class 2604 OID 16414)
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- TOC entry 3394 (class 2604 OID 82011)
-- Name: tipos_materiais id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais ALTER COLUMN id SET DEFAULT nextval('public.tipos_materiais_id_seq'::regclass);


--
-- TOC entry 3395 (class 2604 OID 82052)
-- Name: tipos_materiais_categoria_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais_categoria_links ALTER COLUMN id SET DEFAULT nextval('public.tipos_materiais_categoria_links_id_seq'::regclass);


--
-- TOC entry 3381 (class 2604 OID 16525)
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- TOC entry 3390 (class 2604 OID 16611)
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- TOC entry 3382 (class 2604 OID 16534)
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- TOC entry 3383 (class 2604 OID 16545)
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- TOC entry 3391 (class 2604 OID 16620)
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- TOC entry 3379 (class 2604 OID 16499)
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- TOC entry 3389 (class 2604 OID 16602)
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- TOC entry 3401 (class 2604 OID 82180)
-- Name: veiculos id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos ALTER COLUMN id SET DEFAULT nextval('public.veiculos_id_seq'::regclass);


--
-- TOC entry 3402 (class 2604 OID 82191)
-- Name: veiculos_fornecedor_links id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos_fornecedor_links ALTER COLUMN id SET DEFAULT nextval('public.veiculos_fornecedor_links_id_seq'::regclass);


--
-- TOC entry 3777 (class 0 OID 16420)
-- Dependencies: 218
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.admin_permissions VALUES (6, 'plugin::upload.read', NULL, '{}', '[]', '2022-11-05 12:14:09.417', '2022-11-05 12:14:09.417', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (7, 'plugin::upload.assets.create', NULL, '{}', '[]', '2022-11-05 12:14:09.45', '2022-11-05 12:14:09.45', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (8, 'plugin::upload.assets.update', NULL, '{}', '[]', '2022-11-05 12:14:09.484', '2022-11-05 12:14:09.484', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (9, 'plugin::upload.assets.download', NULL, '{}', '[]', '2022-11-05 12:14:09.517', '2022-11-05 12:14:09.517', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (10, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2022-11-05 12:14:09.55', '2022-11-05 12:14:09.55', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (15, 'plugin::upload.read', NULL, '{}', '["admin::is-creator"]', '2022-11-05 12:14:09.754', '2022-11-05 12:14:09.754', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (16, 'plugin::upload.assets.create', NULL, '{}', '[]', '2022-11-05 12:14:09.793', '2022-11-05 12:14:09.793', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (17, 'plugin::upload.assets.update', NULL, '{}', '["admin::is-creator"]', '2022-11-05 12:14:09.827', '2022-11-05 12:14:09.827', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (18, 'plugin::upload.assets.download', NULL, '{}', '[]', '2022-11-05 12:14:09.87', '2022-11-05 12:14:09.87', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (19, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2022-11-05 12:14:09.912', '2022-11-05 12:14:09.912', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (27, 'plugin::content-manager.explorer.delete', 'plugin::users-permissions.user', '{}', '[]', '2022-11-05 12:14:10.268', '2022-11-05 12:14:10.268', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (29, 'plugin::content-manager.single-types.configure-view', NULL, '{}', '[]', '2022-11-05 12:14:10.335', '2022-11-05 12:14:10.335', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (30, 'plugin::content-manager.collection-types.configure-view', NULL, '{}', '[]', '2022-11-05 12:14:10.368', '2022-11-05 12:14:10.368', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (31, 'plugin::content-manager.components.configure-layout', NULL, '{}', '[]', '2022-11-05 12:14:10.402', '2022-11-05 12:14:10.402', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (32, 'plugin::content-type-builder.read', NULL, '{}', '[]', '2022-11-05 12:14:10.435', '2022-11-05 12:14:10.435', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (33, 'plugin::email.settings.read', NULL, '{}', '[]', '2022-11-05 12:14:10.467', '2022-11-05 12:14:10.467', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (34, 'plugin::upload.read', NULL, '{}', '[]', '2022-11-05 12:14:10.5', '2022-11-05 12:14:10.5', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (35, 'plugin::upload.assets.create', NULL, '{}', '[]', '2022-11-05 12:14:10.55', '2022-11-05 12:14:10.55', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (36, 'plugin::upload.assets.update', NULL, '{}', '[]', '2022-11-05 12:14:10.584', '2022-11-05 12:14:10.584', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (37, 'plugin::upload.assets.download', NULL, '{}', '[]', '2022-11-05 12:14:10.62', '2022-11-05 12:14:10.62', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (38, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2022-11-05 12:14:10.662', '2022-11-05 12:14:10.662', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (39, 'plugin::upload.settings.read', NULL, '{}', '[]', '2022-11-05 12:14:10.703', '2022-11-05 12:14:10.703', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (40, 'plugin::i18n.locale.create', NULL, '{}', '[]', '2022-11-05 12:14:10.745', '2022-11-05 12:14:10.745', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (41, 'plugin::i18n.locale.read', NULL, '{}', '[]', '2022-11-05 12:14:10.787', '2022-11-05 12:14:10.787', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (42, 'plugin::i18n.locale.update', NULL, '{}', '[]', '2022-11-05 12:14:10.828', '2022-11-05 12:14:10.828', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (43, 'plugin::i18n.locale.delete', NULL, '{}', '[]', '2022-11-05 12:14:10.872', '2022-11-05 12:14:10.872', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (44, 'plugin::users-permissions.roles.create', NULL, '{}', '[]', '2022-11-05 12:14:10.94', '2022-11-05 12:14:10.94', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (45, 'plugin::users-permissions.roles.read', NULL, '{}', '[]', '2022-11-05 12:14:10.986', '2022-11-05 12:14:10.986', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (46, 'plugin::users-permissions.roles.update', NULL, '{}', '[]', '2022-11-05 12:14:11.034', '2022-11-05 12:14:11.034', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (47, 'plugin::users-permissions.roles.delete', NULL, '{}', '[]', '2022-11-05 12:14:11.075', '2022-11-05 12:14:11.075', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (48, 'plugin::users-permissions.providers.read', NULL, '{}', '[]', '2022-11-05 12:14:11.108', '2022-11-05 12:14:11.108', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (49, 'plugin::users-permissions.providers.update', NULL, '{}', '[]', '2022-11-05 12:14:11.142', '2022-11-05 12:14:11.142', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (50, 'plugin::users-permissions.email-templates.read', NULL, '{}', '[]', '2022-11-05 12:14:11.175', '2022-11-05 12:14:11.175', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (51, 'plugin::users-permissions.email-templates.update', NULL, '{}', '[]', '2022-11-05 12:14:11.209', '2022-11-05 12:14:11.209', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (52, 'plugin::users-permissions.advanced-settings.read', NULL, '{}', '[]', '2022-11-05 12:14:11.242', '2022-11-05 12:14:11.242', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (53, 'plugin::users-permissions.advanced-settings.update', NULL, '{}', '[]', '2022-11-05 12:14:11.275', '2022-11-05 12:14:11.275', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (54, 'admin::marketplace.read', NULL, '{}', '[]', '2022-11-05 12:14:11.308', '2022-11-05 12:14:11.308', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (55, 'admin::marketplace.plugins.install', NULL, '{}', '[]', '2022-11-05 12:14:11.342', '2022-11-05 12:14:11.342', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (56, 'admin::marketplace.plugins.uninstall', NULL, '{}', '[]', '2022-11-05 12:14:11.376', '2022-11-05 12:14:11.376', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (57, 'admin::webhooks.create', NULL, '{}', '[]', '2022-11-05 12:14:11.409', '2022-11-05 12:14:11.409', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (58, 'admin::webhooks.read', NULL, '{}', '[]', '2022-11-05 12:14:11.443', '2022-11-05 12:14:11.443', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (59, 'admin::webhooks.update', NULL, '{}', '[]', '2022-11-05 12:14:11.484', '2022-11-05 12:14:11.484', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (60, 'admin::webhooks.delete', NULL, '{}', '[]', '2022-11-05 12:14:11.517', '2022-11-05 12:14:11.517', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (61, 'admin::users.create', NULL, '{}', '[]', '2022-11-05 12:14:11.55', '2022-11-05 12:14:11.55', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (62, 'admin::users.read', NULL, '{}', '[]', '2022-11-05 12:14:11.583', '2022-11-05 12:14:11.583', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (63, 'admin::users.update', NULL, '{}', '[]', '2022-11-05 12:14:11.625', '2022-11-05 12:14:11.625', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (64, 'admin::users.delete', NULL, '{}', '[]', '2022-11-05 12:14:11.658', '2022-11-05 12:14:11.658', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (65, 'admin::roles.create', NULL, '{}', '[]', '2022-11-05 12:14:11.693', '2022-11-05 12:14:11.693', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (66, 'admin::roles.read', NULL, '{}', '[]', '2022-11-05 12:14:11.725', '2022-11-05 12:14:11.725', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (67, 'admin::roles.update', NULL, '{}', '[]', '2022-11-05 12:14:11.758', '2022-11-05 12:14:11.758', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (68, 'admin::roles.delete', NULL, '{}', '[]', '2022-11-05 12:14:11.792', '2022-11-05 12:14:11.792', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (69, 'admin::api-tokens.access', NULL, '{}', '[]', '2022-11-05 12:14:11.825', '2022-11-05 12:14:11.825', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (70, 'admin::api-tokens.create', NULL, '{}', '[]', '2022-11-05 12:14:11.859', '2022-11-05 12:14:11.859', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (71, 'admin::api-tokens.read', NULL, '{}', '[]', '2022-11-05 12:14:11.891', '2022-11-05 12:14:11.891', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (72, 'admin::api-tokens.update', NULL, '{}', '[]', '2022-11-05 12:14:11.924', '2022-11-05 12:14:11.924', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (73, 'admin::api-tokens.regenerate', NULL, '{}', '[]', '2022-11-05 12:14:11.959', '2022-11-05 12:14:11.959', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (74, 'admin::api-tokens.delete', NULL, '{}', '[]', '2022-11-05 12:14:11.993', '2022-11-05 12:14:11.993', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (75, 'admin::project-settings.update', NULL, '{}', '[]', '2022-11-05 12:14:12.026', '2022-11-05 12:14:12.026', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (76, 'admin::project-settings.read', NULL, '{}', '[]', '2022-11-05 12:14:12.058', '2022-11-05 12:14:12.058', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (192, 'plugin::content-manager.explorer.create', 'api::entrada.entrada', '{"fields": ["item_entradas", "fornecedor", "observacao"]}', '[]', '2022-11-19 00:16:12.372', '2022-11-19 00:16:12.372', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (193, 'plugin::content-manager.explorer.read', 'api::entrada.entrada', '{"fields": ["item_entradas", "fornecedor", "observacao"]}', '[]', '2022-11-19 00:16:12.415', '2022-11-19 00:16:12.415', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (194, 'plugin::content-manager.explorer.update', 'api::entrada.entrada', '{"fields": ["item_entradas", "fornecedor", "observacao"]}', '[]', '2022-11-19 00:16:12.456', '2022-11-19 00:16:12.456', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (80, 'plugin::content-manager.explorer.delete', 'api::fornecedor.fornecedor', '{}', '[]', '2022-11-10 16:54:34.129', '2022-11-10 16:54:34.129', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (81, 'plugin::content-manager.explorer.publish', 'api::fornecedor.fornecedor', '{}', '[]', '2022-11-10 16:54:34.17', '2022-11-10 16:54:34.17', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (85, 'plugin::content-manager.explorer.create', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "telefone", "cpf"]}', '[]', '2022-11-15 13:50:56.707', '2022-11-15 13:50:56.707', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (86, 'plugin::content-manager.explorer.read', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "telefone", "cpf"]}', '[]', '2022-11-15 13:50:56.748', '2022-11-15 13:50:56.748', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (87, 'plugin::content-manager.explorer.update', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "telefone", "cpf"]}', '[]', '2022-11-15 13:50:56.79', '2022-11-15 13:50:56.79', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (91, 'plugin::content-manager.explorer.delete', 'api::categoria-material.categoria-material', '{}', '[]', '2022-11-15 14:13:13.409', '2022-11-15 14:13:13.409', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (92, 'plugin::content-manager.explorer.publish', 'api::categoria-material.categoria-material', '{}', '[]', '2022-11-15 14:13:13.45', '2022-11-15 14:13:13.45', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (110, 'plugin::content-manager.explorer.delete', 'api::tipo-material.tipo-material', '{}', '[]', '2022-11-15 16:43:15.842', '2022-11-15 16:43:15.842', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (111, 'plugin::content-manager.explorer.publish', 'api::tipo-material.tipo-material', '{}', '[]', '2022-11-15 16:43:15.875', '2022-11-15 16:43:15.875', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (112, 'plugin::content-manager.explorer.create', 'api::categoria-material.categoria-material', '{"fields": ["nome", "tipos"]}', '[]', '2022-11-15 16:48:52.473', '2022-11-15 16:48:52.473', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (113, 'plugin::content-manager.explorer.create', 'api::tipo-material.tipo-material', '{"fields": ["nome", "categoria"]}', '[]', '2022-11-15 16:48:52.528', '2022-11-15 16:48:52.528', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (114, 'plugin::content-manager.explorer.read', 'api::categoria-material.categoria-material', '{"fields": ["nome", "tipos"]}', '[]', '2022-11-15 16:48:52.576', '2022-11-15 16:48:52.576', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (115, 'plugin::content-manager.explorer.read', 'api::tipo-material.tipo-material', '{"fields": ["nome", "categoria"]}', '[]', '2022-11-15 16:48:52.626', '2022-11-15 16:48:52.626', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (116, 'plugin::content-manager.explorer.update', 'api::categoria-material.categoria-material', '{"fields": ["nome", "tipos"]}', '[]', '2022-11-15 16:48:52.677', '2022-11-15 16:48:52.677', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (117, 'plugin::content-manager.explorer.update', 'api::tipo-material.tipo-material', '{"fields": ["nome", "categoria"]}', '[]', '2022-11-15 16:48:52.735', '2022-11-15 16:48:52.735', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (118, 'plugin::content-manager.explorer.create', 'api::maquina.maquina', '{"fields": ["nome"]}', '[]', '2022-11-15 18:41:23.63', '2022-11-15 18:41:23.63', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (119, 'plugin::content-manager.explorer.read', 'api::maquina.maquina', '{"fields": ["nome"]}', '[]', '2022-11-15 18:41:23.677', '2022-11-15 18:41:23.677', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (120, 'plugin::content-manager.explorer.update', 'api::maquina.maquina', '{"fields": ["nome"]}', '[]', '2022-11-15 18:41:23.719', '2022-11-15 18:41:23.719', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (121, 'plugin::content-manager.explorer.delete', 'api::maquina.maquina', '{}', '[]', '2022-11-15 18:41:23.769', '2022-11-15 18:41:23.769', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (122, 'plugin::content-manager.explorer.publish', 'api::maquina.maquina', '{}', '[]', '2022-11-15 18:41:23.819', '2022-11-15 18:41:23.819', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (123, 'plugin::content-manager.explorer.create', 'api::produto.produto', '{"fields": ["nome"]}', '[]', '2022-11-15 20:10:15.414', '2022-11-15 20:10:15.414', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (124, 'plugin::content-manager.explorer.read', 'api::produto.produto', '{"fields": ["nome"]}', '[]', '2022-11-15 20:10:15.452', '2022-11-15 20:10:15.452', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (125, 'plugin::content-manager.explorer.update', 'api::produto.produto', '{"fields": ["nome"]}', '[]', '2022-11-15 20:10:15.485', '2022-11-15 20:10:15.485', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (126, 'plugin::content-manager.explorer.delete', 'api::produto.produto', '{}', '[]', '2022-11-15 20:10:15.519', '2022-11-15 20:10:15.519', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (127, 'plugin::content-manager.explorer.publish', 'api::produto.produto', '{}', '[]', '2022-11-15 20:10:15.577', '2022-11-15 20:10:15.577', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (131, 'plugin::content-manager.explorer.delete', 'api::destino.destino', '{}', '[]', '2022-11-15 20:11:57.657', '2022-11-15 20:11:57.657', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (132, 'plugin::content-manager.explorer.publish', 'api::destino.destino', '{}', '[]', '2022-11-15 20:11:57.699', '2022-11-15 20:11:57.699', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (134, 'plugin::content-manager.explorer.create', 'api::motorista.motorista', '{"fields": ["nome", "cpf", "cnh", "telefone", "fornecedor"]}', '[]', '2022-11-15 20:16:25.158', '2022-11-15 20:16:25.158', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (136, 'plugin::content-manager.explorer.read', 'api::motorista.motorista', '{"fields": ["nome", "cpf", "cnh", "telefone", "fornecedor"]}', '[]', '2022-11-15 20:16:25.224', '2022-11-15 20:16:25.224', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (138, 'plugin::content-manager.explorer.update', 'api::motorista.motorista', '{"fields": ["nome", "cpf", "cnh", "telefone", "fornecedor"]}', '[]', '2022-11-15 20:16:25.291', '2022-11-15 20:16:25.291', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (139, 'plugin::content-manager.explorer.delete', 'api::motorista.motorista', '{}', '[]', '2022-11-15 20:16:25.326', '2022-11-15 20:16:25.326', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (140, 'plugin::content-manager.explorer.publish', 'api::motorista.motorista', '{}', '[]', '2022-11-15 20:16:25.368', '2022-11-15 20:16:25.368', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (142, 'plugin::content-manager.explorer.create', 'api::veiculo.veiculo', '{"fields": ["nome", "placa", "fornecedor"]}', '[]', '2022-11-15 20:17:33.406', '2022-11-15 20:17:33.406', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (144, 'plugin::content-manager.explorer.read', 'api::veiculo.veiculo', '{"fields": ["nome", "placa", "fornecedor"]}', '[]', '2022-11-15 20:17:33.473', '2022-11-15 20:17:33.473', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (146, 'plugin::content-manager.explorer.update', 'api::veiculo.veiculo', '{"fields": ["nome", "placa", "fornecedor"]}', '[]', '2022-11-15 20:17:33.565', '2022-11-15 20:17:33.565', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (147, 'plugin::content-manager.explorer.delete', 'api::veiculo.veiculo', '{}', '[]', '2022-11-15 20:17:33.598', '2022-11-15 20:17:33.598', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (148, 'plugin::content-manager.explorer.publish', 'api::veiculo.veiculo', '{}', '[]', '2022-11-15 20:17:33.641', '2022-11-15 20:17:33.641', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (149, 'plugin::content-manager.explorer.create', 'api::destino.destino', '{"fields": ["nome", "rua", "numero", "bairro", "cidade", "estado", "cep"]}', '[]', '2022-11-15 21:33:31.061', '2022-11-15 21:33:31.061', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (150, 'plugin::content-manager.explorer.read', 'api::destino.destino', '{"fields": ["nome", "rua", "numero", "bairro", "cidade", "estado", "cep"]}', '[]', '2022-11-15 21:33:31.103', '2022-11-15 21:33:31.103', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (151, 'plugin::content-manager.explorer.update', 'api::destino.destino', '{"fields": ["nome", "rua", "numero", "bairro", "cidade", "estado", "cep"]}', '[]', '2022-11-15 21:33:31.145', '2022-11-15 21:33:31.145', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (155, 'plugin::content-manager.explorer.delete', 'api::item-entrada.item-entrada', '{}', '[]', '2022-11-16 19:40:29.234', '2022-11-16 19:40:29.234', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (156, 'plugin::content-manager.explorer.publish', 'api::item-entrada.item-entrada', '{}', '[]', '2022-11-16 19:40:29.275', '2022-11-16 19:40:29.275', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (160, 'plugin::content-manager.explorer.delete', 'api::entrada.entrada', '{}', '[]', '2022-11-16 19:41:27.382', '2022-11-16 19:41:27.382', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (161, 'plugin::content-manager.explorer.publish', 'api::entrada.entrada', '{}', '[]', '2022-11-16 19:41:27.424', '2022-11-16 19:41:27.424', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (178, 'plugin::content-manager.explorer.create', 'api::fornecedor.fornecedor', '{"fields": ["nome", "tipo", "isDestinatario", "cnpjcpf", "email", "telefone", "cep", "rua", "numero", "bairro", "cidade", "estado", "horarioColeta", "isAtivo", "motoristas", "veiculos", "entradas"]}', '[]', '2022-11-18 12:53:44.667', '2022-11-18 12:53:44.667', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (180, 'plugin::content-manager.explorer.read', 'api::fornecedor.fornecedor', '{"fields": ["nome", "tipo", "isDestinatario", "cnpjcpf", "email", "telefone", "cep", "rua", "numero", "bairro", "cidade", "estado", "horarioColeta", "isAtivo", "motoristas", "veiculos", "entradas"]}', '[]', '2022-11-18 12:53:44.75', '2022-11-18 12:53:44.75', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (182, 'plugin::content-manager.explorer.update', 'api::fornecedor.fornecedor', '{"fields": ["nome", "tipo", "isDestinatario", "cnpjcpf", "email", "telefone", "cep", "rua", "numero", "bairro", "cidade", "estado", "horarioColeta", "isAtivo", "motoristas", "veiculos", "entradas"]}', '[]', '2022-11-18 12:53:44.834', '2022-11-18 12:53:44.834', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (186, 'plugin::content-manager.explorer.create', 'api::item-entrada.item-entrada', '{"fields": ["tipo_material", "quantidade", "isDisponivelEstoque", "dataSaida"]}', '[]', '2022-11-18 14:21:42.479', '2022-11-18 14:21:42.479', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (187, 'plugin::content-manager.explorer.read', 'api::item-entrada.item-entrada', '{"fields": ["tipo_material", "quantidade", "isDisponivelEstoque", "dataSaida"]}', '[]', '2022-11-18 14:21:42.522', '2022-11-18 14:21:42.522', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (188, 'plugin::content-manager.explorer.update', 'api::item-entrada.item-entrada', '{"fields": ["tipo_material", "quantidade", "isDisponivelEstoque", "dataSaida"]}', '[]', '2022-11-18 14:21:42.563', '2022-11-18 14:21:42.563', NULL, NULL);


--
-- TOC entry 3799 (class 0 OID 16553)
-- Dependencies: 240
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.admin_permissions_role_links VALUES (192, 192, 1);
INSERT INTO public.admin_permissions_role_links VALUES (193, 193, 1);
INSERT INTO public.admin_permissions_role_links VALUES (6, 6, 2);
INSERT INTO public.admin_permissions_role_links VALUES (7, 7, 2);
INSERT INTO public.admin_permissions_role_links VALUES (8, 8, 2);
INSERT INTO public.admin_permissions_role_links VALUES (9, 9, 2);
INSERT INTO public.admin_permissions_role_links VALUES (10, 10, 2);
INSERT INTO public.admin_permissions_role_links VALUES (194, 194, 1);
INSERT INTO public.admin_permissions_role_links VALUES (15, 15, 3);
INSERT INTO public.admin_permissions_role_links VALUES (16, 16, 3);
INSERT INTO public.admin_permissions_role_links VALUES (17, 17, 3);
INSERT INTO public.admin_permissions_role_links VALUES (18, 18, 3);
INSERT INTO public.admin_permissions_role_links VALUES (19, 19, 3);
INSERT INTO public.admin_permissions_role_links VALUES (27, 27, 1);
INSERT INTO public.admin_permissions_role_links VALUES (29, 29, 1);
INSERT INTO public.admin_permissions_role_links VALUES (30, 30, 1);
INSERT INTO public.admin_permissions_role_links VALUES (31, 31, 1);
INSERT INTO public.admin_permissions_role_links VALUES (32, 32, 1);
INSERT INTO public.admin_permissions_role_links VALUES (33, 33, 1);
INSERT INTO public.admin_permissions_role_links VALUES (34, 34, 1);
INSERT INTO public.admin_permissions_role_links VALUES (35, 35, 1);
INSERT INTO public.admin_permissions_role_links VALUES (36, 36, 1);
INSERT INTO public.admin_permissions_role_links VALUES (37, 37, 1);
INSERT INTO public.admin_permissions_role_links VALUES (38, 38, 1);
INSERT INTO public.admin_permissions_role_links VALUES (39, 39, 1);
INSERT INTO public.admin_permissions_role_links VALUES (40, 40, 1);
INSERT INTO public.admin_permissions_role_links VALUES (41, 41, 1);
INSERT INTO public.admin_permissions_role_links VALUES (42, 42, 1);
INSERT INTO public.admin_permissions_role_links VALUES (43, 43, 1);
INSERT INTO public.admin_permissions_role_links VALUES (44, 44, 1);
INSERT INTO public.admin_permissions_role_links VALUES (45, 45, 1);
INSERT INTO public.admin_permissions_role_links VALUES (46, 46, 1);
INSERT INTO public.admin_permissions_role_links VALUES (47, 47, 1);
INSERT INTO public.admin_permissions_role_links VALUES (48, 48, 1);
INSERT INTO public.admin_permissions_role_links VALUES (49, 49, 1);
INSERT INTO public.admin_permissions_role_links VALUES (50, 50, 1);
INSERT INTO public.admin_permissions_role_links VALUES (51, 51, 1);
INSERT INTO public.admin_permissions_role_links VALUES (52, 52, 1);
INSERT INTO public.admin_permissions_role_links VALUES (53, 53, 1);
INSERT INTO public.admin_permissions_role_links VALUES (54, 54, 1);
INSERT INTO public.admin_permissions_role_links VALUES (55, 55, 1);
INSERT INTO public.admin_permissions_role_links VALUES (56, 56, 1);
INSERT INTO public.admin_permissions_role_links VALUES (57, 57, 1);
INSERT INTO public.admin_permissions_role_links VALUES (58, 58, 1);
INSERT INTO public.admin_permissions_role_links VALUES (59, 59, 1);
INSERT INTO public.admin_permissions_role_links VALUES (60, 60, 1);
INSERT INTO public.admin_permissions_role_links VALUES (61, 61, 1);
INSERT INTO public.admin_permissions_role_links VALUES (62, 62, 1);
INSERT INTO public.admin_permissions_role_links VALUES (63, 63, 1);
INSERT INTO public.admin_permissions_role_links VALUES (64, 64, 1);
INSERT INTO public.admin_permissions_role_links VALUES (65, 65, 1);
INSERT INTO public.admin_permissions_role_links VALUES (66, 66, 1);
INSERT INTO public.admin_permissions_role_links VALUES (67, 67, 1);
INSERT INTO public.admin_permissions_role_links VALUES (68, 68, 1);
INSERT INTO public.admin_permissions_role_links VALUES (69, 69, 1);
INSERT INTO public.admin_permissions_role_links VALUES (70, 70, 1);
INSERT INTO public.admin_permissions_role_links VALUES (71, 71, 1);
INSERT INTO public.admin_permissions_role_links VALUES (72, 72, 1);
INSERT INTO public.admin_permissions_role_links VALUES (73, 73, 1);
INSERT INTO public.admin_permissions_role_links VALUES (74, 74, 1);
INSERT INTO public.admin_permissions_role_links VALUES (75, 75, 1);
INSERT INTO public.admin_permissions_role_links VALUES (76, 76, 1);
INSERT INTO public.admin_permissions_role_links VALUES (80, 80, 1);
INSERT INTO public.admin_permissions_role_links VALUES (81, 81, 1);
INSERT INTO public.admin_permissions_role_links VALUES (85, 85, 1);
INSERT INTO public.admin_permissions_role_links VALUES (86, 86, 1);
INSERT INTO public.admin_permissions_role_links VALUES (87, 87, 1);
INSERT INTO public.admin_permissions_role_links VALUES (91, 91, 1);
INSERT INTO public.admin_permissions_role_links VALUES (92, 92, 1);
INSERT INTO public.admin_permissions_role_links VALUES (110, 110, 1);
INSERT INTO public.admin_permissions_role_links VALUES (111, 111, 1);
INSERT INTO public.admin_permissions_role_links VALUES (112, 112, 1);
INSERT INTO public.admin_permissions_role_links VALUES (113, 113, 1);
INSERT INTO public.admin_permissions_role_links VALUES (114, 114, 1);
INSERT INTO public.admin_permissions_role_links VALUES (115, 115, 1);
INSERT INTO public.admin_permissions_role_links VALUES (116, 116, 1);
INSERT INTO public.admin_permissions_role_links VALUES (117, 117, 1);
INSERT INTO public.admin_permissions_role_links VALUES (118, 118, 1);
INSERT INTO public.admin_permissions_role_links VALUES (119, 119, 1);
INSERT INTO public.admin_permissions_role_links VALUES (120, 120, 1);
INSERT INTO public.admin_permissions_role_links VALUES (121, 121, 1);
INSERT INTO public.admin_permissions_role_links VALUES (122, 122, 1);
INSERT INTO public.admin_permissions_role_links VALUES (123, 123, 1);
INSERT INTO public.admin_permissions_role_links VALUES (124, 124, 1);
INSERT INTO public.admin_permissions_role_links VALUES (125, 125, 1);
INSERT INTO public.admin_permissions_role_links VALUES (126, 126, 1);
INSERT INTO public.admin_permissions_role_links VALUES (127, 127, 1);
INSERT INTO public.admin_permissions_role_links VALUES (131, 131, 1);
INSERT INTO public.admin_permissions_role_links VALUES (132, 132, 1);
INSERT INTO public.admin_permissions_role_links VALUES (134, 134, 1);
INSERT INTO public.admin_permissions_role_links VALUES (136, 136, 1);
INSERT INTO public.admin_permissions_role_links VALUES (138, 138, 1);
INSERT INTO public.admin_permissions_role_links VALUES (139, 139, 1);
INSERT INTO public.admin_permissions_role_links VALUES (140, 140, 1);
INSERT INTO public.admin_permissions_role_links VALUES (142, 142, 1);
INSERT INTO public.admin_permissions_role_links VALUES (144, 144, 1);
INSERT INTO public.admin_permissions_role_links VALUES (146, 146, 1);
INSERT INTO public.admin_permissions_role_links VALUES (147, 147, 1);
INSERT INTO public.admin_permissions_role_links VALUES (148, 148, 1);
INSERT INTO public.admin_permissions_role_links VALUES (149, 149, 1);
INSERT INTO public.admin_permissions_role_links VALUES (150, 150, 1);
INSERT INTO public.admin_permissions_role_links VALUES (151, 151, 1);
INSERT INTO public.admin_permissions_role_links VALUES (155, 155, 1);
INSERT INTO public.admin_permissions_role_links VALUES (156, 156, 1);
INSERT INTO public.admin_permissions_role_links VALUES (160, 160, 1);
INSERT INTO public.admin_permissions_role_links VALUES (161, 161, 1);
INSERT INTO public.admin_permissions_role_links VALUES (178, 178, 1);
INSERT INTO public.admin_permissions_role_links VALUES (180, 180, 1);
INSERT INTO public.admin_permissions_role_links VALUES (182, 182, 1);
INSERT INTO public.admin_permissions_role_links VALUES (186, 186, 1);
INSERT INTO public.admin_permissions_role_links VALUES (187, 187, 1);
INSERT INTO public.admin_permissions_role_links VALUES (188, 188, 1);


--
-- TOC entry 3781 (class 0 OID 16442)
-- Dependencies: 222
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.admin_roles VALUES (1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2022-11-05 12:14:09.152', '2022-11-05 12:14:09.152', NULL, NULL);
INSERT INTO public.admin_roles VALUES (2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2022-11-05 12:14:09.173', '2022-11-05 12:14:09.173', NULL, NULL);
INSERT INTO public.admin_roles VALUES (3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2022-11-05 12:14:09.2', '2022-11-05 12:14:09.2', NULL, NULL);


--
-- TOC entry 3779 (class 0 OID 16431)
-- Dependencies: 220
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.admin_users VALUES (1, 'Strapi', 'Admin', NULL, 'strapi-admin@mail.com', '$2a$10$rn.dwglFRpciH.dXQ5NEMOdQetP0glB5aMPm74Pe52WJV0P7vAa/C', NULL, NULL, true, false, NULL, '2022-11-05 12:14:35.135', '2022-11-05 12:14:35.135', NULL, NULL);
INSERT INTO public.admin_users VALUES (2, 'Teste', 'Email', NULL, 'teste-email@mail.com', NULL, NULL, '31b7b6b044eea010dc039180e786a290d9bfa7f2', false, false, NULL, '2022-11-09 18:14:36.05', '2022-11-09 18:14:36.05', NULL, NULL);


--
-- TOC entry 3801 (class 0 OID 16562)
-- Dependencies: 242
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.admin_users_roles_links VALUES (1, 1, 1);
INSERT INTO public.admin_users_roles_links VALUES (2, 2, 3);


--
-- TOC entry 3817 (class 0 OID 81944)
-- Dependencies: 258
-- Data for Name: categoria_materiais; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.categoria_materiais VALUES (10, 'PLÁSTICO', '2022-11-17 23:52:22.444', '2022-11-17 23:52:26.043', '2022-11-17 23:52:26.038', 1, 1);
INSERT INTO public.categoria_materiais VALUES (11, 'PAPEL', '2022-11-17 23:52:35.588', '2022-11-17 23:52:38.943', '2022-11-17 23:52:38.94', 1, 1);
INSERT INTO public.categoria_materiais VALUES (13, 'METAL', '2022-11-17 23:53:17.996', '2022-11-17 23:53:18.729', '2022-11-17 23:53:18.725', 1, 1);
INSERT INTO public.categoria_materiais VALUES (12, 'VIDRO', '2022-11-17 23:53:00.642', '2022-11-17 23:58:58.421', '2022-11-17 23:58:58.419', 1, 1);


--
-- TOC entry 3827 (class 0 OID 82112)
-- Dependencies: 268
-- Data for Name: destinos; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.destinos VALUES (1, 'Fabrica 1', 'Rua', '1234567890', 'Cidty', 'Ceara', 'cep 000 -09', '2022-11-15 21:33:38.575', '2022-11-15 21:36:14.323', '2022-11-15 21:33:38.569', NULL, NULL, 'Bairoo 13');


--
-- TOC entry 3839 (class 0 OID 90174)
-- Dependencies: 280
-- Data for Name: entradas; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.entradas VALUES (1, '2022-11-16 19:42:01.419', '2022-11-18 12:53:58.837', '2022-11-16 19:42:52.132', 1, 1, NULL);
INSERT INTO public.entradas VALUES (2, '2022-10-16 19:43:12.527', '2022-11-18 12:54:26.374', '2022-10-16 19:43:19.342', 1, 1, NULL);
INSERT INTO public.entradas VALUES (3, '2022-12-16 20:31:21.639', '2022-11-18 12:54:33.731', '2022-12-16 20:31:27.659', 1, 1, NULL);


--
-- TOC entry 3845 (class 0 OID 90262)
-- Dependencies: 286
-- Data for Name: entradas_fornecedor_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.entradas_fornecedor_links VALUES (1, 1, 2);
INSERT INTO public.entradas_fornecedor_links VALUES (2, 2, 3);
INSERT INTO public.entradas_fornecedor_links VALUES (3, 3, 1);


--
-- TOC entry 3841 (class 0 OID 90183)
-- Dependencies: 282
-- Data for Name: entradas_item_entradas_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.entradas_item_entradas_links VALUES (11, 1, 1);
INSERT INTO public.entradas_item_entradas_links VALUES (12, 1, 2);
INSERT INTO public.entradas_item_entradas_links VALUES (13, 2, 3);
INSERT INTO public.entradas_item_entradas_links VALUES (14, 3, 4);


--
-- TOC entry 3787 (class 0 OID 16484)
-- Dependencies: 228
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3807 (class 0 OID 16590)
-- Dependencies: 248
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3805 (class 0 OID 16580)
-- Dependencies: 246
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3815 (class 0 OID 57368)
-- Dependencies: 256
-- Data for Name: fornecedores; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.fornecedores VALUES (5, 'Fornecedor 5', 'DOACAO', 'XX. XXX. XXX/0001-XX', 'fornecedor5@gmail.com', NULL, NULL, 'Chicão', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 17:00:29.231', '2022-11-10 19:25:42.532', '2022-11-10 17:00:36.667', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (7, 'Fornecedor 7', 'PEV', 'XX. XXX. XXX/0001-XX', 'fornecedor7@gmail.com', NULL, NULL, 'Chicão', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 17:01:09.754', '2022-11-10 19:25:59.247', '2022-11-10 17:01:16.626', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (8, 'Fornecedor 8', 'DOACAO', 'XX. XXX. XXX/0001-XX', 'fornecedor8@gmail.com', NULL, NULL, 'Chicão', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 17:02:11.791', '2022-11-10 19:26:05.056', '2022-11-10 17:02:13.629', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (11, 'From Quasar 2', 'FORNECEDOR', 'ZZZZZZZZZZZ', 'fromquasar2@gmail.com', '54645634', '546345634', 'Rua Intert', '234', 'Campus', 'Quixadá', 'Amapá', '77h', '2022-11-13 15:34:04.73', '2022-11-13 15:34:04.73', '2022-11-13 15:34:04.725', NULL, NULL, false, true);
INSERT INTO public.fornecedores VALUES (2, 'Fornecedor 2', 'FORNECEDOR', 'XX. XXX. XXX/0001-Xx', 'fornecedor2@gmail.com', NULL, '55.550-000', 'Chicão', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 16:59:14.562', '2022-11-18 17:10:56.697', '2022-11-10 16:59:16.785', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (1, 'Fornecedor 1', 'PEV', 'XX. XXX. XXX/0001-XX', 'fornecedor1@gmail.com', NULL, NULL, 'Chicão', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 16:54:50.646', '2022-11-13 12:29:45.456', '2022-11-10 16:58:46.491', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (4, 'Fornecedor 4', 'PEV', 'XX. XXX. XXX/0001-XX', 'fornecedor4@gmail.com', NULL, 'cepcep', 'Chicão', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 17:00:10.748', '2022-11-18 17:11:38.557', '2022-11-10 17:00:16.046', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (10, 'From Quasar 1 put', 'FORNECEDOR', 'XXXXXXXXXX', 'fromquasar1@gmail.com', '', NULL, 'Rua Frontend 1', '000', 'Edge', 'Browsers', 'Alagoas', '12h', '2022-11-13 15:32:17.461', '2022-11-18 20:19:35.787', '2022-11-13 15:32:17.454', NULL, NULL, false, true);
INSERT INTO public.fornecedores VALUES (3, 'Fornecedor 333333333333', 'FORNECEDOR', 'XX. XXX. XXX/0001-XX', 'fornecedor3@gmail.com', NULL, '444444444', 'Marília', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 16:59:38.558', '2022-11-18 20:19:49.169', '2022-11-10 16:59:42.332', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (9, 'Fornecedor 9', 'FORNECEDOR', 'XX. XXX. XXX/0001-XX', 'fornecedor9@gmail.com', NULL, NULL, 'Chicão', '345', 'São José', 'Santos', 'Ceará', '10h', '2022-11-10 17:02:26.902', '2022-11-13 14:23:26.693', '2022-11-10 17:02:28.741', 1, 1, true, true);
INSERT INTO public.fornecedores VALUES (6, 'Fornecedor 6', 'FORNECEDOR', 'XX. XXX. XXX/0001-XX', 'fornecedor6@gmail.com', NULL, NULL, 'Rua São Francisco', '345', 'São José', 'Santos', 'Caos', '10h', '2022-11-10 17:00:50.05', '2022-11-13 14:24:09.948', '2022-11-10 17:00:57.016', 1, 1, true, true);


--
-- TOC entry 3791 (class 0 OID 16511)
-- Dependencies: 232
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.i18n_locale VALUES (1, 'English (en)', 'en', '2022-11-05 12:14:08.687', '2022-11-05 12:14:08.687', NULL, NULL);


--
-- TOC entry 3837 (class 0 OID 90134)
-- Dependencies: 278
-- Data for Name: itens_entradas; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.itens_entradas VALUES (1, '2022-11-16 19:42:11.098', '2022-11-18 14:24:11.044', '2022-11-16 19:43:59.008', 1, 1, 10.00, true, NULL);
INSERT INTO public.itens_entradas VALUES (2, '2022-11-16 19:42:20.838', '2022-11-18 14:24:20.795', '2022-11-16 19:44:02.175', 1, 1, 12.00, true, NULL);
INSERT INTO public.itens_entradas VALUES (3, '2022-11-16 19:42:30.658', '2022-11-18 14:24:31.087', '2022-11-16 19:44:05.628', 1, 1, 25.00, true, NULL);
INSERT INTO public.itens_entradas VALUES (4, '2022-11-16 20:30:56.451', '2022-11-18 14:24:42.393', '2022-11-16 20:31:00.767', 1, 1, 33.00, true, NULL);


--
-- TOC entry 3843 (class 0 OID 90237)
-- Dependencies: 284
-- Data for Name: itens_entradas_tipo_material_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.itens_entradas_tipo_material_links VALUES (5, 1, 29);
INSERT INTO public.itens_entradas_tipo_material_links VALUES (6, 2, 31);
INSERT INTO public.itens_entradas_tipo_material_links VALUES (7, 3, 36);
INSERT INTO public.itens_entradas_tipo_material_links VALUES (8, 4, 40);


--
-- TOC entry 3823 (class 0 OID 82070)
-- Dependencies: 264
-- Data for Name: maquinas; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.maquinas VALUES (1, 'Machine 1', '2022-11-15 18:43:40.57', '2022-11-15 19:27:48.832', '2022-11-15 18:43:41.287', 1, 1);
INSERT INTO public.maquinas VALUES (9, 'Machine 2', '2022-11-15 20:04:37.494', '2022-11-15 20:04:37.494', '2022-11-15 20:04:37.489', NULL, NULL);
INSERT INTO public.maquinas VALUES (3, 'Machine 3', '2022-11-15 19:07:58.002', '2022-11-15 20:05:11.195', '2022-11-15 19:07:57.997', NULL, NULL);
INSERT INTO public.maquinas VALUES (11, 'Machine 44', '2022-11-15 20:49:15.434', '2022-11-15 20:49:22.525', '2022-11-15 20:49:15.43', NULL, NULL);


--
-- TOC entry 3829 (class 0 OID 82135)
-- Dependencies: 270
-- Data for Name: motoristas; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.motoristas VALUES (1, 'Nome Teste', '000', '000', '000', '2022-11-15 21:10:27.558', '2022-11-15 21:15:06.941', '2022-11-15 21:10:27.556', NULL, NULL);
INSERT INTO public.motoristas VALUES (4, 'dfgdfgsdf', 'sdfgsdfg', 'sdfgsdf', 'gsdfgsdfg', '2022-11-18 20:37:42.183', '2022-11-18 20:37:42.183', '2022-11-18 20:37:42.178', NULL, NULL);


--
-- TOC entry 3831 (class 0 OID 82146)
-- Dependencies: 272
-- Data for Name: motoristas_fornecedor_links; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3825 (class 0 OID 82091)
-- Dependencies: 266
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.produtos VALUES (1, 'Product 1', '2022-11-15 20:43:34.922', '2022-11-15 20:43:47.826', '2022-11-15 20:43:34.915', NULL, NULL);
INSERT INTO public.produtos VALUES (3, 'Product 2', '2022-11-15 20:49:31.966', '2022-11-15 20:49:40.943', '2022-11-15 20:49:31.963', NULL, NULL);


--
-- TOC entry 3785 (class 0 OID 16464)
-- Dependencies: 226
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3803 (class 0 OID 16571)
-- Dependencies: 244
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3783 (class 0 OID 16453)
-- Dependencies: 224
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3773 (class 0 OID 16402)
-- Dependencies: 214
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.strapi_core_store_settings VALUES (2, 'plugin_content_manager_configuration_content_types::admin::permission', '{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (3, 'plugin_content_manager_configuration_content_types::admin::role', '{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (4, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["folder"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folderPath","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (6, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"editRelations":["parent","children","files"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"path","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (1, 'strapi_content_types_schema', '{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"integer","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"integer","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"telefone":{"type":"string","unique":false},"cpf":{"type":"string","required":true,"unique":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"telefone":{"type":"string","unique":false},"cpf":{"type":"string","required":true,"unique":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::categoria-material.categoria-material":{"kind":"collectionType","collectionName":"categoria_materiais","info":{"singularName":"categoria-material","pluralName":"categoria-materiais","displayName":"Categoria Material","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true,"unique":true},"tipos":{"type":"relation","relation":"oneToMany","target":"api::tipo-material.tipo-material","mappedBy":"categoria"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"categoria_materiais","info":{"singularName":"categoria-material","pluralName":"categoria-materiais","displayName":"Categoria Material","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true,"unique":true},"tipos":{"type":"relation","relation":"oneToMany","target":"api::tipo-material.tipo-material","mappedBy":"categoria"}},"kind":"collectionType"},"modelType":"contentType","modelName":"categoria-material","connection":"default","uid":"api::categoria-material.categoria-material","apiName":"categoria-material","globalId":"CategoriaMaterial","actions":{},"lifecycles":{}},"api::destino.destino":{"kind":"collectionType","collectionName":"destinos","info":{"singularName":"destino","pluralName":"destinos","displayName":"Destino","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"rua":{"type":"string","required":true},"numero":{"type":"string","required":true},"bairro":{"type":"string","required":true},"cidade":{"type":"string","required":true},"estado":{"type":"string","required":true},"cep":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"destinos","info":{"singularName":"destino","pluralName":"destinos","displayName":"Destino","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"rua":{"type":"string","required":true},"numero":{"type":"string","required":true},"bairro":{"type":"string","required":true},"cidade":{"type":"string","required":true},"estado":{"type":"string","required":true},"cep":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"destino","connection":"default","uid":"api::destino.destino","apiName":"destino","globalId":"Destino","actions":{},"lifecycles":{}},"api::entrada.entrada":{"kind":"collectionType","collectionName":"entradas","info":{"singularName":"entrada","pluralName":"entradas","displayName":"Entrada","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"item_entradas":{"type":"relation","relation":"oneToMany","target":"api::item-entrada.item-entrada"},"fornecedor":{"type":"relation","relation":"manyToOne","target":"api::fornecedor.fornecedor","inversedBy":"entradas"},"observacao":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"entradas","info":{"singularName":"entrada","pluralName":"entradas","displayName":"Entrada","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"item_entradas":{"type":"relation","relation":"oneToMany","target":"api::item-entrada.item-entrada"},"fornecedor":{"type":"relation","relation":"manyToOne","target":"api::fornecedor.fornecedor","inversedBy":"entradas"},"observacao":{"type":"text"}},"kind":"collectionType"},"modelType":"contentType","modelName":"entrada","connection":"default","uid":"api::entrada.entrada","apiName":"entrada","globalId":"Entrada","actions":{},"lifecycles":{}},"api::fornecedor.fornecedor":{"kind":"collectionType","collectionName":"fornecedores","info":{"singularName":"fornecedor","pluralName":"fornecedores","displayName":"Fornecedor","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"tipo":{"type":"string","required":true},"isDestinatario":{"type":"boolean","default":false,"required":true},"cnpjcpf":{"type":"string"},"email":{"type":"email","required":true,"unique":true},"telefone":{"type":"string"},"cep":{"type":"string"},"rua":{"type":"string","required":true},"numero":{"type":"string","required":true},"bairro":{"type":"string","required":true},"cidade":{"type":"string","required":true},"estado":{"type":"string"},"horarioColeta":{"type":"string"},"isAtivo":{"type":"boolean","default":true,"required":true},"motoristas":{"type":"relation","relation":"oneToMany","target":"api::motorista.motorista","mappedBy":"fornecedor"},"veiculos":{"type":"relation","relation":"oneToMany","target":"api::veiculo.veiculo","mappedBy":"fornecedor"},"entradas":{"type":"relation","relation":"oneToMany","target":"api::entrada.entrada","mappedBy":"fornecedor"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"fornecedores","info":{"singularName":"fornecedor","pluralName":"fornecedores","displayName":"Fornecedor","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"tipo":{"type":"string","required":true},"isDestinatario":{"type":"boolean","default":false,"required":true},"cnpjcpf":{"type":"string"},"email":{"type":"email","required":true,"unique":true},"telefone":{"type":"string"},"cep":{"type":"string"},"rua":{"type":"string","required":true},"numero":{"type":"string","required":true},"bairro":{"type":"string","required":true},"cidade":{"type":"string","required":true},"estado":{"type":"string"},"horarioColeta":{"type":"string"},"isAtivo":{"type":"boolean","default":true,"required":true},"motoristas":{"type":"relation","relation":"oneToMany","target":"api::motorista.motorista","mappedBy":"fornecedor"},"veiculos":{"type":"relation","relation":"oneToMany","target":"api::veiculo.veiculo","mappedBy":"fornecedor"},"entradas":{"type":"relation","relation":"oneToMany","target":"api::entrada.entrada","mappedBy":"fornecedor"}},"kind":"collectionType"},"modelType":"contentType","modelName":"fornecedor","connection":"default","uid":"api::fornecedor.fornecedor","apiName":"fornecedor","globalId":"Fornecedor","actions":{},"lifecycles":{}},"api::item-entrada.item-entrada":{"kind":"collectionType","collectionName":"itens_entradas","info":{"singularName":"item-entrada","pluralName":"itens-entradas","displayName":"Entrada Item","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"tipo_material":{"type":"relation","relation":"oneToOne","target":"api::tipo-material.tipo-material"},"quantidade":{"type":"decimal","required":true},"isDisponivelEstoque":{"type":"boolean","default":true,"required":true},"dataSaida":{"type":"date"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"itens_entradas","info":{"singularName":"item-entrada","pluralName":"itens-entradas","displayName":"Entrada Item","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"tipo_material":{"type":"relation","relation":"oneToOne","target":"api::tipo-material.tipo-material"},"quantidade":{"type":"decimal","required":true},"isDisponivelEstoque":{"type":"boolean","default":true,"required":true},"dataSaida":{"type":"date"}},"kind":"collectionType"},"modelType":"contentType","modelName":"item-entrada","connection":"default","uid":"api::item-entrada.item-entrada","apiName":"item-entrada","globalId":"ItemEntrada","actions":{},"lifecycles":{}},"api::maquina.maquina":{"kind":"collectionType","collectionName":"maquinas","info":{"singularName":"maquina","pluralName":"maquinas","displayName":"Maquina"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true,"unique":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"maquinas","info":{"singularName":"maquina","pluralName":"maquinas","displayName":"Maquina"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true,"unique":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"maquina","connection":"default","uid":"api::maquina.maquina","apiName":"maquina","globalId":"Maquina","actions":{},"lifecycles":{}},"api::motorista.motorista":{"kind":"collectionType","collectionName":"motoristas","info":{"singularName":"motorista","pluralName":"motoristas","displayName":"Motorista"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"cpf":{"type":"string","required":true},"cnh":{"type":"string","required":true},"telefone":{"type":"string","required":true},"fornecedor":{"type":"relation","relation":"manyToOne","target":"api::fornecedor.fornecedor","inversedBy":"motoristas"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"motoristas","info":{"singularName":"motorista","pluralName":"motoristas","displayName":"Motorista"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"cpf":{"type":"string","required":true},"cnh":{"type":"string","required":true},"telefone":{"type":"string","required":true},"fornecedor":{"type":"relation","relation":"manyToOne","target":"api::fornecedor.fornecedor","inversedBy":"motoristas"}},"kind":"collectionType"},"modelType":"contentType","modelName":"motorista","connection":"default","uid":"api::motorista.motorista","apiName":"motorista","globalId":"Motorista","actions":{},"lifecycles":{}},"api::produto.produto":{"kind":"collectionType","collectionName":"produtos","info":{"singularName":"produto","pluralName":"produtos","displayName":"Produto"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true,"unique":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"produtos","info":{"singularName":"produto","pluralName":"produtos","displayName":"Produto"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true,"unique":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"produto","connection":"default","uid":"api::produto.produto","apiName":"produto","globalId":"Produto","actions":{},"lifecycles":{}},"api::tipo-material.tipo-material":{"kind":"collectionType","collectionName":"tipos_materiais","info":{"singularName":"tipo-material","pluralName":"tipos-materiais","displayName":"Tipo Material","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","unique":false,"required":true},"categoria":{"type":"relation","relation":"manyToOne","target":"api::categoria-material.categoria-material","inversedBy":"tipos"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"tipos_materiais","info":{"singularName":"tipo-material","pluralName":"tipos-materiais","displayName":"Tipo Material","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","unique":false,"required":true},"categoria":{"type":"relation","relation":"manyToOne","target":"api::categoria-material.categoria-material","inversedBy":"tipos"}},"kind":"collectionType"},"modelType":"contentType","modelName":"tipo-material","connection":"default","uid":"api::tipo-material.tipo-material","apiName":"tipo-material","globalId":"TipoMaterial","actions":{},"lifecycles":{}},"api::veiculo.veiculo":{"kind":"collectionType","collectionName":"veiculos","info":{"singularName":"veiculo","pluralName":"veiculos","displayName":"Veiculo"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"placa":{"type":"string","required":true},"fornecedor":{"type":"relation","relation":"manyToOne","target":"api::fornecedor.fornecedor","inversedBy":"veiculos"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"veiculos","info":{"singularName":"veiculo","pluralName":"veiculos","displayName":"Veiculo"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"nome":{"type":"string","required":true},"placa":{"type":"string","required":true},"fornecedor":{"type":"relation","relation":"manyToOne","target":"api::fornecedor.fornecedor","inversedBy":"veiculos"}},"kind":"collectionType"},"modelType":"contentType","modelName":"veiculo","connection":"default","uid":"api::veiculo.veiculo","apiName":"veiculo","globalId":"Veiculo","actions":{},"lifecycles":{}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (7, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (8, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"editRelations":["role"],"edit":[[{"name":"action","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (9, 'plugin_content_manager_configuration_content_types::admin::api-token', '{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (10, 'plugin_content_manager_configuration_content_types::admin::user', '{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (11, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"editRelations":["token"],"edit":[[{"name":"action","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (13, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (16, 'plugin_i18n_default_locale', '"en"', 'string', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (20, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (14, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (12, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"telefone":{"edit":{"label":"telefone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"telefone","searchable":true,"sortable":true}},"cpf":{"edit":{"label":"cpf","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cpf","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"telefone","size":6}],[{"name":"cpf","size":6}]],"editRelations":["role"],"list":["id","username","cpf","email","confirmed"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (15, 'plugin_upload_metrics', '{"weeklySchedule":"37 47 8 * * 1","lastWeeklyUpdate":1669020457112}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (18, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\n\n<p>But don’t worry! You can use the following link to reset your password:</p>\n<p><%= URL %>?code=<%= TOKEN %></p>\n\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\n\n<p>You have to confirm your email address. Please click on the link below.</p>\n\n<p><%= URL %>?confirmation=<%= CODE %></p>\n\n<p>Thanks.</p>"}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (19, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (17, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"],"redirectUri":"http://localhost:1337/api/connect/discord/callback"},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"],"redirectUri":"http://localhost:1337/api/connect/facebook/callback"},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"],"redirectUri":"http://localhost:1337/api/connect/google/callback"},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"],"redirectUri":"http://localhost:1337/api/connect/github/callback"},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"],"redirectUri":"http://localhost:1337/api/connect/microsoft/callback"},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback","redirectUri":"http://localhost:1337/api/connect/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"],"redirectUri":"http://localhost:1337/api/connect/instagram/callback"},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"],"redirectUri":"http://localhost:1337/api/connect/vk/callback"},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"],"redirectUri":"http://localhost:1337/api/connect/twitch/callback"},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"],"redirectUri":"http://localhost:1337/api/connect/linkedin/callback"},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"],"redirectUri":"http://localhost:1337/api/connect/cognito/callback"},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"],"redirectUri":"http://localhost:1337/api/connect/reddit/callback"},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"],"redirectUri":"http://localhost:1337/api/connect/auth0/callback"},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas","redirectUri":"http://localhost:1337/api/connect/cas/callback"}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (24, 'plugin_content_manager_configuration_content_types::api::tipo-material.tipo-material', '{"uid":"api::tipo-material.tipo-material","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"categoria":{"edit":{"label":"categoria","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"categoria","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"nome","size":6}]],"editRelations":["categoria"],"list":["id","categoria","nome"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (22, 'plugin_content_manager_configuration_content_types::api::categoria-material.categoria-material', '{"uid":"api::categoria-material.categoria-material","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"tipos":{"edit":{"label":"tipos","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"tipos","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"nome","size":6}]],"editRelations":["tipos"],"list":["id","nome"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (25, 'plugin_content_manager_configuration_content_types::api::maquina.maquina', '{"uid":"api::maquina.maquina","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","nome","createdAt","updatedAt"],"editRelations":[],"edit":[[{"name":"nome","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (26, 'plugin_content_manager_configuration_content_types::api::produto.produto', '{"uid":"api::produto.produto","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","nome","createdAt","updatedAt"],"editRelations":[],"edit":[[{"name":"nome","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (28, 'plugin_content_manager_configuration_content_types::api::motorista.motorista', '{"uid":"api::motorista.motorista","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"cpf":{"edit":{"label":"cpf","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cpf","searchable":true,"sortable":true}},"cnh":{"edit":{"label":"cnh","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cnh","searchable":true,"sortable":true}},"telefone":{"edit":{"label":"telefone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"telefone","searchable":true,"sortable":true}},"fornecedor":{"edit":{"label":"fornecedor","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"fornecedor","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","nome","cpf","cnh"],"editRelations":["fornecedor"],"edit":[[{"name":"nome","size":6},{"name":"cpf","size":6}],[{"name":"cnh","size":6},{"name":"telefone","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (27, 'plugin_content_manager_configuration_content_types::api::destino.destino', '{"uid":"api::destino.destino","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"rua":{"edit":{"label":"rua","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rua","searchable":true,"sortable":true}},"numero":{"edit":{"label":"numero","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"numero","searchable":true,"sortable":true}},"bairro":{"edit":{"label":"bairro","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"bairro","searchable":true,"sortable":true}},"cidade":{"edit":{"label":"cidade","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cidade","searchable":true,"sortable":true}},"estado":{"edit":{"label":"estado","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"estado","searchable":true,"sortable":true}},"cep":{"edit":{"label":"cep","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cep","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","nome","rua","numero"],"edit":[[{"name":"nome","size":6},{"name":"rua","size":6}],[{"name":"numero","size":6}],[{"name":"cidade","size":6},{"name":"estado","size":6}],[{"name":"cep","size":6},{"name":"bairro","size":6}]],"editRelations":[]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (29, 'plugin_content_manager_configuration_content_types::api::veiculo.veiculo', '{"uid":"api::veiculo.veiculo","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"placa":{"edit":{"label":"placa","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"placa","searchable":true,"sortable":true}},"fornecedor":{"edit":{"label":"fornecedor","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"fornecedor","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","nome","placa","fornecedor"],"editRelations":["fornecedor"],"edit":[[{"name":"nome","size":6},{"name":"placa","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (30, 'plugin_content_manager_configuration_content_types::api::item-entrada.item-entrada', '{"uid":"api::item-entrada.item-entrada","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"tipo_material":{"edit":{"label":"tipo_material","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"tipo_material","searchable":true,"sortable":true}},"quantidade":{"edit":{"label":"quantidade","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"quantidade","searchable":true,"sortable":true}},"isDisponivelEstoque":{"edit":{"label":"isDisponivelEstoque","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isDisponivelEstoque","searchable":true,"sortable":true}},"dataSaida":{"edit":{"label":"dataSaida","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"dataSaida","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"quantidade","size":4},{"name":"isDisponivelEstoque","size":4},{"name":"dataSaida","size":4}]],"editRelations":["tipo_material"],"list":["id","tipo_material","quantidade","isDisponivelEstoque","dataSaida"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (21, 'plugin_content_manager_configuration_content_types::api::fornecedor.fornecedor', '{"uid":"api::fornecedor.fornecedor","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"nome","defaultSortBy":"nome","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"nome":{"edit":{"label":"nome","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nome","searchable":true,"sortable":true}},"tipo":{"edit":{"label":"tipo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tipo","searchable":true,"sortable":true}},"isDestinatario":{"edit":{"label":"isDestinatario","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isDestinatario","searchable":true,"sortable":true}},"cnpjcpf":{"edit":{"label":"cnpjcpf","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cnpjcpf","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"telefone":{"edit":{"label":"telefone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"telefone","searchable":true,"sortable":true}},"cep":{"edit":{"label":"cep","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cep","searchable":true,"sortable":true}},"rua":{"edit":{"label":"rua","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rua","searchable":true,"sortable":true}},"numero":{"edit":{"label":"numero","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"numero","searchable":true,"sortable":true}},"bairro":{"edit":{"label":"bairro","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"bairro","searchable":true,"sortable":true}},"cidade":{"edit":{"label":"cidade","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cidade","searchable":true,"sortable":true}},"estado":{"edit":{"label":"estado","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"estado","searchable":true,"sortable":true}},"horarioColeta":{"edit":{"label":"horarioColeta","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"horarioColeta","searchable":true,"sortable":true}},"isAtivo":{"edit":{"label":"isAtivo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isAtivo","searchable":true,"sortable":true}},"motoristas":{"edit":{"label":"motoristas","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"motoristas","searchable":false,"sortable":false}},"veiculos":{"edit":{"label":"veiculos","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"veiculos","searchable":false,"sortable":false}},"entradas":{"edit":{"label":"entradas","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"entradas","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","nome","tipo","isDestinatario","isAtivo"],"edit":[[{"name":"nome","size":6},{"name":"tipo","size":6}],[{"name":"cnpjcpf","size":6}],[{"name":"email","size":6},{"name":"telefone","size":6}],[{"name":"cep","size":6},{"name":"rua","size":6}],[{"name":"numero","size":6},{"name":"bairro","size":6}],[{"name":"cidade","size":6},{"name":"estado","size":6}],[{"name":"horarioColeta","size":6},{"name":"isDestinatario","size":4}],[{"name":"isAtivo","size":4}]],"editRelations":["motoristas","veiculos","entradas"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (31, 'plugin_content_manager_configuration_content_types::api::entrada.entrada', '{"uid":"api::entrada.entrada","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"item_entradas":{"edit":{"label":"item_entradas","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"item_entradas","searchable":false,"sortable":false}},"fornecedor":{"edit":{"label":"fornecedor","description":"","placeholder":"","visible":true,"editable":true,"mainField":"nome"},"list":{"label":"fornecedor","searchable":true,"sortable":true}},"observacao":{"edit":{"label":"observacao","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"observacao","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","item_entradas","fornecedor","createdAt"],"edit":[[{"name":"observacao","size":6}]],"editRelations":["item_entradas","fornecedor"]}}', 'object', NULL, NULL);


--
-- TOC entry 3771 (class 0 OID 16393)
-- Dependencies: 212
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.strapi_database_schema VALUES (26, '{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"telefone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cpf","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categoria_materiais","indexes":[{"name":"categoria_materiais_created_by_id_fk","columns":["created_by_id"]},{"name":"categoria_materiais_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categoria_materiais_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categoria_materiais_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"destinos","indexes":[{"name":"destinos_created_by_id_fk","columns":["created_by_id"]},{"name":"destinos_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"destinos_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"destinos_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rua","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"numero","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bairro","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cidade","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"estado","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cep","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"entradas","indexes":[{"name":"entradas_created_by_id_fk","columns":["created_by_id"]},{"name":"entradas_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"entradas_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"entradas_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"observacao","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"fornecedores","indexes":[{"name":"fornecedores_created_by_id_fk","columns":["created_by_id"]},{"name":"fornecedores_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"fornecedores_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"fornecedores_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tipo","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_destinatario","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cnpjcpf","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"telefone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cep","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rua","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"numero","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bairro","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cidade","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"estado","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"horario_coleta","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_ativo","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"itens_entradas","indexes":[{"name":"itens_entradas_created_by_id_fk","columns":["created_by_id"]},{"name":"itens_entradas_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"itens_entradas_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"itens_entradas_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"quantidade","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_disponivel_estoque","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data_saida","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"maquinas","indexes":[{"name":"maquinas_created_by_id_fk","columns":["created_by_id"]},{"name":"maquinas_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"maquinas_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"maquinas_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"motoristas","indexes":[{"name":"motoristas_created_by_id_fk","columns":["created_by_id"]},{"name":"motoristas_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"motoristas_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"motoristas_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cpf","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cnh","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"telefone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"produtos","indexes":[{"name":"produtos_created_by_id_fk","columns":["created_by_id"]},{"name":"produtos_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"produtos_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"produtos_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tipos_materiais","indexes":[{"name":"tipos_materiais_created_by_id_fk","columns":["created_by_id"]},{"name":"tipos_materiais_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tipos_materiais_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tipos_materiais_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"veiculos","indexes":[{"name":"veiculos_created_by_id_fk","columns":["created_by_id"]},{"name":"veiculos_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"veiculos_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"veiculos_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nome","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"placa","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"entradas_item_entradas_links","indexes":[{"name":"entradas_item_entradas_links_fk","columns":["entrada_id"]},{"name":"entradas_item_entradas_links_inv_fk","columns":["item_entrada_id"]}],"foreignKeys":[{"name":"entradas_item_entradas_links_fk","columns":["entrada_id"],"referencedColumns":["id"],"referencedTable":"entradas","onDelete":"CASCADE"},{"name":"entradas_item_entradas_links_inv_fk","columns":["item_entrada_id"],"referencedColumns":["id"],"referencedTable":"itens_entradas","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entrada_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"item_entrada_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"entradas_fornecedor_links","indexes":[{"name":"entradas_fornecedor_links_fk","columns":["entrada_id"]},{"name":"entradas_fornecedor_links_inv_fk","columns":["fornecedor_id"]}],"foreignKeys":[{"name":"entradas_fornecedor_links_fk","columns":["entrada_id"],"referencedColumns":["id"],"referencedTable":"entradas","onDelete":"CASCADE"},{"name":"entradas_fornecedor_links_inv_fk","columns":["fornecedor_id"],"referencedColumns":["id"],"referencedTable":"fornecedores","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entrada_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"fornecedor_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"itens_entradas_tipo_material_links","indexes":[{"name":"itens_entradas_tipo_material_links_fk","columns":["item_entrada_id"]},{"name":"itens_entradas_tipo_material_links_inv_fk","columns":["tipo_material_id"]}],"foreignKeys":[{"name":"itens_entradas_tipo_material_links_fk","columns":["item_entrada_id"],"referencedColumns":["id"],"referencedTable":"itens_entradas","onDelete":"CASCADE"},{"name":"itens_entradas_tipo_material_links_inv_fk","columns":["tipo_material_id"],"referencedColumns":["id"],"referencedTable":"tipos_materiais","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"item_entrada_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tipo_material_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"motoristas_fornecedor_links","indexes":[{"name":"motoristas_fornecedor_links_fk","columns":["motorista_id"]},{"name":"motoristas_fornecedor_links_inv_fk","columns":["fornecedor_id"]}],"foreignKeys":[{"name":"motoristas_fornecedor_links_fk","columns":["motorista_id"],"referencedColumns":["id"],"referencedTable":"motoristas","onDelete":"CASCADE"},{"name":"motoristas_fornecedor_links_inv_fk","columns":["fornecedor_id"],"referencedColumns":["id"],"referencedTable":"fornecedores","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"motorista_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"fornecedor_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tipos_materiais_categoria_links","indexes":[{"name":"tipos_materiais_categoria_links_fk","columns":["tipo_material_id"]},{"name":"tipos_materiais_categoria_links_inv_fk","columns":["categoria_material_id"]}],"foreignKeys":[{"name":"tipos_materiais_categoria_links_fk","columns":["tipo_material_id"],"referencedColumns":["id"],"referencedTable":"tipos_materiais","onDelete":"CASCADE"},{"name":"tipos_materiais_categoria_links_inv_fk","columns":["categoria_material_id"],"referencedColumns":["id"],"referencedTable":"categoria_materiais","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"tipo_material_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"categoria_material_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"veiculos_fornecedor_links","indexes":[{"name":"veiculos_fornecedor_links_fk","columns":["veiculo_id"]},{"name":"veiculos_fornecedor_links_inv_fk","columns":["fornecedor_id"]}],"foreignKeys":[{"name":"veiculos_fornecedor_links_fk","columns":["veiculo_id"],"referencedColumns":["id"],"referencedTable":"veiculos","onDelete":"CASCADE"},{"name":"veiculos_fornecedor_links_inv_fk","columns":["fornecedor_id"],"referencedColumns":["id"],"referencedTable":"fornecedores","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"veiculo_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"fornecedor_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}', '2022-11-19 00:16:11.482', '6a49baa570cbac5837029a6227ec54a1');


--
-- TOC entry 3769 (class 0 OID 16386)
-- Dependencies: 210
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3775 (class 0 OID 16411)
-- Dependencies: 216
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3819 (class 0 OID 82008)
-- Dependencies: 260
-- Data for Name: tipos_materiais; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.tipos_materiais VALUES (29, 'PET', '2022-11-17 23:53:52.016', '2022-11-17 23:53:53.687', '2022-11-17 23:53:53.681', 1, 1);
INSERT INTO public.tipos_materiais VALUES (30, 'PEAD', '2022-11-17 23:54:05.187', '2022-11-17 23:54:06.225', '2022-11-17 23:54:06.222', 1, 1);
INSERT INTO public.tipos_materiais VALUES (31, 'PVC', '2022-11-17 23:54:19.999', '2022-11-17 23:54:22.956', '2022-11-17 23:54:22.954', 1, 1);
INSERT INTO public.tipos_materiais VALUES (32, 'PEBD', '2022-11-17 23:54:38.63', '2022-11-17 23:54:41.362', '2022-11-17 23:54:41.357', 1, 1);
INSERT INTO public.tipos_materiais VALUES (33, 'PP', '2022-11-17 23:54:49.744', '2022-11-17 23:54:53.058', '2022-11-17 23:54:53.054', 1, 1);
INSERT INTO public.tipos_materiais VALUES (34, 'PS', '2022-11-17 23:55:05.479', '2022-11-17 23:55:20.098', '2022-11-17 23:55:20.094', 1, 1);
INSERT INTO public.tipos_materiais VALUES (36, 'PAPELÃO', '2022-11-17 23:56:41.129', '2022-11-17 23:57:04.667', '2022-11-17 23:57:04.663', 1, 1);
INSERT INTO public.tipos_materiais VALUES (37, 'CARTOLINA', '2022-11-17 23:57:25.326', '2022-11-17 23:57:30.932', '2022-11-17 23:57:30.929', 1, 1);
INSERT INTO public.tipos_materiais VALUES (38, 'PRATOS, COPOS', '2022-11-17 23:58:45.254', '2022-11-17 23:58:50.653', '2022-11-17 23:58:50.648', 1, 1);
INSERT INTO public.tipos_materiais VALUES (39, 'GARRAFAS', '2022-11-17 23:59:47.256', '2022-11-17 23:59:48.655', '2022-11-17 23:59:48.653', 1, 1);
INSERT INTO public.tipos_materiais VALUES (40, 'VIRO COMUN', '2022-11-18 00:00:54.121', '2022-11-18 00:00:55.146', '2022-11-18 00:00:55.141', 1, 1);
INSERT INTO public.tipos_materiais VALUES (35, 'JORNAL', '2022-11-17 23:56:26.279', '2022-11-18 00:03:38.37', '2022-11-18 00:03:38.366', 1, 1);
INSERT INTO public.tipos_materiais VALUES (41, 'TAMPAS DE METAL', '2022-11-18 00:04:57.331', '2022-11-18 00:04:59.396', '2022-11-18 00:04:59.392', 1, 1);
INSERT INTO public.tipos_materiais VALUES (42, 'FIOS DE METAL', '2022-11-18 00:05:43.07', '2022-11-18 00:05:47.272', '2022-11-18 00:05:47.269', 1, 1);


--
-- TOC entry 3821 (class 0 OID 82049)
-- Dependencies: 262
-- Data for Name: tipos_materiais_categoria_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.tipos_materiais_categoria_links VALUES (29, 29, 10);
INSERT INTO public.tipos_materiais_categoria_links VALUES (30, 30, 10);
INSERT INTO public.tipos_materiais_categoria_links VALUES (31, 31, 10);
INSERT INTO public.tipos_materiais_categoria_links VALUES (32, 32, 10);
INSERT INTO public.tipos_materiais_categoria_links VALUES (33, 33, 10);
INSERT INTO public.tipos_materiais_categoria_links VALUES (34, 34, 10);
INSERT INTO public.tipos_materiais_categoria_links VALUES (35, 35, 11);
INSERT INTO public.tipos_materiais_categoria_links VALUES (36, 36, 11);
INSERT INTO public.tipos_materiais_categoria_links VALUES (37, 37, 11);
INSERT INTO public.tipos_materiais_categoria_links VALUES (38, 38, 12);
INSERT INTO public.tipos_materiais_categoria_links VALUES (39, 39, 12);
INSERT INTO public.tipos_materiais_categoria_links VALUES (40, 40, 12);
INSERT INTO public.tipos_materiais_categoria_links VALUES (41, 41, 13);
INSERT INTO public.tipos_materiais_categoria_links VALUES (42, 42, 13);


--
-- TOC entry 3793 (class 0 OID 16522)
-- Dependencies: 234
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.up_permissions VALUES (1, 'plugin::users-permissions.user.me', '2022-11-05 12:14:08.921', '2022-11-05 12:14:08.921', NULL, NULL);
INSERT INTO public.up_permissions VALUES (2, 'plugin::users-permissions.auth.changePassword', '2022-11-05 12:14:08.921', '2022-11-05 12:14:08.921', NULL, NULL);
INSERT INTO public.up_permissions VALUES (3, 'plugin::users-permissions.auth.callback', '2022-11-05 12:14:09.01', '2022-11-05 12:14:09.01', NULL, NULL);
INSERT INTO public.up_permissions VALUES (4, 'plugin::users-permissions.auth.connect', '2022-11-05 12:14:09.01', '2022-11-05 12:14:09.01', NULL, NULL);
INSERT INTO public.up_permissions VALUES (6, 'plugin::users-permissions.auth.resetPassword', '2022-11-05 12:14:09.01', '2022-11-05 12:14:09.01', NULL, NULL);
INSERT INTO public.up_permissions VALUES (7, 'plugin::users-permissions.auth.register', '2022-11-05 12:14:09.01', '2022-11-05 12:14:09.01', NULL, NULL);
INSERT INTO public.up_permissions VALUES (5, 'plugin::users-permissions.auth.forgotPassword', '2022-11-05 12:14:09.01', '2022-11-05 12:14:09.01', NULL, NULL);
INSERT INTO public.up_permissions VALUES (8, 'plugin::users-permissions.auth.emailConfirmation', '2022-11-05 12:14:09.01', '2022-11-05 12:14:09.01', NULL, NULL);
INSERT INTO public.up_permissions VALUES (9, 'plugin::users-permissions.auth.sendEmailConfirmation', '2022-11-05 12:14:09.01', '2022-11-05 12:14:09.01', NULL, NULL);
INSERT INTO public.up_permissions VALUES (15, 'plugin::users-permissions.user.me', '2022-11-07 19:47:58.76', '2022-11-07 19:47:58.76', NULL, NULL);
INSERT INTO public.up_permissions VALUES (18, 'plugin::users-permissions.role.find', '2022-11-08 18:35:39.951', '2022-11-08 18:35:39.951', NULL, NULL);
INSERT INTO public.up_permissions VALUES (19, 'api::fornecedor.fornecedor.find', '2022-11-10 17:03:38.438', '2022-11-10 17:03:38.438', NULL, NULL);
INSERT INTO public.up_permissions VALUES (20, 'api::fornecedor.fornecedor.findOne', '2022-11-10 17:03:38.438', '2022-11-10 17:03:38.438', NULL, NULL);
INSERT INTO public.up_permissions VALUES (21, 'api::fornecedor.fornecedor.create', '2022-11-10 17:03:38.438', '2022-11-10 17:03:38.438', NULL, NULL);
INSERT INTO public.up_permissions VALUES (22, 'api::fornecedor.fornecedor.update', '2022-11-10 17:03:38.438', '2022-11-10 17:03:38.438', NULL, NULL);
INSERT INTO public.up_permissions VALUES (24, 'plugin::users-permissions.user.create', '2022-11-13 16:01:38.922', '2022-11-13 16:01:38.922', NULL, NULL);
INSERT INTO public.up_permissions VALUES (23, 'plugin::users-permissions.user.update', '2022-11-13 16:01:38.922', '2022-11-13 16:01:38.922', NULL, NULL);
INSERT INTO public.up_permissions VALUES (25, 'plugin::users-permissions.user.find', '2022-11-13 16:01:38.922', '2022-11-13 16:01:38.922', NULL, NULL);
INSERT INTO public.up_permissions VALUES (26, 'plugin::users-permissions.user.findOne', '2022-11-13 16:01:38.922', '2022-11-13 16:01:38.922', NULL, NULL);
INSERT INTO public.up_permissions VALUES (32, 'api::categoria-material.categoria-material.find', '2022-11-15 15:19:49.286', '2022-11-15 15:19:49.286', NULL, NULL);
INSERT INTO public.up_permissions VALUES (33, 'api::categoria-material.categoria-material.findOne', '2022-11-15 15:19:49.286', '2022-11-15 15:19:49.286', NULL, NULL);
INSERT INTO public.up_permissions VALUES (34, 'api::categoria-material.categoria-material.create', '2022-11-15 15:19:49.286', '2022-11-15 15:19:49.286', NULL, NULL);
INSERT INTO public.up_permissions VALUES (35, 'api::categoria-material.categoria-material.update', '2022-11-15 15:19:49.286', '2022-11-15 15:19:49.286', NULL, NULL);
INSERT INTO public.up_permissions VALUES (36, 'api::categoria-material.categoria-material.delete', '2022-11-15 15:19:49.286', '2022-11-15 15:19:49.286', NULL, NULL);
INSERT INTO public.up_permissions VALUES (42, 'api::maquina.maquina.find', '2022-11-15 18:41:34.786', '2022-11-15 18:41:34.786', NULL, NULL);
INSERT INTO public.up_permissions VALUES (43, 'api::maquina.maquina.findOne', '2022-11-15 18:41:34.786', '2022-11-15 18:41:34.786', NULL, NULL);
INSERT INTO public.up_permissions VALUES (44, 'api::maquina.maquina.create', '2022-11-15 18:41:34.786', '2022-11-15 18:41:34.786', NULL, NULL);
INSERT INTO public.up_permissions VALUES (45, 'api::maquina.maquina.update', '2022-11-15 18:41:34.786', '2022-11-15 18:41:34.786', NULL, NULL);
INSERT INTO public.up_permissions VALUES (46, 'api::maquina.maquina.delete', '2022-11-15 18:41:34.786', '2022-11-15 18:41:34.786', NULL, NULL);
INSERT INTO public.up_permissions VALUES (47, 'api::destino.destino.find', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (48, 'api::destino.destino.findOne', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (49, 'api::destino.destino.create', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (50, 'api::destino.destino.update', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (51, 'api::destino.destino.delete', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (52, 'api::motorista.motorista.find', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (53, 'api::motorista.motorista.findOne', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (54, 'api::motorista.motorista.create', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (55, 'api::motorista.motorista.update', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (56, 'api::motorista.motorista.delete', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (57, 'api::produto.produto.find', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (58, 'api::produto.produto.findOne', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (59, 'api::produto.produto.create', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (60, 'api::produto.produto.update', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (61, 'api::produto.produto.delete', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (62, 'api::veiculo.veiculo.find', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (63, 'api::veiculo.veiculo.findOne', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (64, 'api::veiculo.veiculo.create', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (65, 'api::veiculo.veiculo.update', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (66, 'api::veiculo.veiculo.delete', '2022-11-15 20:18:19.69', '2022-11-15 20:18:19.69', NULL, NULL);
INSERT INTO public.up_permissions VALUES (67, 'api::tipo-material.tipo-material.update', '2022-11-16 14:31:31.389', '2022-11-16 14:31:31.389', NULL, NULL);
INSERT INTO public.up_permissions VALUES (68, 'api::tipo-material.tipo-material.delete', '2022-11-16 14:31:31.389', '2022-11-16 14:31:31.389', NULL, NULL);
INSERT INTO public.up_permissions VALUES (69, 'api::tipo-material.tipo-material.find', '2022-11-16 14:31:31.389', '2022-11-16 14:31:31.389', NULL, NULL);
INSERT INTO public.up_permissions VALUES (70, 'api::tipo-material.tipo-material.create', '2022-11-16 14:31:31.389', '2022-11-16 14:31:31.389', NULL, NULL);
INSERT INTO public.up_permissions VALUES (71, 'api::tipo-material.tipo-material.findOne', '2022-11-16 14:31:31.389', '2022-11-16 14:31:31.389', NULL, NULL);
INSERT INTO public.up_permissions VALUES (72, 'api::entrada.entrada.find', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (73, 'api::entrada.entrada.findOne', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (74, 'api::entrada.entrada.create', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (75, 'api::entrada.entrada.update', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (76, 'api::entrada.entrada.delete', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (77, 'api::item-entrada.item-entrada.find', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (78, 'api::item-entrada.item-entrada.findOne', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (79, 'api::item-entrada.item-entrada.create', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (80, 'api::item-entrada.item-entrada.update', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (81, 'api::item-entrada.item-entrada.delete', '2022-11-16 19:44:54.161', '2022-11-16 19:44:54.161', NULL, NULL);
INSERT INTO public.up_permissions VALUES (82, 'api::fornecedor.fornecedor.delete', '2022-11-18 12:32:50.494', '2022-11-18 12:32:50.494', NULL, NULL);


--
-- TOC entry 3811 (class 0 OID 16608)
-- Dependencies: 252
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.up_permissions_role_links VALUES (1, 1, 1);
INSERT INTO public.up_permissions_role_links VALUES (2, 2, 1);
INSERT INTO public.up_permissions_role_links VALUES (3, 3, 2);
INSERT INTO public.up_permissions_role_links VALUES (4, 4, 2);
INSERT INTO public.up_permissions_role_links VALUES (5, 7, 2);
INSERT INTO public.up_permissions_role_links VALUES (6, 9, 2);
INSERT INTO public.up_permissions_role_links VALUES (7, 5, 2);
INSERT INTO public.up_permissions_role_links VALUES (8, 8, 2);
INSERT INTO public.up_permissions_role_links VALUES (9, 6, 2);
INSERT INTO public.up_permissions_role_links VALUES (15, 15, 3);
INSERT INTO public.up_permissions_role_links VALUES (18, 18, 3);
INSERT INTO public.up_permissions_role_links VALUES (19, 19, 3);
INSERT INTO public.up_permissions_role_links VALUES (20, 20, 3);
INSERT INTO public.up_permissions_role_links VALUES (21, 21, 3);
INSERT INTO public.up_permissions_role_links VALUES (22, 22, 3);
INSERT INTO public.up_permissions_role_links VALUES (25, 24, 3);
INSERT INTO public.up_permissions_role_links VALUES (24, 25, 3);
INSERT INTO public.up_permissions_role_links VALUES (23, 26, 3);
INSERT INTO public.up_permissions_role_links VALUES (26, 23, 3);
INSERT INTO public.up_permissions_role_links VALUES (32, 32, 3);
INSERT INTO public.up_permissions_role_links VALUES (34, 34, 3);
INSERT INTO public.up_permissions_role_links VALUES (33, 33, 3);
INSERT INTO public.up_permissions_role_links VALUES (35, 36, 3);
INSERT INTO public.up_permissions_role_links VALUES (36, 35, 3);
INSERT INTO public.up_permissions_role_links VALUES (42, 42, 3);
INSERT INTO public.up_permissions_role_links VALUES (43, 44, 3);
INSERT INTO public.up_permissions_role_links VALUES (44, 46, 3);
INSERT INTO public.up_permissions_role_links VALUES (45, 45, 3);
INSERT INTO public.up_permissions_role_links VALUES (46, 43, 3);
INSERT INTO public.up_permissions_role_links VALUES (47, 47, 3);
INSERT INTO public.up_permissions_role_links VALUES (48, 48, 3);
INSERT INTO public.up_permissions_role_links VALUES (49, 49, 3);
INSERT INTO public.up_permissions_role_links VALUES (50, 51, 3);
INSERT INTO public.up_permissions_role_links VALUES (51, 50, 3);
INSERT INTO public.up_permissions_role_links VALUES (52, 52, 3);
INSERT INTO public.up_permissions_role_links VALUES (53, 53, 3);
INSERT INTO public.up_permissions_role_links VALUES (54, 54, 3);
INSERT INTO public.up_permissions_role_links VALUES (55, 55, 3);
INSERT INTO public.up_permissions_role_links VALUES (56, 56, 3);
INSERT INTO public.up_permissions_role_links VALUES (57, 58, 3);
INSERT INTO public.up_permissions_role_links VALUES (58, 59, 3);
INSERT INTO public.up_permissions_role_links VALUES (59, 57, 3);
INSERT INTO public.up_permissions_role_links VALUES (60, 60, 3);
INSERT INTO public.up_permissions_role_links VALUES (61, 61, 3);
INSERT INTO public.up_permissions_role_links VALUES (62, 62, 3);
INSERT INTO public.up_permissions_role_links VALUES (63, 65, 3);
INSERT INTO public.up_permissions_role_links VALUES (64, 64, 3);
INSERT INTO public.up_permissions_role_links VALUES (65, 63, 3);
INSERT INTO public.up_permissions_role_links VALUES (66, 66, 3);
INSERT INTO public.up_permissions_role_links VALUES (67, 69, 3);
INSERT INTO public.up_permissions_role_links VALUES (68, 67, 3);
INSERT INTO public.up_permissions_role_links VALUES (70, 68, 3);
INSERT INTO public.up_permissions_role_links VALUES (69, 71, 3);
INSERT INTO public.up_permissions_role_links VALUES (71, 70, 3);
INSERT INTO public.up_permissions_role_links VALUES (72, 72, 3);
INSERT INTO public.up_permissions_role_links VALUES (73, 73, 3);
INSERT INTO public.up_permissions_role_links VALUES (74, 74, 3);
INSERT INTO public.up_permissions_role_links VALUES (75, 75, 3);
INSERT INTO public.up_permissions_role_links VALUES (76, 76, 3);
INSERT INTO public.up_permissions_role_links VALUES (77, 77, 3);
INSERT INTO public.up_permissions_role_links VALUES (78, 78, 3);
INSERT INTO public.up_permissions_role_links VALUES (79, 79, 3);
INSERT INTO public.up_permissions_role_links VALUES (80, 81, 3);
INSERT INTO public.up_permissions_role_links VALUES (81, 80, 3);
INSERT INTO public.up_permissions_role_links VALUES (82, 82, 3);


--
-- TOC entry 3795 (class 0 OID 16531)
-- Dependencies: 236
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.up_roles VALUES (1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2022-11-05 12:14:08.863', '2022-11-05 12:14:08.863', NULL, NULL);
INSERT INTO public.up_roles VALUES (2, 'Public', 'Default role given to unauthenticated user.', 'public', '2022-11-05 12:14:08.886', '2022-11-05 12:14:08.886', NULL, NULL);
INSERT INTO public.up_roles VALUES (4, 'FORNECEDOR', 'Fornecedor', 'operador_estoque', '2022-11-08 18:07:53.241', '2022-11-08 18:12:21.468', NULL, NULL);
INSERT INTO public.up_roles VALUES (5, 'OPERADOR_ESTOQUE', 'Operador de Estoque', 'fronecedor', '2022-11-08 18:10:41.647', '2022-11-08 18:13:01.699', NULL, NULL);
INSERT INTO public.up_roles VALUES (3, 'ADMINISTRADOR', 'Administrador Telite', 'administrador', '2022-11-05 12:16:16.655', '2022-11-18 12:32:50.45', NULL, NULL);


--
-- TOC entry 3797 (class 0 OID 16542)
-- Dependencies: 238
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.up_users VALUES (3, 'Admin Administrador 3', 'admin3@telite.com', 'local', '$2a$10$rOLvqoSM4OOOY.uL4VfJQeuWmt81yShk5qPRPXqFyY.e.fBQfWNuK', NULL, NULL, true, false, '2022-11-13 22:04:45.223', '2022-11-13 22:04:45.223', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (4, 'Admin Administrador 4', 'admin4@telite.com', 'local', '$2a$10$DKgiEJeMoZG7uBC8JnR.W.aYNKsrMMVzqzKDoWsMMZiBL/DYlEzEa', NULL, NULL, true, false, '2022-11-13 22:05:05.64', '2022-11-13 22:05:05.64', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (5, 'Admin Administrador 5', 'admin5@telite.com', 'local', '$2a$10$A0XWulTj91wCAYUMJLo3heRslU1LwRPK7XVr3WADEFO0H7/POQWJm', NULL, NULL, true, false, '2022-11-13 22:06:36.644', '2022-11-13 22:06:36.644', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (6, 'Admin Administrador 6', 'admin6@telite.com', 'local', '$2a$10$1kSZ1NNW882Hh8zoHr6oiOViP90jatbqk5LAEojd8kCzwokvE91Mq', NULL, NULL, true, false, '2022-11-13 22:06:49.594', '2022-11-13 22:06:49.594', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (7, 'Admin Administrador 7', 'admin7@telite.com', 'local', '$2a$10$dZX0tMmCTbWoOl/mokLLoO4U2Ful3LITBd2pe2XIpKoRVOVOM7xC2', NULL, NULL, true, false, '2022-11-13 22:07:04.9', '2022-11-13 22:07:04.9', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (8, 'Admin Administrador 8', 'admin8@telite.com', 'local', '$2a$10$Ctv7TCZXfVXRcV35x1Wjj.NPN0ogTCtR6uZM6T7.bgGVrg71PQCfC', NULL, NULL, true, false, '2022-11-13 22:07:17.444', '2022-11-13 22:07:17.444', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (9, 'Admin Administrador 9', 'admin9@telite.com', 'local', '$2a$10$nfelxx.UuFvk0hDe9Epnb.7cqYC0VPfHRFAzc6ikLxrNF/i4Hoxui', NULL, NULL, true, false, '2022-11-13 22:07:29.294', '2022-11-13 22:07:29.294', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (10, 'Admin Administrador 10', 'admin10@telite.com', 'local', '$2a$10$Ib979/fGiVhxNkfooLzz5eaW1QdOPq3DeKzwg/5SNRCtgrtePwWhG', NULL, NULL, true, false, '2022-11-13 22:07:45.192', '2022-11-13 22:07:45.192', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (11, 'Admin Administrador 11', 'admin11@telite.com', 'local', '$2a$10$YOCQD9thJaZGGhBKcmMs0.6iXIDVn/YKuG9wvah19OFpDqveEozgO', NULL, NULL, true, false, '2022-11-13 22:08:09.679', '2022-11-13 22:08:09.679', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (2, 'Admin Administrador 2', 'admin2@telite.com', 'local', '$2a$10$djdfkr4YPcZcgj9uSvfUD.PVP3UTg/AP6Ll9QIwapzqVcub5pOobW', NULL, NULL, true, false, '2022-11-13 22:04:12.059', '2022-11-14 00:29:46.314', 1, 1, NULL, NULL);
INSERT INTO public.up_users VALUES (1, 'Admin Administrador PRINCIPAL', 'admin@telite.com', 'local', '$2a$10$QoRGiFM6sPnuYFEtYLf1TuRxuuadyJ.QA5lWlyF0s1B4Te7.T9fp6', NULL, NULL, true, false, '2022-11-05 12:15:42.367', '2022-11-15 13:52:30.282', 1, 1, NULL, '000.111.222-33');


--
-- TOC entry 3813 (class 0 OID 16617)
-- Dependencies: 254
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.up_users_role_links VALUES (7, 2, 3);
INSERT INTO public.up_users_role_links VALUES (8, 3, 3);
INSERT INTO public.up_users_role_links VALUES (9, 4, 3);
INSERT INTO public.up_users_role_links VALUES (10, 5, 3);
INSERT INTO public.up_users_role_links VALUES (11, 6, 3);
INSERT INTO public.up_users_role_links VALUES (12, 7, 3);
INSERT INTO public.up_users_role_links VALUES (13, 8, 3);
INSERT INTO public.up_users_role_links VALUES (14, 9, 3);
INSERT INTO public.up_users_role_links VALUES (15, 10, 3);
INSERT INTO public.up_users_role_links VALUES (16, 11, 3);
INSERT INTO public.up_users_role_links VALUES (17, 1, 3);


--
-- TOC entry 3789 (class 0 OID 16496)
-- Dependencies: 230
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3809 (class 0 OID 16599)
-- Dependencies: 250
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3833 (class 0 OID 82177)
-- Dependencies: 274
-- Data for Name: veiculos; Type: TABLE DATA; Schema: public; Owner: strapi
--

INSERT INTO public.veiculos VALUES (1, 'Veiculo', '000', '2022-11-15 21:21:41.47', '2022-11-15 21:21:41.47', '2022-11-15 21:21:41.468', NULL, NULL);


--
-- TOC entry 3835 (class 0 OID 82188)
-- Dependencies: 276
-- Data for Name: veiculos_fornecedor_links; Type: TABLE DATA; Schema: public; Owner: strapi
--



--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 194, true);


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 239
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 194, true);


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 241
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 2, true);


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 257
-- Name: categoria_materiais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.categoria_materiais_id_seq', 13, true);


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 267
-- Name: destinos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.destinos_id_seq', 1, true);


--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 285
-- Name: entradas_fornecedor_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.entradas_fornecedor_links_id_seq', 3, true);


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 279
-- Name: entradas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.entradas_id_seq', 3, true);


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 281
-- Name: entradas_item_entradas_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.entradas_item_entradas_links_id_seq', 14, true);


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 247
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 227
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.files_id_seq', 1, false);


--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 245
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 1, false);


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 255
-- Name: fornecedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.fornecedores_id_seq', 11, true);


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 231
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 277
-- Name: itens_entradas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.itens_entradas_id_seq', 4, true);


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 283
-- Name: itens_entradas_tipo_material_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.itens_entradas_tipo_material_links_id_seq', 8, true);


--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 263
-- Name: maquinas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.maquinas_id_seq', 11, true);


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 271
-- Name: motoristas_fornecedor_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.motoristas_fornecedor_links_id_seq', 1, false);


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 269
-- Name: motoristas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.motoristas_id_seq', 4, true);


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 265
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.produtos_id_seq', 3, true);


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 225
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 243
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 223
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 213
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 31, true);


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 211
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 26, true);


--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 209
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 215
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 261
-- Name: tipos_materiais_categoria_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.tipos_materiais_categoria_links_id_seq', 42, true);


--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipos_materiais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.tipos_materiais_id_seq', 42, true);


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 233
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 82, true);


--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 251
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 82, true);


--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 235
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 5, true);


--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 237
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_users_id_seq', 11, true);


--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 253
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 17, true);


--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 229
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 249
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 275
-- Name: veiculos_fornecedor_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.veiculos_fornecedor_links_id_seq', 1, false);


--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 273
-- Name: veiculos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.veiculos_id_seq', 2, true);


--
-- TOC entry 3418 (class 2606 OID 16427)
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3468 (class 2606 OID 16558)
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3426 (class 2606 OID 16449)
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3422 (class 2606 OID 16438)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3472 (class 2606 OID 16567)
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 81949)
-- Name: categoria_materiais categoria_materiais_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.categoria_materiais
    ADD CONSTRAINT categoria_materiais_pkey PRIMARY KEY (id);


--
-- TOC entry 3522 (class 2606 OID 82119)
-- Name: destinos destinos_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.destinos
    ADD CONSTRAINT destinos_pkey PRIMARY KEY (id);


--
-- TOC entry 3559 (class 2606 OID 90267)
-- Name: entradas_fornecedor_links entradas_fornecedor_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_fornecedor_links
    ADD CONSTRAINT entradas_fornecedor_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3551 (class 2606 OID 90188)
-- Name: entradas_item_entradas_links entradas_item_entradas_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_item_entradas_links
    ADD CONSTRAINT entradas_item_entradas_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3546 (class 2606 OID 90179)
-- Name: entradas entradas_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas
    ADD CONSTRAINT entradas_pkey PRIMARY KEY (id);


--
-- TOC entry 3483 (class 2606 OID 16595)
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3438 (class 2606 OID 16491)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 16587)
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- TOC entry 3498 (class 2606 OID 57375)
-- Name: fornecedores fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3451 (class 2606 OID 16518)
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- TOC entry 3542 (class 2606 OID 90139)
-- Name: itens_entradas itens_entradas_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas
    ADD CONSTRAINT itens_entradas_pkey PRIMARY KEY (id);


--
-- TOC entry 3555 (class 2606 OID 90242)
-- Name: itens_entradas_tipo_material_links itens_entradas_tipo_material_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas_tipo_material_links
    ADD CONSTRAINT itens_entradas_tipo_material_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3514 (class 2606 OID 82075)
-- Name: maquinas maquinas_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT maquinas_pkey PRIMARY KEY (id);


--
-- TOC entry 3531 (class 2606 OID 82151)
-- Name: motoristas_fornecedor_links motoristas_fornecedor_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas_fornecedor_links
    ADD CONSTRAINT motoristas_fornecedor_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 82142)
-- Name: motoristas motoristas_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas
    ADD CONSTRAINT motoristas_pkey PRIMARY KEY (id);


--
-- TOC entry 3518 (class 2606 OID 82096)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- TOC entry 3434 (class 2606 OID 16469)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 16576)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3430 (class 2606 OID 16460)
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 16409)
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 16400)
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 3409 (class 2606 OID 16391)
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 16418)
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 3511 (class 2606 OID 82054)
-- Name: tipos_materiais_categoria_links tipos_materiais_categoria_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais_categoria_links
    ADD CONSTRAINT tipos_materiais_categoria_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 82013)
-- Name: tipos_materiais tipos_materiais_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais
    ADD CONSTRAINT tipos_materiais_pkey PRIMARY KEY (id);


--
-- TOC entry 3455 (class 2606 OID 16527)
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3491 (class 2606 OID 16613)
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3459 (class 2606 OID 16538)
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3463 (class 2606 OID 16549)
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3495 (class 2606 OID 16622)
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3487 (class 2606 OID 16604)
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3443 (class 2606 OID 16505)
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- TOC entry 3445 (class 2606 OID 16507)
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- TOC entry 3447 (class 2606 OID 16503)
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 3539 (class 2606 OID 82193)
-- Name: veiculos_fornecedor_links veiculos_fornecedor_links_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos_fornecedor_links
    ADD CONSTRAINT veiculos_fornecedor_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3534 (class 2606 OID 82184)
-- Name: veiculos veiculos_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT veiculos_pkey PRIMARY KEY (id);


--
-- TOC entry 3416 (class 1259 OID 16428)
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- TOC entry 3465 (class 1259 OID 16559)
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3466 (class 1259 OID 16560)
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- TOC entry 3419 (class 1259 OID 16429)
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- TOC entry 3424 (class 1259 OID 16450)
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- TOC entry 3427 (class 1259 OID 16451)
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- TOC entry 3420 (class 1259 OID 16439)
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- TOC entry 3469 (class 1259 OID 16568)
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- TOC entry 3470 (class 1259 OID 16569)
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- TOC entry 3423 (class 1259 OID 16440)
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- TOC entry 3500 (class 1259 OID 81950)
-- Name: categoria_materiais_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX categoria_materiais_created_by_id_fk ON public.categoria_materiais USING btree (created_by_id);


--
-- TOC entry 3503 (class 1259 OID 81951)
-- Name: categoria_materiais_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX categoria_materiais_updated_by_id_fk ON public.categoria_materiais USING btree (updated_by_id);


--
-- TOC entry 3520 (class 1259 OID 82120)
-- Name: destinos_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX destinos_created_by_id_fk ON public.destinos USING btree (created_by_id);


--
-- TOC entry 3523 (class 1259 OID 82121)
-- Name: destinos_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX destinos_updated_by_id_fk ON public.destinos USING btree (updated_by_id);


--
-- TOC entry 3544 (class 1259 OID 90180)
-- Name: entradas_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX entradas_created_by_id_fk ON public.entradas USING btree (created_by_id);


--
-- TOC entry 3556 (class 1259 OID 90268)
-- Name: entradas_fornecedor_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX entradas_fornecedor_links_fk ON public.entradas_fornecedor_links USING btree (entrada_id);


--
-- TOC entry 3557 (class 1259 OID 90269)
-- Name: entradas_fornecedor_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX entradas_fornecedor_links_inv_fk ON public.entradas_fornecedor_links USING btree (fornecedor_id);


--
-- TOC entry 3548 (class 1259 OID 90189)
-- Name: entradas_item_entradas_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX entradas_item_entradas_links_fk ON public.entradas_item_entradas_links USING btree (entrada_id);


--
-- TOC entry 3549 (class 1259 OID 90190)
-- Name: entradas_item_entradas_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX entradas_item_entradas_links_inv_fk ON public.entradas_item_entradas_links USING btree (item_entrada_id);


--
-- TOC entry 3547 (class 1259 OID 90181)
-- Name: entradas_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX entradas_updated_by_id_fk ON public.entradas USING btree (updated_by_id);


--
-- TOC entry 3436 (class 1259 OID 16493)
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- TOC entry 3480 (class 1259 OID 16596)
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- TOC entry 3481 (class 1259 OID 16597)
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- TOC entry 3477 (class 1259 OID 16588)
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- TOC entry 3439 (class 1259 OID 16494)
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- TOC entry 3496 (class 1259 OID 57376)
-- Name: fornecedores_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX fornecedores_created_by_id_fk ON public.fornecedores USING btree (created_by_id);


--
-- TOC entry 3499 (class 1259 OID 57377)
-- Name: fornecedores_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX fornecedores_updated_by_id_fk ON public.fornecedores USING btree (updated_by_id);


--
-- TOC entry 3449 (class 1259 OID 16519)
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- TOC entry 3452 (class 1259 OID 16520)
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- TOC entry 3540 (class 1259 OID 90140)
-- Name: itens_entradas_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX itens_entradas_created_by_id_fk ON public.itens_entradas USING btree (created_by_id);


--
-- TOC entry 3552 (class 1259 OID 90243)
-- Name: itens_entradas_tipo_material_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX itens_entradas_tipo_material_links_fk ON public.itens_entradas_tipo_material_links USING btree (item_entrada_id);


--
-- TOC entry 3553 (class 1259 OID 90244)
-- Name: itens_entradas_tipo_material_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX itens_entradas_tipo_material_links_inv_fk ON public.itens_entradas_tipo_material_links USING btree (tipo_material_id);


--
-- TOC entry 3543 (class 1259 OID 90141)
-- Name: itens_entradas_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX itens_entradas_updated_by_id_fk ON public.itens_entradas USING btree (updated_by_id);


--
-- TOC entry 3512 (class 1259 OID 82076)
-- Name: maquinas_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX maquinas_created_by_id_fk ON public.maquinas USING btree (created_by_id);


--
-- TOC entry 3515 (class 1259 OID 82077)
-- Name: maquinas_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX maquinas_updated_by_id_fk ON public.maquinas USING btree (updated_by_id);


--
-- TOC entry 3524 (class 1259 OID 82143)
-- Name: motoristas_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX motoristas_created_by_id_fk ON public.motoristas USING btree (created_by_id);


--
-- TOC entry 3528 (class 1259 OID 82152)
-- Name: motoristas_fornecedor_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX motoristas_fornecedor_links_fk ON public.motoristas_fornecedor_links USING btree (motorista_id);


--
-- TOC entry 3529 (class 1259 OID 82153)
-- Name: motoristas_fornecedor_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX motoristas_fornecedor_links_inv_fk ON public.motoristas_fornecedor_links USING btree (fornecedor_id);


--
-- TOC entry 3527 (class 1259 OID 82144)
-- Name: motoristas_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX motoristas_updated_by_id_fk ON public.motoristas USING btree (updated_by_id);


--
-- TOC entry 3516 (class 1259 OID 82097)
-- Name: produtos_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX produtos_created_by_id_fk ON public.produtos USING btree (created_by_id);


--
-- TOC entry 3519 (class 1259 OID 82098)
-- Name: produtos_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX produtos_updated_by_id_fk ON public.produtos USING btree (updated_by_id);


--
-- TOC entry 3432 (class 1259 OID 16470)
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- TOC entry 3473 (class 1259 OID 16577)
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- TOC entry 3474 (class 1259 OID 16578)
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- TOC entry 3435 (class 1259 OID 16471)
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- TOC entry 3428 (class 1259 OID 16461)
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- TOC entry 3431 (class 1259 OID 16462)
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- TOC entry 3508 (class 1259 OID 82055)
-- Name: tipos_materiais_categoria_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX tipos_materiais_categoria_links_fk ON public.tipos_materiais_categoria_links USING btree (tipo_material_id);


--
-- TOC entry 3509 (class 1259 OID 82056)
-- Name: tipos_materiais_categoria_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX tipos_materiais_categoria_links_inv_fk ON public.tipos_materiais_categoria_links USING btree (categoria_material_id);


--
-- TOC entry 3504 (class 1259 OID 82014)
-- Name: tipos_materiais_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX tipos_materiais_created_by_id_fk ON public.tipos_materiais USING btree (created_by_id);


--
-- TOC entry 3507 (class 1259 OID 82015)
-- Name: tipos_materiais_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX tipos_materiais_updated_by_id_fk ON public.tipos_materiais USING btree (updated_by_id);


--
-- TOC entry 3453 (class 1259 OID 16528)
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- TOC entry 3488 (class 1259 OID 16614)
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3489 (class 1259 OID 16615)
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- TOC entry 3456 (class 1259 OID 16529)
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- TOC entry 3457 (class 1259 OID 16539)
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- TOC entry 3460 (class 1259 OID 16540)
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- TOC entry 3461 (class 1259 OID 16550)
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- TOC entry 3492 (class 1259 OID 16623)
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- TOC entry 3493 (class 1259 OID 16624)
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- TOC entry 3464 (class 1259 OID 16551)
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- TOC entry 3440 (class 1259 OID 16492)
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- TOC entry 3441 (class 1259 OID 16508)
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- TOC entry 3484 (class 1259 OID 16605)
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- TOC entry 3485 (class 1259 OID 16606)
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- TOC entry 3448 (class 1259 OID 16509)
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- TOC entry 3532 (class 1259 OID 82185)
-- Name: veiculos_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX veiculos_created_by_id_fk ON public.veiculos USING btree (created_by_id);


--
-- TOC entry 3536 (class 1259 OID 82194)
-- Name: veiculos_fornecedor_links_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX veiculos_fornecedor_links_fk ON public.veiculos_fornecedor_links USING btree (veiculo_id);


--
-- TOC entry 3537 (class 1259 OID 82195)
-- Name: veiculos_fornecedor_links_inv_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX veiculos_fornecedor_links_inv_fk ON public.veiculos_fornecedor_links USING btree (fornecedor_id);


--
-- TOC entry 3535 (class 1259 OID 82186)
-- Name: veiculos_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapi
--

CREATE INDEX veiculos_updated_by_id_fk ON public.veiculos USING btree (updated_by_id);


--
-- TOC entry 3560 (class 2606 OID 16625)
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3582 (class 2606 OID 16745)
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3583 (class 2606 OID 16750)
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3561 (class 2606 OID 16630)
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3564 (class 2606 OID 16645)
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3565 (class 2606 OID 16650)
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3562 (class 2606 OID 16635)
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3584 (class 2606 OID 16755)
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- TOC entry 3585 (class 2606 OID 16760)
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3563 (class 2606 OID 16640)
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3599 (class 2606 OID 81952)
-- Name: categoria_materiais categoria_materiais_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.categoria_materiais
    ADD CONSTRAINT categoria_materiais_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3600 (class 2606 OID 81957)
-- Name: categoria_materiais categoria_materiais_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.categoria_materiais
    ADD CONSTRAINT categoria_materiais_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3609 (class 2606 OID 82122)
-- Name: destinos destinos_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.destinos
    ADD CONSTRAINT destinos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3610 (class 2606 OID 82127)
-- Name: destinos destinos_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.destinos
    ADD CONSTRAINT destinos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3621 (class 2606 OID 90191)
-- Name: entradas entradas_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas
    ADD CONSTRAINT entradas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3627 (class 2606 OID 90270)
-- Name: entradas_fornecedor_links entradas_fornecedor_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_fornecedor_links
    ADD CONSTRAINT entradas_fornecedor_links_fk FOREIGN KEY (entrada_id) REFERENCES public.entradas(id) ON DELETE CASCADE;


--
-- TOC entry 3628 (class 2606 OID 90275)
-- Name: entradas_fornecedor_links entradas_fornecedor_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_fornecedor_links
    ADD CONSTRAINT entradas_fornecedor_links_inv_fk FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(id) ON DELETE CASCADE;


--
-- TOC entry 3623 (class 2606 OID 90201)
-- Name: entradas_item_entradas_links entradas_item_entradas_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_item_entradas_links
    ADD CONSTRAINT entradas_item_entradas_links_fk FOREIGN KEY (entrada_id) REFERENCES public.entradas(id) ON DELETE CASCADE;


--
-- TOC entry 3624 (class 2606 OID 90206)
-- Name: entradas_item_entradas_links entradas_item_entradas_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas_item_entradas_links
    ADD CONSTRAINT entradas_item_entradas_links_inv_fk FOREIGN KEY (item_entrada_id) REFERENCES public.itens_entradas(id) ON DELETE CASCADE;


--
-- TOC entry 3622 (class 2606 OID 90196)
-- Name: entradas entradas_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.entradas
    ADD CONSTRAINT entradas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3570 (class 2606 OID 16685)
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3589 (class 2606 OID 16780)
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 3590 (class 2606 OID 16785)
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 3588 (class 2606 OID 16775)
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 3571 (class 2606 OID 16690)
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3597 (class 2606 OID 57378)
-- Name: fornecedores fornecedores_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3598 (class 2606 OID 57383)
-- Name: fornecedores fornecedores_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3574 (class 2606 OID 16705)
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3575 (class 2606 OID 16710)
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3619 (class 2606 OID 90151)
-- Name: itens_entradas itens_entradas_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas
    ADD CONSTRAINT itens_entradas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3625 (class 2606 OID 90245)
-- Name: itens_entradas_tipo_material_links itens_entradas_tipo_material_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas_tipo_material_links
    ADD CONSTRAINT itens_entradas_tipo_material_links_fk FOREIGN KEY (item_entrada_id) REFERENCES public.itens_entradas(id) ON DELETE CASCADE;


--
-- TOC entry 3626 (class 2606 OID 90250)
-- Name: itens_entradas_tipo_material_links itens_entradas_tipo_material_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas_tipo_material_links
    ADD CONSTRAINT itens_entradas_tipo_material_links_inv_fk FOREIGN KEY (tipo_material_id) REFERENCES public.tipos_materiais(id) ON DELETE CASCADE;


--
-- TOC entry 3620 (class 2606 OID 90156)
-- Name: itens_entradas itens_entradas_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.itens_entradas
    ADD CONSTRAINT itens_entradas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3605 (class 2606 OID 82078)
-- Name: maquinas maquinas_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT maquinas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3606 (class 2606 OID 82083)
-- Name: maquinas maquinas_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.maquinas
    ADD CONSTRAINT maquinas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3611 (class 2606 OID 82154)
-- Name: motoristas motoristas_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas
    ADD CONSTRAINT motoristas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3613 (class 2606 OID 82164)
-- Name: motoristas_fornecedor_links motoristas_fornecedor_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas_fornecedor_links
    ADD CONSTRAINT motoristas_fornecedor_links_fk FOREIGN KEY (motorista_id) REFERENCES public.motoristas(id) ON DELETE CASCADE;


--
-- TOC entry 3614 (class 2606 OID 82169)
-- Name: motoristas_fornecedor_links motoristas_fornecedor_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas_fornecedor_links
    ADD CONSTRAINT motoristas_fornecedor_links_inv_fk FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(id) ON DELETE CASCADE;


--
-- TOC entry 3612 (class 2606 OID 82159)
-- Name: motoristas motoristas_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.motoristas
    ADD CONSTRAINT motoristas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3607 (class 2606 OID 82099)
-- Name: produtos produtos_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3608 (class 2606 OID 82104)
-- Name: produtos produtos_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3568 (class 2606 OID 16665)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3586 (class 2606 OID 16765)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3587 (class 2606 OID 16770)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 3569 (class 2606 OID 16670)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3566 (class 2606 OID 16655)
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3567 (class 2606 OID 16660)
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3603 (class 2606 OID 82057)
-- Name: tipos_materiais_categoria_links tipos_materiais_categoria_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais_categoria_links
    ADD CONSTRAINT tipos_materiais_categoria_links_fk FOREIGN KEY (tipo_material_id) REFERENCES public.tipos_materiais(id) ON DELETE CASCADE;


--
-- TOC entry 3604 (class 2606 OID 82062)
-- Name: tipos_materiais_categoria_links tipos_materiais_categoria_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais_categoria_links
    ADD CONSTRAINT tipos_materiais_categoria_links_inv_fk FOREIGN KEY (categoria_material_id) REFERENCES public.categoria_materiais(id) ON DELETE CASCADE;


--
-- TOC entry 3601 (class 2606 OID 82025)
-- Name: tipos_materiais tipos_materiais_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais
    ADD CONSTRAINT tipos_materiais_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3602 (class 2606 OID 82030)
-- Name: tipos_materiais tipos_materiais_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.tipos_materiais
    ADD CONSTRAINT tipos_materiais_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3576 (class 2606 OID 16715)
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3593 (class 2606 OID 16800)
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3594 (class 2606 OID 16805)
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3577 (class 2606 OID 16720)
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3578 (class 2606 OID 16725)
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3579 (class 2606 OID 16730)
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3580 (class 2606 OID 16735)
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3595 (class 2606 OID 16810)
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 3596 (class 2606 OID 16815)
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3581 (class 2606 OID 16740)
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3572 (class 2606 OID 16695)
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3591 (class 2606 OID 16790)
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 3592 (class 2606 OID 16795)
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 3573 (class 2606 OID 16700)
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3615 (class 2606 OID 82196)
-- Name: veiculos veiculos_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT veiculos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3617 (class 2606 OID 82206)
-- Name: veiculos_fornecedor_links veiculos_fornecedor_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos_fornecedor_links
    ADD CONSTRAINT veiculos_fornecedor_links_fk FOREIGN KEY (veiculo_id) REFERENCES public.veiculos(id) ON DELETE CASCADE;


--
-- TOC entry 3618 (class 2606 OID 82211)
-- Name: veiculos_fornecedor_links veiculos_fornecedor_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos_fornecedor_links
    ADD CONSTRAINT veiculos_fornecedor_links_inv_fk FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(id) ON DELETE CASCADE;


--
-- TOC entry 3616 (class 2606 OID 82201)
-- Name: veiculos veiculos_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT veiculos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


-- Completed on 2022-11-21 05:56:09

--
-- PostgreSQL database dump complete
--

