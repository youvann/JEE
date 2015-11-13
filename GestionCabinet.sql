--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-11-13 15:06:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 197 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 197
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16475)
-- Name: Consultation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Consultation" (
    debut date,
    fin date,
    compte_rendu character varying(255),
    id integer NOT NULL,
    patient integer NOT NULL,
    medecin integer NOT NULL
);


ALTER TABLE "Consultation" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16469)
-- Name: Consultation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Consultation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Consultation_id_seq" OWNER TO postgres;

--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 180
-- Name: Consultation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Consultation_id_seq" OWNED BY "Consultation".id;


--
-- TOC entry 182 (class 1259 OID 16473)
-- Name: Consultation_medecin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Consultation_medecin_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Consultation_medecin_seq" OWNER TO postgres;

--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 182
-- Name: Consultation_medecin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Consultation_medecin_seq" OWNED BY "Consultation".medecin;


--
-- TOC entry 181 (class 1259 OID 16471)
-- Name: Consultation_patient_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Consultation_patient_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Consultation_patient_seq" OWNER TO postgres;

--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 181
-- Name: Consultation_patient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Consultation_patient_seq" OWNED BY "Consultation".patient;


--
-- TOC entry 187 (class 1259 OID 16502)
-- Name: Interaction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Interaction" (
    id integer NOT NULL,
    severite character varying(255),
    risque character varying(255),
    precaution character varying(255),
    "produitA" integer NOT NULL,
    "produitB" integer NOT NULL,
    consultation_id integer NOT NULL
);


ALTER TABLE "Interaction" OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16650)
-- Name: Interaction_consultation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Interaction_consultation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Interaction_consultation_id_seq" OWNER TO postgres;

--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 195
-- Name: Interaction_consultation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Interaction_consultation_id_seq" OWNED BY "Interaction".consultation_id;


--
-- TOC entry 184 (class 1259 OID 16496)
-- Name: Interaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Interaction_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Interaction_id_seq" OWNER TO postgres;

--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 184
-- Name: Interaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Interaction_id_seq" OWNED BY "Interaction".id;


--
-- TOC entry 185 (class 1259 OID 16498)
-- Name: Interaction_produitA_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Interaction_produitA_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Interaction_produitA_seq" OWNER TO postgres;

--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 185
-- Name: Interaction_produitA_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Interaction_produitA_seq" OWNED BY "Interaction"."produitA";


--
-- TOC entry 186 (class 1259 OID 16500)
-- Name: Interaction_produitB_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Interaction_produitB_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Interaction_produitB_seq" OWNER TO postgres;

--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 186
-- Name: Interaction_produitB_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Interaction_produitB_seq" OWNED BY "Interaction"."produitB";


--
-- TOC entry 176 (class 1259 OID 16427)
-- Name: Medecin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Medecin" (
    id integer NOT NULL,
    rpps character varying(32),
    utilisateur_id integer NOT NULL
);


ALTER TABLE "Medecin" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16430)
-- Name: Medecin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Medecin_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Medecin_id_seq" OWNER TO postgres;

--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 177
-- Name: Medecin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Medecin_id_seq" OWNED BY "Medecin".id;


--
-- TOC entry 193 (class 1259 OID 16611)
-- Name: Medecin_utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Medecin_utilisateur_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Medecin_utilisateur_id_seq" OWNER TO postgres;

--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 193
-- Name: Medecin_utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Medecin_utilisateur_id_seq" OWNED BY "Medecin".utilisateur_id;


--
-- TOC entry 174 (class 1259 OID 16410)
-- Name: Patient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Patient" (
    date_naissance date,
    age integer,
    id integer NOT NULL,
    sexe character varying(32)
);


ALTER TABLE "Patient" OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16414)
-- Name: Patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Patient_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Patient_id_seq" OWNER TO postgres;

--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 175
-- Name: Patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Patient_id_seq" OWNED BY "Patient".id;


--
-- TOC entry 172 (class 1259 OID 16394)
-- Name: Personne; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Personne" (
    id integer NOT NULL,
    nom character varying(32)[],
    prenom character varying(32)[]
);


ALTER TABLE "Personne" OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16397)
-- Name: Personne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Personne_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Personne_id_seq" OWNER TO postgres;

--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 173
-- Name: Personne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Personne_id_seq" OWNED BY "Personne".id;


