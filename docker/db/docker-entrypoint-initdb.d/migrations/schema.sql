--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 16devel

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

DROP POLICY IF EXISTS "Enable read access for all users" ON public.user_type;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.user_role;
DROP POLICY IF EXISTS "Enable read access for all users" ON public."user";
DROP POLICY IF EXISTS "Enable read access for all users" ON public.role;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.content_type;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.content_part;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.content_content_part;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.content;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.config;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.asset_type;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.asset;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_role_id_fkey;
ALTER TABLE IF EXISTS ONLY public.content_part DROP CONSTRAINT IF EXISTS content_part_parent_content_part_id_fkey;
ALTER TABLE IF EXISTS ONLY public.content_part DROP CONSTRAINT IF EXISTS content_part_content_type_id_fkey;
ALTER TABLE IF EXISTS ONLY public.content DROP CONSTRAINT IF EXISTS content_owner_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.content DROP CONSTRAINT IF EXISTS content_content_type_id_fkey;
ALTER TABLE IF EXISTS ONLY public.content_content_part DROP CONSTRAINT IF EXISTS content_content_part_content_part_id_fkey;
ALTER TABLE IF EXISTS ONLY public.content_content_part DROP CONSTRAINT IF EXISTS content_content_part_content_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug DROP CONSTRAINT IF EXISTS bug_updater_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug DROP CONSTRAINT IF EXISTS bug_reporter_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_note DROP CONSTRAINT IF EXISTS bug_note_updater_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_note DROP CONSTRAINT IF EXISTS bug_note_parent_note_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_note DROP CONSTRAINT IF EXISTS bug_note_creator_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_note DROP CONSTRAINT IF EXISTS bug_note_content_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_note DROP CONSTRAINT IF EXISTS bug_note_bug_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug DROP CONSTRAINT IF EXISTS bug_content_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_assignment DROP CONSTRAINT IF EXISTS bug_assignment_owner_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_assignment DROP CONSTRAINT IF EXISTS bug_assignment_bug_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bug_assignment DROP CONSTRAINT IF EXISTS bug_assignment_assigner_id_fkey;
ALTER TABLE IF EXISTS ONLY public.asset DROP CONSTRAINT IF EXISTS asset_updater_id_fkey;
ALTER TABLE IF EXISTS ONLY public.asset DROP CONSTRAINT IF EXISTS asset_owner_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.asset DROP CONSTRAINT IF EXISTS asset_creator_id_fkey;
ALTER TABLE IF EXISTS ONLY public.asset DROP CONSTRAINT IF EXISTS asset_asset_type_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_type DROP CONSTRAINT IF EXISTS user_type_pkey;
ALTER TABLE IF EXISTS ONLY public.user_type DROP CONSTRAINT IF EXISTS user_type_name_key;
ALTER TABLE IF EXISTS ONLY public.user_type DROP CONSTRAINT IF EXISTS user_type_key_key;
ALTER TABLE IF EXISTS ONLY public.user_role DROP CONSTRAINT IF EXISTS user_role_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_identifier_key;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_email_key;
ALTER TABLE IF EXISTS ONLY public.tenants DROP CONSTRAINT IF EXISTS tenants_pkey;
ALTER TABLE IF EXISTS ONLY public.specialty DROP CONSTRAINT IF EXISTS specialty_pkey;
ALTER TABLE IF EXISTS ONLY public.specialty DROP CONSTRAINT IF EXISTS specialty_name_key;
ALTER TABLE IF EXISTS ONLY public.specialty DROP CONSTRAINT IF EXISTS specialty_key_key;
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS role_pkey;
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS role_name_key;
ALTER TABLE IF EXISTS ONLY public.role DROP CONSTRAINT IF EXISTS role_key_key;
ALTER TABLE IF EXISTS ONLY public.content_type DROP CONSTRAINT IF EXISTS content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.content_type DROP CONSTRAINT IF EXISTS content_type_name_key;
ALTER TABLE IF EXISTS ONLY public.content_type DROP CONSTRAINT IF EXISTS content_type_key_key;
ALTER TABLE IF EXISTS ONLY public.content DROP CONSTRAINT IF EXISTS content_pkey;
ALTER TABLE IF EXISTS ONLY public.content_part DROP CONSTRAINT IF EXISTS content_part_pkey;
ALTER TABLE IF EXISTS ONLY public.content_part DROP CONSTRAINT IF EXISTS content_part_key_key;
ALTER TABLE IF EXISTS ONLY public.content DROP CONSTRAINT IF EXISTS content_key_key;
ALTER TABLE IF EXISTS ONLY public.content_content_part DROP CONSTRAINT IF EXISTS content_content_part_pkey;
ALTER TABLE IF EXISTS ONLY public.config DROP CONSTRAINT IF EXISTS config_pkey;
ALTER TABLE IF EXISTS ONLY public.config DROP CONSTRAINT IF EXISTS config_key_key;
ALTER TABLE IF EXISTS ONLY public.bug DROP CONSTRAINT IF EXISTS bug_pkey;
ALTER TABLE IF EXISTS ONLY public.bug_note DROP CONSTRAINT IF EXISTS bug_note_pkey;
ALTER TABLE IF EXISTS ONLY public.bug_assignment DROP CONSTRAINT IF EXISTS bug_assignment_pkey;
ALTER TABLE IF EXISTS ONLY public.asset_type DROP CONSTRAINT IF EXISTS asset_type_pkey;
ALTER TABLE IF EXISTS ONLY public.asset_type DROP CONSTRAINT IF EXISTS asset_type_name_key;
ALTER TABLE IF EXISTS ONLY public.asset_type DROP CONSTRAINT IF EXISTS asset_type_key_key;
ALTER TABLE IF EXISTS ONLY public.asset DROP CONSTRAINT IF EXISTS asset_pkey;
DROP TABLE IF EXISTS public.user_role;
DROP TABLE IF EXISTS public."user";
DROP TABLE IF EXISTS public.tenants;
DROP TABLE IF EXISTS public.role;
DROP TABLE IF EXISTS public.extensions;
DROP TABLE IF EXISTS public.content_type;
DROP TABLE IF EXISTS public.content_part;
DROP TABLE IF EXISTS public.content_content_part;
DROP TABLE IF EXISTS public.content;
DROP TABLE IF EXISTS public.config;
DROP TABLE IF EXISTS public.bug_note;
DROP TABLE IF EXISTS public.bug_assignment;
DROP TABLE IF EXISTS public.bug;
DROP TABLE IF EXISTS public.asset_type;
DROP TABLE IF EXISTS public.asset;
DROP FUNCTION IF EXISTS public.pgrst_watch();
DROP FUNCTION IF EXISTS public.http_post_plus(uri character varying, data character varying, headers extensions.http_header[]);
DROP FUNCTION IF EXISTS public.http_post_plus(uri character varying, data text, headers extensions.http_header[]);
DROP FUNCTION IF EXISTS public.http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]);
DROP FUNCTION IF EXISTS public.authenticate_memphis();
DROP TYPE IF EXISTS public.gender;
DROP TYPE IF EXISTS public.bug_status;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS '@graphql({"inflect_names": true})';


