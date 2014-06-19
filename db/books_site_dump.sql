--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    login character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    roles_mask integer
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    author_id integer,
    name character varying(255) NOT NULL,
    series character varying(255) NOT NULL,
    publisher character varying(255) NOT NULL,
    year integer NOT NULL,
    pages integer NOT NULL,
    binding character varying(255) NOT NULL,
    format character varying(255) NOT NULL,
    isbn character varying(255) NOT NULL,
    weight integer NOT NULL,
    decription text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cover_file_name character varying(255),
    cover_content_type character varying(255),
    cover_file_size integer,
    cover_updated_at timestamp without time zone
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    book_id integer,
    email character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ancestry character varying(255),
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    moderated boolean DEFAULT false
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admins (id, email, login, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, roles_mask) FROM stdin;
15	full@admin.com	SuperUser	$2a$10$XO1whLx.2lOnCm/Ys7dIBuHsRD8I9eeUca/Iw4UIaaSWu3g4o1sBO	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 12:14:27.649648	2014-06-18 12:14:27.649648	3
14	moderator@ya.com	moder_mafakas	$2a$10$fFxb5pqyyLe7Pf0loSxtV.4vJ2zwMoxNwSNYXBOnxMTKWS6C918ya	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 11:48:33.412424	2014-06-18 12:17:33.233928	2
8	admin@admin.com	Administrator	$2a$10$pm.TdiwEbJ.0maB4GQt4E.VGMECLIYv/JDTBA2om8L6qzbc8Axo3K	\N	\N	\N	0	\N	\N	\N	\N	2014-06-18 11:20:17.484604	2014-06-18 13:32:24.014531	1
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('admins_id_seq', 15, true);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authors (id, full_name, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
1	Лев Толстой	2014-06-17 10:28:54.501939	2014-06-17 10:32:21.057969	lev_tolstoi.jpg	image/jpeg	12535	2014-06-17 10:32:20.875854
2	Федор Достоевский 	2014-06-17 10:52:02.492493	2014-06-17 11:01:31.200193	fedor_dostoevsky.jpg	image/jpeg	10186	2014-06-17 11:01:31.021073
3	Борис Пастернак	2014-06-18 22:24:15.781393	2014-06-18 22:27:38.276442	Boris_Pasternak.jpg	image/jpeg	15555	2014-06-18 22:27:38.129893
4	Михаил Булгаков	2014-06-18 22:30:10.202849	2014-06-18 22:33:30.053381	Mihail_Bulgakov.jpg	image/jpeg	15125	2014-06-18 22:33:29.906836
5	Лёха Фартовый	2014-06-18 22:37:59.695319	2014-06-18 22:38:33.141152	leha_grak.jpg	image/jpeg	46293	2014-06-18 22:38:32.940099
6	Сумрок Дармидон	2014-06-18 22:57:26.285609	2014-06-18 23:03:02.113235	darmidon.jpg	image/jpeg	27486	2014-06-18 23:03:01.927989
7	Никита Кувиков	2014-06-18 23:21:41.551566	2014-06-18 23:26:18.495142	kuvikov.jpg	image/jpeg	25414	2014-06-18 23:26:18.281277
8	Anti Mage	2014-06-18 23:46:09.088283	2014-06-18 23:50:14.854343	anti-mage_reaction.jpg	image/jpeg	131132	2014-06-18 23:50:14.651142
9	Zaysenec	2014-06-19 00:07:52.678878	2014-06-19 00:07:52.678878	\N	\N	\N	\N
10	Стойкий Цвет	2014-06-19 00:21:48.121286	2014-06-19 00:21:48.121286	\N	\N	\N	\N
11	Апельсин Апелисик	2014-06-19 00:26:51.580461	2014-06-19 00:26:51.580461	\N	\N	\N	\N
12	Traen Malaxovetch	2014-06-19 00:31:57.3801	2014-06-19 00:37:28.619026	TCeDV9no-yM.jpg	image/jpeg	132665	2014-06-19 00:37:28.375425
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('authors_id_seq', 12, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY books (id, author_id, name, series, publisher, year, pages, binding, format, isbn, weight, decription, created_at, updated_at, cover_file_name, cover_content_type, cover_file_size, cover_updated_at) FROM stdin;
1	1	Анна Каренина	Мировая классика	Азбука (Россия)	2012	864	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-04935-2	560	"Анна Каренина" - лучший роман о женщине, написанный в XIX веке. По словам Ф. М. Достоевского, "Анна Каренина" поразила современников "не только вседневностью содержания, но и огромной психологической разработкой души человеческой, страшной глубиной и силой". Уже к началу 1900-х годов роман Толстого был переведен на многие языки мира, а в настоящее время входит в золотой фонд мировой литературы.	2014-06-17 10:30:18.67115	2014-06-17 10:32:07.053819	Anna_Karenina_Lev_Tolstoy.jpg	image/jpeg	22093	2014-06-17 10:32:06.878122
2	1	Четвероевангелие	Золотая библиотека мудрости	ЭКСМО (Россия)	2014	480	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-699-69943-8	440	Тридцать последних лет жизни Лев Николаевич Толстой отдал разъяснению христианского учения современному человечеству, которое все больше отдалялось от сущности учения Иисуса.\r\nЧетвероевангелие - одно из главных произведений великого русского писателя, публициста и религиозного мыслителя. Он глубоко изучил древнегреческий и древнееврейский языки, чтобы перевести и истолковать, раскрыть всю глубину евангельского текста.\r\nВ нашей книге представлен толстовский перевод Евангелия с примечаниями и комментариями автора в сокращенном виде: опущены греческий и переведённый канонический текст Евангелия, а также некоторые отступления Толстого.	2014-06-17 10:35:21.878256	2014-06-17 10:39:07.861348	CHetveroevangelie_Lev_Tolstoy.jpg	image/jpeg	24941	2014-06-17 10:39:07.667855
3	1	Война и мир	Мировая классика	Азбука (Россия)	2014	1408	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-07123-0	1020	"Война и мир" Л.Н.Толстого - книга на все времена. Кажется, что она существовала всегда, настолько знакомым кажется текст, едва мы открываем первые страницы романа, настолько памятны многие его эпизоды: охота и святки, первый бал Наташи Ростовой, лунная ночь в Отрадном, князь Андрей в сражении при Аустерлице... Сцены "мирной", семейной жизни сменяются картинами, имеющими значение для хода всей мировой истории, но для Толстого они равноценны, связаны в едином потоке времени. Каждый эпизод важен не только для развития сюжета, но и как одно из бесчисленных проявлений жизни, которая насыщена в каждом своем моменте и которую учит любить Толстой.	2014-06-17 10:41:06.269603	2014-06-17 10:42:37.892971	Voyna_i_mir_komplekt_iz_2_knig_Lev_Tolstoy.jpg	image/jpeg	18995	2014-06-17 10:42:37.700856
4	1	Живой труп	Русская классика	ЭКСМО (Россия)	2012	640	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-699-60268-1	470	Л. Н. Толстой считал, что «художник, чтобы действовать на других, должен быть ищущим, чтобы его произведение было исканием». После кризиса 70-80 годов писатель обращается к проблемной повести, ставя своих героев в остроконфликтные или кризисные ситуации близости смерти, когда происходит переоценка ценностей, открывается неправильность их жизни. Автор определяет причины неверного искаженного мировоззрения людей из высших сословий, что придает особую глубину произведениям.	2014-06-17 10:47:04.951225	2014-06-17 10:48:28.889986	Zhivoy_trup_Lev_Tolstoy.jpg	image/jpeg	25931	2014-06-17 10:48:28.707326
5	2	Идиот	Мировая классика	Азбука (Россия)	2012	640	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-04730-3	450	«Главная идея... - писал Ф. М. Достоевский о своем романе „Идиот", - изобразить положительно-прекрасного человека. Труднее этого нет ничего на свете...» Не для того ли писатель явил миру «князя-Христа», чтобы мы не забывали: «Страдание есть главнейший и, может быть, единственный закон бытия всего человечества».\r\nКаждое новое поколение по-своему воспринимает классику и пытается дать собственные ответы на вечные вопросы бытия. Об этом свидетельствуют и известные экранизации романа, его сценические версии. В России запоминающиеся образы князя Мышкина создали Ю. Яковлев, И. Смоктуновский, Е. Миронов.	2014-06-17 10:53:40.703815	2014-06-17 10:57:17.630982	Idiot_Fedor_Dostoevskiy.jpg	image/jpeg	21399	2014-06-17 10:57:17.435578
7	2	Бесы	Мировая классика	Азбука (Россия)	2013	672	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-06010-4	490	Уже были написаны «Записки из Мертвого дома», «Записки из подполья», «Преступление и наказание», «Идиот» и другие шедевры, а Достоевский все еще испытывал острое чувство неудовлетворенности и, по собственному признанию, только подбирался к главному своему произведению. В 1871-1872 годах выходит его шестой роман с вызывающим и символическим названием «Бесы». Увлекательная драма, захватывающий сюжет, бушующие страсти и чрезвычайные, дикие события «под стеклянным колпаком» провинциального города, - таково одно из величайших произведений не только русской, но и мировой литературы.	2014-06-17 11:00:40.954256	2014-06-17 11:26:27.670574	Besi_Fedor_Dostoevskiy.jpg	image/jpeg	29322	2014-06-17 11:26:27.477863
6	2	Преступление и наказание	Мировая классика	Азбука (Россия)	2012	608	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-04926-0	430	Одно из «краеугольных» произведений русской и мировой литературы, включенный во все школьные и университетские программы, неоднократно экранизированный роман Достоевского «Преступление и наказание» ставит перед читателем важнейшие нравственно-мировоззренческие вопросы - о вере, совести, грехе и об искуплении через страдание. Опровержение преступной «идеи-страсти», «безобразной мечты», завладевшей умом Родиона Раскольникова в самом «умышленном» и «фантастическом» городе на свете, составляет основное содержание этой сложнейшей, соединившей в себе несколько различных жанров книги. Задуманный как «психологический отчет одного преступления», роман Достоевского предстал перед читателем грандиозным художественно-философским исследованием человеческой природы, христианской трагедией о смерти и воскресении души.	2014-06-17 10:56:55.432602	2014-06-17 10:57:24.20773	Prestuplenie_i_nakazanie_Fedor_Dostoevskiy.jpg	image/jpeg	21477	2014-06-17 10:57:24.013749
8	2	Братья Карамазовы	Мировая классика	Азбука (Россия)	2013	832	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-06657-1	560	Последний, самый объемный и один из наиболее известных романов Ф. М. Достоевского обращает читателя к вневременным нравственно-философским вопросам о грехе, воздаянии, сострадании и милосердии. Книга, которую сам писатель определил как "роман о богохульстве и опровержении его", явилась попыткой "решить вопрос о человеке", "разгадать тайну" человека, что, по Достоевскому, означало "решить вопрос о Боге". Сквозь призму истории провинциальной семьи Карамазовых автор повествует об извечной борьбе Божественного и дьявольского в человеческой душе. Один из самых глубоких в мировой литературе опытов отражения христианского сознания, "Братья Карамазовы" стали в ХХ веке объектом парадоксальных философских и психоаналитических интерпретаций.	2014-06-17 11:26:03.082204	2014-06-17 11:26:36.159862	Bratya_Karamazovi_Fedor_Dostoevskiy.jpg	image/jpeg	26833	2014-06-17 11:26:35.95221
11	3	Доктор Живаго	Мировая классика	Азбука (Россия)	2013	608	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-05996-2	430	В 1958 году Борис Пастернак был удостоен Нобелевской премии по литературе «за значительные достижения в современной лирической поэзии, а также за продолжение традиций великого русского эпического романа», но для соотечественников присуждение премии оказалось прочно связано с романом «Доктор Живаго». Масштабная эпопея, захватывающая история любви, трагическое свидетельство многострадальной эпохи, — это произведение по праву считается одним из величайших романов как российской, так и мировой литературы.	2014-06-18 22:26:18.585251	2014-06-18 22:27:25.962411	Doktor_Zhivago_Boris_Pasternak.jpg	image/jpeg	19939	2014-06-18 22:27:25.426464
19	7	Длинногубая санта барбара	Пранки	Prankota	2012	608	Мягкая обложка	84х108/32 (130х205 мм, стандартный)	978-5-389-01686-dd1	144	Порой жизнь может дать такую оплеуху, что не сможешь очухаться и проживешь остаток дней с вопросом "как дальше жить?". Сегодня ты имеешь 6 детей и любящего мужа, а завтра 6 голодающих ртов с изменником! Крутые реверсы, повороты, завороты, завуалированные завороты - все это Вас ждет в этой книге.	2014-06-18 23:29:27.824377	2014-06-18 23:30:53.324979	Santa-Barbara.jpg	image/jpeg	184825	2014-06-18 23:30:53.133514
20	7	На мемориале	Пранки	Prankota	2012	412	Мягкая обложка	84х108/32 (130х205 мм, стандартный)	442-414-5661-532	140	Если кого то сильно-сильно звать, то почему бы такую встречу не провести на мемориале? История о том, как бедный парниша просит не менее бедного, Евгения, приехать к нему. Между ними города-города. Километры любви и желания сцепиться крепкими объятиями друг в друга, дружба их была нерушима, а преград на их пути не существовало в этой галактике...	2014-06-18 23:37:30.921667	2014-06-18 23:37:55.394175	Graf_LasKaz__Memorial_Svyatoj_Eleny_komplekt_iz_2_knig.jpg	image/jpeg	12519	2014-06-18 23:37:55.25547
21	7	Деанон	Пранки	Prankota	2014	132	Твердый переплет	Abibasik	9l-40tki-pa-ca-dea-12	490	Сборник лучщих историй нашего любимого клоуна Евгения, все эти годы он был с нами, однако его карьера подошла к концу, книга содержит автобиографию и всю иформацию об этом, душу щекотящему парне, не пропустите, пыль на этой книге не образуется веками.	2014-06-18 23:41:52.300972	2014-06-18 23:43:20.868379	anon.jpg	image/jpeg	119507	2014-06-18 23:43:20.640224
12	4	Мастер и Маргарита	Мировая классика	Азбука (Россия)	2012	418	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-01686-6	370	«Мастер и Маргарита» М. А. Булгакова - самое удивительное и загадочное произведение ХХ века. Опубликованный в середине 1960-х, этот роман поразил читателей необычностью замысла, красочностью и фантастичностью действия, объединяющего героев разных эпох и культур. Автор создал «роман в романе», где сплетены воедино религиозно-историческая мистерия, восходящая к легенде о распятом Христе, московская «буффонада» и сверхъестественные сцены с персонажами, воплощающими некую темную силу, которая однако «вечно хочет зла и вечно совершает благо».\r\n«Есть в этой книге какая-то безрасчетность, какая-то предсмертная ослепительность большого таланта...» - писал Константин Симонов в своем предисловии к первой публикации романа, открывшей всему миру большого художника, подлинного Мастера слова.	2014-06-18 22:32:11.942706	2014-06-18 22:34:26.72504	Master_i_Margarita_Mihail_Bulgakov.jpg	image/jpeg	23744	2014-06-18 22:34:26.568985
15	6	Авторитет закона	Мировая классика	Новолукомльский БелСоюзДрук	2013	632	Твердый переплет	Приозерский-93х63 (стандарт)	978-5-3219-0124686-6	454	Лихи 90-ые... мир не знает пощады. Каждый зарабатывает на хлеб как может. Защищается, от таких же как ты сам. Но не Евлампиий! Этот герой решается на серьёзный шаг: он созывает вече семи авторитетов города Новолукомль, 1 район - 1 авторитет. Он первый кто решился объеденить всех в одно кольцо, в дружную семью с законом и оплатой проезда. Не пропустите!	2014-06-18 23:01:34.351309	2014-06-18 23:02:46.728285	avtoritet.jpg	image/jpeg	31980	2014-06-18 23:02:46.562062
13	5	Шашлычок	Чоткие пацаны	Шабаны 	2014	100	Твердый переплет	Abibasik	9l-40tki-pa-ca-N	59	Леха Грак, он же фартовый, он же я, ёпта детально описываю, как хорошо можно провести уик энд (фигасе слова вычитал де та в маршрутосе, чотка да?) не во вред своей барсеточке и бабосам. Введение в книге имеет предпосыл к моей первой книге "Семки не для всех", ну а далее все па чоткай схеме, что я написал далее	2014-06-18 22:45:49.444835	2014-06-18 22:48:58.131799	shashlsd.jpg	image/jpeg	22755	2014-06-18 22:48:57.971257
14	5	Семки не для всех	Чоткие пацаны	Шабаны 	2014	132	Твердый переплет	Abibasik	kpyt-0ki-pa-ca-Ne	420	В этом творении искусства я, фартовый, описываю как не легко живется хорошим людям во дворе... Не все знают, как тяжело добыть топлевосик для насыщенного дня, и все прекрасно понимают, что тот самый первый сорт дает цветок солнца. 2014... все подсолнухи вымерли, и я, леха фартовый расскажу в этой книге Вам, как выжить в суровых условиях. Как отжать семку у голубя? ответ в этой книге!	2014-06-18 22:52:49.599384	2014-06-18 22:53:33.540819	semki1.jpg	image/jpeg	23650	2014-06-18 22:53:33.383181
16	5	iOS печально-неотжимная	Чоткие пацаны	Шабаны 	2013	124421	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-389-01686-642	522	Отжимая трубы на районе порой бывают такие моменты, когда ты получаешь то, что хочешь, но кривишь зубы и скалишься... тебе это знакомо? Поверь, и нам это знакомо! Эти садовники яблочники не могут сделать просто телефон чтобы мы, простые люди этого мира, спокойно могли обмениваться данными не по воздуху, а из рук в руки как это было в моем детстве, опа отжал и вся инфа твоя, никаких там ИРДА ИКПОРТЫ быстро, чотка, надежно, навсегда ( ну или пока не словили оборотни ). Книга сборник нытья о том, как тяжело, когда отжал не то что ожидал	2014-06-18 23:08:54.878062	2014-06-18 23:13:45.006884	apple-iphone-5-at-t.jpg	image/jpeg	88272	2014-06-18 23:13:44.716765
17	5	Резонансы как их там	Мировая музыка	ИСЗ	2014	135	Мелодичный переплет	ля минор 92х23 	do-2314-fa-4414	154	Чет тут понесло меня после бензиновых семок и я расскажу вам про некие резонансы и как с ними бороться! Если на вас напал резонанс и вы не знаете что предпринять в данной ситуации, то эта книга просто жизненно необходима Вам и вашим друганам. Резонанс не предупреждает! Зато предупредить его можете ВЫ! 	2014-06-18 23:19:00.93693	2014-06-18 23:19:48.672385	Обложка-книги-Резонанс.jpg	image/jpeg	268638	2014-06-18 23:19:48.384069
18	7	Аннннормальный я!	Пранки	Prankota	2014	141	Мягкая обложка	84х108/32 (130х205 мм, стандартный)	978sd-ds-pushkina-d01686-6	91	Эта книга о грустном. Бедный парень по имени Евгений не мог найти свое место в обществе... все его считали "аммморальный ты человек!", но на деле никто не знает какой же он все таки анннормальный...	2014-06-18 23:24:28.160639	2014-06-18 23:25:47.251166	anorm.jpg	image/jpeg	20594	2014-06-18 23:25:47.052868
22	8	История ненависти к магии	Magick	Dota	2012	412	Твердый переплет	84х108/32 (130х205 мм, раковое дно)	978-5-32219-0124686-6	142	Эта история берет свои корни в далеком прошлом, где юный герой еще не знал, что такое сила разрушения Arcane-магии, оставшись совсем один он решает отказаться от магии в своей крови и ступает на путь истребителя, как Т-50, только NOMAGIC-50	2014-06-18 23:48:31.531437	2014-06-18 23:49:23.954242	magiya.jpg	image/jpeg	25306	2014-06-18 23:49:23.776965
23	8	ШаоЛиньский падаван	Magick	Dota	2013	608	Твердый переплет	84х108/32 (130х205 мм, раковое дно)	9478-5-389-06010-4	230	Не все мы заканчиваем свой путь у истоков мироздания и целостной гармонии. Юный герой один из тех кто с самых низов и дна проходит по ступеням к веришне горы "TOP-MMR", где ему встречаются едкие и абусрдные аспекты этой жизни в лице сатира и работника рынка из америки, дойдет или сорвется? Ответ ждет Вас...	2014-06-18 23:54:48.931341	2014-06-18 23:55:51.647357	mmr.jpg	image/jpeg	14667	2014-06-18 23:55:51.502511
24	8	У фонтана	Magick	Dota	2013	412	Твердый переплет	84х108/32 (130х205 мм, раковое дно)	978-5-3849-06010-4	123	Порой враги зажимают тебя в угл, и за твоей спиной последний рубеж, самое ценное что у тебя есть. Автор повествует нам о том, как он и его четверо надежных (кхм...) и скилованных (КХМ...КХМ...) друзей переворачивают ход истории важнейшего дня в своей жизни.	2014-06-18 23:59:52.75531	2014-06-19 00:00:51.015713	fontan.jpg	image/jpeg	20383	2014-06-19 00:00:50.853116
25	8	В душу запавший запретный плод	Magick	Dota	2012	640	Твердый переплет	84х108/32 (130х205 мм, раковое дно)	9278-5-389-506010-4	560	Грация, блеск, неотразимость, сияниие и смертельная стужа - самое приземленное, что можно сказать об блондинке с синей палкой, которая встретилась нашему герою по пути его линии жизни. Останутся ли они на линии или же разойдутся как в море корабли? Об этом можно узнать в этой книге. Спешите!	2014-06-19 00:05:41.604299	2014-06-19 00:06:31.766483	crystal_m.jpg	image/jpeg	60557	2014-06-19 00:06:31.557902
26	9	Янгул Тугул	Lorka	Hlorka	2014	1000	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:09:05.89953	2014-06-19 00:09:45.354905	\N	\N	\N	\N
27	9	Ячущка Чугущка	Lorka	Hlorka	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:12:05.992885	2014-06-19 00:12:05.992885	\N	\N	\N	\N
29	9	Янугол в глаз укол	Lorka	Hlorka	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	945178-5-389-06010-4	430	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:14:34.082106	2014-06-19 00:14:34.082106	\N	\N	\N	\N
30	9	Ядрег через берег 	Lorka	Hlorka	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	978-5-32129-0124686-6	59	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:15:44.298246	2014-06-19 00:15:44.298246	\N	\N	\N	\N
32	9	Ямкат по кольцу и в закат	Lorka	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:18:05.369364	2014-06-19 00:18:05.369364	\N	\N	\N	\N
28	9	Ярцей и могучая Тучка	Lorka	Hlorka	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	212-412-41214-12	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:13:21.075925	2014-06-19 00:20:47.431111	\N	\N	\N	\N
33	10	Целофан	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:22:21.423553	2014-06-19 00:22:21.423553	\N	\N	\N	\N
34	10	Царапки	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:22:40.679763	2014-06-19 00:22:40.679763	\N	\N	\N	\N
35	10	Циферки	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:23:16.670294	2014-06-19 00:23:16.670294	\N	\N	\N	\N
36	10	Цап Цап Цап	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	490	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:23:51.912268	2014-06-19 00:23:51.912268	\N	\N	\N	\N
37	10	Цивилизация стелка	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:25:20.426911	2014-06-19 00:25:20.426911	\N	\N	\N	\N
38	11	Эдрен пудрен	Мировая классика	Азбука (Россия)	2014	608	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	123	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius. 	2014-06-19 00:27:30.422882	2014-06-19 00:27:30.422882	\N	\N	\N	\N
39	11	Эукариоты	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	490	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius.	2014-06-19 00:29:16.48472	2014-06-19 00:29:16.48472	\N	\N	\N	\N
40	11	Эльза и телохранитель	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	560	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius.	2014-06-19 00:30:04.304081	2014-06-19 00:30:04.304081	\N	\N	\N	\N
41	11	Энданэрэй	Мировая классика	Азбука (Россия)	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	490	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lorem sit amet neque porttitor, vitae porta nunc sagittis. Aenean adipiscing volutpat volutpat. Morbi a ligula sed libero placerat pretium a eu mauris. Praesent interdum ipsum vel sem pharetra luctus. Vestibulum pharetra cursus pretium. Suspendisse ultricies arcu sed sapien porttitor, eget egestas ante rhoncus. Etiam ultrices a odio vitae luctus. Donec neque enim, faucibus sed turpis molestie, sagittis volutpat nibh. Fusce eleifend luctus neque, non faucibus leo rhoncus ut. Donec vitae sollicitudin nisi. Duis turpis magna, consectetur ac tincidunt iaculis, auctor ac ante. Duis ornare auctor varius.	2014-06-19 00:30:28.53572	2014-06-19 00:30:28.53572	\N	\N	\N	\N
42	12	Ty-Ty Нестандартный поезд	Неудачи	Сиплый Богдан продакшн	2014	132	Твердый переплет	84х108/32 (130х205 мм, стандартный)	9l-40tki-pa-ca-N	560	Никогда не бываешь готов к тому, что твои близкие друзья не поймут и не поддержат тебя в те моменты, когда ты делишься с ними своими личными мыслями. В этой истории автор делится со своим другом гудком поезда и постукиванием колес о рельсы, и не получает взамен понимания со стороны друга...	2014-06-19 00:35:26.554512	2014-06-19 00:36:38.122689	poezda.jpg	image/jpeg	164415	2014-06-19 00:36:37.861218
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('books_id_seq', 42, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments (id, book_id, email, full_name, content, created_at, updated_at, ancestry, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, moderated) FROM stdin;
1	1	example@mail.com	Alex Deme	First comment!	2014-06-17 10:54:50.249366	2014-06-18 14:20:15.365633	\N	8mZM6t3vsXc.jpg	image/jpeg	126374	2014-06-17 10:54:49.98382	t
2	1	example@mail.com	Alex Deme	Second comment! Norm kniga pasani	2014-06-18 14:22:03.030304	2014-06-18 14:39:31.786174	\N	lev_tolstoi.jpg	image/jpeg	12535	2014-06-18 14:22:02.542597	t
3	42	example@mail.com	Alex Deme	Za dushy beret!	2014-06-19 00:39:02.31139	2014-06-19 00:39:02.31139	\N	RageFace.png	image/png	16479	2014-06-19 00:39:02.093748	f
4	42	b@com.com	Bogdan Traen Malaxovetch	spasibo!	2014-06-19 00:39:41.273334	2014-06-19 00:39:41.273334	3	\N	\N	\N	\N	f
5	42	ban@an.com	Banan Tatsuya	Просто невероятное произведение! А друг ничего не понимает в дружбе! Только о себе думал! ОН ЖЕ ПРОСТО СКАЗАЛ ТУ ТУУУ! А ЕГО НЕ ПОНЯЛИ! О БОЖЕ ЭТОТ МИР ТАК ЖЕСТОК!	2014-06-19 00:40:58.503426	2014-06-19 00:40:58.503426	\N	banana.jpg	image/jpeg	2339	2014-06-19 00:40:58.370208	f
6	42	example@mail.com	Alex Deme	Ничего, Вы, не понимаете в этой жизни...	2014-06-19 00:41:57.755472	2014-06-19 00:41:57.755472	5	RageFace.png	image/png	16479	2014-06-19 00:41:57.562694	f
7	42	ban@an.com	Banan Tatsuya	Ой будто Вы тут что то смыслите?! и вапсче вам хана мой брат ваш сайт взломает и все! У него по информатике 8	2014-06-19 00:43:14.359786	2014-06-19 00:43:14.359786	5/6	banana.jpg	image/jpeg	2339	2014-06-19 00:43:14.223696	f
10	42	kan@west.com	Kanye West	Ne ponimat russkey yazik, chto voobshe ya tut doing?	2014-06-19 00:47:47.048492	2014-06-19 00:47:47.048492	\N	90c1f-kanye-west.jpg	image/jpeg	21380	2014-06-19 00:47:46.873558	f
11	42	art@art.com	Arty Fesh	Ой какой 8?! моя сестра 12 лет отроду с твоим малым учится у него 7!	2014-06-19 00:50:09.682831	2014-06-19 00:50:09.682831	5/6/7	\N	\N	\N	\N	f
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_id_seq', 12, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20140616164048
20140606180429
20140615202251
20140615204422
20140606111434
20140606112601
20140614104823
20140614110537
20140615204854
20140618095146
\.


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_books_on_author_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_books_on_author_id ON books USING btree (author_id);


--
-- Name: index_comments_on_ancestry; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comments_on_ancestry ON comments USING btree (ancestry);


--
-- Name: index_comments_on_book_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_comments_on_book_id ON comments USING btree (book_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