--
-- TOC entry 179 (class 1259 OID 16463)
-- Name: Produit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Produit" (
    id integer NOT NULL,
    cis character varying(255),
    nom character varying(64)
);


ALTER TABLE "Produit" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16461)
-- Name: Produit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Produit_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Produit_id_seq" OWNER TO postgres;

--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 178
-- Name: Produit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Produit_id_seq" OWNED BY "Produit".id;


--
-- TOC entry 190 (class 1259 OID 16517)
-- Name: Traitement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Traitement" (
    id integer NOT NULL,
    posologie character varying(255),
    produit integer NOT NULL,
    consultation_id integer NOT NULL
);


ALTER TABLE "Traitement" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16660)
-- Name: Traitement_consultation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Traitement_consultation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Traitement_consultation_id_seq" OWNER TO postgres;

--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 196
-- Name: Traitement_consultation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Traitement_consultation_id_seq" OWNED BY "Traitement".consultation_id;


--
-- TOC entry 188 (class 1259 OID 16513)
-- Name: Traitement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Traitement_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Traitement_id_seq" OWNER TO postgres;

--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 188
-- Name: Traitement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Traitement_id_seq" OWNED BY "Traitement".id;


--
-- TOC entry 189 (class 1259 OID 16515)
-- Name: Traitement_produit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Traitement_produit_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Traitement_produit_seq" OWNER TO postgres;

--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 189
-- Name: Traitement_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Traitement_produit_seq" OWNED BY "Traitement".produit;


--
-- TOC entry 191 (class 1259 OID 16602)
-- Name: Utilisateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Utilisateur" (
    id integer NOT NULL,
    compte character varying(32),
    password character varying(25),
    personne_id integer NOT NULL
);


ALTER TABLE "Utilisateur" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16605)
-- Name: Utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Utilisateur_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Utilisateur_id_seq" OWNER TO postgres;

--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 192
-- Name: Utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Utilisateur_id_seq" OWNED BY "Utilisateur".id;


--
-- TOC entry 194 (class 1259 OID 16627)
-- Name: Utilisateur_personne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Utilisateur_personne_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Utilisateur_personne_id_seq" OWNER TO postgres;

--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 194
-- Name: Utilisateur_personne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Utilisateur_personne_id_seq" OWNED BY "Utilisateur".personne_id;


--
-- TOC entry 1948 (class 2604 OID 16478)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Consultation" ALTER COLUMN id SET DEFAULT nextval('"Consultation_id_seq"'::regclass);


--
-- TOC entry 1949 (class 2604 OID 16479)
-- Name: patient; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Consultation" ALTER COLUMN patient SET DEFAULT nextval('"Consultation_patient_seq"'::regclass);


--
-- TOC entry 1950 (class 2604 OID 16480)
-- Name: medecin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Consultation" ALTER COLUMN medecin SET DEFAULT nextval('"Consultation_medecin_seq"'::regclass);


--
-- TOC entry 1951 (class 2604 OID 16505)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Interaction" ALTER COLUMN id SET DEFAULT nextval('"Interaction_id_seq"'::regclass);


--
-- TOC entry 1952 (class 2604 OID 16506)
-- Name: produitA; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Interaction" ALTER COLUMN "produitA" SET DEFAULT nextval('"Interaction_produitA_seq"'::regclass);


--
-- TOC entry 1953 (class 2604 OID 16507)
-- Name: produitB; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Interaction" ALTER COLUMN "produitB" SET DEFAULT nextval('"Interaction_produitB_seq"'::regclass);


--
-- TOC entry 1954 (class 2604 OID 16652)
-- Name: consultation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Interaction" ALTER COLUMN consultation_id SET DEFAULT nextval('"Interaction_consultation_id_seq"'::regclass);