--
-- Name: bug_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.bug_status AS ENUM (
    'initial',
    'reported',
    'assigned',
    'in_progress',
    'pending',
    'fixed',
    'unfixable'
);


ALTER TYPE public.bug_status OWNER TO postgres;

--
-- Name: TYPE bug_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE public.bug_status IS 'Status of Bugs';


--
-- Name: gender; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.gender AS ENUM (
    'male',
    'female',
    'other'
);


ALTER TYPE public.gender OWNER TO supabase_admin;

--
-- Name: authenticate_memphis(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.authenticate_memphis() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    auth_url text := 'http://memphis-rest-gateway.memphis.svc.cluster.local:4444/auth/authenticate';
    auth_request jsonb := '{
        "username": "ethosuser",
        "password": "Toothless1!",
        "account_id": 123456789,
        "token_expiry_in_minutes": 6000000,
        "refresh_token_expiry_in_minutes": 100000
    }';
    auth_response extensions.http_response;
    jwt text;
BEGIN
    auth_response := http_post_plus(auth_url, auth_request::text, ARRAY[
        ('Content-Type', 'application/json')
        ]::extensions.http_header[]);
    jwt := (auth_response.content::jsonb)->>'jwt';
    RETURN jwt;
END;
$$;


ALTER FUNCTION public.authenticate_memphis() OWNER TO postgres;

