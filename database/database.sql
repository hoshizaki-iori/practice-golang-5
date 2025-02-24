PGDMP     0    "                 z            mission_to_the_moon    14.1    14.1                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16552    mission_to_the_moon    DATABASE     n   CREATE DATABASE mission_to_the_moon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Thai_Thailand.874';
 #   DROP DATABASE mission_to_the_moon;
                postgres    false            �            1259    16584    crew    TABLE     y   CREATE TABLE public.crew (
    id integer NOT NULL,
    name character varying NOT NULL,
    birth_date date NOT NULL
);
    DROP TABLE public.crew;
       public         heap    postgres    false            �            1259    16583    crew_id_seq    SEQUENCE     �   CREATE SEQUENCE public.crew_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.crew_id_seq;
       public          postgres    false    214                       0    0    crew_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.crew_id_seq OWNED BY public.crew.id;
          public          postgres    false    213            �            1259    16593    crew_op    TABLE     s   CREATE TABLE public.crew_op (
    id integer NOT NULL,
    crew_id integer NOT NULL,
    op_id integer NOT NULL
);
    DROP TABLE public.crew_op;
       public         heap    postgres    false            �            1259    16592    crew_op_id_seq    SEQUENCE     �   CREATE SEQUENCE public.crew_op_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.crew_op_id_seq;
       public          postgres    false    216                       0    0    crew_op_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.crew_op_id_seq OWNED BY public.crew_op.id;
          public          postgres    false    215            �            1259    16568    mission    TABLE     �   CREATE TABLE public.mission (
    id integer NOT NULL,
    op_id integer NOT NULL,
    crew_size integer NOT NULL,
    rocket character varying(40) NOT NULL,
    launch_site character varying(40) NOT NULL,
    launch_date date NOT NULL
);
    DROP TABLE public.mission;
       public         heap    postgres    false            �            1259    16567    mission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.mission_id_seq;
       public          postgres    false    212                       0    0    mission_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.mission_id_seq OWNED BY public.mission.id;
          public          postgres    false    211            �            1259    16561 	   operation    TABLE     j   CREATE TABLE public.operation (
    op_id integer NOT NULL,
    op_name character varying(50) NOT NULL
);
    DROP TABLE public.operation;
       public         heap    postgres    false            �            1259    16560    operation_op_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operation_op_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.operation_op_id_seq;
       public          postgres    false    210                       0    0    operation_op_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.operation_op_id_seq OWNED BY public.operation.op_id;
          public          postgres    false    209            m           2604    16587    crew id    DEFAULT     b   ALTER TABLE ONLY public.crew ALTER COLUMN id SET DEFAULT nextval('public.crew_id_seq'::regclass);
 6   ALTER TABLE public.crew ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            n           2604    16596 
   crew_op id    DEFAULT     h   ALTER TABLE ONLY public.crew_op ALTER COLUMN id SET DEFAULT nextval('public.crew_op_id_seq'::regclass);
 9   ALTER TABLE public.crew_op ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            l           2604    16571 
   mission id    DEFAULT     h   ALTER TABLE ONLY public.mission ALTER COLUMN id SET DEFAULT nextval('public.mission_id_seq'::regclass);
 9   ALTER TABLE public.mission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            k           2604    16564    operation op_id    DEFAULT     r   ALTER TABLE ONLY public.operation ALTER COLUMN op_id SET DEFAULT nextval('public.operation_op_id_seq'::regclass);
 >   ALTER TABLE public.operation ALTER COLUMN op_id DROP DEFAULT;
       public          postgres    false    210    209    210                      0    16584    crew 
   TABLE DATA           4   COPY public.crew (id, name, birth_date) FROM stdin;
    public          postgres    false    214   �        	          0    16593    crew_op 
   TABLE DATA           5   COPY public.crew_op (id, crew_id, op_id) FROM stdin;
    public          postgres    false    216   �                  0    16568    mission 
   TABLE DATA           Y   COPY public.mission (id, op_id, crew_size, rocket, launch_site, launch_date) FROM stdin;
    public          postgres    false    212   )!                 0    16561 	   operation 
   TABLE DATA           3   COPY public.operation (op_id, op_name) FROM stdin;
    public          postgres    false    210   {!                  0    0    crew_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.crew_id_seq', 12, true);
          public          postgres    false    213                       0    0    crew_op_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.crew_op_id_seq', 5, true);
          public          postgres    false    215                       0    0    mission_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.mission_id_seq', 4, true);
          public          postgres    false    211                       0    0    operation_op_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.operation_op_id_seq', 4, true);
          public          postgres    false    209            v           2606    16598    crew_op crew_op_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.crew_op
    ADD CONSTRAINT crew_op_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.crew_op DROP CONSTRAINT crew_op_pkey;
       public            postgres    false    216            r           2606    16573    mission crew_operation_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.mission
    ADD CONSTRAINT crew_operation_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.mission DROP CONSTRAINT crew_operation_pkey;
       public            postgres    false    212            t           2606    16591    crew crew_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.crew DROP CONSTRAINT crew_pkey;
       public            postgres    false    214            p           2606    16566    operation operation_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (op_id);
 B   ALTER TABLE ONLY public.operation DROP CONSTRAINT operation_pkey;
       public            postgres    false    210               d   x�ʱ@0 й��'w-+��E��MZ��1�'��vѧ%�.�sbZ���{�?N��,×IF��وu�;l���Ě��9���      	      x�3�4�4�2�4����@2F��� !��         B   x�3�4�4�N,)-�S�tRp�520�tN,HU�N��KM�T�q�56�4�43�50�52����� ���         $   x�3�t�520Qp,����W0�2�2͹b���� �m      