--
-- TOC entry 1945 (class 2604 OID 16432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Medecin" ALTER COLUMN id SET DEFAULT nextval('"Medecin_id_seq"'::regclass);


--
-- TOC entry 1946 (class 2604 OID 16613)
-- Name: utilisateur_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Medecin" ALTER COLUMN utilisateur_id SET DEFAULT nextval('"Medecin_utilisateur_id_seq"'::regclass);


--
-- TOC entry 1944 (class 2604 OID 16416)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Patient" ALTER COLUMN id SET DEFAULT nextval('"Patient_id_seq"'::regclass);


--
-- TOC entry 1943 (class 2604 OID 16399)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Personne" ALTER COLUMN id SET DEFAULT nextval('"Personne_id_seq"'::regclass);


--
-- TOC entry 1947 (class 2604 OID 16466)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Produit" ALTER COLUMN id SET DEFAULT nextval('"Produit_id_seq"'::regclass);


--
-- TOC entry 1955 (class 2604 OID 16520)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Traitement" ALTER COLUMN id SET DEFAULT nextval('"Traitement_id_seq"'::regclass);


--
-- TOC entry 1956 (class 2604 OID 16521)
-- Name: produit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Traitement" ALTER COLUMN produit SET DEFAULT nextval('"Traitement_produit_seq"'::regclass);


--
-- TOC entry 1957 (class 2604 OID 16662)
-- Name: consultation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Traitement" ALTER COLUMN consultation_id SET DEFAULT nextval('"Traitement_consultation_id_seq"'::regclass);


--
-- TOC entry 1958 (class 2604 OID 16607)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Utilisateur" ALTER COLUMN id SET DEFAULT nextval('"Utilisateur_id_seq"'::regclass);


--
-- TOC entry 1959 (class 2604 OID 16629)
-- Name: personne_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Utilisateur" ALTER COLUMN personne_id SET DEFAULT nextval('"Utilisateur_personne_id_seq"'::regclass);


--
-- TOC entry 2110 (class 0 OID 16475)
-- Dependencies: 183
-- Data for Name: Consultation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Consultation" (debut, fin, compte_rendu, id, patient, medecin) FROM stdin;
\.


--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 180
-- Name: Consultation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Consultation_id_seq"', 1, false);


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 182
-- Name: Consultation_medecin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Consultation_medecin_seq"', 1, false);


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 181
-- Name: Consultation_patient_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Consultation_patient_seq"', 1, false);


--
-- TOC entry 2114 (class 0 OID 16502)
-- Dependencies: 187
-- Data for Name: Interaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Interaction" (id, severite, risque, precaution, "produitA", "produitB", consultation_id) FROM stdin;
\.


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 195
-- Name: Interaction_consultation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Interaction_consultation_id_seq"', 1, false);


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 184
-- Name: Interaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Interaction_id_seq"', 1, false);


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 185
-- Name: Interaction_produitA_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Interaction_produitA_seq"', 1, false);


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 186
-- Name: Interaction_produitB_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Interaction_produitB_seq"', 1, false);


--
-- TOC entry 2103 (class 0 OID 16427)
-- Dependencies: 176
-- Data for Name: Medecin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Medecin" (id, rpps, utilisateur_id) FROM stdin;
\.


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 177
-- Name: Medecin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Medecin_id_seq"', 1, false);


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 193
-- Name: Medecin_utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Medecin_utilisateur_id_seq"', 1, false);


--
-- TOC entry 2101 (class 0 OID 16410)
-- Dependencies: 174
-- Data for Name: Patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Patient" (date_naissance, age, id, sexe) FROM stdin;
\.


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 175
-- Name: Patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Patient_id_seq"', 1, false);


--
-- TOC entry 2099 (class 0 OID 16394)
-- Dependencies: 172
-- Data for Name: Personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Personne" (id, nom, prenom) FROM stdin;
\.


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 173
-- Name: Personne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Personne_id_seq"', 1, false);


--
-- TOC entry 2106 (class 0 OID 16463)
-- Dependencies: 179
-- Data for Name: Produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Produit" (id, cis, nom) FROM stdin;
\.


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 178
-- Name: Produit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Produit_id_seq"', 1, false);


--
-- TOC entry 2117 (class 0 OID 16517)
-- Dependencies: 190
-- Data for Name: Traitement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Traitement" (id, posologie, produit, consultation_id) FROM stdin;
\.


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 196
-- Name: Traitement_consultation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Traitement_consultation_id_seq"', 1, false);


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 188
-- Name: Traitement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Traitement_id_seq"', 1, false);


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 189
-- Name: Traitement_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Traitement_produit_seq"', 1, false);


--
-- TOC entry 2118 (class 0 OID 16602)
-- Dependencies: 191
-- Data for Name: Utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Utilisateur" (id, compte, password, personne_id) FROM stdin;
\.


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 192
-- Name: Utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Utilisateur_id_seq"', 1, false);


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 194
-- Name: Utilisateur_personne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Utilisateur_personne_id_seq"', 1, false);


--
-- TOC entry 1970 (class 2606 OID 16483)
-- Name: Consultation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Consultation"
    ADD CONSTRAINT "Consultation_pkey" PRIMARY KEY (id);


--
-- TOC entry 1974 (class 2606 OID 16512)
-- Name: Interaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Interaction"
    ADD CONSTRAINT "Interaction_pkey" PRIMARY KEY (id);


--
-- TOC entry 1965 (class 2606 OID 16437)
-- Name: Medecin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Medecin"
    ADD CONSTRAINT "Medecin_pkey" PRIMARY KEY (id);


--
-- TOC entry 1963 (class 2606 OID 16551)
-- Name: Patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Patient"
    ADD CONSTRAINT "Patient_pkey" PRIMARY KEY (id);


--
-- TOC entry 1968 (class 2606 OID 16468)
-- Name: Produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Produit"
    ADD CONSTRAINT "Produit_pkey" PRIMARY KEY (id);


--
-- TOC entry 1977 (class 2606 OID 16523)
-- Name: Traitement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Traitement"
    ADD CONSTRAINT "Traitement_pkey" PRIMARY KEY (id);


--
-- TOC entry 1981 (class 2606 OID 16620)
-- Name: Utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Utilisateur"
    ADD CONSTRAINT "Utilisateur_pkey" PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 16407)
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Personne"
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 1961
-- Name: CONSTRAINT id ON "Personne"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id ON "Personne" IS 'id_personne';