--
-- Name: http_post_plus(character varying, jsonb, extensions.http_header[]); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]) RETURNS extensions.http_response
    LANGUAGE sql
    AS $$ SELECT extensions.http(('POST', uri, headers, 'application/json', data::text)::extensions.http_request) $$;


ALTER FUNCTION public.http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]) OWNER TO supabase_admin;

--
-- Name: http_post_plus(character varying, text, extensions.http_header[]); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.http_post_plus(uri character varying, data text, headers extensions.http_header[]) RETURNS extensions.http_response
    LANGUAGE sql
    AS $$ SELECT extensions.http(('POST', uri, headers, 'application/json', data)::extensions.http_request) $$;


ALTER FUNCTION public.http_post_plus(uri character varying, data text, headers extensions.http_header[]) OWNER TO supabase_admin;

--
-- Name: http_post_plus(character varying, character varying, extensions.http_header[]); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.http_post_plus(uri character varying, data character varying, headers extensions.http_header[]) RETURNS extensions.http_response
    LANGUAGE sql
    AS $$ SELECT extensions.http(('POST', uri, headers, 'application/json', data)::extensions.http_request) $$;


ALTER FUNCTION public.http_post_plus(uri character varying, data character varying, headers extensions.http_header[]) OWNER TO supabase_admin;

--
-- Name: pgrst_watch(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pgrst_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NOTIFY pgrst, 'reload schema';
END;
$$;


ALTER FUNCTION public.pgrst_watch() OWNER TO postgres;

--
-- Name: quick_test(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.quick_test() RETURNS extensions.http_response
    LANGUAGE plpgsql
    AS $$
DECLARE
    post_url text := 'http://memphis-rest-gateway.memphis.svc.cluster.local:4444/stations/referral/produce/single';
    jwt text := authenticate_memphis();
    bearer text := 'Bearer ' || jwt;
BEGIN
    return http_post_plus(post_url, '{"first":"one"}',
                          ARRAY[('Authorization', bearer)]::extensions.http_header[]);
END
    $$;


SET default_tablespace = '';

SET default_table_access_method = heap;


--
-- Name: asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    asset_type_id uuid,
    name text,
    data jsonb,
    creator_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    updater_id uuid,
    owner_user_id uuid,
    hash text NOT NULL
);


ALTER TABLE public.asset OWNER TO postgres;

--
-- Name: asset_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_type (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    key text NOT NULL,
    schema jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    mime_types text[]
);


ALTER TABLE public.asset_type OWNER TO postgres;

--
-- Name: TABLE asset_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.asset_type IS 'Asset Type';


--
-- Name: bug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bug (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    key text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    data jsonb,
    content_id uuid,
    description text,
    reporter_id uuid,
    status public.bug_status DEFAULT 'initial'::public.bug_status NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    updater_id uuid
);


ALTER TABLE public.bug OWNER TO postgres;

--
-- Name: bug_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bug_assignment (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    assigner_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_id uuid,
    bug_id uuid NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    notes text,
    status public.bug_status DEFAULT 'assigned'::public.bug_status NOT NULL
);


ALTER TABLE public.bug_assignment OWNER TO postgres;

--
-- Name: bug_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bug_note (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    bug_id uuid NOT NULL,
    content_id uuid NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    creator_id uuid,
    updater_id uuid,
    parent_note_id uuid
);


ALTER TABLE public.bug_note OWNER TO postgres;

--
-- Name: config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    key text NOT NULL,
    data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.config OWNER TO postgres;

--
-- Name: content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    content_type_id uuid NOT NULL,
    data jsonb,
    description text,
    body text NOT NULL,
    mime_type text DEFAULT 'text/markdown'::text NOT NULL,
    title text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_user_id uuid,
    key text
);


