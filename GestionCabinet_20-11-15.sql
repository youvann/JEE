--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-11-20 19:14:37 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 197 (class 3079 OID 12123)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 197
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 16483)
-- Name: consultation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE consultation (
    date_debut date,
    date_fin date,
    compte_rendu character varying(255),
    id integer NOT NULL,
    patient_id integer NOT NULL,
    medecin_id integer NOT NULL
);


ALTER TABLE consultation OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16486)
-- Name: consultation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE consultation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consultation_id_seq OWNER TO postgres;

--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 173
-- Name: consultation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consultation_id_seq OWNED BY consultation.id;


--
-- TOC entry 174 (class 1259 OID 16488)
-- Name: consultation_medecin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE consultation_medecin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consultation_medecin_seq OWNER TO postgres;

--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 174
-- Name: consultation_medecin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consultation_medecin_seq OWNED BY consultation.medecin_id;


--
-- TOC entry 175 (class 1259 OID 16490)
-- Name: consultation_patient_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE consultation_patient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consultation_patient_seq OWNER TO postgres;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 175
-- Name: consultation_patient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consultation_patient_seq OWNED BY consultation.patient_id;


--
-- TOC entry 176 (class 1259 OID 16492)
-- Name: interaction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE interaction (
    id integer NOT NULL,
    severite character varying(255),
    risque character varying(255),
    precaution character varying(255),
    "produitA" integer NOT NULL,
    "produitB" integer NOT NULL,
    consultation_id integer NOT NULL
);


ALTER TABLE interaction OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16498)
-- Name: interaction_consultation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE interaction_consultation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interaction_consultation_id_seq OWNER TO postgres;

--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 177
-- Name: interaction_consultation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE interaction_consultation_id_seq OWNED BY interaction.consultation_id;


--
-- TOC entry 178 (class 1259 OID 16500)
-- Name: interaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE interaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interaction_id_seq OWNER TO postgres;

--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 178
-- Name: interaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE interaction_id_seq OWNED BY interaction.id;


--
-- TOC entry 179 (class 1259 OID 16502)
-- Name: interaction_produitA_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "interaction_produitA_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "interaction_produitA_seq" OWNER TO postgres;

--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 179
-- Name: interaction_produitA_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "interaction_produitA_seq" OWNED BY interaction."produitA";


--
-- TOC entry 180 (class 1259 OID 16504)
-- Name: interaction_produitB_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "interaction_produitB_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "interaction_produitB_seq" OWNER TO postgres;

--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 180
-- Name: interaction_produitB_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "interaction_produitB_seq" OWNED BY interaction."produitB";


--
-- TOC entry 181 (class 1259 OID 16506)
-- Name: medecin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medecin (
    id integer NOT NULL,
    rpps character varying(32),
    utilisateur_id integer NOT NULL
);


ALTER TABLE medecin OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16509)
-- Name: medecin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medecin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medecin_id_seq OWNER TO postgres;

--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 182
-- Name: medecin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medecin_id_seq OWNED BY medecin.id;


--
-- TOC entry 183 (class 1259 OID 16511)
-- Name: medecin_utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medecin_utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medecin_utilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 183
-- Name: medecin_utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medecin_utilisateur_id_seq OWNED BY medecin.utilisateur_id;


--
-- TOC entry 184 (class 1259 OID 16513)
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE patient (
    date_naissance date,
    age integer,
    id integer NOT NULL,
    sexe character varying(32)
);


ALTER TABLE patient OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16516)
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patient_id_seq OWNER TO postgres;

--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 185
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE patient_id_seq OWNED BY patient.id;


--
-- TOC entry 186 (class 1259 OID 16518)
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personne (
    id integer NOT NULL,
    nom character varying(32),
    prenom character varying(32),
    age bit varying,
    datenaissance bit varying
);


ALTER TABLE personne OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16524)
-- Name: personne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personne_id_seq OWNER TO postgres;

