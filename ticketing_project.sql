--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-07-15 17:52:10

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 24606)
-- Name: aset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aset (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    kategori integer,
    lokasi integer
);


ALTER TABLE public.aset OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24605)
-- Name: aset_id_aset_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aset_id_aset_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aset_id_aset_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 219
-- Name: aset_id_aset_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aset_id_aset_seq OWNED BY public.aset.id;


--
-- TOC entry 230 (class 1259 OID 24684)
-- Name: aset_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aset_kategori (
    id integer NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE public.aset_kategori OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24683)
-- Name: aset_kategori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aset_kategori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aset_kategori_id_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 229
-- Name: aset_kategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aset_kategori_id_seq OWNED BY public.aset_kategori.id;


--
-- TOC entry 228 (class 1259 OID 24671)
-- Name: lokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lokasi (
    id integer NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE public.lokasi OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24670)
-- Name: gedung_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gedung_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gedung_id_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 227
-- Name: gedung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gedung_id_seq OWNED BY public.lokasi.id;


--
-- TOC entry 226 (class 1259 OID 24633)
-- Name: peran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peran (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    deskripsi text
);


ALTER TABLE public.peran OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24632)
-- Name: peran_id_peran_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peran_id_peran_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peran_id_peran_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 225
-- Name: peran_id_peran_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peran_id_peran_seq OWNED BY public.peran.id;


--
-- TOC entry 224 (class 1259 OID 24624)
-- Name: prioritas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prioritas (
    id integer NOT NULL,
    nama character varying NOT NULL,
    deskripsi text NOT NULL
);


ALTER TABLE public.prioritas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24623)
-- Name: prioritas_id_prioritas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prioritas_id_prioritas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prioritas_id_prioritas_seq OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 223
-- Name: prioritas_id_prioritas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prioritas_id_prioritas_seq OWNED BY public.prioritas.id;


--
-- TOC entry 222 (class 1259 OID 24615)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    deskripsi text NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24614)
-- Name: status_id_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_id_status_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 221
-- Name: status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_status_seq OWNED BY public.status.id;


--
-- TOC entry 217 (class 1259 OID 24589)
-- Name: tiket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiket (
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


ALTER TABLE public.tiket OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24698)
-- Name: tiket_aset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiket_aset (
    id integer NOT NULL,
    tiket integer,
    aset integer
);


ALTER TABLE public.tiket_aset OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24697)
-- Name: tiket_aset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiket_aset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tiket_aset_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 233
-- Name: tiket_aset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiket_aset_id_seq OWNED BY public.tiket_aset.id;


--
-- TOC entry 218 (class 1259 OID 24596)
-- Name: tiket_id_tiket_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiket_id_tiket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tiket_id_tiket_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 218
-- Name: tiket_id_tiket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiket_id_tiket_seq OWNED BY public.tiket.id;


--
-- TOC entry 237 (class 1259 OID 24827)
-- Name: tiket_nomor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiket_nomor_seq
    START WITH 10014
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tiket_nomor_seq OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 24705)
-- Name: tiket_progres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiket_progres (
    id integer NOT NULL,
    tiket integer,
    status integer,
    keterangan character varying(255),
    created_at time with time zone,
    updated_at time with time zone
);


ALTER TABLE public.tiket_progres OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 24704)
-- Name: tiket_progres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiket_progres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tiket_progres_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 235
-- Name: tiket_progres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiket_progres_id_seq OWNED BY public.tiket_progres.id;


--
-- TOC entry 232 (class 1259 OID 24691)
-- Name: tiket_teknisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiket_teknisi (
    id integer NOT NULL,
    tiket integer,
    teknisi integer
);


ALTER TABLE public.tiket_teknisi OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24690)
-- Name: tiket_teknisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiket_teknisi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tiket_teknisi_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 231
-- Name: tiket_teknisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiket_teknisi_id_seq OWNED BY public.tiket_teknisi.id;


