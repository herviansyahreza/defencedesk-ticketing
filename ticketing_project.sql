PGDMP      #                |            ticketing_project    16.1    16.1 `    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    24579    ticketing_project    DATABASE     �   CREATE DATABASE ticketing_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 !   DROP DATABASE ticketing_project;
                postgres    false            �            1259    24606    aset    TABLE     �   CREATE TABLE public.aset (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    kategori integer,
    lokasi integer
);
    DROP TABLE public.aset;
       public         heap    postgres    false            �            1259    24605    aset_id_aset_seq    SEQUENCE     �   CREATE SEQUENCE public.aset_id_aset_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.aset_id_aset_seq;
       public          postgres    false    220            ^           0    0    aset_id_aset_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.aset_id_aset_seq OWNED BY public.aset.id;
          public          postgres    false    219            �            1259    24684    aset_kategori    TABLE     i   CREATE TABLE public.aset_kategori (
    id integer NOT NULL,
    nama character varying(255) NOT NULL
);
 !   DROP TABLE public.aset_kategori;
       public         heap    postgres    false            �            1259    24683    aset_kategori_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aset_kategori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.aset_kategori_id_seq;
       public          postgres    false    230            _           0    0    aset_kategori_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.aset_kategori_id_seq OWNED BY public.aset_kategori.id;
          public          postgres    false    229            �            1259    24671    lokasi    TABLE     b   CREATE TABLE public.lokasi (
    id integer NOT NULL,
    nama character varying(255) NOT NULL
);
    DROP TABLE public.lokasi;
       public         heap    postgres    false            �            1259    24670    gedung_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gedung_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.gedung_id_seq;
       public          postgres    false    228            `           0    0    gedung_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.gedung_id_seq OWNED BY public.lokasi.id;
          public          postgres    false    227            �            1259    24633    peran    TABLE     u   CREATE TABLE public.peran (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    deskripsi text
);
    DROP TABLE public.peran;
       public         heap    postgres    false            �            1259    24632    peran_id_peran_seq    SEQUENCE     �   CREATE SEQUENCE public.peran_id_peran_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.peran_id_peran_seq;
       public          postgres    false    226            a           0    0    peran_id_peran_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.peran_id_peran_seq OWNED BY public.peran.id;
          public          postgres    false    225            �            1259    24624 	   prioritas    TABLE     }   CREATE TABLE public.prioritas (
    id integer NOT NULL,
    nama character varying NOT NULL,
    deskripsi text NOT NULL
);
    DROP TABLE public.prioritas;
       public         heap    postgres    false            �            1259    24623    prioritas_id_prioritas_seq    SEQUENCE     �   CREATE SEQUENCE public.prioritas_id_prioritas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.prioritas_id_prioritas_seq;
       public          postgres    false    224            b           0    0    prioritas_id_prioritas_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.prioritas_id_prioritas_seq OWNED BY public.prioritas.id;
          public          postgres    false    223            �            1259    24615    status    TABLE        CREATE TABLE public.status (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    deskripsi text NOT NULL
);
    DROP TABLE public.status;
       public         heap    postgres    false            �            1259    24614    status_id_status_seq    SEQUENCE     �   CREATE SEQUENCE public.status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.status_id_status_seq;
       public          postgres    false    222            c           0    0    status_id_status_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.status_id_status_seq OWNED BY public.status.id;
          public          postgres    false    221            �            1259    24589    tiket    TABLE     x  CREATE TABLE public.tiket (
    judul character varying(255) NOT NULL,
    deskripsi text NOT NULL,
    status integer NOT NULL,
    prioritas integer,
    created_at timestamp with time zone,
    edited_at timestamp with time zone,
    id integer NOT NULL,
    user_id integer,
    deleted_at timestamp with time zone,
    aset integer,
    solusi text,
    nomor integer
);
    DROP TABLE public.tiket;
       public         heap    postgres    false            �            1259    24698 
   tiket_aset    TABLE     a   CREATE TABLE public.tiket_aset (
    id integer NOT NULL,
    tiket integer,
    aset integer
);
    DROP TABLE public.tiket_aset;
       public         heap    postgres    false            �            1259    24697    tiket_aset_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tiket_aset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tiket_aset_id_seq;
       public          postgres    false    234            d           0    0    tiket_aset_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tiket_aset_id_seq OWNED BY public.tiket_aset.id;
          public          postgres    false    233            �            1259    24596    tiket_id_tiket_seq    SEQUENCE     �   CREATE SEQUENCE public.tiket_id_tiket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tiket_id_tiket_seq;
       public          postgres    false    217            e           0    0    tiket_id_tiket_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.tiket_id_tiket_seq OWNED BY public.tiket.id;
          public          postgres    false    218            �            1259    24827    tiket_nomor_seq    SEQUENCE     |   CREATE SEQUENCE public.tiket_nomor_seq
    START WITH 10014
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tiket_nomor_seq;
       public          postgres    false            �            1259    24705    tiket_progres    TABLE     �   CREATE TABLE public.tiket_progres (
    id integer NOT NULL,
    tiket integer,
    status integer,
    keterangan character varying(255),
    created_at time with time zone,
    updated_at time with time zone
);
 !   DROP TABLE public.tiket_progres;
       public         heap    postgres    false            �            1259    24704    tiket_progres_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tiket_progres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tiket_progres_id_seq;
       public          postgres    false    236            f           0    0    tiket_progres_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tiket_progres_id_seq OWNED BY public.tiket_progres.id;
          public          postgres    false    235            �            1259    24691    tiket_teknisi    TABLE     g   CREATE TABLE public.tiket_teknisi (
    id integer NOT NULL,
    tiket integer,
    teknisi integer
);
 !   DROP TABLE public.tiket_teknisi;
       public         heap    postgres    false            �            1259    24690    tiket_teknisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tiket_teknisi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tiket_teknisi_id_seq;
       public          postgres    false    232            g           0    0    tiket_teknisi_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tiket_teknisi_id_seq OWNED BY public.tiket_teknisi.id;
          public          postgres    false    231            �            1259    24581    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp with time zone,
    edited_at timestamp with time zone,
    peran integer,
    approved boolean DEFAULT false,
    nim character varying(32),
    prodi character varying(255),
    refresh_token text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24580    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            h           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            �           2604    24609    aset id    DEFAULT     g   ALTER TABLE ONLY public.aset ALTER COLUMN id SET DEFAULT nextval('public.aset_id_aset_seq'::regclass);
 6   ALTER TABLE public.aset ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    24687    aset_kategori id    DEFAULT     t   ALTER TABLE ONLY public.aset_kategori ALTER COLUMN id SET DEFAULT nextval('public.aset_kategori_id_seq'::regclass);
 ?   ALTER TABLE public.aset_kategori ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    24674 	   lokasi id    DEFAULT     f   ALTER TABLE ONLY public.lokasi ALTER COLUMN id SET DEFAULT nextval('public.gedung_id_seq'::regclass);
 8   ALTER TABLE public.lokasi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    24636    peran id    DEFAULT     j   ALTER TABLE ONLY public.peran ALTER COLUMN id SET DEFAULT nextval('public.peran_id_peran_seq'::regclass);
 7   ALTER TABLE public.peran ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    24627    prioritas id    DEFAULT     v   ALTER TABLE ONLY public.prioritas ALTER COLUMN id SET DEFAULT nextval('public.prioritas_id_prioritas_seq'::regclass);
 ;   ALTER TABLE public.prioritas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    24618 	   status id    DEFAULT     m   ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_status_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    24597    tiket id    DEFAULT     j   ALTER TABLE ONLY public.tiket ALTER COLUMN id SET DEFAULT nextval('public.tiket_id_tiket_seq'::regclass);
 7   ALTER TABLE public.tiket ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    24701    tiket_aset id    DEFAULT     n   ALTER TABLE ONLY public.tiket_aset ALTER COLUMN id SET DEFAULT nextval('public.tiket_aset_id_seq'::regclass);
 <   ALTER TABLE public.tiket_aset ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    24708    tiket_progres id    DEFAULT     t   ALTER TABLE ONLY public.tiket_progres ALTER COLUMN id SET DEFAULT nextval('public.tiket_progres_id_seq'::regclass);
 ?   ALTER TABLE public.tiket_progres ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    24694    tiket_teknisi id    DEFAULT     t   ALTER TABLE ONLY public.tiket_teknisi ALTER COLUMN id SET DEFAULT nextval('public.tiket_teknisi_id_seq'::regclass);
 ?   ALTER TABLE public.tiket_teknisi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    24584    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            F          0    24606    aset 
   TABLE DATA                 public          postgres    false    220   �h       P          0    24684    aset_kategori 
   TABLE DATA                 public          postgres    false    230   j       N          0    24671    lokasi 
   TABLE DATA                 public          postgres    false    228   �j       L          0    24633    peran 
   TABLE DATA                 public          postgres    false    226   �k       J          0    24624 	   prioritas 
   TABLE DATA                 public          postgres    false    224   �l       H          0    24615    status 
   TABLE DATA                 public          postgres    false    222   �m       C          0    24589    tiket 
   TABLE DATA                 public          postgres    false    217   Ro       T          0    24698 
   tiket_aset 
   TABLE DATA                 public          postgres    false    234   �s       V          0    24705    tiket_progres 
   TABLE DATA                 public          postgres    false    236   �s       R          0    24691    tiket_teknisi 
   TABLE DATA                 public          postgres    false    232   t       B          0    24581    users 
   TABLE DATA                 public          postgres    false    216   t       i           0    0    aset_id_aset_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.aset_id_aset_seq', 33, true);
          public          postgres    false    219            j           0    0    aset_kategori_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.aset_kategori_id_seq', 1, false);
          public          postgres    false    229            k           0    0    gedung_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.gedung_id_seq', 2, true);
          public          postgres    false    227            l           0    0    peran_id_peran_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.peran_id_peran_seq', 5, true);
          public          postgres    false    225            m           0    0    prioritas_id_prioritas_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.prioritas_id_prioritas_seq', 5, true);
          public          postgres    false    223            n           0    0    status_id_status_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.status_id_status_seq', 7, true);
          public          postgres    false    221            o           0    0    tiket_aset_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tiket_aset_id_seq', 1, true);
          public          postgres    false    233            p           0    0    tiket_id_tiket_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tiket_id_tiket_seq', 71, true);
          public          postgres    false    218            q           0    0    tiket_nomor_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tiket_nomor_seq', 10017, true);
          public          postgres    false    237            r           0    0    tiket_progres_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tiket_progres_id_seq', 1, false);
          public          postgres    false    235            s           0    0    tiket_teknisi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tiket_teknisi_id_seq', 1, false);
          public          postgres    false    231            t           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 64, true);
          public          postgres    false    215            �           2606    24689     aset_kategori aset_kategori_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.aset_kategori
    ADD CONSTRAINT aset_kategori_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.aset_kategori DROP CONSTRAINT aset_kategori_pkey;
       public            postgres    false    230            �           2606    24613    aset aset_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.aset
    ADD CONSTRAINT aset_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.aset DROP CONSTRAINT aset_pkey;
       public            postgres    false    220            �           2606    24676    lokasi gedung_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.lokasi
    ADD CONSTRAINT gedung_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.lokasi DROP CONSTRAINT gedung_pkey;
       public            postgres    false    228            �           2606    24640    peran peran_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.peran
    ADD CONSTRAINT peran_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.peran DROP CONSTRAINT peran_pkey;
       public            postgres    false    226            �           2606    24631    prioritas prioritas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.prioritas
    ADD CONSTRAINT prioritas_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.prioritas DROP CONSTRAINT prioritas_pkey;
       public            postgres    false    224            �           2606    24622    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    222            �           2606    24703    tiket_aset tiket_aset_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tiket_aset
    ADD CONSTRAINT tiket_aset_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tiket_aset DROP CONSTRAINT tiket_aset_pkey;
       public            postgres    false    234            �           2606    24604    tiket tiket_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tiket DROP CONSTRAINT tiket_pkey;
       public            postgres    false    217            �           2606    24710     tiket_progres tiket_progres_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tiket_progres
    ADD CONSTRAINT tiket_progres_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tiket_progres DROP CONSTRAINT tiket_progres_pkey;
       public            postgres    false    236            �           2606    24696     tiket_teknisi tiket_teknisi_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tiket_teknisi
    ADD CONSTRAINT tiket_teknisi_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tiket_teknisi DROP CONSTRAINT tiket_teknisi_pkey;
       public            postgres    false    232            �           2606    24588    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    24716    aset aset_kategori    FK CONSTRAINT     �   ALTER TABLE ONLY public.aset
    ADD CONSTRAINT aset_kategori FOREIGN KEY (kategori) REFERENCES public.aset_kategori(id) NOT VALID;
 <   ALTER TABLE ONLY public.aset DROP CONSTRAINT aset_kategori;
       public          postgres    false    230    220    4766            �           2606    24721    aset aset_lokasi    FK CONSTRAINT     y   ALTER TABLE ONLY public.aset
    ADD CONSTRAINT aset_lokasi FOREIGN KEY (lokasi) REFERENCES public.lokasi(id) NOT VALID;
 :   ALTER TABLE ONLY public.aset DROP CONSTRAINT aset_lokasi;
       public          postgres    false    220    4764    228            �           2606    24801    tiket tiket_aset    FK CONSTRAINT     u   ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_aset FOREIGN KEY (aset) REFERENCES public.aset(id) NOT VALID;
 :   ALTER TABLE ONLY public.tiket DROP CONSTRAINT tiket_aset;
       public          postgres    false    4756    220    217            �           2606    24756    tiket_aset tiket_aset_aset    FK CONSTRAINT        ALTER TABLE ONLY public.tiket_aset
    ADD CONSTRAINT tiket_aset_aset FOREIGN KEY (aset) REFERENCES public.aset(id) NOT VALID;
 D   ALTER TABLE ONLY public.tiket_aset DROP CONSTRAINT tiket_aset_aset;
       public          postgres    false    4756    220    234            �           2606    24751    tiket_aset tiket_aset_tiket    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiket_aset
    ADD CONSTRAINT tiket_aset_tiket FOREIGN KEY (tiket) REFERENCES public.tiket(id) NOT VALID;
 E   ALTER TABLE ONLY public.tiket_aset DROP CONSTRAINT tiket_aset_tiket;
       public          postgres    false    4754    234    217            �           2606    24731    tiket tiket_prioritas    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_prioritas FOREIGN KEY (prioritas) REFERENCES public.prioritas(id) NOT VALID;
 ?   ALTER TABLE ONLY public.tiket DROP CONSTRAINT tiket_prioritas;
       public          postgres    false    217    4760    224            �           2606    24766 "   tiket_progres tiket_progres_status    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiket_progres
    ADD CONSTRAINT tiket_progres_status FOREIGN KEY (status) REFERENCES public.status(id) NOT VALID;
 L   ALTER TABLE ONLY public.tiket_progres DROP CONSTRAINT tiket_progres_status;
       public          postgres    false    222    236    4758            �           2606    24761 !   tiket_progres tiket_progres_tiket    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiket_progres
    ADD CONSTRAINT tiket_progres_tiket FOREIGN KEY (tiket) REFERENCES public.tiket(id) NOT VALID;
 K   ALTER TABLE ONLY public.tiket_progres DROP CONSTRAINT tiket_progres_tiket;
       public          postgres    false    4754    236    217            �           2606    24736    tiket tiket_status    FK CONSTRAINT     {   ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_status FOREIGN KEY (status) REFERENCES public.status(id) NOT VALID;
 <   ALTER TABLE ONLY public.tiket DROP CONSTRAINT tiket_status;
       public          postgres    false    217    222    4758            �           2606    24746 #   tiket_teknisi tiket_teknisi_teknisi    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiket_teknisi
    ADD CONSTRAINT tiket_teknisi_teknisi FOREIGN KEY (teknisi) REFERENCES public.users(id) NOT VALID;
 M   ALTER TABLE ONLY public.tiket_teknisi DROP CONSTRAINT tiket_teknisi_teknisi;
       public          postgres    false    232    4752    216            �           2606    24741 !   tiket_teknisi tiket_teknisi_tiket    FK CONSTRAINT     �   ALTER TABLE ONLY public.tiket_teknisi
    ADD CONSTRAINT tiket_teknisi_tiket FOREIGN KEY (tiket) REFERENCES public.tiket(id) NOT VALID;
 K   ALTER TABLE ONLY public.tiket_teknisi DROP CONSTRAINT tiket_teknisi_tiket;
       public          postgres    false    4754    232    217            �           2606    24726    tiket tiket_users    FK CONSTRAINT     z   ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_users FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 ;   ALTER TABLE ONLY public.tiket DROP CONSTRAINT tiket_users;
       public          postgres    false    217    216    4752            �           2606    24711    users user_peran    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_peran FOREIGN KEY (peran) REFERENCES public.peran(id) NOT VALID;
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT user_peran;
       public          postgres    false    4762    226    216            F     x���=o�0��=��6@rQ�� �B-�
��ۤ�"(6�߯+��|��9���)v��~�r�rwx�����sejS]	�U����Oè��Y=����q���D�7��a[w���4�u���2�.��r/=��=7_��������������Cw��z��5�ʕ�Rih��h�ݺU��N���e_��� ��~?���d��@�9;����X�@�$HnA��<�	�p� 9F� �Q�� �����YpI��I�1rtyD�70+A      P   �   x���v
Q���W((M��L�K,N-��N,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�L�T״��$C�P�w~nAiIj�f�ܐ�T�Y�J�&@#��)q�)Є��̒�rM0��ZTq K;{      N   E  x����k�0��Ż� bR������L����m�&�M����
M[�N��O�&/IN��������[ɟ�2�F2�����>|n�0b�D��."��@;e��� 	����P䇢`h^���iY�&���D�s�u3ZN�D�sVM$<�����KeuВzH��Y�q��Y���,�I-���"F�[1B�#d��{��SKx�ɬ(Ps��(!;�E	�+��"�O{Kg�bx8g�bx5����䨃#��;8B���]Q��jln"�F����(,>PS����R�B��]���[��S�p�n����G8V�j;'J{�J�t�?U��0      L   �   x����n�0�w?7'�Q���)CEZ4nw�F-HԐ�/�38K�v����wR{:?:hO���{�~�6!ÎL�06�D1�����3���-Ca�73��<@X5�i��ؠI<��Ħ3����BΊj<)#��I�|�e�C��ڿQ?)igS�;�7�'G3]a)n�������I��Z=�D4+�g�c�d�w���G�>�@Z@*�/-��%���ff[�`���~ ��      J     x���Mk�0�{~�ni!�q�i��]k��2G8v�-3��'w��Ne=9��'o�?l�����2������ĂVl:�C�%�����;n����-_�;�,֡��H���,Q08u�3���E�Z[`��03јM�~j�����J���
���T�'?)�ө�&�ߐ`�Y��j|P���*a=,���K}�d��[E�*9&��ӷF@�9r�s0��<���_�sf@	RjO^��ǌ3N�����l���K      H   C  x���MK�@@��sk���œH����V�w��������I���s
�yo[,7����v�����)c�v3�p����$������b���W�؞[���ĨpD�CIA+p������nT��si���X�#�t�%r-��Q�a�
�X'J`zG
��QI\��
<���z�^��Y�!�d�&X�d���6�R��� S��QS�d�aM��ڊ��eǱ���>���Ա��8��� �sy�o�6N�Ʋ��M�X8�n���R�.��%���6A<U긓)�c{.10x�$V
۟������A��k��w4���      C   k  x�՘Ko�8������:_z�i��A[�n�X�k�z��E��)ɕ-�g-��8Q�����8����6��u�7:�m�w�չjч��l�F�jr�O�^����m��dtmt+�rg�lU�M�k�2=\�l�l��7w��B�Q��ԅu��6��?��<|FV��Z�������#Lܓ�E����)�0��o$Z�w�{#�^��v�"��d�^�<?������?�~��$ �r�é�5�&F4JM�,�o�!���h K@�@�1�pih��6�B?�w�J�j�i��B6��y���>ԦEܝ�������L�h��tƕj1X��P�Q�(f4��ȉc,�b|A>�6�R�{��L����H��-�;.Gr����{�齭���U����蓪޻_�?\f�pOW�>��(��OϥQ�D�ڪջt��{�E]�*t��c�QF�=�F�	�R3����g�F���C���������7����]���`�#��_eLWv|�0� �� J$���H���^�v�/l\u��X���U�׼:S���$H�%(J��G����]���rG�MnME�$)�3G8f7E�sL d�oWbiD.*�$e���I�sjm���CE9Q������
R��(淴Xp�~��^<�/�y�U��)�����J��,�_�W!˓E���2���+d���>
}��D��>4(SB0��)u(q�Ř:c����@���w���Ѣ�ӧޓ9�n��K�\,]xs�k]��P�?���	����Lg9��q�D�h��'TL#�Fax�8	�� �D�{2� Pm�x���dҀ�2�B��'e�0�hT�N� ����"Bɢ#�,�n�:����D��Qh��g�ű�PH��è9f�W�3�G7��K_��6��
])ܵ1�$��,auK`O�$1����:�gy��떓��_Ҕ0\�g��=������0z��?��7��9^�pӯw-�4����+�h8F���e�O�]�����k��X���}�8�sb����m^����Z8�-��/A`,�͉�����y���z@r�P "�1���`��*X�z9Z�d�j��9IpH���<2R�i���q�佻�a~      T   
   x���          V   
   x���          R   
   x���          B   �  x�՗I��H���+8tDu�ؘ$��e�XD�KG*�� `�X���Ꚛn���D��ef��x[cg0sc��L�oC�c�Ӕ�B�S�:��O��&Aiz�i9��e����r�#?�S5�$4.p�."�RKc�4�����,p��Yt���a�J�y�x'�O����_���.>U��p���y�7W[�;�6#��iO;6����4���V�tR,��Tᕘl�(|�7�b8���mNfyI����xn��k0��O}����3�ӌ�<�Q���럟��&��<-�(af�?!���T�|����n4s4��mg���0৭^���!Al��յ���4?*"�����������Ə/W ��c��lD���P�=B�r�C�Pt���'T)j�i@�*7Ͳ�Py��@��A]�]i��4-�6�"��L�gvh?����s,l	?�ۣ0��_\�[%�㡓*t[/y�2�/���g�n�rsһq+z�l8�6����Nb��e�\g��\�{���5ؔ6�Ypbް�8���uHB��'��SQ�#Z���K� �Agՙ���+́�-�r�}q��J��di㕁�C�_��H&\kR�V[TXEQ~�w�+@��އ[�2.�ѩ�z��ݾ'T>k��a;��ewe#�6ӹ8qR�fxf_�M��{~�;*��]:�X�$=XE-�������!2?@�4p�TV�#�<zH+���b!�JЍ%�l*��Ȧ��@��&k;�!q�/\�����9?�l�����6T��s ��`��{�UQY4R�`���6%w+�W��~q���J��pd��la�1���6#Y��x��N�e(-(����s=�-B���{p��_�+R�f��{��P@�5��~����V�؅Q��n6Ku�o��r��X�ʩ���ͻ�͹���{|`8�-�U��Gy���+x�~E�U��E1��aFy��^�ߋ����ַ�as;�I'Ht'Q���^�q���98���H▪�A3Q�YP�QhC�
��}˽���#������L�B��^�?Z�k9y�\.c��xA����Q�DNYDT}*{�k���(��$�]Çy-�2�E��-GN~h�B��GzELP ��	Ezq�m��?�%[�,r�T��]j�3�mz~>��	�t~h�N����`�=���"��"�'�O��K��l     