ALTER TABLE public.content OWNER TO postgres;

--
-- Name: content_content_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_content_part (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    content_id uuid NOT NULL,
    content_part_id uuid NOT NULL,
    index integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.content_content_part OWNER TO postgres;

--
-- Name: content_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_part (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    body text NOT NULL,
    title text,
    description text,
    mime_type text NOT NULL,
    parent_content_part_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    content_type_id uuid NOT NULL,
    key text,
    data jsonb
);


ALTER TABLE public.content_part OWNER TO postgres;

--
-- Name: content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_type (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    key text NOT NULL,
    schema jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    mime_type text DEFAULT 'text/markdown'::text NOT NULL
);


ALTER TABLE public.content_type OWNER TO postgres;


ALTER TABLE public.ethos_invitation OWNER TO postgres;

--
-- Name: extensions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extensions (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.extensions OWNER TO postgres;
--



-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    key text NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    external_id text NOT NULL,
    jwt_secret text NOT NULL,
    postgres_cdc_default text NOT NULL,
    max_concurrent_users integer NOT NULL,
    max_events_per_second integer NOT NULL,
    max_bytes_per_second integer NOT NULL,
    max_channels_per_client integer NOT NULL,
    max_joins_per_second integer NOT NULL,
    suspend boolean NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.tenants OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    identifier text NOT NULL,
    email text NOT NULL,
    kratos_id text,
    display_name text,
    data jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    role_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- Name: TABLE user_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.user_role IS 'User Roles';




--
-- Data for Name: asset_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asset_type (id, name, key, schema, created_at, mime_types) VALUES ('5ced0ca7-cac2-4f54-bc97-8f260aab4340', 'Photo', 'photo', '{}', '2023-01-18 15:03:06.298711+00', '{image/jpeg,image/jpg,image/png}');


--
-- Data for Name: bug; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bug_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bug_note; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.config (id, key, data, created_at) VALUES ('eb4ffd29-7a96-4c3d-b44e-3b21f0f2258e', 'local_functions', '{"baseUrl": "http://functions:9999"}', '2023-11-21 15:30:21.121944+00');


--
-- Data for Name: content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.content_type (id, name, key, schema, created_at, mime_type) VALUES ('04ca0244-f140-4963-a428-5a742bfd7170', 'Bug Report', 'bug_report', '{}', '2024-01-15 21:11:16.519518+00', 'text/markdown');
INSERT INTO public.content_type (id, name, key, schema, created_at, mime_type) VALUES ('15a93911-4297-4237-9aed-cc4002f4c33f', 'Bug Report Template', 'bug_report_template', '{}', '2024-01-15 21:12:02.524689+00', 'text/markdown');
INSERT INTO public.content_type (id, name, key, schema, created_at, mime_type) VALUES ('2f8712ce-a0f5-4b93-94a2-fbad3d01ad4e', 'Bug Notes', 'bug_notes', NULL, '2024-01-15 22:36:49.599661+00', 'text/markdown');


--
-- Data for Name: ethos_invitation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: extensions; Type: TABLE DATA; Schema: public; Owner: postgres
--


-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id, created_at, name, key) VALUES ('da5844fd-f969-4ac4-8d3b-ba0655175519', '2023-01-18 15:01:04.585217+00', 'Administrator', 'admin');
INSERT INTO public.role (id, created_at, name, key) VALUES ('829dde7c-0843-441d-9234-559b70ea19b2', '2023-01-18 15:01:24.863214+00', 'Super Administrator', 'super-admin');
INSERT INTO public.role (id, created_at, name, key) VALUES ('fe3c5ce2-128d-4ef0-a5ee-e35ad75fc4d5', '2023-01-18 15:01:35.824771+00', 'User', 'user');


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tenants (id, name, external_id, jwt_secret, postgres_cdc_default, max_concurrent_users, max_events_per_second, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, inserted_at, updated_at) VALUES ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Realtime Client', 'realtime', 'Tm9ESVpjbDF1a25BdHVjTmRqaUdHTEljRTZQTEp5QVNXUFNxYkpUWkZLYjFucHhzdFBZK3ZPZldTUExkNWExNklhNFh0UmpMS05QVDB1T0JpdUl5cXc9PQ==', 'false', 200, 100, 100000, 100, 100, false, '2024-01-13 18:08:25.100203+00', '2024-01-13 18:08:25.100203+00');



--
-- Name: asset asset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (id);


--
-- Name: asset_type asset_type_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_type
    ADD CONSTRAINT asset_type_key_key UNIQUE (key);


--
-- Name: asset_type asset_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_type
    ADD CONSTRAINT asset_type_name_key UNIQUE (name);


--
-- Name: asset_type asset_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_type
    ADD CONSTRAINT asset_type_pkey PRIMARY KEY (id);


--
-- Name: bug_assignment bug_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_assignment
    ADD CONSTRAINT bug_assignment_pkey PRIMARY KEY (id);


--
-- Name: bug_note bug_note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_note
    ADD CONSTRAINT bug_note_pkey PRIMARY KEY (id);


--
-- Name: bug bug_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_pkey PRIMARY KEY (id);


--
-- Name: config config_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_key_key UNIQUE (key);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);