--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 187
-- Name: personne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personne_id_seq OWNED BY personne.id;


--
-- TOC entry 188 (class 1259 OID 16526)
-- Name: produit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produit (
    id integer NOT NULL,
    cis character varying(255),
    nom character varying(64)
);


ALTER TABLE produit OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16529)
-- Name: produit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produit_id_seq OWNER TO postgres;

--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 189
-- Name: produit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produit_id_seq OWNED BY produit.id;


--
-- TOC entry 190 (class 1259 OID 16531)
-- Name: traitement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE traitement (
    id integer NOT NULL,
    posologie character varying(255),
    produit integer NOT NULL,
    consultation_id integer NOT NULL
);


ALTER TABLE traitement OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16534)
-- Name: traitement_consultation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE traitement_consultation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE traitement_consultation_id_seq OWNER TO postgres;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 191
-- Name: traitement_consultation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE traitement_consultation_id_seq OWNED BY traitement.consultation_id;


--
-- TOC entry 192 (class 1259 OID 16536)
-- Name: traitement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE traitement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE traitement_id_seq OWNER TO postgres;

--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 192
-- Name: traitement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE traitement_id_seq OWNED BY traitement.id;


--
-- TOC entry 193 (class 1259 OID 16538)
-- Name: traitement_produit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE traitement_produit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE traitement_produit_seq OWNER TO postgres;

--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 193
-- Name: traitement_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE traitement_produit_seq OWNED BY traitement.produit;


--
-- TOC entry 194 (class 1259 OID 16540)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utilisateur (
    id integer NOT NULL,
    compte character varying(32),
    password character varying(25),
    personne_id integer NOT NULL
);


ALTER TABLE utilisateur OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16543)
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 195
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utilisateur_id_seq OWNED BY utilisateur.id;


--
-- TOC entry 196 (class 1259 OID 16545)
-- Name: utilisateur_personne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utilisateur_personne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilisateur_personne_id_seq OWNER TO postgres;

--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 196
-- Name: utilisateur_personne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utilisateur_personne_id_seq OWNED BY utilisateur.personne_id;


--
-- TOC entry 2209 (class 2604 OID 16547)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultation ALTER COLUMN id SET DEFAULT nextval('consultation_id_seq'::regclass);


--
-- TOC entry 2210 (class 2604 OID 16548)
-- Name: patient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultation ALTER COLUMN patient_id SET DEFAULT nextval('consultation_patient_seq'::regclass);


--
-- TOC entry 2211 (class 2604 OID 16549)
-- Name: medecin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultation ALTER COLUMN medecin_id SET DEFAULT nextval('consultation_medecin_seq'::regclass);


--
-- TOC entry 2212 (class 2604 OID 16550)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interaction ALTER COLUMN id SET DEFAULT nextval('interaction_id_seq'::regclass);


--
-- TOC entry 2213 (class 2604 OID 16551)
-- Name: produitA; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interaction ALTER COLUMN "produitA" SET DEFAULT nextval('"interaction_produitA_seq"'::regclass);


--
-- TOC entry 2214 (class 2604 OID 16552)
-- Name: produitB; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interaction ALTER COLUMN "produitB" SET DEFAULT nextval('"interaction_produitB_seq"'::regclass);


--
-- TOC entry 2215 (class 2604 OID 16553)
-- Name: consultation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interaction ALTER COLUMN consultation_id SET DEFAULT nextval('interaction_consultation_id_seq'::regclass);


--
-- TOC entry 2216 (class 2604 OID 16554)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medecin ALTER COLUMN id SET DEFAULT nextval('medecin_id_seq'::regclass);


--
-- TOC entry 2217 (class 2604 OID 16555)
-- Name: utilisateur_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medecin ALTER COLUMN utilisateur_id SET DEFAULT nextval('medecin_utilisateur_id_seq'::regclass);