--
-- TOC entry 1978 (class 1259 OID 16673)
-- Name: fki_consultation_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_consultation_id ON "Traitement" USING btree (consultation_id);


--
-- TOC entry 1975 (class 1259 OID 16684)
-- Name: fki_consultation_id_2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_consultation_id_2 ON "Interaction" USING btree (consultation_id);


--
-- TOC entry 1971 (class 1259 OID 16495)
-- Name: fki_medecin; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_medecin ON "Consultation" USING btree (medecin);


--
-- TOC entry 1972 (class 1259 OID 16489)
-- Name: fki_patient; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_patient ON "Consultation" USING btree (patient);


--
-- TOC entry 1982 (class 1259 OID 16639)
-- Name: fki_personne_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_personne_id ON "Utilisateur" USING btree (personne_id);


--
-- TOC entry 1979 (class 1259 OID 16529)
-- Name: fki_produit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_produit ON "Traitement" USING btree (produit);


--
-- TOC entry 1966 (class 1259 OID 16626)
-- Name: fki_utilisateur_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_utilisateur_id ON "Medecin" USING btree (utilisateur_id);


--
-- TOC entry 1983 (class 2606 OID 16567)
-- Name: Patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Patient"
    ADD CONSTRAINT "Patient_id_fkey" FOREIGN KEY (id) REFERENCES "Personne"(id) ON DELETE CASCADE;


--
-- TOC entry 1988 (class 2606 OID 16668)
-- Name: consultation_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Traitement"
    ADD CONSTRAINT consultation_id FOREIGN KEY (consultation_id) REFERENCES "Consultation"(id);


--
-- TOC entry 1986 (class 2606 OID 16679)
-- Name: consultation_id_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Interaction"
    ADD CONSTRAINT consultation_id_2 FOREIGN KEY (consultation_id) REFERENCES "Consultation"(id);


--
-- TOC entry 1985 (class 2606 OID 16490)
-- Name: medecin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Consultation"
    ADD CONSTRAINT medecin FOREIGN KEY (medecin) REFERENCES "Medecin"(id);


--
-- TOC entry 1989 (class 2606 OID 16640)
-- Name: personne_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Utilisateur"
    ADD CONSTRAINT personne_id FOREIGN KEY (personne_id) REFERENCES "Personne"(id) ON DELETE CASCADE;


--
-- TOC entry 1987 (class 2606 OID 16524)
-- Name: produit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Traitement"
    ADD CONSTRAINT produit FOREIGN KEY (produit) REFERENCES "Produit"(id);


--
-- TOC entry 1984 (class 2606 OID 16645)
-- Name: utilisateur_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Medecin"
    ADD CONSTRAINT utilisateur_id FOREIGN KEY (id) REFERENCES "Utilisateur"(id) ON DELETE CASCADE;


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-13 15:06:39

--
-- PostgreSQL database dump complete
--

