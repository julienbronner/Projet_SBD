--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: agence_billet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agence_billet (
    id integer NOT NULL,
    numero_billet integer NOT NULL,
    numero_train_id integer NOT NULL,
    agence character varying(200) NOT NULL,
    prix_billet numeric(6,2) NOT NULL,
    depart_ville character varying(200) NOT NULL,
    depart_date timestamp with time zone NOT NULL,
    arrivee_ville character varying(200) NOT NULL,
    arrivee_date timestamp with time zone NOT NULL
);


ALTER TABLE public.agence_billet OWNER TO postgres;

--
-- Name: agence_billet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agence_billet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agence_billet_id_seq OWNER TO postgres;

--
-- Name: agence_billet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agence_billet_id_seq OWNED BY public.agence_billet.id;


--
-- Name: agence_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agence_client (
    id integer NOT NULL,
    numero_client integer NOT NULL,
    nom character varying(200) NOT NULL,
    prenom character varying(200) NOT NULL,
    majorite boolean NOT NULL,
    numero_reduction_id integer NOT NULL,
    email character varying(200) NOT NULL
);


ALTER TABLE public.agence_client OWNER TO postgres;

--
-- Name: agence_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agence_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agence_client_id_seq OWNER TO postgres;

--
-- Name: agence_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agence_client_id_seq OWNED BY public.agence_client.id;


--
-- Name: agence_place; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agence_place (
    id integer NOT NULL,
    numero_de_serie_voiture_id integer NOT NULL,
    numero_place integer NOT NULL,
    "position" character varying(200) NOT NULL
);


ALTER TABLE public.agence_place OWNER TO postgres;

--
-- Name: agence_place_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agence_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agence_place_id_seq OWNER TO postgres;

--
-- Name: agence_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agence_place_id_seq OWNED BY public.agence_place.id;


--
-- Name: agence_reduction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agence_reduction (
    id integer NOT NULL,
    numero_reduction integer NOT NULL,
    type_reduction character varying(200) NOT NULL,
    pourcentage integer NOT NULL
);


ALTER TABLE public.agence_reduction OWNER TO postgres;

--
-- Name: agence_reduction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agence_reduction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agence_reduction_id_seq OWNER TO postgres;

--
-- Name: agence_reduction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agence_reduction_id_seq OWNED BY public.agence_reduction.id;


--
-- Name: agence_reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agence_reservation (
    id integer NOT NULL,
    numero_reservation integer NOT NULL,
    numero_billet_id integer NOT NULL,
    numero_client_id integer NOT NULL,
    numero_place_id integer NOT NULL,
    numero_voiture integer NOT NULL,
    confirmation boolean NOT NULL
);


ALTER TABLE public.agence_reservation OWNER TO postgres;

--
-- Name: agence_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agence_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agence_reservation_id_seq OWNER TO postgres;

--
-- Name: agence_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agence_reservation_id_seq OWNED BY public.agence_reservation.id;


--
-- Name: agence_train; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agence_train (
    id integer NOT NULL,
    numero_train integer NOT NULL,
    depart_ville character varying(200) NOT NULL,
    arrivee_ville character varying(200) NOT NULL
);


ALTER TABLE public.agence_train OWNER TO postgres;

--
-- Name: agence_train_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agence_train_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agence_train_id_seq OWNER TO postgres;

--
-- Name: agence_train_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agence_train_id_seq OWNED BY public.agence_train.id;


--
-- Name: agence_voiture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agence_voiture (
    id integer NOT NULL,
    numero_de_serie_voiture integer NOT NULL,
    numero_train_id integer NOT NULL,
    nombre_place_dispo integer NOT NULL
);


ALTER TABLE public.agence_voiture OWNER TO postgres;

--
-- Name: agence_voiture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agence_voiture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agence_voiture_id_seq OWNER TO postgres;

--
-- Name: agence_voiture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agence_voiture_id_seq OWNED BY public.agence_voiture.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: agence_billet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_billet ALTER COLUMN id SET DEFAULT nextval('public.agence_billet_id_seq'::regclass);


--
-- Name: agence_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_client ALTER COLUMN id SET DEFAULT nextval('public.agence_client_id_seq'::regclass);


--
-- Name: agence_place id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_place ALTER COLUMN id SET DEFAULT nextval('public.agence_place_id_seq'::regclass);


--
-- Name: agence_reduction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_reduction ALTER COLUMN id SET DEFAULT nextval('public.agence_reduction_id_seq'::regclass);


