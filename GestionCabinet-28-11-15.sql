--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-11-28 11:26:44 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 180 (class 3079 OID 12123)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 180
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 16410)
-- Name: consultation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE consultation (
    id bigint NOT NULL,
    date_debut timestamp without time zone,
    date_fin timestamp without time zone,
    compte_rendu character varying(1000),
    patient_id bigint,
    medecin_id bigint
);


ALTER TABLE consultation OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16413)
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
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 175
-- Name: consultation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consultation_id_seq OWNED BY consultation.id;


--
-- TOC entry 178 (class 1259 OID 16448)
-- Name: interaction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE interaction (
    id bigint NOT NULL,
    severite character varying(1000),
    risques character varying(1000),
    precautions character varying(1000),
    consultation_id bigint,
    produit_a_cis character varying(32),
    produit_a_nom character varying(100),
    produit_b_cis character varying(32),
    produit_b_nom character varying(100)
);


ALTER TABLE interaction OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16451)
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
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 179
-- Name: interaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE interaction_id_seq OWNED BY interaction.id;


--
-- TOC entry 172 (class 1259 OID 16390)
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personne (
    id bigint NOT NULL,
    nom character varying(32),
    prenom character varying(32),
    personne_type character varying(32) NOT NULL,
    compte character varying(32),
    rpps character varying(32),
    date_naissance timestamp without time zone
);


ALTER TABLE personne OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16395)
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
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 173
-- Name: personne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personne_id_seq OWNED BY personne.id;


--
-- TOC entry 176 (class 1259 OID 16437)
-- Name: traitement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE traitement (
    id bigint NOT NULL,
    posologie character varying(1000),
    consultation_id bigint,
    produit_cis character varying(32),
    produit_nom character varying(100)
);


ALTER TABLE traitement OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16440)
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
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 177
-- Name: traitement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE traitement_id_seq OWNED BY traitement.id;


--
-- TOC entry 2169 (class 2604 OID 16415)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultation ALTER COLUMN id SET DEFAULT nextval('consultation_id_seq'::regclass);


--
-- TOC entry 2171 (class 2604 OID 16453)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interaction ALTER COLUMN id SET DEFAULT nextval('interaction_id_seq'::regclass);


--
-- TOC entry 2168 (class 2604 OID 16397)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personne ALTER COLUMN id SET DEFAULT nextval('personne_id_seq'::regclass);


--
-- TOC entry 2170 (class 2604 OID 16442)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY traitement ALTER COLUMN id SET DEFAULT nextval('traitement_id_seq'::regclass);


--
-- TOC entry 2299 (class 0 OID 16410)
-- Dependencies: 174
-- Data for Name: consultation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY consultation (id, date_debut, date_fin, compte_rendu, patient_id, medecin_id) FROM stdin;
196	2015-12-11 11:00:00	2015-12-11 11:20:00	\N	29	1
194	2015-12-11 09:00:00	2015-12-11 09:20:00	Le patient a un petit rhume et a du mal à dormir...	27	1
198	2015-12-11 10:00:00	2015-12-11 10:20:00	\N	28	1
199	2015-12-11 11:00:00	2015-12-11 11:20:00	\N	29	1
\.


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 175
-- Name: consultation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('consultation_id_seq', 199, true);


