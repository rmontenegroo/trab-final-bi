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
-- Name: dim_local; Type: TABLE; Schema: dw; Owner: -
--

CREATE TABLE "public".dim_local (
    sk_local serial PRIMARY KEY,
    nm_cidade character varying(32) DEFAULT 'N/A'::character varying NOT NULL,
    sg_estado character(3) DEFAULT 'N/A'::bpchar NOT NULL,
    nm_pais character varying(40) DEFAULT 'N/A'::character varying NOT NULL
);