--
-- TOC entry 216 (class 1259 OID 24581)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
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


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24580)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4742 (class 2604 OID 24609)
-- Name: aset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aset ALTER COLUMN id SET DEFAULT nextval('public.aset_id_aset_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 24687)
-- Name: aset_kategori id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aset_kategori ALTER COLUMN id SET DEFAULT nextval('public.aset_kategori_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 24674)
-- Name: lokasi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokasi ALTER COLUMN id SET DEFAULT nextval('public.gedung_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 24636)
-- Name: peran id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peran ALTER COLUMN id SET DEFAULT nextval('public.peran_id_peran_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 24627)
-- Name: prioritas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prioritas ALTER COLUMN id SET DEFAULT nextval('public.prioritas_id_prioritas_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 24618)
-- Name: status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_status_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 24597)
-- Name: tiket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket ALTER COLUMN id SET DEFAULT nextval('public.tiket_id_tiket_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 24701)
-- Name: tiket_aset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_aset ALTER COLUMN id SET DEFAULT nextval('public.tiket_aset_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 24708)
-- Name: tiket_progres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_progres ALTER COLUMN id SET DEFAULT nextval('public.tiket_progres_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 24694)
-- Name: tiket_teknisi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_teknisi ALTER COLUMN id SET DEFAULT nextval('public.tiket_teknisi_id_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 24584)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4934 (class 0 OID 24606)
-- Dependencies: 220
-- Data for Name: aset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aset (id, nama, kategori, lokasi) FROM stdin;
21	Wifi Kemhan go.id 	1	1
22	Wifi Kadet Mahasiswa	1	1
23	Wifi Unhan Mahasiswa	1	1
28	Komputer PC 1A	2	4
13	Wifi Unhan 1st-Class	1	10
2	Wifi Unhan 2nd-Class	1	10
12	Wifi Unhan 3rd-Class	1	10
8	Wifi Unhan 4th-Class	1	10
14	Wifi Unhan 5th-Class	1	12
15	Wifi Unhan 6th-Class	1	12
16	Wifi Unhan 7th-Class	1	12
17	Wifi Unhan 8th-Class	1	12
31	Wifi Unhan 14nd-Class	1	6
30	Wifi Unhan 13nd-Class	1	6
32	Wifi Unhan 15th-Class	1	6
33	Wifi Unhan 16th-Class	1	6
18	Wifi Unhan 9th-Class	1	5
19	Wifi Unhan 10th-Class	1	5
20	Wifi Unhan 11th-Class	1	5
29	Wifi Unhan 12th-Class	1	5
\.


--
-- TOC entry 4944 (class 0 OID 24684)
-- Dependencies: 230
-- Data for Name: aset_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aset_kategori (id, nama) FROM stdin;
1	Wifi
2	Komputer
3	Website
4	Router
5	Switch
6	Server
\.


--
-- TOC entry 4942 (class 0 OID 24671)
-- Dependencies: 228
-- Data for Name: lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lokasi (id, nama) FROM stdin;
1	Gedung Rektorat Lt.1
2	Gedung Rektorat Lt.2
3	Gedung Rektorat Lt.3
4	Gedung Roum Lt.1
5	Gedung Roum Lt.2
6	Gedung Roum Lt.3
7	Gedung Roak Lt.1
8	Gedung Roak Lt.2
9	Gedung Roak Lt.3
10	Gedung Auditorium Lt.1
11	Gedung Auditorium Lt.2
12	Gedung Auditorium Lt.3
13	Gedung Dining Hall Lt.1
14	Gedung Dining Hall Lt.2
15	Gedung Dining Hall Lt.3
16	Gedung Fakultas Kedokteran Lt.1
17	Gedung Fakultas Kedokteran Lt.2
18	Gedung Fakultas Kedokteran Lt.3
19	Gedung Fakultas Farmasi Lt.1
20	Gedung Fakultas Farmasi Lt.2
21	Gedung Fakultas Farmasi Lt.3
22	Gedung Fakultas MIPA Lt.1
23	Gedung Fakultas MIPA Lt.2
24	Gedung Fakultas MIPA Lt.3
25	Gedung Fakultas Sains dan Teknologi Pertahanan Lt.1
26	Gedung Fakultas Sains dan Teknologi Pertahanan Lt.2
27	Gedung Fakultas Sains dan Teknologi Pertahanan Lt.3
28	Gedung Aula Merah Putih
29	Gedung Guest House
\.


--
-- TOC entry 4940 (class 0 OID 24633)
-- Dependencies: 226
-- Data for Name: peran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peran (id, nama, deskripsi) FROM stdin;
3	Pengguna	Pengguna biasa yang menggunakan sistem dengan hak terbatas dalam membuat tiket dan memonitor hanya tiketnya
2	Teknisi	Pengguna yang memiliki hak untuk memonitor tiket dan melakukan tindak lanjut pada tiket yang dilaporkan pengguna biasa
1	Administrator	Pengguna yang memiliki seluruh hak pada sistem
\.


--
-- TOC entry 4938 (class 0 OID 24624)
-- Dependencies: 224
-- Data for Name: prioritas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prioritas (id, nama, deskripsi) FROM stdin;
1	Low	Tiket dengan tingkat kepentingan rendah, tidak mengganggu operasi utama.
2	Medium	Tiket dengan tingkat kepentingan menengah, membutuhkan perhatian tetapi tidak mendesak.
3	High	Tiket dengan tingkat kepentingan tinggi, membutuhkan penanganan segera.
4	Urgent	Tiket yang sangat mendesak dan memerlukan tindakan segera untuk memperbaiki masalah kritis.
\.


--
-- TOC entry 4936 (class 0 OID 24615)
-- Dependencies: 222
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, nama, deskripsi) FROM stdin;
1	Open	Tiket baru yang belum ditangani.
2	In Progress	Tiket sedang ditangani atau dalam proses penyelesaian.
3	On Hold	Tiket ditangguhkan atau ditunda untuk sementara waktu.
4	Resolved	Tiket telah diselesaikan dan menunggu konfirmasi dari pelapor atau pengguna.
5	Closed	Tiket telah diselesaikan dan ditutup secara definitif.
6	Reopened	Tiket yang telah ditutup namun kemudian dibuka kembali karena masalah belum sepenuhnya diselesaikan.
\.


--
-- TOC entry 4931 (class 0 OID 24589)
-- Dependencies: 217
-- Data for Name: tiket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiket (judul, deskripsi, status, prioritas, created_at, edited_at, id, user_id, deleted_at, aset, solusi, nomor) FROM stdin;
bbbbbbbbbbbb	bbbbbbbbbbbbbbb	1	1	2024-06-27 14:26:37.116+07	2024-07-08 08:28:24.461+07	46	49	\N	13	\N	10003
eeeeeeeeeeeeeee	eeeeeeeeeeeeeeeeeeeeee	1	1	2024-06-28 17:41:20.258+07	2024-07-08 08:28:46.132+07	49	50	\N	15	\N	10006
Laporan wifi mati di kelas kedokteran cohort 3	Wifi mati dan tidak bisa internet.	6	4	2024-06-28 17:37:21.217+07	2024-07-08 08:30:20.482+07	48	50	\N	18	Tiket laporan sudah diselesaikan dan aset terkait sudah bisa digunakan kembali. Penyelesaian tiket laporan adalah dengan merestart aset karena sebelumnya ada gangguan lonjakan listrik. Terima Kasih.	10005
Laporan Wifi Kelas Teknik Elektro Co-1 Rusak	Wifi kelas elektro tidak bisa digunakan karena mati dan tidak bisa internet	1	3	2024-06-30 19:14:09.027+07	2024-07-08 08:31:04.51+07	52	50	\N	12	\N	10007
oooooooooo	ooooooooooooo	1	1	2024-06-27 11:26:53.059+07	2024-07-08 08:27:54.222+07	44	49	\N	2	\N	10001
cccccccccccccc	ccccccccccccccc	1	1	2024-06-28 09:07:57.828+07	2024-07-08 08:28:33.12+07	47	51	\N	13	\N	10004
Laporan Wifi Ruang Rapat Co-1 Rusak	Wifi di ruang rapat internetnya mati 	2	4	2024-06-30 19:15:39.783+07	2024-07-08 08:30:43.836+07	53	51	\N	8	\N	10008
Laporan Wifi di Kantin Rusak	Wifi di kantin dining hall tidak bisa digunakan karena lampu power mati, mohon untuk di restart ulang	2	3	2024-06-30 19:27:00.361+07	2024-07-08 08:30:53.376+07	54	51	\N	22	Tim teknisi akan menuju TKP untuk melakukan pengecekan, silakan ditunggu.	10009
Laporan Wifi di Kantin Mati	Wifi di kantin unhan mati dan tidak bisa digunakan	5	3	2024-06-30 20:54:49.914+07	2024-07-08 14:24:28.954+07	55	51	\N	22	Wifi sudah dinyalakan kembali dan dari server sudah diperbaiki oleh pihak teknisi	10010
Laporan Wifi Lab terpadu Ruang 1 mati dan tidak ada internet	Wifi mati dan tidak ada internet, mohon segera diperbaiki karena ada ujian yang harus online.	1	4	2024-07-08 08:34:00.923+07	2024-07-09 15:59:48.394+07	58	51	\N	22	\N	10011
Laporan Wifi di Kelas Farmasi Rusak	Wifi kelas farmasi rusak karena terjatuh. Mohon segera diperbaiki.	1	4	2024-07-10 11:17:34.682+07	2024-07-10 11:19:42.163+07	64	55	\N	16	\N	10012
Laporan Wifi Lab Farmasi Ruang 1 Mati 	Wifi ruang 1 lab farmasi tidak ada internet. Mohon segera diperbaiki karena ada kepentingan perhitungan laboratorium yang membutuhkan internet.	2	4	2024-07-10 11:19:12.568+07	2024-07-10 14:04:18.437+07	65	55	\N	22	\N	10013
aaaaaaaaaaaa	aaaaaaaaaaaaaaaa	1	1	2024-06-27 11:39:19.602+07	2024-07-08 08:28:14.187+07	45	49	\N	13	\N	10002
\.


--
-- TOC entry 4948 (class 0 OID 24698)
-- Dependencies: 234
-- Data for Name: tiket_aset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiket_aset (id, tiket, aset) FROM stdin;
\.


--
-- TOC entry 4950 (class 0 OID 24705)
-- Dependencies: 236
-- Data for Name: tiket_progres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiket_progres (id, tiket, status, keterangan, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4946 (class 0 OID 24691)
-- Dependencies: 232
-- Data for Name: tiket_teknisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiket_teknisi (id, tiket, teknisi) FROM stdin;
\.


--
-- TOC entry 4930 (class 0 OID 24581)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, created_at, edited_at, peran, approved, nim, prodi, refresh_token) FROM stdin;
48	Admin3	admin3@gmail.com	$2b$10$3.CUF9a2NAar/nHAkjSF/OQAOiegKcmJJDngbH1HivVyPILF2yiL.	2024-07-09 15:37:17.368+07	\N	1	t	10000003	Pustik Unhan	\N
50	Gutri Rahmad Zuwa	gutri@gmail.com	$2b$10$zrtSG3xvlOSbeU7Jk3Q9CeWcdNLep4Ada45/TTMBOUiBnFDsuj85e	2024-07-09 15:41:47.247+07	\N	3	t	320200401009	Informatika	\N
54	Agung Hirawan	agung@gmail.com	$2b$10$G0GQ8zGMM7c08gu/hG0kpeUIrT2bXGKzQsvYneI5vnR7n2s.x.PkG	2024-07-09 16:16:31.294+07	\N	3	f	320200304001	Fisika	\N
56	Abdul Hadi	hadi@gmail.com	$2b$10$kSV2rcfTv7/PCz1ZMnxGg.lEB/6p9D5tApICkJwJ/YtKXU7Ud.6Gu	2024-07-09 16:18:23.501+07	\N	3	f	320200404001	Teknik Sipil	\N
57	Abdul Fakhar	fakhar@gmail.com	$2b$10$hEAXAQlmuB6U0FeMhMTocOwK14RyrDo6MGNXIeDJM3VT.5iP42YG6	2024-07-09 16:19:58.888+07	\N	3	f	320200301001	Matematika	\N
51	Muhammad Azka	azka@gmail.com	$2b$10$FMgbROrMOB7IudZQU5PSsesteROwTZoYDdhaguc.28Ype0csQMa0W	2024-07-09 15:42:31.123+07	\N	3	t	320200402016	Teknik Elektro	\N
55	Raka Rajendra	rajen@gmail.com	$2b$10$VV4L8kBn88sdOr6LKV0tQ.LoakFBXPYOkza5ZfvTeWBC3EqumetfW	2024-07-09 16:17:28.911+07	\N	3	t	320200201023	Farmasi	\N
53	Teknisi3	teknisi3@gmail.com	$2b$10$HwTkRKgl6wj4j.FARVIDe.fov1OLn7HONeNeQSvkaWl6VriPsZ2ZW	2024-07-09 15:45:52.326+07	\N	2	t	20000003	Pustik Unhan	\N
61	Luthfi Cakrayuda	cakra@gmail.com	$2b$10$XHNT2np2JKBtRsH0pId3L.LWQsK.2T7s6SlTY/8JFEgaUBEZq9beS	2024-07-10 11:53:31.558+07	\N	3	f	320210401010	Informatika	\N
62	Alfiano Deni Kusuma	alfiano@gmail.com	$2b$10$HW3GDONl/bJN.pAkpHSpFOvvywLNve4s/EjR3wK61WFht2LpFytkS	2024-07-10 11:54:22.484+07	\N	3	f	320200401003	Informatika	\N
63	Muhammad Rifqi Fauzan	rifqi@gmail.com	$2b$10$vulSwwNTqW0eVi69UqsInu/aSoYDFHQ7d/yu2V3xcj6uHPpoTIh2u	2024-07-10 11:54:52.509+07	\N	3	f	320200401017	Informatika	\N
49	Arya Bagaskara Pratama	bagas@gmail.com	$2b$10$3pb70s62vuhXfkF7jbWGM.CI7bsqxq.JvejiiMH3JMIRACDajPkfy	2024-07-09 15:41:02.586+07	\N	3	t	320200401004	Informatika	\N
\.


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 219
-- Name: aset_id_aset_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aset_id_aset_seq', 33, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 229
-- Name: aset_kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aset_kategori_id_seq', 1, false);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 227
-- Name: gedung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gedung_id_seq', 2, true);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 225
-- Name: peran_id_peran_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peran_id_peran_seq', 5, true);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 223
-- Name: prioritas_id_prioritas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prioritas_id_prioritas_seq', 5, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 221
-- Name: status_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_status_seq', 7, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 233
-- Name: tiket_aset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_aset_id_seq', 1, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 218
-- Name: tiket_id_tiket_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_id_tiket_seq', 71, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 237
-- Name: tiket_nomor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_nomor_seq', 10017, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 235
-- Name: tiket_progres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_progres_id_seq', 1, false);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 231
-- Name: tiket_teknisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_teknisi_id_seq', 1, false);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 64, true);


--
-- TOC entry 4766 (class 2606 OID 24689)
-- Name: aset_kategori aset_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aset_kategori
    ADD CONSTRAINT aset_kategori_pkey PRIMARY KEY (id);


--
-- TOC entry 4756 (class 2606 OID 24613)
-- Name: aset aset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aset
    ADD CONSTRAINT aset_pkey PRIMARY KEY (id);


--
-- TOC entry 4764 (class 2606 OID 24676)
-- Name: lokasi gedung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokasi
    ADD CONSTRAINT gedung_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 24640)
-- Name: peran peran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peran
    ADD CONSTRAINT peran_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 24631)
-- Name: prioritas prioritas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prioritas
    ADD CONSTRAINT prioritas_pkey PRIMARY KEY (id);


--
-- TOC entry 4758 (class 2606 OID 24622)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 24703)
-- Name: tiket_aset tiket_aset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_aset
    ADD CONSTRAINT tiket_aset_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2606 OID 24604)
-- Name: tiket tiket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 24710)
-- Name: tiket_progres tiket_progres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_progres
    ADD CONSTRAINT tiket_progres_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 24696)
-- Name: tiket_teknisi tiket_teknisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_teknisi
    ADD CONSTRAINT tiket_teknisi_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 24588)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 24716)
