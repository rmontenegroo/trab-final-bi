
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

CREATE TABLE "public".dim_dispendio (
    sk_dispendio serial PRIMARY KEY,
    descricao character varying(60) NOT NULL,
    nm_passageiro character varying(120) DEFAULT 'N/A'::character varying NOT NULL,
    trecho character varying(100) DEFAULT 'N/A'::character varying NOT NULL,
    especificacao character varying(20) DEFAULT 'N/A'::character varying NOT NULL
);