--
-- Name: agence_reservation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_reservation ALTER COLUMN id SET DEFAULT nextval('public.agence_reservation_id_seq'::regclass);


--
-- Name: agence_train id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_train ALTER COLUMN id SET DEFAULT nextval('public.agence_train_id_seq'::regclass);


--
-- Name: agence_voiture id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_voiture ALTER COLUMN id SET DEFAULT nextval('public.agence_voiture_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: agence_billet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agence_billet (id, numero_billet, numero_train_id, agence, prix_billet, depart_ville, depart_date, arrivee_ville, arrivee_date) FROM stdin;
1	1	1	P├®taouchnok	30.00	Lille	2020-12-04 15:54:00+00	Paris	2020-12-04 16:54:00+00
2	2	1	P├®taouchnok	50.00	Lille	2020-12-04 18:25:58+00	Lyon	2020-12-04 23:26:08+00
3	3	2	P├®taouchnok	40.00	Lille	2020-12-11 08:50:00+00	Paris	2020-12-11 10:00:00+00
\.


--
-- Data for Name: agence_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agence_client (id, numero_client, nom, prenom, majorite, numero_reduction_id, email) FROM stdin;
1	1	Bourdet	L├®o	t	2	julbronner@free.fr
2	2	Bronner	Julien	t	1	julbronner@free.fr
\.


--
-- Data for Name: agence_place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agence_place (id, numero_de_serie_voiture_id, numero_place, "position") FROM stdin;
1	1	1	Fenetre
2	1	2	Couloir
\.


--
-- Data for Name: agence_reduction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agence_reduction (id, numero_reduction, type_reduction, pourcentage) FROM stdin;
1	1	Jeune	30
2	2	Aucune	0
\.


--
-- Data for Name: agence_reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agence_reservation (id, numero_reservation, numero_billet_id, numero_client_id, numero_place_id, numero_voiture, confirmation) FROM stdin;
\.


--
-- Data for Name: agence_train; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agence_train (id, numero_train, depart_ville, arrivee_ville) FROM stdin;
1	1	Lille	Marseille
2	2	Lille	Lyon
3	3	Paris	Bordeaux
\.


--
-- Data for Name: agence_voiture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agence_voiture (id, numero_de_serie_voiture, numero_train_id, nombre_place_dispo) FROM stdin;
1	1	1	50
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add billet	7	add_billet
26	Can change billet	7	change_billet
27	Can delete billet	7	delete_billet
28	Can view billet	7	view_billet
29	Can add client	8	add_client
30	Can change client	8	change_client
31	Can delete client	8	delete_client
32	Can view client	8	view_client
33	Can add place	9	add_place
34	Can change place	9	change_place
35	Can delete place	9	delete_place
36	Can view place	9	view_place
37	Can add reduction	10	add_reduction
38	Can change reduction	10	change_reduction
39	Can delete reduction	10	delete_reduction
40	Can view reduction	10	view_reduction
41	Can add reservation	11	add_reservation
42	Can change reservation	11	change_reservation
43	Can delete reservation	11	delete_reservation
44	Can view reservation	11	view_reservation
45	Can add train	12	add_train
46	Can change train	12	change_train
47	Can delete train	12	delete_train
48	Can view train	12	view_train
49	Can add voiture	13	add_voiture
50	Can change voiture	13	change_voiture
51	Can delete voiture	13	delete_voiture
52	Can view voiture	13	view_voiture
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$Vtn2IboK1VJO$t01SpOKHUJhmPbv67/JqrxfltM65eDicJxoAmJmaRME=	2020-12-04 15:47:44.868612+00	t	root				t	t	2020-12-04 15:47:40.349715+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-12-04 15:49:45.002574+00	1	Jeune	1	[{"added": {}}]	10	1
2	2020-12-04 15:50:27.492731+00	1	BourdetL├®o	1	[{"added": {}}]	8	1
3	2020-12-04 15:51:57.493524+00	2	Aucune	1	[{"added": {}}]	10	1
4	2020-12-04 15:52:03.734207+00	1	Bourdet L├®o	2	[{"changed": {"fields": ["Numero reduction"]}}]	8	1
5	2020-12-04 15:52:13.816244+00	2	Bronner Julien	1	[{"added": {}}]	8	1
6	2020-12-04 15:52:59.335229+00	2	Bronner Julien	2	[{"changed": {"fields": ["Numero client"]}}]	8	1
7	2020-12-04 15:53:12.980811+00	1	1 Lille-Marseille	1	[{"added": {}}]	12	1
8	2020-12-04 15:53:22.575416+00	1	1	1	[{"added": {}}]	13	1
9	2020-12-04 15:53:43.569202+00	1	Voiture 1 Place 1	1	[{"added": {}}]	9	1
10	2020-12-04 15:53:52.241202+00	2	Voiture 1 Place 2	1	[{"added": {}}]	9	1
11	2020-12-04 15:54:48.565473+00	1	1	1	[{"added": {}}]	7	1
12	2020-12-04 15:55:11.544095+00	1	1	1	[{"added": {}}]	11	1
13	2020-12-04 17:05:50.144068+00	2	2 Lille-Lyon	1	[{"added": {}}]	12	1
14	2020-12-04 17:06:04.343303+00	3	3 Paris-Bordeaux	1	[{"added": {}}]	12	1
15	2020-12-04 18:26:15.494615+00	2	2	1	[{"added": {}}]	7	1
16	2020-12-04 18:28:03.446107+00	3	3 Lille-Paris	1	[{"added": {}}]	7	1
17	2020-12-04 21:26:39.959921+00	1	1	3		11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	agence	billet
8	agence	client
9	agence	place
10	agence	reduction
11	agence	reservation
12	agence	train
13	agence	voiture
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-12-04 15:46:37.379717+00
2	auth	0001_initial	2020-12-04 15:46:37.464056+00
3	admin	0001_initial	2020-12-04 15:46:37.578599+00
4	admin	0002_logentry_remove_auto_add	2020-12-04 15:46:37.620971+00
5	admin	0003_logentry_add_action_flag_choices	2020-12-04 15:46:37.633445+00
6	agence	0001_initial	2020-12-04 15:46:37.70592+00
7	agence	0002_auto_20201204_1335	2020-12-04 15:46:37.794006+00
8	agence	0003_auto_20201204_1510	2020-12-04 15:46:37.813208+00
9	agence	0004_auto_20201204_1525	2020-12-04 15:46:37.825454+00
10	agence	0005_reservation_prix_total	2020-12-04 15:46:37.837741+00
11	agence	0006_remove_reservation_prix_total	2020-12-04 15:46:37.849226+00
12	contenttypes	0002_remove_content_type_name	2020-12-04 15:46:37.878351+00
13	auth	0002_alter_permission_name_max_length	2020-12-04 15:46:37.891882+00
14	auth	0003_alter_user_email_max_length	2020-12-04 15:46:37.904875+00
15	auth	0004_alter_user_username_opts	2020-12-04 15:46:37.917246+00
16	auth	0005_alter_user_last_login_null	2020-12-04 15:46:37.929594+00
17	auth	0006_require_contenttypes_0002	2020-12-04 15:46:37.934199+00
18	auth	0007_alter_validators_add_error_messages	2020-12-04 15:46:37.947247+00
19	auth	0008_alter_user_username_max_length	2020-12-04 15:46:37.967523+00
20	auth	0009_alter_user_last_name_max_length	2020-12-04 15:46:37.981442+00
21	auth	0010_alter_group_name_max_length	2020-12-04 15:46:37.994055+00
22	auth	0011_update_proxy_permissions	2020-12-04 15:46:38.010092+00
23	auth	0012_alter_user_first_name_max_length	2020-12-04 15:46:38.022774+00
24	sessions	0001_initial	2020-12-04 15:46:38.040728+00
25	agence	0007_client_email	2020-12-04 21:15:31.891351+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
l6dafcro91ly3lny5gilnidsi7vebubg	.eJxVjDsOwjAQBe_iGln-BW8o6TmDtfaucQDZUpxUiLuTSCmgfTPz3iLgupSwdp7DROIitDj9bhHTk-sO6IH13mRqdZmnKHdFHrTLWyN-XQ_376BgL1udwCD4M7GKNqXI3gF4lckOdoTBsnOaHDk9MmW0xjvyBjNktTUZSIvPF-o7OBk:1klDJA:_MSegOMhzHfhmPUDefhYFej-jBDK6N5GbzJCZxXwpm4	2020-12-18 15:47:44.872767+00
\.


--
-- Name: agence_billet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agence_billet_id_seq', 3, true);


--
-- Name: agence_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agence_client_id_seq', 2, true);


--
-- Name: agence_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agence_place_id_seq', 2, true);


--
-- Name: agence_reduction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agence_reduction_id_seq', 2, true);


--
-- Name: agence_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agence_reservation_id_seq', 12, true);


--
-- Name: agence_train_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agence_train_id_seq', 3, true);


--
-- Name: agence_voiture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agence_voiture_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 17, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: agence_billet agence_billet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_billet
    ADD CONSTRAINT agence_billet_pkey PRIMARY KEY (id);


--
-- Name: agence_client agence_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_client
    ADD CONSTRAINT agence_client_pkey PRIMARY KEY (id);


--
-- Name: agence_place agence_place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_place
    ADD CONSTRAINT agence_place_pkey PRIMARY KEY (id);


--
-- Name: agence_reduction agence_reduction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_reduction
    ADD CONSTRAINT agence_reduction_pkey PRIMARY KEY (id);


--
-- Name: agence_reservation agence_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_reservation
    ADD CONSTRAINT agence_reservation_pkey PRIMARY KEY (id);


--
-- Name: agence_train agence_train_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_train
    ADD CONSTRAINT agence_train_pkey PRIMARY KEY (id);


--
-- Name: agence_voiture agence_voiture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_voiture
    ADD CONSTRAINT agence_voiture_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: agence_billet_numero_train_id_af2f2450; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agence_billet_numero_train_id_af2f2450 ON public.agence_billet USING btree (numero_train_id);


--
-- Name: agence_client_numero_reduction_id_7d1c8696; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agence_client_numero_reduction_id_7d1c8696 ON public.agence_client USING btree (numero_reduction_id);


--
-- Name: agence_place_numero_de_serie_voiture_id_dcf8c2e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agence_place_numero_de_serie_voiture_id_dcf8c2e1 ON public.agence_place USING btree (numero_de_serie_voiture_id);


--
-- Name: agence_reservation_numero_billet_id_e2f8eb44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agence_reservation_numero_billet_id_e2f8eb44 ON public.agence_reservation USING btree (numero_billet_id);


--
-- Name: agence_reservation_numero_client_id_3336fa18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agence_reservation_numero_client_id_3336fa18 ON public.agence_reservation USING btree (numero_client_id);


--
-- Name: agence_reservation_numero_place_id_493af5c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agence_reservation_numero_place_id_493af5c5 ON public.agence_reservation USING btree (numero_place_id);


--
-- Name: agence_voiture_numero_train_id_906f272a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agence_voiture_numero_train_id_906f272a ON public.agence_voiture USING btree (numero_train_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: agence_billet agence_billet_numero_train_id_af2f2450_fk_agence_train_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_billet
    ADD CONSTRAINT agence_billet_numero_train_id_af2f2450_fk_agence_train_id FOREIGN KEY (numero_train_id) REFERENCES public.agence_train(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agence_client agence_client_numero_reduction_id_7d1c8696_fk_agence_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_client
    ADD CONSTRAINT agence_client_numero_reduction_id_7d1c8696_fk_agence_re FOREIGN KEY (numero_reduction_id) REFERENCES public.agence_reduction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agence_place agence_place_numero_de_serie_voit_dcf8c2e1_fk_agence_vo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_place
    ADD CONSTRAINT agence_place_numero_de_serie_voit_dcf8c2e1_fk_agence_vo FOREIGN KEY (numero_de_serie_voiture_id) REFERENCES public.agence_voiture(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agence_reservation agence_reservation_numero_billet_id_e2f8eb44_fk_agence_bi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_reservation
    ADD CONSTRAINT agence_reservation_numero_billet_id_e2f8eb44_fk_agence_bi FOREIGN KEY (numero_billet_id) REFERENCES public.agence_billet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agence_reservation agence_reservation_numero_client_id_3336fa18_fk_agence_cl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_reservation
    ADD CONSTRAINT agence_reservation_numero_client_id_3336fa18_fk_agence_cl FOREIGN KEY (numero_client_id) REFERENCES public.agence_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agence_reservation agence_reservation_numero_place_id_493af5c5_fk_agence_place_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_reservation
    ADD CONSTRAINT agence_reservation_numero_place_id_493af5c5_fk_agence_place_id FOREIGN KEY (numero_place_id) REFERENCES public.agence_place(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agence_voiture agence_voiture_numero_train_id_906f272a_fk_agence_train_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agence_voiture
    ADD CONSTRAINT agence_voiture_numero_train_id_906f272a_fk_agence_train_id FOREIGN KEY (numero_train_id) REFERENCES public.agence_train(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

