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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_id integer NOT NULL,
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
    name character varying(255) NOT NULL
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

INSERT INTO public.games VALUES (203, 2018, 'Final', 201, 4, 202, 2);
INSERT INTO public.games VALUES (204, 2018, 'Third Place', 203, 2, 204, 0);
INSERT INTO public.games VALUES (205, 2018, 'Semi-Final', 202, 2, 204, 1);
INSERT INTO public.games VALUES (206, 2018, 'Semi-Final', 201, 1, 203, 0);
INSERT INTO public.games VALUES (207, 2018, 'Quarter-Final', 202, 3, 205, 2);
INSERT INTO public.games VALUES (208, 2018, 'Quarter-Final', 204, 2, 206, 0);
INSERT INTO public.games VALUES (209, 2018, 'Quarter-Final', 203, 2, 207, 1);
INSERT INTO public.games VALUES (210, 2018, 'Quarter-Final', 201, 2, 208, 0);
INSERT INTO public.games VALUES (211, 2018, 'Eighth-Final', 204, 2, 209, 1);
INSERT INTO public.games VALUES (212, 2018, 'Eighth-Final', 206, 1, 210, 0);
INSERT INTO public.games VALUES (213, 2018, 'Eighth-Final', 203, 3, 211, 2);
INSERT INTO public.games VALUES (214, 2018, 'Eighth-Final', 207, 2, 212, 0);
INSERT INTO public.games VALUES (215, 2018, 'Eighth-Final', 202, 2, 213, 1);
INSERT INTO public.games VALUES (216, 2018, 'Eighth-Final', 205, 2, 214, 1);
INSERT INTO public.games VALUES (217, 2018, 'Eighth-Final', 208, 2, 215, 1);
INSERT INTO public.games VALUES (218, 2018, 'Eighth-Final', 201, 4, 216, 3);
INSERT INTO public.games VALUES (219, 2014, 'Final', 217, 1, 216, 0);
INSERT INTO public.games VALUES (220, 2014, 'Third Place', 218, 3, 207, 0);
INSERT INTO public.games VALUES (221, 2014, 'Semi-Final', 216, 1, 218, 0);
INSERT INTO public.games VALUES (222, 2014, 'Semi-Final', 217, 7, 207, 1);
INSERT INTO public.games VALUES (223, 2014, 'Quarter-Final', 218, 1, 219, 0);
INSERT INTO public.games VALUES (224, 2014, 'Quarter-Final', 216, 1, 203, 0);
INSERT INTO public.games VALUES (225, 2014, 'Quarter-Final', 207, 2, 209, 1);
INSERT INTO public.games VALUES (226, 2014, 'Quarter-Final', 217, 1, 201, 0);
INSERT INTO public.games VALUES (227, 2014, 'Eighth-Final', 207, 2, 220, 1);
INSERT INTO public.games VALUES (228, 2014, 'Eighth-Final', 209, 2, 208, 0);
INSERT INTO public.games VALUES (229, 2014, 'Eighth-Final', 201, 2, 221, 0);
INSERT INTO public.games VALUES (230, 2014, 'Eighth-Final', 217, 2, 222, 1);
INSERT INTO public.games VALUES (231, 2014, 'Eighth-Final', 218, 2, 212, 1);
INSERT INTO public.games VALUES (232, 2014, 'Eighth-Final', 219, 2, 223, 1);
INSERT INTO public.games VALUES (233, 2014, 'Eighth-Final', 216, 1, 210, 0);
INSERT INTO public.games VALUES (234, 2014, 'Eighth-Final', 203, 2, 224, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (201, 'France');
INSERT INTO public.teams VALUES (202, 'Croatia');
INSERT INTO public.teams VALUES (203, 'Belgium');
INSERT INTO public.teams VALUES (204, 'England');
INSERT INTO public.teams VALUES (205, 'Russia');
INSERT INTO public.teams VALUES (206, 'Sweden');
INSERT INTO public.teams VALUES (207, 'Brazil');
INSERT INTO public.teams VALUES (208, 'Uruguay');
INSERT INTO public.teams VALUES (209, 'Colombia');
INSERT INTO public.teams VALUES (210, 'Switzerland');
INSERT INTO public.teams VALUES (211, 'Japan');
INSERT INTO public.teams VALUES (212, 'Mexico');
INSERT INTO public.teams VALUES (213, 'Denmark');
INSERT INTO public.teams VALUES (214, 'Spain');
INSERT INTO public.teams VALUES (215, 'Portugal');
INSERT INTO public.teams VALUES (216, 'Argentina');
INSERT INTO public.teams VALUES (217, 'Germany');
INSERT INTO public.teams VALUES (218, 'Netherlands');
INSERT INTO public.teams VALUES (219, 'Costa Rica');
INSERT INTO public.teams VALUES (220, 'Chile');
INSERT INTO public.teams VALUES (221, 'Nigeria');
INSERT INTO public.teams VALUES (222, 'Algeria');
INSERT INTO public.teams VALUES (223, 'Greece');
INSERT INTO public.teams VALUES (224, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 234, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 224, true);


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
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

