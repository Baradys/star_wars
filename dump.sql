PGDMP         "            	    z            star_wars_db    14.5    14.4 u   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    star_wars_db    DATABASE     i   CREATE DATABASE star_wars_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE star_wars_db;
                postgres    false            �            1259    16751    accounts_chat    TABLE     n   CREATE TABLE public.accounts_chat (
    id bigint NOT NULL,
    type_of_chat character varying(1) NOT NULL
);
 !   DROP TABLE public.accounts_chat;
       public         heap    postgres    false            �            1259    16750    accounts_chat_id_seq    SEQUENCE     }   CREATE SEQUENCE public.accounts_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_chat_id_seq;
       public          postgres    false    252            �           0    0    accounts_chat_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_chat_id_seq OWNED BY public.accounts_chat.id;
          public          postgres    false    251            �            1259    16758    accounts_chat_members    TABLE     �   CREATE TABLE public.accounts_chat_members (
    id bigint NOT NULL,
    chat_id bigint NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.accounts_chat_members;
       public         heap    postgres    false            �            1259    16757    accounts_chat_members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_chat_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.accounts_chat_members_id_seq;
       public          postgres    false    254            �           0    0    accounts_chat_members_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.accounts_chat_members_id_seq OWNED BY public.accounts_chat_members.id;
          public          postgres    false    253                        1259    16765    accounts_message    TABLE     �   CREATE TABLE public.accounts_message (
    id bigint NOT NULL,
    message text NOT NULL,
    publication_date timestamp with time zone NOT NULL,
    is_read boolean NOT NULL,
    author_id integer NOT NULL,
    chat_id bigint NOT NULL
);
 $   DROP TABLE public.accounts_message;
       public         heap    postgres    false            �            1259    16764    accounts_message_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_message_id_seq;
       public          postgres    false    256            �           0    0    accounts_message_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_message_id_seq OWNED BY public.accounts_message.id;
          public          postgres    false    255            �            1259    16722    accounts_profile    TABLE     �  CREATE TABLE public.accounts_profile (
    id bigint NOT NULL,
    profile_pic character varying(100),
    vk character varying(50),
    instagram character varying(50),
    user_id integer,
    slug character varying(50) NOT NULL,
    birthday date,
    city character varying(100),
    country_id bigint,
    email character varying(254),
    gender character varying(1) NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    favorites_data jsonb,
    cart_data jsonb
);
 $   DROP TABLE public.accounts_profile;
       public         heap    postgres    false            �            1259    16721    accounts_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_profile_id_seq;
       public          postgres    false    250            �           0    0    accounts_profile_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_profile_id_seq OWNED BY public.accounts_profile.id;
          public          postgres    false    249            �            1259    16421 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16420    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    216            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    215            �            1259    16430    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16429    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    218            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    217            �            1259    16414    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16413    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    214            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    213            �            1259    16437 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16446    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16445    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    222            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    221            �            1259    16436    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    220            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    219            �            1259    16453    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16452 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    224            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    223                       1259    16830 
   books_book    TABLE     �   CREATE TABLE public.books_book (
    id bigint NOT NULL,
    name character varying(40) NOT NULL,
    price integer NOT NULL,
    slug character varying(50) NOT NULL,
    poster character varying(100)
);
    DROP TABLE public.books_book;
       public         heap    postgres    false                       1259    16829    books_book_id_seq    SEQUENCE     z   CREATE SEQUENCE public.books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public          postgres    false    260            �           0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books_book.id;
          public          postgres    false    259                       1259    17158    books_book_views    TABLE     �   CREATE TABLE public.books_book_views (
    id bigint NOT NULL,
    book_id bigint NOT NULL,
    ipmanager_id bigint NOT NULL
);
 $   DROP TABLE public.books_book_views;
       public         heap    postgres    false                       1259    17157    books_book_views_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_book_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.books_book_views_id_seq;
       public          postgres    false    273            �           0    0    books_book_views_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.books_book_views_id_seq OWNED BY public.books_book_views.id;
          public          postgres    false    272                       1259    16800    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false                       1259    16799    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    258            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    257            �            1259    16405    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16404    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            �            1259    16396    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16395    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    210            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209                       1259    16903    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       1259    16837 
   games_game    TABLE     �   CREATE TABLE public.games_game (
    id bigint NOT NULL,
    name character varying(40) NOT NULL,
    price integer NOT NULL,
    slug character varying(50) NOT NULL,
    poster character varying(100)
);
    DROP TABLE public.games_game;
       public         heap    postgres    false                       1259    16836    games_game_id_seq    SEQUENCE     z   CREATE SEQUENCE public.games_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.games_game_id_seq;
       public          postgres    false    262            �           0    0    games_game_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games_game.id;
          public          postgres    false    261                       1259    17179    games_game_views    TABLE     �   CREATE TABLE public.games_game_views (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    ipmanager_id bigint NOT NULL
);
 $   DROP TABLE public.games_game_views;
       public         heap    postgres    false                       1259    17178    games_game_views_id_seq    SEQUENCE     �   CREATE SEQUENCE public.games_game_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.games_game_views_id_seq;
       public          postgres    false    275            �           0    0    games_game_views_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.games_game_views_id_seq OWNED BY public.games_game_views.id;
          public          postgres    false    274                       1259    17151    main_page_ipmanager    TABLE     l   CREATE TABLE public.main_page_ipmanager (
    id bigint NOT NULL,
    ip character varying(100) NOT NULL
);
 '   DROP TABLE public.main_page_ipmanager;
       public         heap    postgres    false                       1259    17150    main_page_ipmanager_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_page_ipmanager_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.main_page_ipmanager_id_seq;
       public          postgres    false    271            �           0    0    main_page_ipmanager_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.main_page_ipmanager_id_seq OWNED BY public.main_page_ipmanager.id;
          public          postgres    false    270            �            1259    16587    movies_actor    TABLE       CREATE TABLE public.movies_actor (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    gender character varying(1) NOT NULL,
    slug character varying(50) NOT NULL,
    birthday date,
    birthplace_id bigint
);
     DROP TABLE public.movies_actor;
       public         heap    postgres    false            �            1259    16628    movies_actor_carrier_role    TABLE     �   CREATE TABLE public.movies_actor_carrier_role (
    id bigint NOT NULL,
    actor_id bigint NOT NULL,
    carrierrole_id bigint NOT NULL
);
 -   DROP TABLE public.movies_actor_carrier_role;
       public         heap    postgres    false            �            1259    16627     movies_actor_carrier_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_actor_carrier_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.movies_actor_carrier_role_id_seq;
       public          postgres    false    242            �           0    0     movies_actor_carrier_role_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.movies_actor_carrier_role_id_seq OWNED BY public.movies_actor_carrier_role.id;
          public          postgres    false    241            �            1259    16586    movies_actor_id_seq    SEQUENCE     |   CREATE SEQUENCE public.movies_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_actor_id_seq;
       public          postgres    false    236            �           0    0    movies_actor_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_actor_id_seq OWNED BY public.movies_actor.id;
          public          postgres    false    235            �            1259    16620    movies_carrierrole    TABLE     l   CREATE TABLE public.movies_carrierrole (
    id bigint NOT NULL,
    name character varying(30) NOT NULL
);
 &   DROP TABLE public.movies_carrierrole;
       public         heap    postgres    false            �            1259    16619    movies_carrierrole_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_carrierrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.movies_carrierrole_id_seq;
       public          postgres    false    240            �           0    0    movies_carrierrole_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.movies_carrierrole_id_seq OWNED BY public.movies_carrierrole.id;
          public          postgres    false    239            �            1259    16670    movies_comment    TABLE       CREATE TABLE public.movies_comment (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    body text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    feedback_id bigint,
    user_id integer
);
 "   DROP TABLE public.movies_comment;
       public         heap    postgres    false            �            1259    16669    movies_comment_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.movies_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.movies_comment_id_seq;
       public          postgres    false    246            �           0    0    movies_comment_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.movies_comment_id_seq OWNED BY public.movies_comment.id;
          public          postgres    false    245            �            1259    16557    movies_composer    TABLE     �   CREATE TABLE public.movies_composer (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    birthday date
);
 #   DROP TABLE public.movies_composer;
       public         heap    postgres    false            �            1259    16556    movies_composer_id_seq    SEQUENCE        CREATE SEQUENCE public.movies_composer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.movies_composer_id_seq;
       public          postgres    false    232            �           0    0    movies_composer_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.movies_composer_id_seq OWNED BY public.movies_composer.id;
          public          postgres    false    231            �            1259    16519    movies_countries    TABLE     j   CREATE TABLE public.movies_countries (
    id bigint NOT NULL,
    name character varying(60) NOT NULL
);
 $   DROP TABLE public.movies_countries;
       public         heap    postgres    false            �            1259    16518    movies_countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.movies_countries_id_seq;
       public          postgres    false    228            �           0    0    movies_countries_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.movies_countries_id_seq OWNED BY public.movies_countries.id;
          public          postgres    false    227            �            1259    16564    movies_director    TABLE     �   CREATE TABLE public.movies_director (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    birthday date
);
 #   DROP TABLE public.movies_director;
       public         heap    postgres    false            �            1259    16563    movies_director_id_seq    SEQUENCE        CREATE SEQUENCE public.movies_director_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.movies_director_id_seq;
       public          postgres    false    234            �           0    0    movies_director_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.movies_director_id_seq OWNED BY public.movies_director.id;
          public          postgres    false    233            �            1259    16661    movies_feedback    TABLE     
  CREATE TABLE public.movies_feedback (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    body text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    movie_id bigint,
    user_id integer
);
 #   DROP TABLE public.movies_feedback;
       public         heap    postgres    false            �            1259    16660    movies_feedback_id_seq    SEQUENCE        CREATE SEQUENCE public.movies_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.movies_feedback_id_seq;
       public          postgres    false    244            �           0    0    movies_feedback_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.movies_feedback_id_seq OWNED BY public.movies_feedback.id;
          public          postgres    false    243            �            1259    16512    movies_movie    TABLE     �  CREATE TABLE public.movies_movie (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    "rating_IMBd" numeric(3,1),
    rating_rotten_tomatoes integer,
    timing integer,
    date date,
    year integer,
    composer_id bigint,
    director_id bigint,
    slug character varying(50) NOT NULL,
    action integer,
    poster character varying(100),
    video_link character varying(150),
    price integer NOT NULL,
    canon boolean NOT NULL
);
     DROP TABLE public.movies_movie;
       public         heap    postgres    false            �            1259    16594    movies_movie_actors    TABLE     �   CREATE TABLE public.movies_movie_actors (
    id bigint NOT NULL,
    movie_id bigint NOT NULL,
    actor_id bigint NOT NULL
);
 '   DROP TABLE public.movies_movie_actors;
       public         heap    postgres    false            �            1259    16593    movies_movie_actors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_actors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.movies_movie_actors_id_seq;
       public          postgres    false    238            �           0    0    movies_movie_actors_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.movies_movie_actors_id_seq OWNED BY public.movies_movie_actors.id;
          public          postgres    false    237            �            1259    16532    movies_movie_countries    TABLE     �   CREATE TABLE public.movies_movie_countries (
    id bigint NOT NULL,
    movie_id bigint NOT NULL,
    countries_id bigint NOT NULL
);
 *   DROP TABLE public.movies_movie_countries;
       public         heap    postgres    false            �            1259    16531    movies_movie_countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.movies_movie_countries_id_seq;
       public          postgres    false    230            �           0    0    movies_movie_countries_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.movies_movie_countries_id_seq OWNED BY public.movies_movie_countries.id;
          public          postgres    false    229            �            1259    16511    movies_movie_id_seq    SEQUENCE     |   CREATE SEQUENCE public.movies_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    226            �           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies_movie.id;
          public          postgres    false    225                       1259    17200    movies_movie_views    TABLE     �   CREATE TABLE public.movies_movie_views (
    id bigint NOT NULL,
    movie_id bigint NOT NULL,
    ipmanager_id bigint NOT NULL
);
 &   DROP TABLE public.movies_movie_views;
       public         heap    postgres    false                       1259    17199    movies_movie_views_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.movies_movie_views_id_seq;
       public          postgres    false    277            �           0    0    movies_movie_views_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.movies_movie_views_id_seq OWNED BY public.movies_movie_views.id;
          public          postgres    false    276            �            1259    16703    movies_rating    TABLE     �   CREATE TABLE public.movies_rating (
    id bigint NOT NULL,
    rating smallint NOT NULL,
    movie_id bigint,
    user_id integer
);
 !   DROP TABLE public.movies_rating;
       public         heap    postgres    false            �            1259    16702    movies_rating_id_seq    SEQUENCE     }   CREATE SEQUENCE public.movies_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.movies_rating_id_seq;
       public          postgres    false    248            �           0    0    movies_rating_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.movies_rating_id_seq OWNED BY public.movies_rating.id;
          public          postgres    false    247                       1259    16850    orders_order    TABLE     �   CREATE TABLE public.orders_order (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    paid boolean NOT NULL,
    user_id integer NOT NULL
);
     DROP TABLE public.orders_order;
       public         heap    postgres    false                       1259    16849    orders_order_id_seq    SEQUENCE     |   CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    264            �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;
          public          postgres    false    263            
           1259    16859    orders_orderitem    TABLE     <  CREATE TABLE public.orders_orderitem (
    id bigint NOT NULL,
    product character varying(1) NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    game_id bigint,
    movie_id bigint,
    order_id bigint NOT NULL,
    CONSTRAINT orders_orderitem_quantity_check CHECK ((quantity >= 0))
);
 $   DROP TABLE public.orders_orderitem;
       public         heap    postgres    false            	           1259    16858    orders_orderitem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.orders_orderitem_id_seq;
       public          postgres    false    266            �           0    0    orders_orderitem_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.orders_orderitem_id_seq OWNED BY public.orders_orderitem.id;
          public          postgres    false    265                       1259    16897    serials_serial    TABLE     �   CREATE TABLE public.serials_serial (
    id bigint NOT NULL,
    name character varying(40) NOT NULL,
    price integer NOT NULL,
    slug character varying(50) NOT NULL,
    poster character varying(100)
);
 "   DROP TABLE public.serials_serial;
       public         heap    postgres    false                       1259    16896    serials_serial_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.serials_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.serials_serial_id_seq;
       public          postgres    false    268            �           0    0    serials_serial_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.serials_serial_id_seq OWNED BY public.serials_serial.id;
          public          postgres    false    267                       1259    17221    serials_serial_views    TABLE     �   CREATE TABLE public.serials_serial_views (
    id bigint NOT NULL,
    serial_id bigint NOT NULL,
    ipmanager_id bigint NOT NULL
);
 (   DROP TABLE public.serials_serial_views;
       public         heap    postgres    false                       1259    17220    serials_serial_views_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serials_serial_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.serials_serial_views_id_seq;
       public          postgres    false    279            �           0    0    serials_serial_views_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.serials_serial_views_id_seq OWNED BY public.serials_serial_views.id;
          public          postgres    false    278                       2604    16754    accounts_chat id    DEFAULT     t   ALTER TABLE ONLY public.accounts_chat ALTER COLUMN id SET DEFAULT nextval('public.accounts_chat_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_chat ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252                        2604    16761    accounts_chat_members id    DEFAULT     �   ALTER TABLE ONLY public.accounts_chat_members ALTER COLUMN id SET DEFAULT nextval('public.accounts_chat_members_id_seq'::regclass);
 G   ALTER TABLE public.accounts_chat_members ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    254    254            !           2604    16768    accounts_message id    DEFAULT     z   ALTER TABLE ONLY public.accounts_message ALTER COLUMN id SET DEFAULT nextval('public.accounts_message_id_seq'::regclass);
 B   ALTER TABLE public.accounts_message ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256                       2604    16725    accounts_profile id    DEFAULT     z   ALTER TABLE ONLY public.accounts_profile ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_id_seq'::regclass);
 B   ALTER TABLE public.accounts_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250                       2604    16424    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216                       2604    16433    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218                       2604    16417    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214                       2604    16440    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220                       2604    16449    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222                       2604    16456    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            $           2604    16833    books_book id    DEFAULT     n   ALTER TABLE ONLY public.books_book ALTER COLUMN id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books_book ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    260    260            +           2604    17161    books_book_views id    DEFAULT     z   ALTER TABLE ONLY public.books_book_views ALTER COLUMN id SET DEFAULT nextval('public.books_book_views_id_seq'::regclass);
 B   ALTER TABLE public.books_book_views ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    272    273            "           2604    16803    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258                       2604    16408    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            
           2604    16399    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            %           2604    16840    games_game id    DEFAULT     n   ALTER TABLE ONLY public.games_game ALTER COLUMN id SET DEFAULT nextval('public.games_game_id_seq'::regclass);
 <   ALTER TABLE public.games_game ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    262    262            ,           2604    17182    games_game_views id    DEFAULT     z   ALTER TABLE ONLY public.games_game_views ALTER COLUMN id SET DEFAULT nextval('public.games_game_views_id_seq'::regclass);
 B   ALTER TABLE public.games_game_views ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    274    275            *           2604    17154    main_page_ipmanager id    DEFAULT     �   ALTER TABLE ONLY public.main_page_ipmanager ALTER COLUMN id SET DEFAULT nextval('public.main_page_ipmanager_id_seq'::regclass);
 E   ALTER TABLE public.main_page_ipmanager ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270    271                       2604    16590    movies_actor id    DEFAULT     r   ALTER TABLE ONLY public.movies_actor ALTER COLUMN id SET DEFAULT nextval('public.movies_actor_id_seq'::regclass);
 >   ALTER TABLE public.movies_actor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236                       2604    16631    movies_actor_carrier_role id    DEFAULT     �   ALTER TABLE ONLY public.movies_actor_carrier_role ALTER COLUMN id SET DEFAULT nextval('public.movies_actor_carrier_role_id_seq'::regclass);
 K   ALTER TABLE public.movies_actor_carrier_role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242                       2604    16623    movies_carrierrole id    DEFAULT     ~   ALTER TABLE ONLY public.movies_carrierrole ALTER COLUMN id SET DEFAULT nextval('public.movies_carrierrole_id_seq'::regclass);
 D   ALTER TABLE public.movies_carrierrole ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240                       2604    16673    movies_comment id    DEFAULT     v   ALTER TABLE ONLY public.movies_comment ALTER COLUMN id SET DEFAULT nextval('public.movies_comment_id_seq'::regclass);
 @   ALTER TABLE public.movies_comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246                       2604    16560    movies_composer id    DEFAULT     x   ALTER TABLE ONLY public.movies_composer ALTER COLUMN id SET DEFAULT nextval('public.movies_composer_id_seq'::regclass);
 A   ALTER TABLE public.movies_composer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232                       2604    16522    movies_countries id    DEFAULT     z   ALTER TABLE ONLY public.movies_countries ALTER COLUMN id SET DEFAULT nextval('public.movies_countries_id_seq'::regclass);
 B   ALTER TABLE public.movies_countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228                       2604    16567    movies_director id    DEFAULT     x   ALTER TABLE ONLY public.movies_director ALTER COLUMN id SET DEFAULT nextval('public.movies_director_id_seq'::regclass);
 A   ALTER TABLE public.movies_director ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234                       2604    16664    movies_feedback id    DEFAULT     x   ALTER TABLE ONLY public.movies_feedback ALTER COLUMN id SET DEFAULT nextval('public.movies_feedback_id_seq'::regclass);
 A   ALTER TABLE public.movies_feedback ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244                       2604    16515    movies_movie id    DEFAULT     r   ALTER TABLE ONLY public.movies_movie ALTER COLUMN id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies_movie ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226                       2604    16597    movies_movie_actors id    DEFAULT     �   ALTER TABLE ONLY public.movies_movie_actors ALTER COLUMN id SET DEFAULT nextval('public.movies_movie_actors_id_seq'::regclass);
 E   ALTER TABLE public.movies_movie_actors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238                       2604    16535    movies_movie_countries id    DEFAULT     �   ALTER TABLE ONLY public.movies_movie_countries ALTER COLUMN id SET DEFAULT nextval('public.movies_movie_countries_id_seq'::regclass);
 H   ALTER TABLE public.movies_movie_countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            -           2604    17203    movies_movie_views id    DEFAULT     ~   ALTER TABLE ONLY public.movies_movie_views ALTER COLUMN id SET DEFAULT nextval('public.movies_movie_views_id_seq'::regclass);
 D   ALTER TABLE public.movies_movie_views ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    277    277                       2604    16706    movies_rating id    DEFAULT     t   ALTER TABLE ONLY public.movies_rating ALTER COLUMN id SET DEFAULT nextval('public.movies_rating_id_seq'::regclass);
 ?   ALTER TABLE public.movies_rating ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            &           2604    16853    orders_order id    DEFAULT     r   ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263    264            '           2604    16862    orders_orderitem id    DEFAULT     z   ALTER TABLE ONLY public.orders_orderitem ALTER COLUMN id SET DEFAULT nextval('public.orders_orderitem_id_seq'::regclass);
 B   ALTER TABLE public.orders_orderitem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    265    266            )           2604    16900    serials_serial id    DEFAULT     v   ALTER TABLE ONLY public.serials_serial ALTER COLUMN id SET DEFAULT nextval('public.serials_serial_id_seq'::regclass);
 @   ALTER TABLE public.serials_serial ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    268    268            .           2604    17224    serials_serial_views id    DEFAULT     �   ALTER TABLE ONLY public.serials_serial_views ALTER COLUMN id SET DEFAULT nextval('public.serials_serial_views_id_seq'::regclass);
 F   ALTER TABLE public.serials_serial_views ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    279    279            �          0    16751    accounts_chat 
   TABLE DATA                 public          postgres    false    252   (�      �          0    16758    accounts_chat_members 
   TABLE DATA                 public          postgres    false    254   t�      �          0    16765    accounts_message 
   TABLE DATA                 public          postgres    false    256   ��      �          0    16722    accounts_profile 
   TABLE DATA                 public          postgres    false    250   }�      �          0    16421 
   auth_group 
   TABLE DATA                 public          postgres    false    216   ��      �          0    16430    auth_group_permissions 
   TABLE DATA                 public          postgres    false    218   ��      �          0    16414    auth_permission 
   TABLE DATA                 public          postgres    false    214   ��      �          0    16437 	   auth_user 
   TABLE DATA                 public          postgres    false    220   %�      �          0    16446    auth_user_groups 
   TABLE DATA                 public          postgres    false    222   ��      �          0    16453    auth_user_user_permissions 
   TABLE DATA                 public          postgres    false    224   ��      �          0    16830 
   books_book 
   TABLE DATA                 public          postgres    false    260   �      �          0    17158    books_book_views 
   TABLE DATA                 public          postgres    false    273   u�      �          0    16800    django_admin_log 
   TABLE DATA                 public          postgres    false    258   ��      �          0    16405    django_content_type 
   TABLE DATA                 public          postgres    false    212   �      �          0    16396    django_migrations 
   TABLE DATA                 public          postgres    false    210   Z      �          0    16903    django_session 
   TABLE DATA                 public          postgres    false    269   
      �          0    16837 
   games_game 
   TABLE DATA                 public          postgres    false    262   �      �          0    17179    games_game_views 
   TABLE DATA                 public          postgres    false    275   �      �          0    17151    main_page_ipmanager 
   TABLE DATA                 public          postgres    false    271         �          0    16587    movies_actor 
   TABLE DATA                 public          postgres    false    236   p      �          0    16628    movies_actor_carrier_role 
   TABLE DATA                 public          postgres    false    242   @      �          0    16620    movies_carrierrole 
   TABLE DATA                 public          postgres    false    240   Z      �          0    16670    movies_comment 
   TABLE DATA                 public          postgres    false    246   t      �          0    16557    movies_composer 
   TABLE DATA                 public          postgres    false    232         �          0    16519    movies_countries 
   TABLE DATA                 public          postgres    false    228   �      �          0    16564    movies_director 
   TABLE DATA                 public          postgres    false    234   T      �          0    16661    movies_feedback 
   TABLE DATA                 public          postgres    false    244   q       �          0    16512    movies_movie 
   TABLE DATA                 public          postgres    false    226   !      �          0    16594    movies_movie_actors 
   TABLE DATA                 public          postgres    false    238   h$      �          0    16532    movies_movie_countries 
   TABLE DATA                 public          postgres    false    230   L%      �          0    17200    movies_movie_views 
   TABLE DATA                 public          postgres    false    277   �%      �          0    16703    movies_rating 
   TABLE DATA                 public          postgres    false    248   D&      �          0    16850    orders_order 
   TABLE DATA                 public          postgres    false    264   �&      �          0    16859    orders_orderitem 
   TABLE DATA                 public          postgres    false    266   �'      �          0    16897    serials_serial 
   TABLE DATA                 public          postgres    false    268   E(      �          0    17221    serials_serial_views 
   TABLE DATA                 public          postgres    false    279   _(                  0    0    accounts_chat_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.accounts_chat_id_seq', 1, true);
          public          postgres    false    251                       0    0    accounts_chat_members_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.accounts_chat_members_id_seq', 26, true);
          public          postgres    false    253                       0    0    accounts_message_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accounts_message_id_seq', 3, true);
          public          postgres    false    255                       0    0    accounts_profile_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_profile_id_seq', 67, true);
          public          postgres    false    249                       0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    215                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    217                       0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);
          public          postgres    false    213                       0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    221                       0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 15, true);
          public          postgres    false    219            	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            
           0    0    books_book_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.books_book_id_seq', 1, true);
          public          postgres    false    259                       0    0    books_book_views_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.books_book_views_id_seq', 23, true);
          public          postgres    false    272                       0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 279, true);
          public          postgres    false    257                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);
          public          postgres    false    211                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 70, true);
          public          postgres    false    209                       0    0    games_game_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.games_game_id_seq', 2, true);
          public          postgres    false    261                       0    0    games_game_views_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.games_game_views_id_seq', 36, true);
          public          postgres    false    274                       0    0    main_page_ipmanager_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.main_page_ipmanager_id_seq', 11, true);
          public          postgres    false    270                       0    0     movies_actor_carrier_role_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.movies_actor_carrier_role_id_seq', 1, false);
          public          postgres    false    241                       0    0    movies_actor_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.movies_actor_id_seq', 9, true);
          public          postgres    false    235                       0    0    movies_carrierrole_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.movies_carrierrole_id_seq', 1, false);
          public          postgres    false    239                       0    0    movies_comment_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.movies_comment_id_seq', 2, true);
          public          postgres    false    245                       0    0    movies_composer_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.movies_composer_id_seq', 2, true);
          public          postgres    false    231                       0    0    movies_countries_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.movies_countries_id_seq', 6, true);
          public          postgres    false    227                       0    0    movies_director_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.movies_director_id_seq', 4, true);
          public          postgres    false    233                       0    0    movies_feedback_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.movies_feedback_id_seq', 59, true);
          public          postgres    false    243                       0    0    movies_movie_actors_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.movies_movie_actors_id_seq', 580, true);
          public          postgres    false    237                       0    0    movies_movie_countries_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.movies_movie_countries_id_seq', 162, true);
          public          postgres    false    229                       0    0    movies_movie_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.movies_movie_id_seq', 9, true);
          public          postgres    false    225                       0    0    movies_movie_views_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.movies_movie_views_id_seq', 49, true);
          public          postgres    false    276                       0    0    movies_rating_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.movies_rating_id_seq', 27, true);
          public          postgres    false    247                       0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 32, true);
          public          postgres    false    263                        0    0    orders_orderitem_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.orders_orderitem_id_seq', 38, true);
          public          postgres    false    265            !           0    0    serials_serial_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.serials_serial_id_seq', 1, false);
          public          postgres    false    267            "           0    0    serials_serial_views_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.serials_serial_views_id_seq', 1, false);
          public          postgres    false    278            �           2606    16774 I   accounts_chat_members accounts_chat_members_chat_id_user_id_041d0d39_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_chat_members
    ADD CONSTRAINT accounts_chat_members_chat_id_user_id_041d0d39_uniq UNIQUE (chat_id, user_id);
 s   ALTER TABLE ONLY public.accounts_chat_members DROP CONSTRAINT accounts_chat_members_chat_id_user_id_041d0d39_uniq;
       public            postgres    false    254    254            �           2606    16763 0   accounts_chat_members accounts_chat_members_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.accounts_chat_members
    ADD CONSTRAINT accounts_chat_members_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.accounts_chat_members DROP CONSTRAINT accounts_chat_members_pkey;
       public            postgres    false    254            �           2606    16756     accounts_chat accounts_chat_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_chat
    ADD CONSTRAINT accounts_chat_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_chat DROP CONSTRAINT accounts_chat_pkey;
       public            postgres    false    252            �           2606    16772 &   accounts_message accounts_message_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_message
    ADD CONSTRAINT accounts_message_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_message DROP CONSTRAINT accounts_message_pkey;
       public            postgres    false    256            �           2606    16744 +   accounts_profile accounts_profile_email_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_email_key UNIQUE (email);
 U   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_email_key;
       public            postgres    false    250            �           2606    16727 &   accounts_profile accounts_profile_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_pkey;
       public            postgres    false    250            �           2606    16736 *   accounts_profile accounts_profile_slug_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_slug_key UNIQUE (slug);
 T   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_slug_key;
       public            postgres    false    250            �           2606    16729 -   accounts_profile accounts_profile_user_id_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);
 W   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_key;
       public            postgres    false    250            <           2606    16827    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            A           2606    16469 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218            D           2606    16435 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            >           2606    16426    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            7           2606    16460 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            9           2606    16419 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214            L           2606    16451 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    222            O           2606    16484 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    222    222            F           2606    16442    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    220            R           2606    16458 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    224            U           2606    16498 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    224    224            I           2606    16822     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    220            �           2606    16835    books_book books_book_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.books_book DROP CONSTRAINT books_book_pkey;
       public            postgres    false    260            �           2606    17248    books_book books_book_slug_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.books_book
    ADD CONSTRAINT books_book_slug_key UNIQUE (slug);
 H   ALTER TABLE ONLY public.books_book DROP CONSTRAINT books_book_slug_key;
       public            postgres    false    260            �           2606    17165 D   books_book_views books_book_views_book_id_ipmanager_id_f19e0dec_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.books_book_views
    ADD CONSTRAINT books_book_views_book_id_ipmanager_id_f19e0dec_uniq UNIQUE (book_id, ipmanager_id);
 n   ALTER TABLE ONLY public.books_book_views DROP CONSTRAINT books_book_views_book_id_ipmanager_id_f19e0dec_uniq;
       public            postgres    false    273    273            �           2606    17163 &   books_book_views books_book_views_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.books_book_views
    ADD CONSTRAINT books_book_views_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.books_book_views DROP CONSTRAINT books_book_views_pkey;
       public            postgres    false    273            �           2606    16808 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    258            2           2606    16412 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            4           2606    16410 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            0           2606    16403 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210            �           2606    16909 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    269            �           2606    16842    games_game games_game_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.games_game
    ADD CONSTRAINT games_game_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.games_game DROP CONSTRAINT games_game_pkey;
       public            postgres    false    262            �           2606    16846    games_game games_game_slug_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.games_game
    ADD CONSTRAINT games_game_slug_key UNIQUE (slug);
 H   ALTER TABLE ONLY public.games_game DROP CONSTRAINT games_game_slug_key;
       public            postgres    false    262            �           2606    17186 D   games_game_views games_game_views_game_id_ipmanager_id_1898bc3f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.games_game_views
    ADD CONSTRAINT games_game_views_game_id_ipmanager_id_1898bc3f_uniq UNIQUE (game_id, ipmanager_id);
 n   ALTER TABLE ONLY public.games_game_views DROP CONSTRAINT games_game_views_game_id_ipmanager_id_1898bc3f_uniq;
       public            postgres    false    275    275            �           2606    17184 &   games_game_views games_game_views_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.games_game_views
    ADD CONSTRAINT games_game_views_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.games_game_views DROP CONSTRAINT games_game_views_pkey;
       public            postgres    false    275            �           2606    17156 ,   main_page_ipmanager main_page_ipmanager_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.main_page_ipmanager
    ADD CONSTRAINT main_page_ipmanager_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.main_page_ipmanager DROP CONSTRAINT main_page_ipmanager_pkey;
       public            postgres    false    271            z           2606    16635 Y   movies_actor_carrier_role movies_actor_carrier_role_actor_id_carrierrole_id_94490916_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.movies_actor_carrier_role
    ADD CONSTRAINT movies_actor_carrier_role_actor_id_carrierrole_id_94490916_uniq UNIQUE (actor_id, carrierrole_id);
 �   ALTER TABLE ONLY public.movies_actor_carrier_role DROP CONSTRAINT movies_actor_carrier_role_actor_id_carrierrole_id_94490916_uniq;
       public            postgres    false    242    242            ~           2606    16633 8   movies_actor_carrier_role movies_actor_carrier_role_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.movies_actor_carrier_role
    ADD CONSTRAINT movies_actor_carrier_role_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.movies_actor_carrier_role DROP CONSTRAINT movies_actor_carrier_role_pkey;
       public            postgres    false    242            n           2606    16592    movies_actor movies_actor_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.movies_actor
    ADD CONSTRAINT movies_actor_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.movies_actor DROP CONSTRAINT movies_actor_pkey;
       public            postgres    false    236            x           2606    16625 *   movies_carrierrole movies_carrierrole_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.movies_carrierrole
    ADD CONSTRAINT movies_carrierrole_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.movies_carrierrole DROP CONSTRAINT movies_carrierrole_pkey;
       public            postgres    false    240            �           2606    16677 "   movies_comment movies_comment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.movies_comment
    ADD CONSTRAINT movies_comment_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.movies_comment DROP CONSTRAINT movies_comment_pkey;
       public            postgres    false    246            e           2606    16562 $   movies_composer movies_composer_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.movies_composer
    ADD CONSTRAINT movies_composer_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.movies_composer DROP CONSTRAINT movies_composer_pkey;
       public            postgres    false    232            ]           2606    16524 &   movies_countries movies_countries_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.movies_countries
    ADD CONSTRAINT movies_countries_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.movies_countries DROP CONSTRAINT movies_countries_pkey;
       public            postgres    false    228            i           2606    16569 $   movies_director movies_director_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.movies_director
    ADD CONSTRAINT movies_director_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.movies_director DROP CONSTRAINT movies_director_pkey;
       public            postgres    false    234            �           2606    16668 $   movies_feedback movies_feedback_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.movies_feedback
    ADD CONSTRAINT movies_feedback_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.movies_feedback DROP CONSTRAINT movies_feedback_pkey;
       public            postgres    false    244            s           2606    16603 G   movies_movie_actors movies_movie_actors_movie_id_actor_id_73463e17_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_actors
    ADD CONSTRAINT movies_movie_actors_movie_id_actor_id_73463e17_uniq UNIQUE (movie_id, actor_id);
 q   ALTER TABLE ONLY public.movies_movie_actors DROP CONSTRAINT movies_movie_actors_movie_id_actor_id_73463e17_uniq;
       public            postgres    false    238    238            v           2606    16599 ,   movies_movie_actors movies_movie_actors_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.movies_movie_actors
    ADD CONSTRAINT movies_movie_actors_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.movies_movie_actors DROP CONSTRAINT movies_movie_actors_pkey;
       public            postgres    false    238            a           2606    16539 Q   movies_movie_countries movies_movie_countries_movie_id_countries_id_74cdf2e4_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_countries
    ADD CONSTRAINT movies_movie_countries_movie_id_countries_id_74cdf2e4_uniq UNIQUE (movie_id, countries_id);
 {   ALTER TABLE ONLY public.movies_movie_countries DROP CONSTRAINT movies_movie_countries_movie_id_countries_id_74cdf2e4_uniq;
       public            postgres    false    230    230            c           2606    16537 2   movies_movie_countries movies_movie_countries_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.movies_movie_countries
    ADD CONSTRAINT movies_movie_countries_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.movies_movie_countries DROP CONSTRAINT movies_movie_countries_pkey;
       public            postgres    false    230            Y           2606    16517    movies_movie movies_movie_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.movies_movie
    ADD CONSTRAINT movies_movie_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.movies_movie DROP CONSTRAINT movies_movie_pkey;
       public            postgres    false    226            �           2606    17207 I   movies_movie_views movies_movie_views_movie_id_ipmanager_id_0863e675_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_views
    ADD CONSTRAINT movies_movie_views_movie_id_ipmanager_id_0863e675_uniq UNIQUE (movie_id, ipmanager_id);
 s   ALTER TABLE ONLY public.movies_movie_views DROP CONSTRAINT movies_movie_views_movie_id_ipmanager_id_0863e675_uniq;
       public            postgres    false    277    277            �           2606    17205 *   movies_movie_views movies_movie_views_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.movies_movie_views
    ADD CONSTRAINT movies_movie_views_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.movies_movie_views DROP CONSTRAINT movies_movie_views_pkey;
       public            postgres    false    277            �           2606    16708     movies_rating movies_rating_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.movies_rating
    ADD CONSTRAINT movies_rating_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.movies_rating DROP CONSTRAINT movies_rating_pkey;
       public            postgres    false    248            �           2606    16857    orders_order orders_order_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_pkey;
       public            postgres    false    264            �           2606    16865 &   orders_orderitem orders_orderitem_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_pkey;
       public            postgres    false    266            �           2606    16902 "   serials_serial serials_serial_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.serials_serial
    ADD CONSTRAINT serials_serial_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.serials_serial DROP CONSTRAINT serials_serial_pkey;
       public            postgres    false    268            �           2606    17253 &   serials_serial serials_serial_slug_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.serials_serial
    ADD CONSTRAINT serials_serial_slug_key UNIQUE (slug);
 P   ALTER TABLE ONLY public.serials_serial DROP CONSTRAINT serials_serial_slug_key;
       public            postgres    false    268            �           2606    17226 .   serials_serial_views serials_serial_views_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.serials_serial_views
    ADD CONSTRAINT serials_serial_views_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.serials_serial_views DROP CONSTRAINT serials_serial_views_pkey;
       public            postgres    false    279            �           2606    17228 N   serials_serial_views serials_serial_views_serial_id_ipmanager_id_eeb3f716_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.serials_serial_views
    ADD CONSTRAINT serials_serial_views_serial_id_ipmanager_id_eeb3f716_uniq UNIQUE (serial_id, ipmanager_id);
 x   ALTER TABLE ONLY public.serials_serial_views DROP CONSTRAINT serials_serial_views_serial_id_ipmanager_id_eeb3f716_uniq;
       public            postgres    false    279    279            �           1259    16785 &   accounts_chat_members_chat_id_3080fc45    INDEX     k   CREATE INDEX accounts_chat_members_chat_id_3080fc45 ON public.accounts_chat_members USING btree (chat_id);
 :   DROP INDEX public.accounts_chat_members_chat_id_3080fc45;
       public            postgres    false    254            �           1259    16786 &   accounts_chat_members_user_id_3a443b51    INDEX     k   CREATE INDEX accounts_chat_members_user_id_3a443b51 ON public.accounts_chat_members USING btree (user_id);
 :   DROP INDEX public.accounts_chat_members_user_id_3a443b51;
       public            postgres    false    254            �           1259    16797 #   accounts_message_author_id_0afec40b    INDEX     e   CREATE INDEX accounts_message_author_id_0afec40b ON public.accounts_message USING btree (author_id);
 7   DROP INDEX public.accounts_message_author_id_0afec40b;
       public            postgres    false    256            �           1259    16798 !   accounts_message_chat_id_9094c78c    INDEX     a   CREATE INDEX accounts_message_chat_id_9094c78c ON public.accounts_message USING btree (chat_id);
 5   DROP INDEX public.accounts_message_chat_id_9094c78c;
       public            postgres    false    256            �           1259    16748 $   accounts_profile_country_id_4a38bafe    INDEX     g   CREATE INDEX accounts_profile_country_id_4a38bafe ON public.accounts_profile USING btree (country_id);
 8   DROP INDEX public.accounts_profile_country_id_4a38bafe;
       public            postgres    false    250            �           1259    16749 $   accounts_profile_email_71583453_like    INDEX     v   CREATE INDEX accounts_profile_email_71583453_like ON public.accounts_profile USING btree (email varchar_pattern_ops);
 8   DROP INDEX public.accounts_profile_email_71583453_like;
       public            postgres    false    250            �           1259    16737 #   accounts_profile_slug_8a7a322e_like    INDEX     t   CREATE INDEX accounts_profile_slug_8a7a322e_like ON public.accounts_profile USING btree (slug varchar_pattern_ops);
 7   DROP INDEX public.accounts_profile_slug_8a7a322e_like;
       public            postgres    false    250            :           1259    16828    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            ?           1259    16480 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            B           1259    16481 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            5           1259    16466 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214            J           1259    16496 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    222            M           1259    16495 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    222            P           1259    16510 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    224            S           1259    16509 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    224            G           1259    16823     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    220            �           1259    17249    books_book_slug_a38a79a6_like    INDEX     h   CREATE INDEX books_book_slug_a38a79a6_like ON public.books_book USING btree (slug varchar_pattern_ops);
 1   DROP INDEX public.books_book_slug_a38a79a6_like;
       public            postgres    false    260            �           1259    17176 !   books_book_views_book_id_884058cf    INDEX     a   CREATE INDEX books_book_views_book_id_884058cf ON public.books_book_views USING btree (book_id);
 5   DROP INDEX public.books_book_views_book_id_884058cf;
       public            postgres    false    273            �           1259    17177 &   books_book_views_ipmanager_id_ddbd786f    INDEX     k   CREATE INDEX books_book_views_ipmanager_id_ddbd786f ON public.books_book_views USING btree (ipmanager_id);
 :   DROP INDEX public.books_book_views_ipmanager_id_ddbd786f;
       public            postgres    false    273            �           1259    16819 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    258            �           1259    16820 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    258            �           1259    16911 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    269            �           1259    16910 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    269            �           1259    16847    games_game_slug_02e11826_like    INDEX     h   CREATE INDEX games_game_slug_02e11826_like ON public.games_game USING btree (slug varchar_pattern_ops);
 1   DROP INDEX public.games_game_slug_02e11826_like;
       public            postgres    false    262            �           1259    17197 !   games_game_views_game_id_acbfffb9    INDEX     a   CREATE INDEX games_game_views_game_id_acbfffb9 ON public.games_game_views USING btree (game_id);
 5   DROP INDEX public.games_game_views_game_id_acbfffb9;
       public            postgres    false    275            �           1259    17198 &   games_game_views_ipmanager_id_de70a003    INDEX     k   CREATE INDEX games_game_views_ipmanager_id_de70a003 ON public.games_game_views USING btree (ipmanager_id);
 :   DROP INDEX public.games_game_views_ipmanager_id_de70a003;
       public            postgres    false    275            l           1259    16654 #   movies_actor_birthplace_id_e735d869    INDEX     e   CREATE INDEX movies_actor_birthplace_id_e735d869 ON public.movies_actor USING btree (birthplace_id);
 7   DROP INDEX public.movies_actor_birthplace_id_e735d869;
       public            postgres    false    236            {           1259    16646 +   movies_actor_carrier_role_actor_id_fe4bedcd    INDEX     u   CREATE INDEX movies_actor_carrier_role_actor_id_fe4bedcd ON public.movies_actor_carrier_role USING btree (actor_id);
 ?   DROP INDEX public.movies_actor_carrier_role_actor_id_fe4bedcd;
       public            postgres    false    242            |           1259    16647 1   movies_actor_carrier_role_carrierrole_id_f0e7b2c0    INDEX     �   CREATE INDEX movies_actor_carrier_role_carrierrole_id_f0e7b2c0 ON public.movies_actor_carrier_role USING btree (carrierrole_id);
 E   DROP INDEX public.movies_actor_carrier_role_carrierrole_id_f0e7b2c0;
       public            postgres    false    242            o           1259    16600    movies_actor_slug_4b182dff    INDEX     S   CREATE INDEX movies_actor_slug_4b182dff ON public.movies_actor USING btree (slug);
 .   DROP INDEX public.movies_actor_slug_4b182dff;
       public            postgres    false    236            p           1259    16601    movies_actor_slug_4b182dff_like    INDEX     l   CREATE INDEX movies_actor_slug_4b182dff_like ON public.movies_actor USING btree (slug varchar_pattern_ops);
 3   DROP INDEX public.movies_actor_slug_4b182dff_like;
       public            postgres    false    236            �           1259    16700 #   movies_comment_feedback_id_5bb78a65    INDEX     e   CREATE INDEX movies_comment_feedback_id_5bb78a65 ON public.movies_comment USING btree (feedback_id);
 7   DROP INDEX public.movies_comment_feedback_id_5bb78a65;
       public            postgres    false    246            �           1259    16701    movies_comment_user_id_651fc81b    INDEX     ]   CREATE INDEX movies_comment_user_id_651fc81b ON public.movies_comment USING btree (user_id);
 3   DROP INDEX public.movies_comment_user_id_651fc81b;
       public            postgres    false    246            f           1259    16580    movies_composer_slug_8c60eeb9    INDEX     Y   CREATE INDEX movies_composer_slug_8c60eeb9 ON public.movies_composer USING btree (slug);
 1   DROP INDEX public.movies_composer_slug_8c60eeb9;
       public            postgres    false    232            g           1259    16581 "   movies_composer_slug_8c60eeb9_like    INDEX     r   CREATE INDEX movies_composer_slug_8c60eeb9_like ON public.movies_composer USING btree (slug varchar_pattern_ops);
 6   DROP INDEX public.movies_composer_slug_8c60eeb9_like;
       public            postgres    false    232            j           1259    16582    movies_director_slug_3dfb4ced    INDEX     Y   CREATE INDEX movies_director_slug_3dfb4ced ON public.movies_director USING btree (slug);
 1   DROP INDEX public.movies_director_slug_3dfb4ced;
       public            postgres    false    234            k           1259    16583 "   movies_director_slug_3dfb4ced_like    INDEX     r   CREATE INDEX movies_director_slug_3dfb4ced_like ON public.movies_director USING btree (slug varchar_pattern_ops);
 6   DROP INDEX public.movies_director_slug_3dfb4ced_like;
       public            postgres    false    234                       1259    16688 !   movies_feedback_movie_id_123349ec    INDEX     a   CREATE INDEX movies_feedback_movie_id_123349ec ON public.movies_feedback USING btree (movie_id);
 5   DROP INDEX public.movies_feedback_movie_id_123349ec;
       public            postgres    false    244            �           1259    16689     movies_feedback_user_id_24b5b774    INDEX     _   CREATE INDEX movies_feedback_user_id_24b5b774 ON public.movies_feedback USING btree (user_id);
 4   DROP INDEX public.movies_feedback_user_id_24b5b774;
       public            postgres    false    244            q           1259    16615 %   movies_movie_actors_actor_id_44828aa1    INDEX     i   CREATE INDEX movies_movie_actors_actor_id_44828aa1 ON public.movies_movie_actors USING btree (actor_id);
 9   DROP INDEX public.movies_movie_actors_actor_id_44828aa1;
       public            postgres    false    238            t           1259    16614 %   movies_movie_actors_movie_id_baed65f3    INDEX     i   CREATE INDEX movies_movie_actors_movie_id_baed65f3 ON public.movies_movie_actors USING btree (movie_id);
 9   DROP INDEX public.movies_movie_actors_movie_id_baed65f3;
       public            postgres    false    238            V           1259    16584 !   movies_movie_composer_id_ee4ffdc1    INDEX     a   CREATE INDEX movies_movie_composer_id_ee4ffdc1 ON public.movies_movie USING btree (composer_id);
 5   DROP INDEX public.movies_movie_composer_id_ee4ffdc1;
       public            postgres    false    226            ^           1259    16551 ,   movies_movie_countries_countries_id_5fc1b63c    INDEX     w   CREATE INDEX movies_movie_countries_countries_id_5fc1b63c ON public.movies_movie_countries USING btree (countries_id);
 @   DROP INDEX public.movies_movie_countries_countries_id_5fc1b63c;
       public            postgres    false    230            _           1259    16550 (   movies_movie_countries_movie_id_7eca54b1    INDEX     o   CREATE INDEX movies_movie_countries_movie_id_7eca54b1 ON public.movies_movie_countries USING btree (movie_id);
 <   DROP INDEX public.movies_movie_countries_movie_id_7eca54b1;
       public            postgres    false    230            W           1259    16585 !   movies_movie_director_id_820fda18    INDEX     a   CREATE INDEX movies_movie_director_id_820fda18 ON public.movies_movie USING btree (director_id);
 5   DROP INDEX public.movies_movie_director_id_820fda18;
       public            postgres    false    226            Z           1259    16617    movies_movie_slug_0ca8c2c1    INDEX     S   CREATE INDEX movies_movie_slug_0ca8c2c1 ON public.movies_movie USING btree (slug);
 .   DROP INDEX public.movies_movie_slug_0ca8c2c1;
       public            postgres    false    226            [           1259    16618    movies_movie_slug_0ca8c2c1_like    INDEX     l   CREATE INDEX movies_movie_slug_0ca8c2c1_like ON public.movies_movie USING btree (slug varchar_pattern_ops);
 3   DROP INDEX public.movies_movie_slug_0ca8c2c1_like;
       public            postgres    false    226            �           1259    17219 (   movies_movie_views_ipmanager_id_fe9cf63d    INDEX     o   CREATE INDEX movies_movie_views_ipmanager_id_fe9cf63d ON public.movies_movie_views USING btree (ipmanager_id);
 <   DROP INDEX public.movies_movie_views_ipmanager_id_fe9cf63d;
       public            postgres    false    277            �           1259    17218 $   movies_movie_views_movie_id_6d0b2512    INDEX     g   CREATE INDEX movies_movie_views_movie_id_6d0b2512 ON public.movies_movie_views USING btree (movie_id);
 8   DROP INDEX public.movies_movie_views_movie_id_6d0b2512;
       public            postgres    false    277            �           1259    16719    movies_rating_movie_id_697b1621    INDEX     ]   CREATE INDEX movies_rating_movie_id_697b1621 ON public.movies_rating USING btree (movie_id);
 3   DROP INDEX public.movies_rating_movie_id_697b1621;
       public            postgres    false    248            �           1259    16720    movies_rating_user_id_30a94f7b    INDEX     [   CREATE INDEX movies_rating_user_id_30a94f7b ON public.movies_rating USING btree (user_id);
 2   DROP INDEX public.movies_rating_user_id_30a94f7b;
       public            postgres    false    248            �           1259    16877    orders_order_user_id_e9b59eb1    INDEX     Y   CREATE INDEX orders_order_user_id_e9b59eb1 ON public.orders_order USING btree (user_id);
 1   DROP INDEX public.orders_order_user_id_e9b59eb1;
       public            postgres    false    264            �           1259    16893 !   orders_orderitem_game_id_a7fff13c    INDEX     a   CREATE INDEX orders_orderitem_game_id_a7fff13c ON public.orders_orderitem USING btree (game_id);
 5   DROP INDEX public.orders_orderitem_game_id_a7fff13c;
       public            postgres    false    266            �           1259    16894 "   orders_orderitem_movie_id_6b61c196    INDEX     c   CREATE INDEX orders_orderitem_movie_id_6b61c196 ON public.orders_orderitem USING btree (movie_id);
 6   DROP INDEX public.orders_orderitem_movie_id_6b61c196;
       public            postgres    false    266            �           1259    16895 "   orders_orderitem_order_id_fe61a34d    INDEX     c   CREATE INDEX orders_orderitem_order_id_fe61a34d ON public.orders_orderitem USING btree (order_id);
 6   DROP INDEX public.orders_orderitem_order_id_fe61a34d;
       public            postgres    false    266            �           1259    17254 !   serials_serial_slug_412395e4_like    INDEX     p   CREATE INDEX serials_serial_slug_412395e4_like ON public.serials_serial USING btree (slug varchar_pattern_ops);
 5   DROP INDEX public.serials_serial_slug_412395e4_like;
       public            postgres    false    268            �           1259    17240 *   serials_serial_views_ipmanager_id_06b94de8    INDEX     s   CREATE INDEX serials_serial_views_ipmanager_id_06b94de8 ON public.serials_serial_views USING btree (ipmanager_id);
 >   DROP INDEX public.serials_serial_views_ipmanager_id_06b94de8;
       public            postgres    false    279            �           1259    17239 '   serials_serial_views_serial_id_db75aa72    INDEX     m   CREATE INDEX serials_serial_views_serial_id_db75aa72 ON public.serials_serial_views USING btree (serial_id);
 ;   DROP INDEX public.serials_serial_views_serial_id_db75aa72;
       public            postgres    false    279            �           2606    16775 P   accounts_chat_members accounts_chat_members_chat_id_3080fc45_fk_accounts_chat_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_chat_members
    ADD CONSTRAINT accounts_chat_members_chat_id_3080fc45_fk_accounts_chat_id FOREIGN KEY (chat_id) REFERENCES public.accounts_chat(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.accounts_chat_members DROP CONSTRAINT accounts_chat_members_chat_id_3080fc45_fk_accounts_chat_id;
       public          postgres    false    3479    252    254            �           2606    16780 L   accounts_chat_members accounts_chat_members_user_id_3a443b51_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_chat_members
    ADD CONSTRAINT accounts_chat_members_user_id_3a443b51_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_chat_members DROP CONSTRAINT accounts_chat_members_user_id_3a443b51_fk_auth_user_id;
       public          postgres    false    254    220    3398            �           2606    16787 D   accounts_message accounts_message_author_id_0afec40b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_message
    ADD CONSTRAINT accounts_message_author_id_0afec40b_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.accounts_message DROP CONSTRAINT accounts_message_author_id_0afec40b_fk_auth_user_id;
       public          postgres    false    256    3398    220            �           2606    16792 F   accounts_message accounts_message_chat_id_9094c78c_fk_accounts_chat_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_message
    ADD CONSTRAINT accounts_message_chat_id_9094c78c_fk_accounts_chat_id FOREIGN KEY (chat_id) REFERENCES public.accounts_chat(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_message DROP CONSTRAINT accounts_message_chat_id_9094c78c_fk_accounts_chat_id;
       public          postgres    false    3479    252    256            �           2606    16738 L   accounts_profile accounts_profile_country_id_4a38bafe_fk_movies_countries_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_country_id_4a38bafe_fk_movies_countries_id FOREIGN KEY (country_id) REFERENCES public.movies_countries(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_country_id_4a38bafe_fk_movies_countries_id;
       public          postgres    false    228    250    3421            �           2606    16730 B   accounts_profile accounts_profile_user_id_49a85d32_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.accounts_profile DROP CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id;
       public          postgres    false    220    250    3398            �           2606    16475 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3385    214    218            �           2606    16470 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    216    218    3390            �           2606    16461 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3380    212    214            �           2606    16490 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    216    3390    222            �           2606    16485 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    220    222    3398            �           2606    16504 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    224    3385    214            �           2606    16499 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    3398    220    224            �           2606    17166 C   books_book_views books_book_views_book_id_884058cf_fk_books_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book_views
    ADD CONSTRAINT books_book_views_book_id_884058cf_fk_books_book_id FOREIGN KEY (book_id) REFERENCES public.books_book(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.books_book_views DROP CONSTRAINT books_book_views_book_id_884058cf_fk_books_book_id;
       public          postgres    false    3495    260    273            �           2606    17171 D   books_book_views books_book_views_ipmanager_id_ddbd786f_fk_main_page    FK CONSTRAINT     �   ALTER TABLE ONLY public.books_book_views
    ADD CONSTRAINT books_book_views_ipmanager_id_ddbd786f_fk_main_page FOREIGN KEY (ipmanager_id) REFERENCES public.main_page_ipmanager(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.books_book_views DROP CONSTRAINT books_book_views_ipmanager_id_ddbd786f_fk_main_page;
       public          postgres    false    271    273    3522            �           2606    16809 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    212    258    3380            �           2606    16814 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    220    258    3398            �           2606    17187 C   games_game_views games_game_views_game_id_acbfffb9_fk_games_game_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.games_game_views
    ADD CONSTRAINT games_game_views_game_id_acbfffb9_fk_games_game_id FOREIGN KEY (game_id) REFERENCES public.games_game(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.games_game_views DROP CONSTRAINT games_game_views_game_id_acbfffb9_fk_games_game_id;
       public          postgres    false    275    3500    262                        2606    17192 D   games_game_views games_game_views_ipmanager_id_de70a003_fk_main_page    FK CONSTRAINT     �   ALTER TABLE ONLY public.games_game_views
    ADD CONSTRAINT games_game_views_ipmanager_id_de70a003_fk_main_page FOREIGN KEY (ipmanager_id) REFERENCES public.main_page_ipmanager(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.games_game_views DROP CONSTRAINT games_game_views_ipmanager_id_de70a003_fk_main_page;
       public          postgres    false    3522    275    271            �           2606    16655 G   movies_actor movies_actor_birthplace_id_e735d869_fk_movies_countries_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_actor
    ADD CONSTRAINT movies_actor_birthplace_id_e735d869_fk_movies_countries_id FOREIGN KEY (birthplace_id) REFERENCES public.movies_countries(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.movies_actor DROP CONSTRAINT movies_actor_birthplace_id_e735d869_fk_movies_countries_id;
       public          postgres    false    228    3421    236            �           2606    16641 S   movies_actor_carrier_role movies_actor_carrier_carrierrole_id_f0e7b2c0_fk_movies_ca    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_actor_carrier_role
    ADD CONSTRAINT movies_actor_carrier_carrierrole_id_f0e7b2c0_fk_movies_ca FOREIGN KEY (carrierrole_id) REFERENCES public.movies_carrierrole(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.movies_actor_carrier_role DROP CONSTRAINT movies_actor_carrier_carrierrole_id_f0e7b2c0_fk_movies_ca;
       public          postgres    false    3448    240    242            �           2606    16636 X   movies_actor_carrier_role movies_actor_carrier_role_actor_id_fe4bedcd_fk_movies_actor_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_actor_carrier_role
    ADD CONSTRAINT movies_actor_carrier_role_actor_id_fe4bedcd_fk_movies_actor_id FOREIGN KEY (actor_id) REFERENCES public.movies_actor(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.movies_actor_carrier_role DROP CONSTRAINT movies_actor_carrier_role_actor_id_fe4bedcd_fk_movies_actor_id;
       public          postgres    false    242    236    3438            �           2606    16690 H   movies_comment movies_comment_feedback_id_5bb78a65_fk_movies_feedback_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_comment
    ADD CONSTRAINT movies_comment_feedback_id_5bb78a65_fk_movies_feedback_id FOREIGN KEY (feedback_id) REFERENCES public.movies_feedback(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.movies_comment DROP CONSTRAINT movies_comment_feedback_id_5bb78a65_fk_movies_feedback_id;
       public          postgres    false    3457    244    246            �           2606    16695 >   movies_comment movies_comment_user_id_651fc81b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_comment
    ADD CONSTRAINT movies_comment_user_id_651fc81b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.movies_comment DROP CONSTRAINT movies_comment_user_id_651fc81b_fk_auth_user_id;
       public          postgres    false    3398    220    246            �           2606    16678 D   movies_feedback movies_feedback_movie_id_123349ec_fk_movies_movie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_feedback
    ADD CONSTRAINT movies_feedback_movie_id_123349ec_fk_movies_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies_movie(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.movies_feedback DROP CONSTRAINT movies_feedback_movie_id_123349ec_fk_movies_movie_id;
       public          postgres    false    244    226    3417            �           2606    16683 @   movies_feedback movies_feedback_user_id_24b5b774_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_feedback
    ADD CONSTRAINT movies_feedback_user_id_24b5b774_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.movies_feedback DROP CONSTRAINT movies_feedback_user_id_24b5b774_fk_auth_user_id;
       public          postgres    false    244    220    3398            �           2606    16609 L   movies_movie_actors movies_movie_actors_actor_id_44828aa1_fk_movies_actor_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_actors
    ADD CONSTRAINT movies_movie_actors_actor_id_44828aa1_fk_movies_actor_id FOREIGN KEY (actor_id) REFERENCES public.movies_actor(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.movies_movie_actors DROP CONSTRAINT movies_movie_actors_actor_id_44828aa1_fk_movies_actor_id;
       public          postgres    false    238    236    3438            �           2606    16604 L   movies_movie_actors movies_movie_actors_movie_id_baed65f3_fk_movies_movie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_actors
    ADD CONSTRAINT movies_movie_actors_movie_id_baed65f3_fk_movies_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies_movie(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.movies_movie_actors DROP CONSTRAINT movies_movie_actors_movie_id_baed65f3_fk_movies_movie_id;
       public          postgres    false    226    3417    238            �           2606    16570 D   movies_movie movies_movie_composer_id_ee4ffdc1_fk_movies_composer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie
    ADD CONSTRAINT movies_movie_composer_id_ee4ffdc1_fk_movies_composer_id FOREIGN KEY (composer_id) REFERENCES public.movies_composer(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.movies_movie DROP CONSTRAINT movies_movie_composer_id_ee4ffdc1_fk_movies_composer_id;
       public          postgres    false    226    232    3429            �           2606    16545 N   movies_movie_countries movies_movie_countri_countries_id_5fc1b63c_fk_movies_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_countries
    ADD CONSTRAINT movies_movie_countri_countries_id_5fc1b63c_fk_movies_co FOREIGN KEY (countries_id) REFERENCES public.movies_countries(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.movies_movie_countries DROP CONSTRAINT movies_movie_countri_countries_id_5fc1b63c_fk_movies_co;
       public          postgres    false    230    3421    228            �           2606    16540 R   movies_movie_countries movies_movie_countries_movie_id_7eca54b1_fk_movies_movie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_countries
    ADD CONSTRAINT movies_movie_countries_movie_id_7eca54b1_fk_movies_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies_movie(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.movies_movie_countries DROP CONSTRAINT movies_movie_countries_movie_id_7eca54b1_fk_movies_movie_id;
       public          postgres    false    230    3417    226            �           2606    16575 D   movies_movie movies_movie_director_id_820fda18_fk_movies_director_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie
    ADD CONSTRAINT movies_movie_director_id_820fda18_fk_movies_director_id FOREIGN KEY (director_id) REFERENCES public.movies_director(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.movies_movie DROP CONSTRAINT movies_movie_director_id_820fda18_fk_movies_director_id;
       public          postgres    false    234    226    3433                       2606    17213 H   movies_movie_views movies_movie_views_ipmanager_id_fe9cf63d_fk_main_page    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_views
    ADD CONSTRAINT movies_movie_views_ipmanager_id_fe9cf63d_fk_main_page FOREIGN KEY (ipmanager_id) REFERENCES public.main_page_ipmanager(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.movies_movie_views DROP CONSTRAINT movies_movie_views_ipmanager_id_fe9cf63d_fk_main_page;
       public          postgres    false    3522    277    271                       2606    17208 J   movies_movie_views movies_movie_views_movie_id_6d0b2512_fk_movies_movie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_movie_views
    ADD CONSTRAINT movies_movie_views_movie_id_6d0b2512_fk_movies_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies_movie(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.movies_movie_views DROP CONSTRAINT movies_movie_views_movie_id_6d0b2512_fk_movies_movie_id;
       public          postgres    false    277    3417    226            �           2606    16709 @   movies_rating movies_rating_movie_id_697b1621_fk_movies_movie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_rating
    ADD CONSTRAINT movies_rating_movie_id_697b1621_fk_movies_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies_movie(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.movies_rating DROP CONSTRAINT movies_rating_movie_id_697b1621_fk_movies_movie_id;
       public          postgres    false    3417    226    248            �           2606    16714 <   movies_rating movies_rating_user_id_30a94f7b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_rating
    ADD CONSTRAINT movies_rating_user_id_30a94f7b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.movies_rating DROP CONSTRAINT movies_rating_user_id_30a94f7b_fk_auth_user_id;
       public          postgres    false    3398    248    220            �           2606    16871 :   orders_order orders_order_user_id_e9b59eb1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_user_id_e9b59eb1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_user_id_e9b59eb1_fk_auth_user_id;
       public          postgres    false    264    3398    220            �           2606    16878 C   orders_orderitem orders_orderitem_game_id_a7fff13c_fk_games_game_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_game_id_a7fff13c_fk_games_game_id FOREIGN KEY (game_id) REFERENCES public.games_game(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_game_id_a7fff13c_fk_games_game_id;
       public          postgres    false    3500    266    262            �           2606    16883 F   orders_orderitem orders_orderitem_movie_id_6b61c196_fk_movies_movie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_movie_id_6b61c196_fk_movies_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies_movie(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_movie_id_6b61c196_fk_movies_movie_id;
       public          postgres    false    3417    266    226            �           2606    16888 F   orders_orderitem orders_orderitem_order_id_fe61a34d_fk_orders_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.orders_orderitem DROP CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id;
       public          postgres    false    264    3505    266                       2606    17234 L   serials_serial_views serials_serial_views_ipmanager_id_06b94de8_fk_main_page    FK CONSTRAINT     �   ALTER TABLE ONLY public.serials_serial_views
    ADD CONSTRAINT serials_serial_views_ipmanager_id_06b94de8_fk_main_page FOREIGN KEY (ipmanager_id) REFERENCES public.main_page_ipmanager(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.serials_serial_views DROP CONSTRAINT serials_serial_views_ipmanager_id_06b94de8_fk_main_page;
       public          postgres    false    279    3522    271                       2606    17229 Q   serials_serial_views serials_serial_views_serial_id_db75aa72_fk_serials_serial_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.serials_serial_views
    ADD CONSTRAINT serials_serial_views_serial_id_db75aa72_fk_serials_serial_id FOREIGN KEY (serial_id) REFERENCES public.serials_serial(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.serials_serial_views DROP CONSTRAINT serials_serial_views_serial_id_db75aa72_fk_serials_serial_id;
       public          postgres    false    279    3513    268            �   <   x���v
Q���W((M��L�KLN�/�+)�O�H,Qs�	uV�0�QPwQ״��� ��%      �   N   x���v
Q���W((M��L�KLN�/�+)�O�H,��M�MJ-*Vs�	uV�02�Q0"Mk.O���A�5sq �O%�      �   �   x���v
Q���W((M��L�KLN�/�+)��M-.NLOUs�	uV�0�QP�H���W2���t,tM��L����-L��̴��
J�JSu��XӚ˓k���g�+��c���X������b{�Z�+S��Zbb�gl����\\ �IQ�      �   �  x���j�0����7� �c5v��f�(,[��A�G�-y�b��h��v�!ʮ�{�&g	m��n���.,|Χ� ��u�GoJ�?8T��($��\�M�H�1gcb����������4Mk*��^o����H�"�]��;Em�r�"��+s5����O5��6��QAD.[{��N� C<c���=�+V�iU����Ҝ�<�c�����Yq��f��2��S��� 6b�=��ߞd�?ũ��i��+I��lTc���n?�`:C�I@2��E �PY"/"{h��e��Ob_��M���}�H]:���˓�J�e:���>GQe�Y���\LǶA��SV��b��T|+�������D�"DB�O	�� i���*����������\v�M�{?W��
�|E�ǫ7�Q�U��F�u�3b)�R�Z�P?h�Q���ۻPq�D��s���@���x����SC2�G��xM�m����3��:x~��U��wj�      �   
   x���          �   
   x���          �   Y  x����j�@�}�B���-�Ħ�R�����0�'��e	Ynɓ�5�+�)�HՌ�����s��B7��9�����՗�����sV���9�O��m�b�/�]��ç�W�ٛ�Ev���2�^g�j��]�<�_dn���Y?z�����ٜ�Փ�ml$�c���[��x?F�)�?
�3���g,��;8���0M�˰#�҆�K�w�Sి��G����,�MS�N�P��s�7ɰ�I9C�Xf�Y�bs-G}�9a�����)���̓�'��d��0tγd��/Y��j�v�J�>׶sg�(��4Q_�`O,@�b������7�F>ⱟX���
�7�ކ�gN?@�$����K���j?IS� -�O�>e��ͷ2MS�&k���/�{ޏ�4QW�wb���k�<�Fx��5D�X��q)v�C�S�}g/��&���Fz����ˀ�X�1�6����"q�[@�7�Y��+�%��?'��+�I)C�jK�R�+���>U���Y�U������i��F])�����%�>���>U�(mz�1�7�h,���p6f��*GMSڨ��Q�6���ԶO�yK�UG95��A���Q�2�6.����ꃅL�z�֮�����ptC?K<ͫ֋l
�U�E<���"�Ǎ��G��g�s��-ڏ�i�Cs��A#�,ڟ�}ܞ{�vg.��qy6�-v��c#MMՂ���1Y5��)`H������Sy�mL���p"�ω�j<N�K#@UM��pg����_"o�����L8���DO�')MDU��UJQE�qӧ���Ѻ���lNq4I��Ue&���U�Iy��@dQaҥ�
D��U7�c����pl�DU�����<f��Rv���l�^J���1W�㞌k�|8ù�DO��> U�ۘ>
�Յ<�1�� D�V������Hy8��Q��:K����٪����-�K��9sy���z��������V5��C�B�Y,S��:-�)j��>k�灬hm��	O��7P]��T���đD���1u�7���3[��8=�h�ǉ|t�0�cD���"í&���ی��;NxސE��f�mY�)g���DZ�e��o /�z3^��G�D�ƾ_�gg� 1�U!      �   �  x����n�@�{?Hi�Μ�*�n�������DÒ���:��C"���FJG:W��/}g&�Bw���^:\��i�m����*n=�V�����������1I�	�����G���x����4��X���x3��n�׹d��EY���E��3,+(^���V�_�݀ ��r�ÒF��� S�T"�XZG}�g����ٜn���κ���0hHT��}�6�|�+��3(fQ~l����������H��	2�RV�-o��v.;��X�C2W��4��*�5"j"(��K�5����&*� ����=l�GG�E?Ր���L�1g��q6�c��b�����۝l[����a�Tڶ!nBY������ʚ�(O�{��0K�s��e*�~d,I�����ӷV�ߟ��@%�^ #:Ƥ      �   
   x���          �   
   x���          �   Y   x���v
Q���W((M��L�K���.��
a�>���
�:
�A�e�y�:
�F�@^��V�_�_\�ZT����*HW״��� ��      �   =   x���v
Q���W((M��L�K���.���e����
a�>���
f:
�@d�i���  [�      �      x��][��u~ׯh��1"�^Փ'��`��%�d#0��3$G��f�v� E'�9���aGI��yK�ФD���z��IΩ����ٝ���5x���}u9��sN]��+o��]��7����<��{���������������w�~��Wnd�e�r�5N9���`:cz@�@R���9_ÿ`��7���4s�����}�/^���HE7�ԂɕH]���dEZ��J���T]E�"s��J����]E�M"5�ͥ��]Eʍ"Y�%���]Ez+� ��%�έ���H����Z>Z�s�y���r�a�$+�_���AV�G����y��]>�o?.?s�>,�"<�/���+w �hxe���ʭ��p8��w�Zq<9���O~�.�Uֆ���Jn2���@q��b����B���j#�"�pAL3�<�R���j��c)�����Ƽ�f�-�����|2�w�$�9��I0m�5G���pEUB���W����q��� '��hZ��m�j�3;�T4��{ O_��S�V������x����M������Ń���l���������ˇg{�8u�4��-��P]_�gle�� �g���lg��O������E[Y���ISٴ�[ن[9_�²�L��E���pM�22�n+�ߨM��QŀK�م٨�ߨ���PI,�Z��B�~���N��h�E�0�ߞ�w��_��^ݓ����x4�s+���s%V.�H���@$̸�,�D�IW�l�Ԩ�$�Ef�՞b4�H��E��b� BSJW.�v����[���<���J6���,�)�
���~!��B�����Ń�ϝ����υܜb�`t 9�Rȕ��Ig���E%9����6�rP��p9$]��r���DsA��C���8{�9���ʍû��φm�q��05܀�Jr��k��G���{��9���o�6�� ����d���)�~2"���q�vG!c(������q<-�(�����3Z�֡h�A	PY�y���v|0IJ���(J�m�� ���4���A�|��W�ѓ�}����X۩���L��Wż
+Z��$� ��W�}���Q1�@�р�Ԡ����GN�w`���|@���;%=�V~�^�e�>�p�>���`�.- 5�����&��sD�@x\~����!��L�����;=��K�c�������@}���[�S����fP��� Pj�s�w�t�����t~gXܫ��6X���������a�b�O���*+���cش"�P$����4q��ڇ��4+���1�Ӵ��F�S��jC��}�D_ :�!��������4< ���U:��l�k��q��Ӂ�h����,Mc� 	N����E�_���狏N���_Og���ė�vQ�$إ-��X�#.&��`o��� +�࿀���6HB��\�c����O�y�Lq��M�ޟ�F]|�`�Lt���bOV#Z� �,�qd��κ�ehQ���G���Z &q�K�Fov#�?������j�UA�%p��v<s�4 �[)���]xQ�-�]ݫm��m��F\�s��7�	��0�����6�"4�"sTm9c���%��G0�0ؿB�����<�|��Âh��\�֛J-D	������%u�M%x^�P�*�X�~�y.��y�+�~�S��<�Kn3�"D�n�8����S/�����Z��?Vׁ�'I�S��5�Q�*�A5=�_�I�
?�z�B� �x�j�u��⼺i�M�7�O�ߣ����������D�X8�)�^y=ǀ�5�ç/ps���47 �B\D�I3n^�M��a�3?Ѵ$N���qV_E�|+���B�X�y��9�"�����i��"��c�JnX����c��9
���D/��Y�e�>����i�}��\����i�$������A���w;����h�B�PHX���8�@��%�$:��$Ǔ��(\KX#T�A	��bcX�`����C���h�T�4j7񌤷����|��!����3'���׆����X��2;����vo�x�{%?"��m��XA�c��`9Ux��;|�����{�s�U���/bA-F`��}��Ur������b:P��g��)�{$�T�.6+�T��=<Y�ߓ�N*b�s̕1\��k�q1,��0*bZs�}u���ì��s�9�V��j��tF-�Ȝ㕵0���&��C{̥�n��[0�R���M.�x�hW�;��YE.��6�)lFn��<7����(��ʊ��x��߆��	6P��?n2��3�
��ON��qCt��x��逜�t&�����L�����31�q�/̞�.w�Ou#�-��_ZR��H�!����*�rJ`	��N�/ጅ��O��wo���P:�O#���+/��;��&�5���:e��
��g��h�%I��>�R*�P�9��b�]��(B�H1M�`��T�S(厌.�D��Ų�l�D~	I����x%o����Gʆ��b��*��TzBgBcy��|?�A�&q$�c��%M�QċpŌ���x'Нp��p�ܘ��N.�iXW�^U'�8��7��kaqMꪇD���}����u��Ew����|f��t	Mm%�����4�9��	;�ɹ@�6�|��b�V��/�ei��^�6�x@���u��:�E,��M�8�ݒjd�ʺ�P)�cϤ�����U7����T�t�S$�"���h�m�vQ��s�XSQ�Q�x�a{�[Sq�c\� \�����4J&���ς�dtN�H�uo��o��#�.Y��<&XiB����	b�a���	�;_������ht<�n��n�bxo�M���G��T��X1I(��`���URū��&��A���FÛ���cZm�:��%Zt�w��q��rV�쭀�p�j��x/�"�j�ـ�T��#��v.~��
�c��x�zU�ܸ�Yp��Q�hT�"�z9߉��k��ܜ��k�q}�ܴLN����^��2tm�Ƣ�筻��8��ТH�n��.�>R�����Rn��x��P�KW�"���h�POջ���/�-/}廌Eԫ��\��c��z��`wHex�T���~[T�αZ����=���
W��T�T�lَ�>�o�k?��P�+�܈M�òݾ���P�+�5���H}F��xh�ͥ!���_�/�C��`�K��<�� ��
_��N�|��K��C���k�@�6!�5.a<T�
���?۱�Pʆ��&��3^SL˵���jL��s�,�����Wc"����3�b��4!u�xN4u=^h`��\�-//^�M�`]7XA��S?��؛6c��y�ˣ�NLE���c�ly� ���h�D�PY�f�L]�za��[���v��s�F4Mk,�N(!���������h���j.�hS�y���<���T]2�4�{�`+�����Qg��E�4����]����J�Meh���ݢѨ�'+�z�#�Ђ�ޗd�8Nb�3���#?Kh����Þ�����{�"ǂ��U@�`��ڷ9�a�0 Cŉf6���L�7 M,3	�pOdB�[����&*t6�P����M�}�"	��HD�xo��_ɫ��"�����_��m��Er|�B�����dl6�n��I�4��cɱ�{�᪓�2�bG�|�/�M�$�����d������Qȿ��T����J{�T�/����g�x/���.f�[�pv��	�f���Y�~��W���T��[��Ʊ��qļ���m��K=��v�d�X]z^�r���u����_��6��b�m�[��g��cR;����7����κ�`�!�w���$;��[����V��&R���f,d&�DҴ}���E"V<�
J��~{>�H�K��\�(S-;���8"kc-����Չ�J"�*d�0����;F$��cT�9`��F�*&FE�ÈD\l��r�1ɩW~}�l�
1�lw�M�@�K�g���W�f��Z�NP�P�]�i�ӥp,��YO�%�޴{�SK��#�y����e�K��o�z�J��_?�͋���h���!k�;��5   �U�"��E�T�K�y����^��q�� �H�*�}����ɭ��({|�|p�%��>��y�\�ǯ��n3e𱙪K��t��뜝0�F��S*���#�i��7��.�,��nV捃y���≮!~���Pm�1���bD5^��):�:���QUҵb�^ç�XH��C�뺊�#��x�)�.d�ԝ��V�F�/u''c�8��>��P�;eS�v���%ug��<~�L�L�oMD��ER��F7��4�n1��W����q��txJe|�t��4|�#�uY�����;��;��eo��FKAi�Ս7����J#+G��qr���ЦX���T��WogpZ�G��cQy��*g��ky��N��yU���I�]��M��Gئ&�t�'7�[�1�tM��*Om�Wy�&Nu�7�[�.2Y�'��3���p��<�U��$�N^ǻ������XV�-��n�4�[�U����Q�p�I�h�P.�uT,�nR,�̚f�X8ݤX,�ή��:�N7��uJmM�tT*�nR*���6XJ�S8��M(�z�.�u�(��5
H󓓗�:�N��e?��Ėw�W'�n�ڤ�4�P&�b�	Ǘ�T+�m��#���=$������cx%�Tz1�64"�k��"�~Ŷ���
һ�W�$� �Ç�T�� �s�Ave���x>:�#����Fs���_�W7X;�*����K�_���/潌�dx�F'&� ߄���ًàaa0g\a`-�h��nq<���N�%�4���Wp͘�}�?�θ�٭���O'x�bz�KW��T�y6����pr��zw~gR%���)e�.��B
�����Q6�;����lV�u��BX�%M��mq]�e�Q1�K�$>�J�����]r�����!*lc#k-2],5g�lN�m5&^�R%]Z�<u�9ɼ�\���9+b��͝�Z���l������(m��
�Zq�n�ަ�	�r�NnX����i�D7���?A��e�愁[ʽd��]ξ9��'�{[zƍw�ۤ	s������Z*��ޫ�B�A�����V�      �   U  x���=O�0ཿ"[@B�IZh���!*-��%qS��g]��{l��So{��G����6�����3T���o�-j�Vh{�#��׷��.���%u�B����.��ˬ��ɽ3ؓg� %�^�f@���a,���� ����ާ�!>9��-A3Czv+��cU@$v��V���;��]ZG�9}�擂�A�	fY$5���<�B�0E��h*��i1m�r�p�eX�[�ㇻ����A�\W����AV�j��n�e>r�u��p#�d��u�����O�9�<�8��=����H#5��)�3�
š�͍�.L6H}0�Cn!��r��l���S�      �   �  x��YM��6��W��m~StO=��H�&��JZG�d������eI�(�Qg^���ސ3of�?�������Ͽo�秺ʷ���������*8m����?���@޼���+]�z,OoaL��:T]��0f��w${G冑;ƷT����?�����Ad����}Y��C"q��ƿT��\h�a�D��l?�Ⴧ����b>��V�v�q��|�.%��2J2��m�χ����JW5��e0=LRQ��CE�T�mK�(c�T��ȍ�19`�+����E퓀��1�bFj �Z�6	�$��p��9�^Tm�w���a�Vhx��$C��\���Tf���}r�!H��4�5�>�Sx��4
�Ex�v>Um��p�3|l�b
K#VFJm�Z���uyK�X�|�Xu� im�$h�AJc9�l�SKak�H�X7)��ei�s� ߘ-��5i*�4�Mt3`�\&	��,IF��$VN*G27�s&W;�eyJ���V9b��j�Z�����XK��y�?��F�WT�@��HYg���l�e:�*
����\�œ˿�4�@}�B5��,�SF�H���h���Kl!�a�bmetX���(����H�����`26�6��5�C�y�ty�#VV� g�nP(8��c����~��ŖB�t:�����ǉ��n}�|���1�5n��%91�?W�i�q�v�L�J&��c�\��#����S8Q�P�dI@����l���F\�Ã�ڪ��/����",fk�/{r 4�޺�H�3��t�#p~��x����Wy�uB`W[�?�`���3>ts	�-�͹�h���l��t
��G\�ٺ<�/��AQ���������qU�^*�
^���-|x� �����cM�����W7p�
��\'CPS4������3����+mp�4�ƞ9�9�X|���*\h�HM];*^r4!N	��������Okl�$�3E����2��@�g�X��[>����bO���hA���z�E�����
z�S��/�Mű�|����=y�uu�i�G8"h�Z�Ű'�"����_�7H����j\#��q"nl�x�C'h�{�q�ʦ����uE,����X%�mQ�+7Wn	��(?�,��������K!S�6���|�Q��D��T8�E�=]��!c����}��i�[�	�SP0P+�����2�M�T=�U���q��rq�1�L���3@�a|GԎ�-��4��\�i��=��{���N��ݢ3��rGL���]4�i���y��.���%�gu���0��q�+S��Ԇ�4;�A�kG)�bQ�c6�,l쿧���(�P�~&z�Q��nq�ʧëG��CE�ZJ ���cH#�{E!�5�l�%��o���t�T*v܄�jAQj���T>�z�5���L���n1ؽ��O�8h߆Sq\\��q�PB=�32�(�d��bZ݇���I�޼��w�      �   �  x��I��ؖ���W�YV��ph]#l�il� ��3=���|�ʼ7�*cv��<����쵾�����o��оuSP��GT�M�zC<y�|����o��K��]2�x��c��sU����[:#�΂_���/�&�K�Ţ#�|B� �T�a=�nV���\��
�!m�v%�y�+&&�����)(��C(�EO(v���`�����C����]�h2VKlX��T��C�L��Ӗ��������.8NK7Fg�Іc>3(.A�Ȭ0iW{y2����T�^�u
_p��ꚵ�H[��aw���˹�+V_�G"�6���X�EDh�w�RpEmL��W�.�{bE{�"V�6�Y��X��|y���}��#�u��Au	!��B�C�[���v�^Q����s���CC��:��5H�d+8�(tQ+�K�(RY1��7���a
�7?!�	�?0&	��k�gy��Sڧx��uP 4X�f�F����5;h����ڢ�#SuW�x�+�[�|Iפ�cq)d-�6��}B�;Q��dLM|�h�����5=�V�c� �V}��a��;u7=ůj��]��KEU��\X����������	�p����}HdE'�PWko�i�H+�>��1��]p�^�<�{m�Z}��m(��.��79a�	 �����c�W#6�K��]�]���H�h���nT����n��j�ċS-�I)�QHoCy��a�T���@^^��L9Gm#�C\�e��U�]�E��y��n~˼�Z��%�Tg�OE�x��s�3��]r�+���=
��c�`oEߝ�u�@�*�����m��R�6P�P�������ݧ��X�J�L�@�s��=.��D���8���(��졣e;��Jľ�Ϸ���w�z�b>?^|2���٩��^�2��m�{
E�i�"L�wb�c����W�Z�;o ���B>��0�������ސ�,�n۸H�pN�Te����op��P���ONoj\��G�9�cۗz��2UH��9��X^��U=��l�<i�ݡW�g���e��)�)7�z<.^�Q��1:݋K`��9� �NG�k�+������2��E�5�:��&�6�1fx����@'��tFzN7u%�����5�R�
�ϗk�z�!A�>��~��sơ-yB~�x���܁��h�.o�I�.B���6��)'���s�'��_���%�
��f����!^���j���0��������K��@P8]�>�T�D��ː�9E�A���_s_�S�DW&��h�\���²1���Dn��wE��m5 ���ԟ�GN}�	�(���D�ni��p�.�Zl	��u�����Ynꉻ�m�[?�h�xd�:�L��z0EGD��}��鏙 �!������]�"��貮��l�9����.(�[��(�_P4�@��/�F)Uiڐe��Z}���r�����q-�/Q��$Ma4�Ca�5|W�F�m�M�`�6<FW�W�ΪS��s�dw��fyqvun��� ���
��E�`�φ>b�?`��$1��!?��il�zPsN}��U��zd�yLk���}�H^Թ�#c�d(AϳS��n���;7ڼq�wi�������8M}�M�O^� ��7(&
�>�R����+�O}�h�����,��������#nς/ߠ-�D��{��	K|�Ls��4�aQ�ͺE���(���l#"@�[�u��˔_ε���.��ql�w��s�c��]����C{VM*4��
�+�P�3����Ph��M�R�a������2�Bd��r����1���8�U-C����O�Q�8D~���hEs���N�������CSi��TƢs��/Wi�6f1H���
��V�3����b��m�X� �A����TC��!�S����F�x�Xn�`�ӫת�zdᆗ�f�T-�d��j����)�Fۈ�q�����cF�{�*z��Q[��8�y�(����i�s�\�Y��A1ldՌ�D �:�S��K���iź1C'�,�|'-�W0y���@��#E�49W���!�;x����	�F�����<w��2Hb����}���h����[#���nyo��0��;M�o0|�� > F�}M��@����d���K���pȭ���״���&w��@�ZÂM�Is��hq��`��Q��]��~U��]Z�G�pA�i1�i~J�}���� B�j��.3�i~��Q�a��)�t�c!��g/�i���޴� �W�����ry��q_f��T�n���6�M٘��(�;k"�g���M���x%�h��/��x���7��"[�Ё��wi�k�4�:�ɭc�d�.[��.�P�39 8�G3$�r�S蛂���-�}T�;�7[S�B��_$��koy�G��ʅ�w��u�JW+���$�e�Pgu����B�u�{n�#���i9MY�u�PZ�Pۓ\O�s"{���bR<,�S.��t��f�>�;��T7s	�ƷZ�v��ڌ���[#t�4�j(wh+v"r��0�_L�HY���!y�N�R^�:��yV y7���v �þP
� ��:K�}�څ���.fP�S^ ~L\�j��u�#�c��HS����*����`XCd1ǎGS��L~���Q�s��^���{���h�,�"�0�g^��(x�d�2��P�l�M�{����V;� I���Y������B~\���*������{ot�G�� G��YX���'m-�׼�f��@�Y�JRI=��r�^��\�s,a?�y��M������6��0~#�#CU��o!�&bl�n"������x��.��#[~�GJ^�*|h I7��oMe��,��^6
֊����ȂE�������.һ0w8���#�.�h_ٶ�f,��B�C'EQ�M�+�=�}`ʹ�x�Xƃ�o�~��������j�G�)��#��W	�׫���Bc"$�u�6	V�M��~��������?���0�_����'*���e����6�fjv���!���6ٞ[8����(G��k6��a!�B�dx�a	�?����p��8�B�ۑlZj�.��=$H�l��3����5����Af�����h�q-�%�Zމ���c��{�)���������>�nز	I�!Z��bx��+
8(�l� ����3岑�\Lo`�$���aK{v�"���OT��h�T�7C0Y�L���-z{u�$�|�'��h�M�8��ؽ�9�[��o�Y��І�7$�MTw� c�J\4�q��+Җ�gAFm�'D���.�~�fy�&j�h�+�m��Zȹ)/�2<`�I���a�Zucf��;*��.���&�|��yWo��bԺ�(冀tUsV�cSQ���dm�����;�� %\�w��\��zFsuֿ�R-�t2E�y	:@�n�$���b��m

�n�K�1_V�H��0#�9a�>�E�1;�v@���Ģ���z<<{f3����킆`����z�>0���/<K�#���i6m�"sU�T��XBS`�}B�����Ȉ�B�L]����,��ʲ�t6���5��s�s�@�{�� ��E�u׻cNK��0�0�I6͹��*9�bM��=������ͪ�T�l;Rdb�l����%bp0#L�Vq��`R	͋�b�~����v`�T��W��H�&��(3�r�XƔ6*_m�
�<�RK�]K���e'�H[�#��
���Ty]�:�#p�]��W���ꭜ�W+]���9�[���X�xʹ�/���U�'�{l>��*a��sy}�1m�t/s�\8��A6j�#�g�ā�պ�����*A�P�!	�+/�Ns�e] ӱ���<�%2��De�������nͣ��H������_�J,�<xҨ�<z�E�܋H��'���ߙ��SQs֖��O4Z�-�2�4�vL�/���{%����L`���@)�7����q���      �   �   x�����0Fw��nhBAL��"�PFR��H���1�����\�r��w�(���(�a������(^���䧰X[`�s�1[8�]�J���i	��M������]٨�e�j�d�h��G6��31!	N�$�z۞��\��@�;��)%#ļ"\���滩��7���i���)ʬz�Cn_'���	!�g�      �   H   x���v
Q���W((M��L�KO�M-���e����
a�>���
F:
F:
����\���3j���� A!�      �   H   x���v
Q���W((M��L��M�̋/HLO��,�M�2��}B]�4u������P]Ӛ�� �      �   �  x��ӻNA����M�,,�XYhB�%�5#;��^�,�h%V6&T��B[C"�g��3;R��dg���?�Ly��uP5�{�}�}v�ں��ZǗ�����V�X�kF�a����#��n؅�V�]�8���A�{jKK�I2y�)��\�H����
xo�����>�+���W��{�e���u_j�@I�"Y����P���)�#�Iix2ó�_���si���8i�FIK��'PsJ�a�/���g,�p��g�� R؎�1SE���-u�^>�aK:@�FKEe6vі�y����RBU8���+���FG�{����kQ��R�S4暕�h��&�
�5��W,��9��"��d�4�+'ưo%bZ	�b(LE�{'���0�r�K[�9�^�Ф�J�a���j��yQ<��-��o��<Z�w��I��f�O�~��w      �   
   x���          �   
   x���          �   �   x���v
Q���W((M��L���/�L-�O���M�+Qs�	uV�0�QP/ʩ�����@^yFb	�6202�5��5�T02�26�24Գ02�60&(kj��`h�i��I�;��f������H�D���T��������X���������ZB��� ��B�      �   �   x���v
Q���W((M��L���/�L-�O��-�/N-Rs�	uV�0�QP�0�¶�.�U�_�qa�Ş���\l��Te���f�T&��-��t��B]Ӛ˓x��@�/����^������[/6���yźə���E{L�u,u�@�pq tYO�      �   s   x���v
Q���W((M��L���/�L-�O�/�+)��}B]�4u�C��5��<I�f��M�.c�.Ϣ�<R�� �9'�%�$����3���8�d�f �%��trq �k�      �     x��ϿK�@�=�mQ��S��C��T��U�� g�D.��S��.�����B[ji���G�%��.��wx^��uN�$����e5�#���]���vzd��#&>�g�E6���|�c��J��=�N�45�0+uj����m���]�q���|�\��,�*0���s]���v��}�IA��uM=�L���u�	#�C�D��L4u�r��[r��p!o�/�|�祜�{�֙�Q��P���u�`�@�F����      �   �   x���v
Q���W((M��L���/�L-�OKMMIJL�Vs�	uV�0��QP�,)VH��OQ�a��������������������������1AYCcMk.O�a	44#5''dzF~�BbQ�B)�U�
��V&&VF�z&&Fh�*ku Q�C�      �   =  x����NA �{�b�h�4{h�L=�Fi��ś����V�p�6�hlbۘ�m�	���W�}�>I���,p��?s��柟�O/ϼZ!�镗�R��7R�~��#�S��e�HO�����O�uX/<b]��X�]a�����/���>���k���3��	�6L�shۉ$�RZ���RT�VlӔdK�U�� �$Q��Yo�M���_*7$�Rl����8�ŏ�����W&��\���U���9�#�R���I��MMO����OA�ʰ�^��=~:1?$��
���|�[�������.a�.���	�"S��P`a��s(K�d*)&��d�=E�;�F�^��ӯg�����	�P�!��9-����0= �N s���6{,�Md��!��	�� ��&FB�ƚs�����B���D�D&��:l�G�x� 9~2�I2R��TA�[�6O�[�v�IR`����p(������I��K�ecp�#q���#B�k�&��@O�� 
/EǅaTN���R�(p��E�F(���5e�ٰ��1)��(4A���Ax~ ����&R����,(�]
G�'IR�a(�͔K�9'm2cRر����
�B����x� ��\�Nq�u�(6ܽ8p ��`;W���^��X?�0v��Z*;A�]���谙�	F��b!~�?�^��s[*�%O0��^���D��p3;�[.z��,xn��CUM+�$?˧�`�X�r�1 �x^AF������݄G�<qh���<!tA����Z��zhwCC��`.�f7��]-��w3bb�?W��      �   �   x����
�@��W1�	�q�h���@����Badu��;胠Ճ�9sR���N��;���z��c�����_��kV���T�je��U)��6K�R�Z��Z�d�"C(�A�� ���L�+@�`'/#��AC�g�8K[P*؁R�rM��Tpe��\�4W-A-C5(3�7�Ԭ(�8~�BrM�Z���@�5�5En�P�.�f�b��      �   x   x���v
Q���W((M��L���/�L-�S����y%E@�B��O�k��������!iZsy���TG��|�f:
���6�Q0#_����9��-u,��mf��`I�n`t���Z�!��� :���      �   `   x���v
Q���W((M��L���/�L-�S�@\^������al��`D���\�$�41�Q0"O����%y:�u���i��`B�N�SM�:�� �k'      �   V   x���v
Q���W((M��L���/�L-�/J,��KWs�	uV�02�Q0�Q0���\�Dk3k3$U�)y���ڌI�g���� B{PO      �   �   x���Kk�@�}~����1�ytc.ł�n%j���H�E�}��bк�Ź��8q��D�}��n�g3YV��L��z�������y�g�l�|'۔lwY$Y.ge��gD!��@�Yyf�X��MI�I;��-�����:�)�)�F�;��E��DM�z����]�E#i7y��3ƦU��C�x��e�os��l���$VLW�cY$�x�HZZ�kM�A}� �0�t      �   �   x���v
Q���W((M��L��/JI-*�S�%��
a�>���
�F:
��:
�z@ZG�/���0�д��$�4c�i�@�L���3�$�0�a���p���36 �8S\>:�ؐT��p�c#RM3��6�M��p 㸸 !�Q      �   
   x���          �   
   x���         