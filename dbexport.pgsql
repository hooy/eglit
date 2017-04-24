--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO bitnami;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO bitnami;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO bitnami;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO bitnami;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO bitnami;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO bitnami;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO bitnami;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO bitnami;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO bitnami;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO bitnami;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO bitnami;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO bitnami;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO bitnami;

--
-- Name: banking_account; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE banking_account (
    id integer NOT NULL,
    balance_currency character varying(3) NOT NULL,
    number character varying(8) NOT NULL,
    user_id integer NOT NULL,
    balance numeric(10,2) NOT NULL
);


ALTER TABLE banking_account OWNER TO bitnami;

--
-- Name: banking_account_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE banking_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banking_account_id_seq OWNER TO bitnami;

--
-- Name: banking_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE banking_account_id_seq OWNED BY banking_account.id;


--
-- Name: banking_profile; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE banking_profile (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE banking_profile OWNER TO bitnami;

--
-- Name: banking_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE banking_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banking_profile_id_seq OWNER TO bitnami;

--
-- Name: banking_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE banking_profile_id_seq OWNED BY banking_profile.id;


--
-- Name: banking_transaction; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE banking_transaction (
    id uuid NOT NULL,
    amount_currency character varying(3) NOT NULL,
    amount numeric(10,2) NOT NULL,
    destination_id integer,
    source_id integer,
    date timestamp with time zone NOT NULL
);


ALTER TABLE banking_transaction OWNER TO bitnami;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO bitnami;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO bitnami;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO bitnami;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO bitnami;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO bitnami;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO bitnami;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO bitnami;

--
-- Name: djmoney_rates_rate; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE djmoney_rates_rate (
    id integer NOT NULL,
    currency character varying(3) NOT NULL,
    value numeric(20,6) NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE djmoney_rates_rate OWNER TO bitnami;

--
-- Name: djmoney_rates_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE djmoney_rates_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djmoney_rates_rate_id_seq OWNER TO bitnami;

--
-- Name: djmoney_rates_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE djmoney_rates_rate_id_seq OWNED BY djmoney_rates_rate.id;


--
-- Name: djmoney_rates_ratesource; Type: TABLE; Schema: public; Owner: bitnami
--

CREATE TABLE djmoney_rates_ratesource (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    last_update timestamp with time zone NOT NULL,
    base_currency character varying(3) NOT NULL
);


ALTER TABLE djmoney_rates_ratesource OWNER TO bitnami;

--
-- Name: djmoney_rates_ratesource_id_seq; Type: SEQUENCE; Schema: public; Owner: bitnami
--

CREATE SEQUENCE djmoney_rates_ratesource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE djmoney_rates_ratesource_id_seq OWNER TO bitnami;

--
-- Name: djmoney_rates_ratesource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitnami
--

ALTER SEQUENCE djmoney_rates_ratesource_id_seq OWNED BY djmoney_rates_ratesource.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: banking_account id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_account ALTER COLUMN id SET DEFAULT nextval('banking_account_id_seq'::regclass);


--
-- Name: banking_profile id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_profile ALTER COLUMN id SET DEFAULT nextval('banking_profile_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: djmoney_rates_rate id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY djmoney_rates_rate ALTER COLUMN id SET DEFAULT nextval('djmoney_rates_rate_id_seq'::regclass);


--
-- Name: djmoney_rates_ratesource id; Type: DEFAULT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY djmoney_rates_ratesource ALTER COLUMN id SET DEFAULT nextval('djmoney_rates_ratesource_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add profile	7	add_profile
20	Can change profile	7	change_profile
21	Can delete profile	7	delete_profile
22	Can add account	8	add_account
23	Can change account	8	change_account
24	Can delete account	8	delete_account
25	Can add transaction	9	add_transaction
26	Can change transaction	9	change_transaction
27	Can delete transaction	9	delete_transaction
28	Can add rate source	10	add_ratesource
29	Can change rate source	10	change_ratesource
30	Can delete rate source	10	delete_ratesource
31	Can add rate	11	add_rate
32	Can change rate	11	change_rate
33	Can delete rate	11	delete_rate
34	Can add Token	12	add_token
35	Can change Token	12	change_token
36	Can delete Token	12	delete_token
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$30000$wCeM6KAWTHJ0$Cvp9zMv6K718S1IvnmGrFLCuya+8ToIlYauwBv1iAmQ=	\N	f	vasya	Vasya	Pupkin		f	t	2017-04-19 13:03:19+00
3	pbkdf2_sha256$30000$CW9Jkaje6MjL$XH7VZDxktPFhQ4vMOyEGczkToXBCp8iUr40zi2tUhOQ=	\N	f	test_user				f	t	2017-04-20 15:27:00.517015+00
4	pbkdf2_sha256$30000$z4Sjj8f0ZCFp$PRnZQbJGbCbT4aHbKwdOWxfC1OHRXWt2xwVKw+rqwA8=	\N	t	admin				t	t	2017-04-24 12:27:16+00
1	pbkdf2_sha256$30000$X7ipiD4Fet5Z$Ef2CD3TgoXwzm329E94CzWpt6lh733B9DYak2p15ZKE=	2017-04-24 13:01:51.746522+00	t	maxwell	Sergey	Gorbunov	info@maxwell.lv	t	t	2017-04-19 12:55:45+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY authtoken_token (key, created, user_id) FROM stdin;
ef3497c1b655c2ff090e4cdf0a355b1c689b3182	2017-04-20 15:25:32.537501+00	1
da3798ead3c8d1dd455deea43859d8cdfc7d0150	2017-04-20 15:27:00.548363+00	3
c9ccd59b545f93e99dbe4c5b9c0bc0826c50a180	2017-04-24 12:27:16.811876+00	4
\.


--
-- Data for Name: banking_account; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY banking_account (id, balance_currency, number, user_id, balance) FROM stdin;
2	EUR	58769468	2	100.00
3	EUR	46533809	2	200.00
4	EUR	25188892	1	522.00
5	GBP	62911229	1	358.34
21	EUR	95411210	1	0.00
37	USD	98531044	1	0.00
38	USD	67013570	1	0.00
39	USD	51585424	1	0.00
40	GBP	58980950	1	0.00
41	GBP	99367641	1	0.00
43	EUR	82551498	3	0.00
44	EUR	51694417	3	0.00
42	GBP	24232221	3	33.38
1	EUR	79539072	1	471.77
\.


--
-- Name: banking_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('banking_account_id_seq', 44, true);


--
-- Data for Name: banking_profile; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY banking_profile (id, user_id) FROM stdin;
2	2
3	3
4	4
1	1
\.


--
-- Name: banking_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('banking_profile_id_seq', 4, true);


--
-- Data for Name: banking_transaction; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY banking_transaction (id, amount_currency, amount, destination_id, source_id, date) FROM stdin;
342cfda4-4861-4e13-8a38-5775f804a619	EUR	10.00	5	1	2017-04-20 10:48:14.325859+00
197ceb93-19fd-4c5c-ad64-a5cbbdb705c5	CHF	50.00	1	\N	2017-04-20 11:58:16.542234+00
2d6b0188-cf58-415d-9a24-ea0136af222e	EUR	5.00	\N	1	2017-04-20 11:59:45.38263+00
22f01e61-3ff7-4001-b780-73bdfd5291a4	EUR	20.00	42	1	2017-04-24 11:56:30.661812+00
b5d8ff6d-b225-4a09-a88b-dc0cb80be8c8	EUR	20.00	42	1	2017-04-24 11:58:56.319817+00
813c4fd3-7c3b-40b6-9d58-e14aba589788	EUR	20.00	\N	1	2017-04-24 12:01:15.199707+00
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-04-19 13:03:04.450049+00	1	maxwell	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	3	1
2	2017-04-19 13:03:19.914875+00	2	vasya	1	[{"added": {}}]	3	1
3	2017-04-19 13:03:30.195999+00	2	vasya	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	3	1
4	2017-04-19 13:15:03.127626+00	1	Account object	1	[{"added": {}}]	8	1
5	2017-04-19 13:20:51.709085+00	1e84c121-daae-4bc4-8a1e-421a8285603e	1e84c121-daae-4bc4-8a1e-421a8285603e (transfer)	1	[{"added": {}}]	9	1
6	2017-04-19 15:10:22.434556+00	2	58769468	1	[{"added": {}}]	8	1
7	2017-04-19 15:11:14.395311+00	3	46533809	1	[{"added": {}}]	8	1
8	2017-04-19 15:18:53.989947+00	4	25188892	1	[{"added": {}}]	8	1
9	2017-04-19 15:19:04.564309+00	5	62911229	1	[{"added": {}}]	8	1
10	2017-04-19 16:06:04.482037+00	1	79539072	2	[{"changed": {"fields": ["balance"]}}]	8	1
11	2017-04-19 16:06:11.875334+00	041bd1a9-f602-479b-bdb6-f00d9cdbca58	041bd1a9-f602-479b-bdb6-f00d9cdbca58 (transfer)	1	[{"added": {}}]	9	1
12	2017-04-20 10:37:29.021587+00	426c5a15-cf8c-49a3-90c5-50d182faf4ba	426c5a15-cf8c-49a3-90c5-50d182faf4ba (transfer)	1	[{"added": {}}]	9	1
13	2017-04-20 10:38:00.922832+00	84c379f8-6128-49ff-b0c2-d17583537488	84c379f8-6128-49ff-b0c2-d17583537488 (transfer)	1	[{"added": {}}]	9	1
14	2017-04-20 10:42:58.482153+00	efa50c3f-e69c-4065-9bb4-620f778375d6	efa50c3f-e69c-4065-9bb4-620f778375d6 (transfer)	1	[{"added": {}}]	9	1
15	2017-04-20 10:48:05.477888+00	efa50c3f-e69c-4065-9bb4-620f778375d6	efa50c3f-e69c-4065-9bb4-620f778375d6 (transfer)	3		9	1
16	2017-04-20 10:48:05.480636+00	1e84c121-daae-4bc4-8a1e-421a8285603e	1e84c121-daae-4bc4-8a1e-421a8285603e (transfer)	3		9	1
17	2017-04-20 10:48:14.326732+00	342cfda4-4861-4e13-8a38-5775f804a619	342cfda4-4861-4e13-8a38-5775f804a619 (transfer)	1	[{"added": {}}]	9	1
18	2017-04-20 11:58:16.544234+00	197ceb93-19fd-4c5c-ad64-a5cbbdb705c5	197ceb93-19fd-4c5c-ad64-a5cbbdb705c5 (deposit)	1	[{"added": {}}]	9	1
19	2017-04-20 11:59:45.383403+00	2d6b0188-cf58-415d-9a24-ea0136af222e	2d6b0188-cf58-415d-9a24-ea0136af222e (withdraw)	1	[{"added": {}}]	9	1
20	2017-04-20 15:25:32.538183+00	ef3497c1b655c2ff090e4cdf0a355b1c689b3182	ef3497c1b655c2ff090e4cdf0a355b1c689b3182	1	[{"added": {}}]	12	1
21	2017-04-20 15:27:00.549004+00	3	test_user	1	[{"added": {}}]	3	1
22	2017-04-24 10:06:20.480571+00	36	39822084 (USD)	3		8	1
23	2017-04-24 10:06:20.483134+00	35	89493803 (USD)	3		8	1
24	2017-04-24 10:06:20.484692+00	34	71242226 (USD)	3		8	1
25	2017-04-24 10:06:20.486229+00	33	17804092 (USD)	3		8	1
26	2017-04-24 10:06:20.487801+00	32	19940787 (USD)	3		8	1
27	2017-04-24 10:06:20.489419+00	31	68067538 (USD)	3		8	1
28	2017-04-24 10:06:20.491036+00	30	65756939 (EUR)	3		8	1
29	2017-04-24 10:06:20.492483+00	29	58760490 (EUR)	3		8	1
30	2017-04-24 10:06:20.49388+00	28	53542310 (EUR)	3		8	1
31	2017-04-24 10:06:20.495315+00	27	30606997 (EUR)	3		8	1
32	2017-04-24 10:06:20.496712+00	26	80903848 (EUR)	3		8	1
33	2017-04-24 10:06:20.498148+00	25	42878869 (EUR)	3		8	1
34	2017-04-24 10:06:20.49962+00	24	29018930 (EUR)	3		8	1
35	2017-04-24 10:06:20.500986+00	23	90261990 (EUR)	3		8	1
36	2017-04-24 10:06:20.502468+00	22	83924138 (EUR)	3		8	1
37	2017-04-24 12:27:16.812556+00	4	admin	1	[{"added": {}}]	3	1
38	2017-04-24 12:27:21.854261+00	4	admin	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	3	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 38, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	banking	profile
8	banking	account
9	banking	transaction
10	djmoney_rates	ratesource
11	djmoney_rates	rate
12	authtoken	token
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-03-03 10:40:33.562607+00
2	auth	0001_initial	2017-03-03 10:40:33.703349+00
3	admin	0001_initial	2017-03-03 10:40:33.750912+00
4	admin	0002_logentry_remove_auto_add	2017-03-03 10:40:33.779851+00
5	contenttypes	0002_remove_content_type_name	2017-03-03 10:40:33.858828+00
6	auth	0002_alter_permission_name_max_length	2017-03-03 10:40:33.887012+00
7	auth	0003_alter_user_email_max_length	2017-03-03 10:40:33.913238+00
8	auth	0004_alter_user_username_opts	2017-03-03 10:40:33.93873+00
9	auth	0005_alter_user_last_login_null	2017-03-03 10:40:33.965193+00
10	auth	0006_require_contenttypes_0002	2017-03-03 10:40:33.967524+00
11	auth	0007_alter_validators_add_error_messages	2017-03-03 10:40:33.992765+00
12	auth	0008_alter_user_username_max_length	2017-03-03 10:40:34.024802+00
13	sessions	0001_initial	2017-03-03 10:40:34.051108+00
14	banking	0001_initial	2017-04-19 12:41:22.708676+00
15	banking	0002_auto_20170419_1242	2017-04-19 12:42:24.139181+00
16	banking	0003_auto_20170419_1320	2017-04-19 13:20:49.280044+00
17	banking	0004_auto_20170419_1331	2017-04-19 13:31:59.870081+00
18	banking	0005_auto_20170419_1438	2017-04-19 14:38:11.39702+00
19	banking	0006_auto_20170419_1510	2017-04-19 15:11:04.552682+00
20	banking	0007_transaction_date	2017-04-19 16:07:19.155327+00
21	djmoney_rates	0001_initial	2017-04-20 10:28:07.489063+00
22	banking	0008_auto_20170420_1157	2017-04-20 11:57:10.612053+00
23	authtoken	0001_initial	2017-04-20 15:14:16.406611+00
24	authtoken	0002_auto_20160226_1747	2017-04-20 15:14:16.511593+00
25	banking	0009_auto_20170420_1514	2017-04-20 15:14:16.592578+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('django_migrations_id_seq', 25, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
qc05w9fvf4m4vv06iu072az3363til41	YmI3M2JkOGM2ZjI0MTg0MjA2N2FlM2FkOGQ5NzI5YTNlZTAzYjUzZDp7fQ==	2017-05-03 14:56:22.581291+00
e4d2vhl9ma3wlruty1sarpou7yntdk6d	YmI3M2JkOGM2ZjI0MTg0MjA2N2FlM2FkOGQ5NzI5YTNlZTAzYjUzZDp7fQ==	2017-05-03 15:02:36.027329+00
7pgvx0wx09atuvxd0fya8aielldrk50g	ODA5N2YwN2IyNTgyNDJjMDg3ZjRjN2Q3MmE2NWY1ZTUzZWIxOTE0Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjE5YWE3OWZmZTQyNDg3Y2ZhMWQ4ZWZhNGFmMmExNTIyOGJmNzYyYzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-05-08 13:01:51.751361+00
\.


--
-- Data for Name: djmoney_rates_rate; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY djmoney_rates_rate (id, currency, value, source_id) FROM stdin;
1	USD	1.072500	1
2	IDR	14293.000000	1
3	BGN	1.955800	1
4	ILS	3.931300	1
5	GBP	0.834300	1
6	DKK	7.438700	1
7	CAD	1.441500	1
8	JPY	116.910000	1
9	HUF	313.050000	1
10	RON	4.534100	1
11	MYR	4.719000	1
12	SEK	9.619500	1
13	SGD	1.498700	1
14	HKD	8.339700	1
15	AUD	1.425500	1
16	CHF	1.069000	1
17	KRW	1222.400000	1
18	CNY	7.385200	1
19	TRY	3.929200	1
20	HRK	7.446800	1
21	NZD	1.528300	1
22	THB	36.883000	1
32	EUR	1.000000	1
23	NOK	9.152800	1
24	RUB	60.266000	1
25	INR	69.243000	1
26	MXN	20.019000	1
27	CZK	26.794000	1
28	BRL	3.336800	1
29	PLN	4.235800	1
30	PHP	53.339000	1
31	ZAR	14.261000	1
\.


--
-- Name: djmoney_rates_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('djmoney_rates_rate_id_seq', 32, true);


--
-- Data for Name: djmoney_rates_ratesource; Type: TABLE DATA; Schema: public; Owner: bitnami
--

COPY djmoney_rates_ratesource (id, name, last_update, base_currency) FROM stdin;
1	http://api.fixer.io/latest	2017-04-20 10:37:22.073823+00	EUR
\.


--
-- Name: djmoney_rates_ratesource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitnami
--

SELECT pg_catalog.setval('djmoney_rates_ratesource_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: banking_account banking_account_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_account
    ADD CONSTRAINT banking_account_pkey PRIMARY KEY (id);


--
-- Name: banking_profile banking_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_profile
    ADD CONSTRAINT banking_profile_pkey PRIMARY KEY (id);


--
-- Name: banking_profile banking_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_profile
    ADD CONSTRAINT banking_profile_user_id_key UNIQUE (user_id);


--
-- Name: banking_transaction banking_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_transaction
    ADD CONSTRAINT banking_transaction_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: djmoney_rates_rate djmoney_rates_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY djmoney_rates_rate
    ADD CONSTRAINT djmoney_rates_rate_pkey PRIMARY KEY (id);


--
-- Name: djmoney_rates_rate djmoney_rates_rate_source_id_ed7087c4_uniq; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY djmoney_rates_rate
    ADD CONSTRAINT djmoney_rates_rate_source_id_ed7087c4_uniq UNIQUE (source_id, currency);


--
-- Name: djmoney_rates_ratesource djmoney_rates_ratesource_name_key; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY djmoney_rates_ratesource
    ADD CONSTRAINT djmoney_rates_ratesource_name_key UNIQUE (name);


--
-- Name: djmoney_rates_ratesource djmoney_rates_ratesource_pkey; Type: CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY djmoney_rates_ratesource
    ADD CONSTRAINT djmoney_rates_ratesource_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: banking_transaction_0afd9202; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX banking_transaction_0afd9202 ON banking_transaction USING btree (source_id);


--
-- Name: banking_transaction_279358a3; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX banking_transaction_279358a3 ON banking_transaction USING btree (destination_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djmoney_rates_rate_0afd9202; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX djmoney_rates_rate_0afd9202 ON djmoney_rates_rate USING btree (source_id);


--
-- Name: djmoney_rates_ratesource_name_b64a0817_like; Type: INDEX; Schema: public; Owner: bitnami
--

CREATE INDEX djmoney_rates_ratesource_name_b64a0817_like ON djmoney_rates_ratesource USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: banking_account banking_account_user_id_84511647_fk_banking_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_account
    ADD CONSTRAINT banking_account_user_id_84511647_fk_banking_profile_id FOREIGN KEY (user_id) REFERENCES banking_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: banking_profile banking_profile_user_id_06676ce8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_profile
    ADD CONSTRAINT banking_profile_user_id_06676ce8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: banking_transaction banking_transacti_destination_id_11489495_fk_banking_account_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_transaction
    ADD CONSTRAINT banking_transacti_destination_id_11489495_fk_banking_account_id FOREIGN KEY (destination_id) REFERENCES banking_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: banking_transaction banking_transaction_source_id_c841a0a6_fk_banking_account_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY banking_transaction
    ADD CONSTRAINT banking_transaction_source_id_c841a0a6_fk_banking_account_id FOREIGN KEY (source_id) REFERENCES banking_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djmoney_rates_rate djmoney_rates_source_id_3afdea41_fk_djmoney_rates_ratesource_id; Type: FK CONSTRAINT; Schema: public; Owner: bitnami
--

ALTER TABLE ONLY djmoney_rates_rate
    ADD CONSTRAINT djmoney_rates_source_id_3afdea41_fk_djmoney_rates_ratesource_id FOREIGN KEY (source_id) REFERENCES djmoney_rates_ratesource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