--
-- TOC entry 2303 (class 0 OID 16448)
-- Dependencies: 178
-- Data for Name: interaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY interaction (id, severite, risques, precautions, consultation_id, produit_a_cis, produit_a_nom, produit_b_cis, produit_b_nom) FROM stdin;
29	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		\N	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
28	DISADVISES_ASSOCIATION	Augmentation du risque hémorragique (agression de la muqueuse gastroduodénale par les anti-inflammatoires non stéroïdiens).	Si l'association ne peut être évitée, surveillance clinique étroite.	\N	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
27	DISADVISES_ASSOCIATION	Majoration du risque ulcérogène et hémorragique digestif.	Association déconseillée avec des doses anti-inflammatoires d'acide acétylsalicylique (>= 1 g/prise et/ou >=3 g/jour) et avec des doses antalgiques ou antipyrétiques (>= 500 mg/prise et/ou < 3 g/jour). A prendre en compte avec des doses antiagrégantes (de 50 mg à 375 mg/jour en 1 ou plusieurs prises)	\N	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
26	TAKE_INTO_ACCOUNT	Risque de majoration de l'hyperkaliémie, potentiellement létale.	Pour connaître les risques et les niveaux de contrainte spécifiques aux médicaments hyperkaliémiants, il convient de se reporter aux interactions propres à chaque substance.	\N	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
25	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		\N	60562855	PLAVIX 300 mg cp pellic	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
24	TAKE_INTO_ACCOUNT	L'utilisation conjointe de médicaments agissant à divers niveaux de l'hémostase majore le risque de saignement. Ainsi, chez le sujet de moins de 65 ans, l'association de l'héparine à doses préventives, ou de substances apparentées, à l'acide acétylsalicylique, quelle que soit la dose, doit être prise en compte en maintenant une surveillance clinique et éventuellement biologique.		\N	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte
23	DISADVISES_ASSOCIATION	Majoration du risque hémorragique par addition des activités antiagrégantes plaquettaires.	Association déconseillée : en dehors des indications validées pour cette association dans les syndromes coronariens aigus. Précaution d'emploi : dans les indications validées pour cette association dans les syndromes coronariens aigus. Surveillance clinique.	\N	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	60562855	PLAVIX 300 mg cp pellic
22	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		\N	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
21	DISADVISES_ASSOCIATION	Augmentation du risque hémorragique (inhibition de la fonction plaquettaire et agression de la muqueuse gastroduodénale par l'acide acétylsalicylique).	Association déconseillée avec : \n- des doses anti-inflammatoires d'acide acétylsalicylique (>= 1 g par prise et/ou >= 3 g par jour) \n- des doses antalgiques ou antipyrétiques (>= 500 mg par prise et/ou < 3 g par jour). \nUtiliser un autre anti-inflammatoire ou un autre antalgique ou antipyrétique. \nA prendre en compte avec : \n- des doses antiagrégantes (de 50 mg à 375 mg par jour).	\N	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
30	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		\N	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	60562855	PLAVIX 300 mg cp pellic
31	DISADVISES_ASSOCIATION	Augmentation du risque hémorragique (inhibition de la fonction plaquettaire et agression de la muqueuse gastroduodénale par l'acide acétylsalicylique).	Association déconseillée avec : \n- des doses anti-inflammatoires d'acide acétylsalicylique (>= 1 g par prise et/ou >= 3 g par jour) \n- des doses antalgiques ou antipyrétiques (>= 500 mg par prise et/ou < 3 g par jour). \nUtiliser un autre anti-inflammatoire ou un autre antalgique ou antipyrétique. \nA prendre en compte avec : \n- des doses antiagrégantes (de 50 mg à 375 mg par jour).	194	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
32	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		194	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
33	DISADVISES_ASSOCIATION	Majoration du risque hémorragique par addition des activités antiagrégantes plaquettaires.	Association déconseillée : en dehors des indications validées pour cette association dans les syndromes coronariens aigus. Précaution d'emploi : dans les indications validées pour cette association dans les syndromes coronariens aigus. Surveillance clinique.	194	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	60562855	PLAVIX 300 mg cp pellic
34	TAKE_INTO_ACCOUNT	L'utilisation conjointe de médicaments agissant à divers niveaux de l'hémostase majore le risque de saignement. Ainsi, chez le sujet de moins de 65 ans, l'association de l'héparine à doses préventives, ou de substances apparentées, à l'acide acétylsalicylique, quelle que soit la dose, doit être prise en compte en maintenant une surveillance clinique et éventuellement biologique.		194	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte
35	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		194	60562855	PLAVIX 300 mg cp pellic	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
36	TAKE_INTO_ACCOUNT	Risque de majoration de l'hyperkaliémie, potentiellement létale.	Pour connaître les risques et les niveaux de contrainte spécifiques aux médicaments hyperkaliémiants, il convient de se reporter aux interactions propres à chaque substance.	194	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
37	DISADVISES_ASSOCIATION	Majoration du risque ulcérogène et hémorragique digestif.	Association déconseillée avec des doses anti-inflammatoires d'acide acétylsalicylique (>= 1 g/prise et/ou >=3 g/jour) et avec des doses antalgiques ou antipyrétiques (>= 500 mg/prise et/ou < 3 g/jour). A prendre en compte avec des doses antiagrégantes (de 50 mg à 375 mg/jour en 1 ou plusieurs prises)	194	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
39	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		194	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
38	DISADVISES_ASSOCIATION	Augmentation du risque hémorragique (agression de la muqueuse gastroduodénale par les anti-inflammatoires non stéroïdiens).	Si l'association ne peut être évitée, surveillance clinique étroite.	194	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
40	TAKE_INTO_ACCOUNT	Augmentation du risque hémorragique.		194	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte	60562855	PLAVIX 300 mg cp pellic
\.


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 179
-- Name: interaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('interaction_id_seq', 40, true);


--
-- TOC entry 2297 (class 0 OID 16390)
-- Dependencies: 172
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personne (id, nom, prenom, personne_type, compte, rpps, date_naissance) FROM stdin;
1	Rama	Pierre	medecin	compte1	rpps1	\N
3	Authier	Valerie	medecin	compte3	rpps3	\N
4	Laval	Julien	medecin	compte4	rpps4	\N
2	Dara	Nico	medecin	compte2	rpps2	\N
27	MARTIN	Jean	patient	\N	\N	1964-03-12 00:00:00
28	DUPOND	Henri	patient	\N	\N	1958-02-23 00:00:00
29	GIUDICELLI	Jeannette	patient	\N	\N	1943-07-20 00:00:00
\.


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 173
-- Name: personne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personne_id_seq', 29, true);


--
-- TOC entry 2301 (class 0 OID 16437)
-- Dependencies: 176
-- Data for Name: traitement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY traitement (id, posologie, consultation_id, produit_cis, produit_nom) FROM stdin;
56	\N	194	60234100	DOLIPRANE 1000 mg cp
57	\N	194	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
59	\N	194	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
60	\N	194	60562855	PLAVIX 300 mg cp pellic
61	\N	194	60234100	DOLIPRANE 1000 mg cp
62	\N	194	61349237	IBUPROFENE ACTAVIS 400 mg cp pellic
63	\N	194	67010731	LOVENOX 10 000 UI anti-Xa/1 ml sol inj en seringue préremplie
64	\N	194	60562855	PLAVIX 300 mg cp pellic
58	\N	\N	63936571	ASPEGIC 1000 mg pdre p sol buv en sachet-dose adulte
\.


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 177
-- Name: traitement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('traitement_id_seq', 64, true);


--
-- TOC entry 2177 (class 2606 OID 16420)
-- Name: pk_consultation; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY consultation
    ADD CONSTRAINT pk_consultation PRIMARY KEY (id);


--
-- TOC entry 2183 (class 2606 OID 16458)
-- Name: pk_interaction; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interaction
    ADD CONSTRAINT pk_interaction PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 16402)
-- Name: pk_personne; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT pk_personne PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 16447)
-- Name: pk_traitement; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY traitement
    ADD CONSTRAINT pk_traitement PRIMARY KEY (id);