--
-- Name: content_content_part content_content_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_content_part
    ADD CONSTRAINT content_content_part_pkey PRIMARY KEY (id);


--
-- Name: content content_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_key_key UNIQUE (key);


--
-- Name: content_part content_part_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_part
    ADD CONSTRAINT content_part_key_key UNIQUE (key);


--
-- Name: content_part content_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_part
    ADD CONSTRAINT content_part_pkey PRIMARY KEY (id);


--
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- Name: content_type content_type_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_type
    ADD CONSTRAINT content_type_key_key UNIQUE (key);


--
-- Name: content_type content_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_type
    ADD CONSTRAINT content_type_name_key UNIQUE (name);


--
-- Name: content_type content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_type
    ADD CONSTRAINT content_type_pkey PRIMARY KEY (id);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);




--
-- Name: role role_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_key_key UNIQUE (key);


--
-- Name: role role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_identifier_key UNIQUE (identifier);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


-- Name: external_id_unique_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX external_id_unique_index ON public.tenants USING btree (external_id);


--
-- Name: idx_content_content_part; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_content_content_part ON public.content_content_part USING btree (content_id, content_part_id);


--
-- Name: asset asset_asset_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_asset_type_id_fkey FOREIGN KEY (asset_type_id) REFERENCES public.asset_type(id);


--
-- Name: asset asset_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: asset asset_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public."user"(id);


