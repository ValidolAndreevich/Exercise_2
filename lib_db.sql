PGDMP     -    
        
    	    y            lib_db    14.0    14.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16401    lib_db    DATABASE     j   CREATE DATABASE lib_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1251';
    DROP DATABASE lib_db;
                postgres    false            ?            1259    16403    books    TABLE     ]   CREATE TABLE public.books (
    book_id integer NOT NULL,
    name character varying(100)
);
    DROP TABLE public.books;
       public         heap    postgres    false            ?            1259    16402    books_book_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public          postgres    false    210                       0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;
          public          postgres    false    209            ?            1259    16410 	   languages    TABLE     g   CREATE TABLE public.languages (
    lang_id integer NOT NULL,
    abbreviation character varying(5)
);
    DROP TABLE public.languages;
       public         heap    postgres    false            ?            1259    16409    languages_lang_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.languages_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.languages_lang_id_seq;
       public          postgres    false    212            	           0    0    languages_lang_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.languages_lang_id_seq OWNED BY public.languages.lang_id;
          public          postgres    false    211            ?            1259    16417    localization    TABLE     ?   CREATE TABLE public.localization (
    localization_id integer NOT NULL,
    book_id integer,
    lang_id integer,
    name character varying(100)
);
     DROP TABLE public.localization;
       public         heap    postgres    false            ?            1259    16416     localization_localization_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.localization_localization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.localization_localization_id_seq;
       public          postgres    false    214            
           0    0     localization_localization_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.localization_localization_id_seq OWNED BY public.localization.localization_id;
          public          postgres    false    213            f           2604    16406    books book_id    DEFAULT     n   ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books ALTER COLUMN book_id DROP DEFAULT;
       public          postgres    false    210    209    210            g           2604    16413    languages lang_id    DEFAULT     v   ALTER TABLE ONLY public.languages ALTER COLUMN lang_id SET DEFAULT nextval('public.languages_lang_id_seq'::regclass);
 @   ALTER TABLE public.languages ALTER COLUMN lang_id DROP DEFAULT;
       public          postgres    false    211    212    212            h           2604    16420    localization localization_id    DEFAULT     ?   ALTER TABLE ONLY public.localization ALTER COLUMN localization_id SET DEFAULT nextval('public.localization_localization_id_seq'::regclass);
 K   ALTER TABLE public.localization ALTER COLUMN localization_id DROP DEFAULT;
       public          postgres    false    213    214    214            ?          0    16403    books 
   TABLE DATA           .   COPY public.books (book_id, name) FROM stdin;
    public          postgres    false    210   g       ?          0    16410 	   languages 
   TABLE DATA           :   COPY public.languages (lang_id, abbreviation) FROM stdin;
    public          postgres    false    212   ?                 0    16417    localization 
   TABLE DATA           O   COPY public.localization (localization_id, book_id, lang_id, name) FROM stdin;
    public          postgres    false    214   ?                  0    0    books_book_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.books_book_id_seq', 4, true);
          public          postgres    false    209                       0    0    languages_lang_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.languages_lang_id_seq', 3, true);
          public          postgres    false    211                       0    0     localization_localization_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.localization_localization_id_seq', 14, true);
          public          postgres    false    213            j           2606    16408    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    210            l           2606    16415    languages languages_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (lang_id);
 B   ALTER TABLE ONLY public.languages DROP CONSTRAINT languages_pkey;
       public            postgres    false    212            n           2606    16422    localization localization_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.localization
    ADD CONSTRAINT localization_pkey PRIMARY KEY (localization_id);
 H   ALTER TABLE ONLY public.localization DROP CONSTRAINT localization_pkey;
       public            postgres    false    214            o           2606    16423 &   localization localization_book_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.localization
    ADD CONSTRAINT localization_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 P   ALTER TABLE ONLY public.localization DROP CONSTRAINT localization_book_id_fkey;
       public          postgres    false    3178    210    214            p           2606    16428 &   localization localization_lang_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.localization
    ADD CONSTRAINT localization_lang_id_fkey FOREIGN KEY (lang_id) REFERENCES public.languages(lang_id);
 P   ALTER TABLE ONLY public.localization DROP CONSTRAINT localization_lang_id_fkey;
       public          postgres    false    212    214    3180            ?   E   x?3???/JQ?OS(?HU(??K/?2?t)?K?2?t?,??KUH??MM??2?t???K)?L?(?????? K?}      ?      x?3???2?
?2?t??????? %?V         ?   x???4???Ĕ?D???Ԣ???ԼL.C????Iv_?p??bӅ?@֎{.캰??z????Đ?%?4/??Ј??q?/?NT???MM?
??L???2hШ?@C?!F?r?\?q???Є???b#P?dD??n??=... ??V<     