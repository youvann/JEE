PGDMP                     
    s            GestionCabinet    9.4.5    9.4.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16627    GestionCabinet    DATABASE     �   CREATE DATABASE "GestionCabinet" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'fr_FR.UTF-8' LC_CTYPE = 'fr_FR.UTF-8';
     DROP DATABASE "GestionCabinet";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             youvann    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  youvann    false    5            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM youvann;
GRANT ALL ON SCHEMA public TO youvann;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  youvann    false    5            �            3079    12123    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    177            �            1259    24823    consultation    TABLE        CREATE TABLE consultation (
);
     DROP TABLE public.consultation;
       public         postgres    false    5            �            1259    24817    interaction    TABLE        CREATE TABLE interaction (
);
    DROP TABLE public.interaction;
       public         postgres    false    5            �            1259    16628    personne    TABLE       CREATE TABLE personne (
    nom character varying(32),
    prenom character varying(32),
    personne_type character varying(32) NOT NULL,
    date_naissance timestamp with time zone,
    rpps character varying,
    compte character varying,
    id bigint NOT NULL
);
    DROP TABLE public.personne;
       public         postgres    false    5            �            1259    33027    personne_id_seq    SEQUENCE     q   CREATE SEQUENCE personne_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.personne_id_seq;
       public       postgres    false    5    172            �           0    0    personne_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE personne_id_seq OWNED BY personne.id;
            public       postgres    false    176            �            1259    24820 
   traitement    TABLE        CREATE TABLE traitement (
);
    DROP TABLE public.traitement;
       public         postgres    false    5            p           2604    33029    id    DEFAULT     \   ALTER TABLE ONLY personne ALTER COLUMN id SET DEFAULT nextval('personne_id_seq'::regclass);
 :   ALTER TABLE public.personne ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    172            �          0    24823    consultation 
   TABLE DATA                  COPY consultation  FROM stdin;
    public       postgres    false    175   C       �          0    24817    interaction 
   TABLE DATA                  COPY interaction  FROM stdin;
    public       postgres    false    173   `       �          0    16628    personne 
   TABLE DATA               Y   COPY personne (nom, prenom, personne_type, date_naissance, rpps, compte, id) FROM stdin;
    public       postgres    false    172   }       �           0    0    personne_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('personne_id_seq', 4, true);
            public       postgres    false    176            �          0    24820 
   traitement 
   TABLE DATA                  COPY traitement  FROM stdin;
    public       postgres    false    174   �       r           2606    33037    pk_personne 
   CONSTRAINT     K   ALTER TABLE ONLY personne
    ADD CONSTRAINT pk_personne PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.personne DROP CONSTRAINT pk_personne;
       public         postgres    false    172    172            �      x������ � �      �      x������ � �      �   (   x��MM1�̅�əy�1~Pd�2���&\1z\\\ J��      �      x������ � �     