--
-- Name: asset asset_updater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_updater_id_fkey FOREIGN KEY (updater_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: bug_assignment bug_assignment_assigner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_assignment
    ADD CONSTRAINT bug_assignment_assigner_id_fkey FOREIGN KEY (assigner_id) REFERENCES public."user"(id);


--
-- Name: bug_assignment bug_assignment_bug_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_assignment
    ADD CONSTRAINT bug_assignment_bug_id_fkey FOREIGN KEY (bug_id) REFERENCES public.bug(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bug_assignment bug_assignment_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_assignment
    ADD CONSTRAINT bug_assignment_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id);


--
-- Name: bug bug_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.content(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: bug_note bug_note_bug_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_note
    ADD CONSTRAINT bug_note_bug_id_fkey FOREIGN KEY (bug_id) REFERENCES public.bug(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bug_note bug_note_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_note
    ADD CONSTRAINT bug_note_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.content(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bug_note bug_note_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_note
    ADD CONSTRAINT bug_note_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bug_note bug_note_parent_note_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_note
    ADD CONSTRAINT bug_note_parent_note_id_fkey FOREIGN KEY (parent_note_id) REFERENCES public.bug_note(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bug_note bug_note_updater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug_note
    ADD CONSTRAINT bug_note_updater_id_fkey FOREIGN KEY (updater_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: bug bug_reporter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_reporter_id_fkey FOREIGN KEY (reporter_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: bug bug_updater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_updater_id_fkey FOREIGN KEY (updater_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: content_content_part content_content_part_content_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_content_part
    ADD CONSTRAINT content_content_part_content_id_fkey FOREIGN KEY (content_id) REFERENCES public.content(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: content_content_part content_content_part_content_part_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_content_part
    ADD CONSTRAINT content_content_part_content_part_id_fkey FOREIGN KEY (content_part_id) REFERENCES public.content_part(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: content content_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.content_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: content content_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: content_part content_part_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_part
    ADD CONSTRAINT content_part_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.content_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: content_part content_part_parent_content_part_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_part
    ADD CONSTRAINT content_part_parent_content_part_id_fkey FOREIGN KEY (parent_content_part_id) REFERENCES public.content_part(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES public.tenants(external_id);


--
-- Name: user_role user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_role user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user user_user_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_user_type_id_fkey FOREIGN KEY (user_type_id) REFERENCES public.user_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: asset Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.asset USING (true);


--
-- Name: asset_type Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.asset_type USING (true);


--
-- Name: config Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.config USING (true);


--
-- Name: content Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.content USING (true);


--
-- Name: content_content_part Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.content_content_part USING (true);


--
-- Name: content_part Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.content_part USING (true);


--
-- Name: content_type Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.content_type USING (true);


--
-- Name: role Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.role USING (true);


--
-- Name: user Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public."user" USING (true);


--
-- Name: user_role Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.user_role USING (true);


--
-- Name: user_type Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.user_type USING (true);


--
-- Name: asset; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.asset ENABLE ROW LEVEL SECURITY;

--
-- Name: asset_type; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.asset_type ENABLE ROW LEVEL SECURITY;

--
-- Name: bug; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.bug ENABLE ROW LEVEL SECURITY;

--
-- Name: bug_assignment; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.bug_assignment ENABLE ROW LEVEL SECURITY;

--
-- Name: bug_note; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.bug_note ENABLE ROW LEVEL SECURITY;

--
-- Name: config; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.config ENABLE ROW LEVEL SECURITY;

--
-- Name: content; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.content ENABLE ROW LEVEL SECURITY;

--
-- Name: content_content_part; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.content_content_part ENABLE ROW LEVEL SECURITY;

--
-- Name: content_part; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.content_part ENABLE ROW LEVEL SECURITY;

--
-- Name: content_type; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.content_type ENABLE ROW LEVEL SECURITY;


ALTER TABLE public.role ENABLE ROW LEVEL SECURITY;

-- Name: user; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ENABLE ROW LEVEL SECURITY;

--
-- Name: user_role; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_role ENABLE ROW LEVEL SECURITY;

--
--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: FUNCTION authenticate_memphis(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.authenticate_memphis() TO anon;
GRANT ALL ON FUNCTION public.authenticate_memphis() TO authenticated;
GRANT ALL ON FUNCTION public.authenticate_memphis() TO service_role;


--
-- Name: FUNCTION http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]) TO postgres;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]) TO anon;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]) TO authenticated;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data jsonb, headers extensions.http_header[]) TO service_role;


--
-- Name: FUNCTION http_post_plus(uri character varying, data text, headers extensions.http_header[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data text, headers extensions.http_header[]) TO postgres;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data text, headers extensions.http_header[]) TO anon;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data text, headers extensions.http_header[]) TO authenticated;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data text, headers extensions.http_header[]) TO service_role;


--
-- Name: FUNCTION http_post_plus(uri character varying, data character varying, headers extensions.http_header[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data character varying, headers extensions.http_header[]) TO postgres;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data character varying, headers extensions.http_header[]) TO anon;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data character varying, headers extensions.http_header[]) TO authenticated;
GRANT ALL ON FUNCTION public.http_post_plus(uri character varying, data character varying, headers extensions.http_header[]) TO service_role;


--
-- Name: FUNCTION pgrst_watch(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgrst_watch() TO anon;
GRANT ALL ON FUNCTION public.pgrst_watch() TO authenticated;
GRANT ALL ON FUNCTION public.pgrst_watch() TO service_role;



--
-- Name: TABLE asset; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.asset TO anon;
GRANT ALL ON TABLE public.asset TO authenticated;
GRANT ALL ON TABLE public.asset TO service_role;


--
-- Name: TABLE asset_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.asset_type TO anon;
GRANT ALL ON TABLE public.asset_type TO authenticated;
GRANT ALL ON TABLE public.asset_type TO service_role;


--
-- Name: TABLE bug; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bug TO anon;
GRANT ALL ON TABLE public.bug TO authenticated;
GRANT ALL ON TABLE public.bug TO service_role;


--
-- Name: TABLE bug_assignment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bug_assignment TO anon;
GRANT ALL ON TABLE public.bug_assignment TO authenticated;
GRANT ALL ON TABLE public.bug_assignment TO service_role;


--
-- Name: TABLE bug_note; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bug_note TO anon;
GRANT ALL ON TABLE public.bug_note TO authenticated;
GRANT ALL ON TABLE public.bug_note TO service_role;


--
-- Name: TABLE config; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.config TO anon;
GRANT ALL ON TABLE public.config TO authenticated;
GRANT ALL ON TABLE public.config TO service_role;


--
-- Name: TABLE content; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.content TO anon;
GRANT ALL ON TABLE public.content TO authenticated;
GRANT ALL ON TABLE public.content TO service_role;


--
-- Name: TABLE content_content_part; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.content_content_part TO anon;
GRANT ALL ON TABLE public.content_content_part TO authenticated;
GRANT ALL ON TABLE public.content_content_part TO service_role;


--
-- Name: TABLE content_part; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.content_part TO anon;
GRANT ALL ON TABLE public.content_part TO authenticated;
GRANT ALL ON TABLE public.content_part TO service_role;


--
-- Name: TABLE content_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.content_type TO anon;
GRANT ALL ON TABLE public.content_type TO authenticated;
GRANT ALL ON TABLE public.content_type TO service_role;



--
-- Name: TABLE extensions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.extensions TO anon;
GRANT ALL ON TABLE public.extensions TO authenticated;
GRANT ALL ON TABLE public.extensions TO service_role;


--
GRANT ALL ON TABLE public.role TO anon;
GRANT ALL ON TABLE public.role TO authenticated;
GRANT ALL ON TABLE public.role TO service_role;


--
-- Name: TABLE specialty; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.specialty TO anon;
GRANT ALL ON TABLE public.specialty TO authenticated;
GRANT ALL ON TABLE public.specialty TO service_role;


--
-- Name: TABLE tenants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tenants TO anon;
GRANT ALL ON TABLE public.tenants TO authenticated;
GRANT ALL ON TABLE public.tenants TO service_role;


--
-- Name: TABLE "user"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."user" TO anon;
GRANT ALL ON TABLE public."user" TO authenticated;
GRANT ALL ON TABLE public."user" TO service_role;


--
-- Name: TABLE user_role; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_role TO anon;
GRANT ALL ON TABLE public.user_role TO authenticated;
GRANT ALL ON TABLE public.user_role TO service_role;



--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- PostgreSQL database dump complete
--

