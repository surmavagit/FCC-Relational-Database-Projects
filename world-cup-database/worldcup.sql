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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
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
    name character varying(20) NOT NULL
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

INSERT INTO public.games VALUES (257, 2018, 'Final', 1121, 1115, 4, 2);
INSERT INTO public.games VALUES (258, 2018, 'Third Place', 1111, 1107, 2, 0);
INSERT INTO public.games VALUES (259, 2018, 'Semi-Final', 1115, 1107, 2, 1);
INSERT INTO public.games VALUES (260, 2018, 'Semi-Final', 1121, 1111, 1, 0);
INSERT INTO public.games VALUES (261, 2018, 'Quarter-Final', 1115, 1117, 3, 2);
INSERT INTO public.games VALUES (262, 2018, 'Quarter-Final', 1107, 1109, 2, 0);
INSERT INTO public.games VALUES (263, 2018, 'Quarter-Final', 1111, 1113, 2, 1);
INSERT INTO public.games VALUES (264, 2018, 'Quarter-Final', 1121, 1119, 2, 0);
INSERT INTO public.games VALUES (265, 2018, 'Eighth-Final', 1107, 1108, 2, 1);
INSERT INTO public.games VALUES (266, 2018, 'Eighth-Final', 1109, 1110, 1, 0);
INSERT INTO public.games VALUES (267, 2018, 'Eighth-Final', 1111, 1112, 3, 2);
INSERT INTO public.games VALUES (268,2018, 'Eighth-Final', 1113, 1114, 2, 0);
INSERT INTO public.games VALUES (269, 2018, 'Eighth-Final', 1115, 1116, 2, 1);
INSERT INTO public.games VALUES (270, 2018, 'Eighth-Final', 1117, 1118, 2, 1);
INSERT INTO public.games VALUES (271, 2018, 'Eighth-Final', 1119, 1120, 2, 1);
INSERT INTO public.games VALUES (272, 2018, 'Eighth-Final', 1121, 1122, 4, 3);
INSERT INTO public.games VALUES (273, 2014, 'Final', 1129, 1122, 1, 0);
INSERT INTO public.games VALUES (274, 2014, 'Third Place', 1131, 1113, 3, 0);
INSERT INTO public.games VALUES (275, 2014, 'Semi-Final', 1122, 1131, 1, 0);
INSERT INTO public.games VALUES (276, 2014, 'Semi-Final', 1129, 1113, 7, 1);
INSERT INTO public.games VALUES (277, 2014, 'Quarter-Final', 1131, 1133, 1, 0);
INSERT INTO public.games VALUES (278, 2014, 'Quarter-Final', 1122, 1111, 1, 0);
INSERT INTO public.games VALUES (279, 2014, 'Quarter-Final', 1113, 1108, 2, 1);
INSERT INTO public.games VALUES (280, 2014, 'Quarter-Final', 1129, 1121, 1, 0);
INSERT INTO public.games VALUES (281, 2014, 'Eighth-Final', 1113, 1124, 2, 1);
INSERT INTO public.games VALUES (282, 2014, 'Eighth-Final', 1108, 1119, 2, 0);
INSERT INTO public.games VALUES (283, 2014, 'Eighth-Final', 1121, 1128, 2, 0);
INSERT INTO public.games VALUES (284, 2014, 'Eighth-Final', 1129, 1130, 2, 1);
INSERT INTO public.games VALUES (285, 2014, 'Eighth-Final', 1131, 1114, 2, 1);
INSERT INTO public.games VALUES (286, 2014, 'Eighth-Final', 1133, 1134, 2, 1);
INSERT INTO public.games VALUES (287, 2014, 'Eighth-Final', 1122, 1110, 1, 0);
INSERT INTO public.games VALUES (288, 2014, 'Eighth-Final', 1111, 1138, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (1107, 'England');
INSERT INTO public.teams VALUES (1108, 'Colombia');
INSERT INTO public.teams VALUES (1109, 'Sweden');
INSERT INTO public.teams VALUES (1110, 'Switzerland');
INSERT INTO public.teams VALUES (1111, 'Belgium');
INSERT INTO public.teams VALUES (1112, 'Japan');
INSERT INTO public.teams VALUES (1113, 'Brazil');
INSERT INTO public.teams VALUES (1114, 'Mexico');
INSERT INTO public.teams VALUES (1115, 'Croatia');
INSERT INTO public.teams VALUES (1116, 'Denmark');
INSERT INTO public.teams VALUES (1117, 'Russia');
INSERT INTO public.teams VALUES (1118, 'Spain');
INSERT INTO public.teams VALUES (1119, 'Uruguay');
INSERT INTO public.teams VALUES (1120, 'Portugal');
INSERT INTO public.teams VALUES (1121, 'France');
INSERT INTO public.teams VALUES (1122, 'Argentina');
INSERT INTO public.teams VALUES (1124, 'Chile');
INSERT INTO public.teams VALUES (1128, 'Nigeria');
INSERT INTO public.teams VALUES (1129, 'Germany');
INSERT INTO public.teams VALUES (1130, 'Algeria');
INSERT INTO public.teams VALUES (1131, 'Netherlands');
INSERT INTO public.teams VALUES (1133, 'Costa Rica');
INSERT INTO public.teams VALUES (1134, 'Greece');
INSERT INTO public.teams VALUES (1138, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 288, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1138, true);


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

 
