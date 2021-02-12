--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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

SET default_table_access_method = heap;

--
-- Name: dim_fornecedor; Type: TABLE; Schema: dw; Owner: -
--

CREATE TABLE "public".dim_fornecedor (
    sk_fornecedor serial PRIMARY KEY,
    natureza character varying(8) NOT NULL,
    nm_fornecedor character varying(150) DEFAULT 'N/A'::character varying NOT NULL,
    cadastro character varying(24) NOT NULL
);

