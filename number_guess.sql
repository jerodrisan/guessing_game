--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    id_game integer NOT NULL,
    user_id integer NOT NULL,
    games_played integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_id_game_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_id_game_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_game_seq OWNER TO freecodecamp;

--
-- Name: games_id_game_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_id_game_seq OWNED BY public.games.id_game;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: games id_game; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN id_game SET DEFAULT nextval('public.games_id_game_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3, 22, 1, 4);
INSERT INTO public.games VALUES (4, 23, 1, 3);
INSERT INTO public.games VALUES (5, 22, 2, 7);
INSERT INTO public.games VALUES (6, 24, 1, 8);
INSERT INTO public.games VALUES (7, 24, 2, 7);
INSERT INTO public.games VALUES (8, 25, 1, 11);
INSERT INTO public.games VALUES (9, 25, 2, 7);
INSERT INTO public.games VALUES (10, 24, 3, 13);
INSERT INTO public.games VALUES (11, 24, 4, 8);
INSERT INTO public.games VALUES (12, 24, 5, 5);
INSERT INTO public.games VALUES (13, 26, 1, 2);
INSERT INTO public.games VALUES (14, 26, 2, 4);
INSERT INTO public.games VALUES (15, 27, 1, 5);
INSERT INTO public.games VALUES (16, 27, 2, 3);
INSERT INTO public.games VALUES (17, 26, 3, 11);
INSERT INTO public.games VALUES (18, 26, 4, 9);
INSERT INTO public.games VALUES (19, 26, 5, 7);
INSERT INTO public.games VALUES (20, 28, 1, 3);
INSERT INTO public.games VALUES (21, 28, 2, 7);
INSERT INTO public.games VALUES (22, 29, 1, 6);
INSERT INTO public.games VALUES (23, 29, 2, 3);
INSERT INTO public.games VALUES (24, 28, 3, 10);
INSERT INTO public.games VALUES (25, 28, 4, 10);
INSERT INTO public.games VALUES (26, 28, 5, 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (22, 'pepe');
INSERT INTO public.users VALUES (23, 'manolo');
INSERT INTO public.users VALUES (24, 'user_1713918020832');
INSERT INTO public.users VALUES (25, 'user_1713918020831');
INSERT INTO public.users VALUES (26, 'user_1713918126377');
INSERT INTO public.users VALUES (27, 'user_1713918126376');
INSERT INTO public.users VALUES (28, 'user_1713918239160');
INSERT INTO public.users VALUES (29, 'user_1713918239159');


--
-- Name: games_id_game_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_id_game_seq', 26, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 29, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id_game);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