--
-- TOC entry 2218 (class 2604 OID 16556)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient ALTER COLUMN id SET DEFAULT nextval('patient_id_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 16557)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personne ALTER COLUMN id SET DEFAULT nextval('personne_id_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 16558)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produit ALTER COLUMN id SET DEFAULT nextval('produit_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 16559)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY traitement ALTER COLUMN id SET DEFAULT nextval('traitement_id_seq'::regclass);


--
-- TOC entry 2222 (class 2604 OID 16560)
-- Name: produit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY traitement ALTER COLUMN produit SET DEFAULT nextval('traitement_produit_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 16561)
-- Name: consultation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY traitement ALTER COLUMN consultation_id SET DEFAULT nextval('traitement_consultation_id_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 16562)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur ALTER COLUMN id SET DEFAULT nextval('utilisateur_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 16563)
-- Name: personne_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur ALTER COLUMN personne_id SET DEFAULT nextval('utilisateur_personne_id_seq'::regclass);


--
-- TOC entry 2365 (class 0 OID 16483)
-- Dependencies: 172
-- Data for Name: consultation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY consultation (date_debut, date_fin, compte_rendu, id, patient_id, medecin_id) FROM stdin;
\.


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 173
-- Name: consultation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('consultation_id_seq', 1, false);


--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 174
-- Name: consultation_medecin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('consultation_medecin_seq', 1, false);


--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 175
-- Name: consultation_patient_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('consultation_patient_seq', 1, false);


--
-- TOC entry 2369 (class 0 OID 16492)
-- Dependencies: 176
-- Data for Name: interaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY interaction (id, severite, risque, precaution, "produitA", "produitB", consultation_id) FROM stdin;
\.


--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 177
-- Name: interaction_consultation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('interaction_consultation_id_seq', 1, false);


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 178
-- Name: interaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('interaction_id_seq', 1, false);


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 179
-- Name: interaction_produitA_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"interaction_produitA_seq"', 1, false);


--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 180
-- Name: interaction_produitB_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"interaction_produitB_seq"', 1, false);


--
-- TOC entry 2374 (class 0 OID 16506)
-- Dependencies: 181
-- Data for Name: medecin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medecin (id, rpps, utilisateur_id) FROM stdin;
\.


--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 182
-- Name: medecin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medecin_id_seq', 1, false);


--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 183
-- Name: medecin_utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medecin_utilisateur_id_seq', 1, false);


--
-- TOC entry 2377 (class 0 OID 16513)
-- Dependencies: 184
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patient (date_naissance, age, id, sexe) FROM stdin;
\.


--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 185
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('patient_id_seq', 1, false);


--
-- TOC entry 2379 (class 0 OID 16518)
-- Dependencies: 186
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personne (id, nom, prenom, age, datenaissance) FROM stdin;
1	nom1	prenom1	\N	\N
2	nom2	prenom2	\N	\N
\.


--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 187
-- Name: personne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personne_id_seq', 1, false);


--
-- TOC entry 2381 (class 0 OID 16526)
-- Dependencies: 188
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY produit (id, cis, nom) FROM stdin;
\.


--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 189
-- Name: produit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produit_id_seq', 1, false);


--
-- TOC entry 2383 (class 0 OID 16531)
-- Dependencies: 190
-- Data for Name: traitement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY traitement (id, posologie, produit, consultation_id) FROM stdin;
\.


--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 191
-- Name: traitement_consultation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('traitement_consultation_id_seq', 1, false);


--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 192
-- Name: traitement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('traitement_id_seq', 1, false);


--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 193
-- Name: traitement_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('traitement_produit_seq', 1, false);


--
-- TOC entry 2387 (class 0 OID 16540)
-- Dependencies: 194
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utilisateur (id, compte, password, personne_id) FROM stdin;
\.


--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 195
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utilisateur_id_seq', 1, false);


--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 196
-- Name: utilisateur_personne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utilisateur_personne_id_seq', 1, false);


--
-- TOC entry 2227 (class 2606 OID 16565)
-- Name: Consultation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY consultation
    ADD CONSTRAINT "Consultation_pkey" PRIMARY KEY (id);


--
-- TOC entry 2231 (class 2606 OID 16567)
-- Name: Interaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interaction
    ADD CONSTRAINT "Interaction_pkey" PRIMARY KEY (id);


--
-- TOC entry 2234 (class 2606 OID 16569)
-- Name: Medecin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medecin
    ADD CONSTRAINT "Medecin_pkey" PRIMARY KEY (id);


--
-- TOC entry 2237 (class 2606 OID 16571)
-- Name: Patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT "Patient_pkey" PRIMARY KEY (id);


--
-- TOC entry 2241 (class 2606 OID 16573)
-- Name: Produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produit
    ADD CONSTRAINT "Produit_pkey" PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 16575)
-- Name: Traitement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY traitement
    ADD CONSTRAINT "Traitement_pkey" PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 16577)
