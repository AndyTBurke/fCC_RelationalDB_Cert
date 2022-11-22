--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (182, 183, 129, 2018, 'Final', 4, 2);
INSERT INTO public.games VALUES (184, 185, 130, 2018, 'Third Place', 2, 0);
INSERT INTO public.games VALUES (183, 185, 131, 2018, 'Semi-Final', 2, 1);
INSERT INTO public.games VALUES (182, 184, 132, 2018, 'Semi-Final', 1, 0);
INSERT INTO public.games VALUES (183, 186, 133, 2018, 'Quarter-Final', 3, 2);
INSERT INTO public.games VALUES (185, 187, 134, 2018, 'Quarter-Final', 2, 0);
INSERT INTO public.games VALUES (184, 188, 135, 2018, 'Quarter-Final', 2, 1);
INSERT INTO public.games VALUES (182, 189, 136, 2018, 'Quarter-Final', 2, 0);
INSERT INTO public.games VALUES (185, 190, 137, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (187, 191, 138, 2018, 'Eighth-Final', 1, 0);
INSERT INTO public.games VALUES (184, 192, 139, 2018, 'Eighth-Final', 3, 2);
INSERT INTO public.games VALUES (188, 193, 140, 2018, 'Eighth-Final', 2, 0);
INSERT INTO public.games VALUES (183, 194, 141, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (186, 195, 142, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (189, 196, 143, 2018, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (182, 197, 144, 2018, 'Eighth-Final', 4, 3);
INSERT INTO public.games VALUES (198, 197, 145, 2014, 'Final', 1, 0);
INSERT INTO public.games VALUES (199, 188, 146, 2014, 'Third Place', 3, 0);
INSERT INTO public.games VALUES (197, 199, 147, 2014, 'Semi-Final', 1, 0);
INSERT INTO public.games VALUES (198, 188, 148, 2014, 'Semi-Final', 7, 1);
INSERT INTO public.games VALUES (199, 200, 149, 2014, 'Quarter-Final', 1, 0);
INSERT INTO public.games VALUES (197, 184, 150, 2014, 'Quarter-Final', 1, 0);
INSERT INTO public.games VALUES (188, 190, 151, 2014, 'Quarter-Final', 2, 1);
INSERT INTO public.games VALUES (198, 182, 152, 2014, 'Quarter-Final', 1, 0);
INSERT INTO public.games VALUES (188, 201, 153, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (190, 189, 154, 2014, 'Eighth-Final', 2, 0);
INSERT INTO public.games VALUES (182, 202, 155, 2014, 'Eighth-Final', 2, 0);
INSERT INTO public.games VALUES (198, 203, 156, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (199, 193, 157, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (200, 204, 158, 2014, 'Eighth-Final', 2, 1);
INSERT INTO public.games VALUES (197, 191, 159, 2014, 'Eighth-Final', 1, 0);
INSERT INTO public.games VALUES (184, 205, 160, 2014, 'Eighth-Final', 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (182, 'France');
INSERT INTO public.teams VALUES (183, 'Croatia');
INSERT INTO public.teams VALUES (184, 'Belgium');
INSERT INTO public.teams VALUES (185, 'England');
INSERT INTO public.teams VALUES (186, 'Russia');
INSERT INTO public.teams VALUES (187, 'Sweden');
INSERT INTO public.teams VALUES (188, 'Brazil');
INSERT INTO public.teams VALUES (189, 'Uruguay');
INSERT INTO public.teams VALUES (190, 'Colombia');
INSERT INTO public.teams VALUES (191, 'Switzerland');
INSERT INTO public.teams VALUES (192, 'Japan');
INSERT INTO public.teams VALUES (193, 'Mexico');
INSERT INTO public.teams VALUES (194, 'Denmark');
INSERT INTO public.teams VALUES (195, 'Spain');
INSERT INTO public.teams VALUES (196, 'Portugal');
INSERT INTO public.teams VALUES (197, 'Argentina');
INSERT INTO public.teams VALUES (198, 'Germany');
INSERT INTO public.teams VALUES (199, 'Netherlands');
INSERT INTO public.teams VALUES (200, 'Costa Rica');
INSERT INTO public.teams VALUES (201, 'Chile');
INSERT INTO public.teams VALUES (202, 'Nigeria');
INSERT INTO public.teams VALUES (203, 'Algeria');
INSERT INTO public.teams VALUES (204, 'Greece');
INSERT INTO public.teams VALUES (205, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 160, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 205, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