-- Name: aset aset_kategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aset
    ADD CONSTRAINT aset_kategori FOREIGN KEY (kategori) REFERENCES public.aset_kategori(id) NOT VALID;


--
-- TOC entry 4779 (class 2606 OID 24721)
-- Name: aset aset_lokasi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aset
    ADD CONSTRAINT aset_lokasi FOREIGN KEY (lokasi) REFERENCES public.lokasi(id) NOT VALID;


--
-- TOC entry 4774 (class 2606 OID 24801)
-- Name: tiket tiket_aset; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_aset FOREIGN KEY (aset) REFERENCES public.aset(id) NOT VALID;


--
-- TOC entry 4782 (class 2606 OID 24756)
-- Name: tiket_aset tiket_aset_aset; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_aset
    ADD CONSTRAINT tiket_aset_aset FOREIGN KEY (aset) REFERENCES public.aset(id) NOT VALID;


--
-- TOC entry 4783 (class 2606 OID 24751)
-- Name: tiket_aset tiket_aset_tiket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_aset
    ADD CONSTRAINT tiket_aset_tiket FOREIGN KEY (tiket) REFERENCES public.tiket(id) NOT VALID;


--
-- TOC entry 4775 (class 2606 OID 24731)
-- Name: tiket tiket_prioritas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_prioritas FOREIGN KEY (prioritas) REFERENCES public.prioritas(id) NOT VALID;