-- Name: Utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT "Utilisateur_pkey" PRIMARY KEY (id);


--
-- TOC entry 2239 (class 2606 OID 16579)
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 2239
-- Name: CONSTRAINT id ON personne; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id ON personne IS 'id_personne';


--
-- TOC entry 2244 (class 1259 OID 16580)
-- Name: fki_consultation_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_consultation_id ON traitement USING btree (consultation_id);


--
-- TOC entry 2232 (class 1259 OID 16581)
-- Name: fki_consultation_id_2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_consultation_id_2 ON interaction USING btree (consultation_id);


--
-- TOC entry 2228 (class 1259 OID 16582)
-- Name: fki_medecin; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_medecin ON consultation USING btree (medecin_id);


--
-- TOC entry 2229 (class 1259 OID 16583)
-- Name: fki_patient; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_patient ON consultation USING btree (patient_id);


--
-- TOC entry 2248 (class 1259 OID 16584)
-- Name: fki_personne_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_personne_id ON utilisateur USING btree (personne_id);


--
-- TOC entry 2245 (class 1259 OID 16585)
-- Name: fki_produit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_produit ON traitement USING btree (produit);


--
-- TOC entry 2235 (class 1259 OID 16586)
-- Name: fki_utilisateur_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_utilisateur_id ON medecin USING btree (utilisateur_id);


--
-- TOC entry 2252 (class 2606 OID 16587)
-- Name: Patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT "Patient_id_fkey" FOREIGN KEY (id) REFERENCES personne(id) ON DELETE CASCADE;


--
-- TOC entry 2253 (class 2606 OID 16592)
-- Name: consultation_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY traitement
    ADD CONSTRAINT consultation_id FOREIGN KEY (consultation_id) REFERENCES consultation(id);


--
-- TOC entry 2250 (class 2606 OID 16597)
-- Name: consultation_id_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interaction
    ADD CONSTRAINT consultation_id_2 FOREIGN KEY (consultation_id) REFERENCES consultation(id);


--
-- TOC entry 2249 (class 2606 OID 16602)
-- Name: medecin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultation
    ADD CONSTRAINT medecin FOREIGN KEY (medecin_id) REFERENCES medecin(id);


--
-- TOC entry 2255 (class 2606 OID 16607)
-- Name: personne_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT personne_id FOREIGN KEY (personne_id) REFERENCES personne(id) ON DELETE CASCADE;


--
-- TOC entry 2254 (class 2606 OID 16612)
-- Name: produit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY traitement
    ADD CONSTRAINT produit FOREIGN KEY (produit) REFERENCES produit(id);


--
-- TOC entry 2251 (class 2606 OID 16617)
-- Name: utilisateur_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medecin
    ADD CONSTRAINT utilisateur_id FOREIGN KEY (id) REFERENCES utilisateur(id) ON DELETE CASCADE;


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: youvann
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM youvann;
GRANT ALL ON SCHEMA public TO youvann;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-20 19:14:37 CET

--
-- PostgreSQL database dump complete
--