--
-- TOC entry 2174 (class 1259 OID 16430)
-- Name: fki_consultation_medecin_id_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_consultation_medecin_id_personne ON consultation USING btree (medecin_id);


--
-- TOC entry 2175 (class 1259 OID 16436)
-- Name: fki_consultation_patient_id_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_consultation_patient_id_personne ON consultation USING btree (patient_id);


--
-- TOC entry 2181 (class 1259 OID 16473)
-- Name: fki_interaction_consultation_id_consultation; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_interaction_consultation_id_consultation ON interaction USING btree (consultation_id);


--
-- TOC entry 2178 (class 1259 OID 16467)
-- Name: fki_traitement_consultation_id_consultation; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_traitement_consultation_id_consultation ON traitement USING btree (consultation_id);


--
-- TOC entry 2184 (class 2606 OID 16474)
-- Name: fk_consultation_medecin_id_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultation
    ADD CONSTRAINT fk_consultation_medecin_id_personne FOREIGN KEY (medecin_id) REFERENCES personne(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2185 (class 2606 OID 16479)
-- Name: fk_consultation_patient_id_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultation
    ADD CONSTRAINT fk_consultation_patient_id_personne FOREIGN KEY (patient_id) REFERENCES personne(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2187 (class 2606 OID 16468)
-- Name: fk_interaction_consultation_id_consultation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interaction
    ADD CONSTRAINT fk_interaction_consultation_id_consultation FOREIGN KEY (consultation_id) REFERENCES consultation(id);


--
-- TOC entry 2186 (class 2606 OID 16462)
-- Name: fk_traitement_consultation_id_consultation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY traitement
    ADD CONSTRAINT fk_traitement_consultation_id_consultation FOREIGN KEY (consultation_id) REFERENCES consultation(id);


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: youvann
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM youvann;
GRANT ALL ON SCHEMA public TO youvann;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-28 11:26:44 CET

--
-- PostgreSQL database dump complete
--