--
-- TOC entry 4784 (class 2606 OID 24766)
-- Name: tiket_progres tiket_progres_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_progres
    ADD CONSTRAINT tiket_progres_status FOREIGN KEY (status) REFERENCES public.status(id) NOT VALID;


--
-- TOC entry 4785 (class 2606 OID 24761)
-- Name: tiket_progres tiket_progres_tiket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_progres
    ADD CONSTRAINT tiket_progres_tiket FOREIGN KEY (tiket) REFERENCES public.tiket(id) NOT VALID;


--
-- TOC entry 4776 (class 2606 OID 24736)
-- Name: tiket tiket_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_status FOREIGN KEY (status) REFERENCES public.status(id) NOT VALID;


--
-- TOC entry 4780 (class 2606 OID 24746)
-- Name: tiket_teknisi tiket_teknisi_teknisi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_teknisi
    ADD CONSTRAINT tiket_teknisi_teknisi FOREIGN KEY (teknisi) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 4781 (class 2606 OID 24741)
-- Name: tiket_teknisi tiket_teknisi_tiket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket_teknisi
    ADD CONSTRAINT tiket_teknisi_tiket FOREIGN KEY (tiket) REFERENCES public.tiket(id) NOT VALID;


--
-- TOC entry 4777 (class 2606 OID 24726)
-- Name: tiket tiket_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_users FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 4773 (class 2606 OID 24711)
-- Name: users user_peran; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_peran FOREIGN KEY (peran) REFERENCES public.peran(id) NOT VALID;


-- Completed on 2024-07-15 17:52:10

--
-- PostgreSQL database dump complete
--

