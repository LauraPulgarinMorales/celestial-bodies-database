--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(90) NOT NULL,
    asteroid_size integer NOT NULL,
    mass numeric,
    asteroid_type text,
    is_hazardous boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    size integer,
    name character varying(90),
    age_in_millions_of_years integer,
    shape text,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(90) NOT NULL,
    moon_size integer NOT NULL,
    mass numeric,
    moon_type text,
    has_atmosphere boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(90) NOT NULL,
    planet_size integer NOT NULL,
    mass numeric NOT NULL,
    distance_from_star numeric,
    planet_type text,
    has_life boolean,
    is_habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(90) NOT NULL,
    star_size integer NOT NULL,
    mass numeric NOT NULL,
    age_in_millions_of_years integer,
    star_type text,
    is_visible boolean,
    has_planets boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 0.00015, 'Dwarf planet', false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 0.00004, 'Rocky', false);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 370, 0.0000001, 'Near-Earth asteroid', true);
INSERT INTO public.asteroid VALUES (4, 'Bennu', 0, 0.00000008, 'Carbonaceous', true);
INSERT INTO public.asteroid VALUES (5, 'Eros', 17, 0.00000067, 'Rocky', false);
INSERT INTO public.asteroid VALUES (6, 'Itokawa', 0, 0.000000000035, 'Rocky', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 100000, 'milky_way', 13600, 'spiral', 0, true, true);
INSERT INTO public.galaxy VALUES (2, 120000, 'andromeda', 10000, 'spiral', 2537000, false, false);
INSERT INTO public.galaxy VALUES (3, 60000, 'triangulum', 8500, 'spiral', 2730000, false, false);
INSERT INTO public.galaxy VALUES (4, 50000, 'whirlpool', 9500, 'spiral', 23000000, false, false);
INSERT INTO public.galaxy VALUES (5, 120000, 'messier_87', 13000, 'elliptical', 54000000, false, false);
INSERT INTO public.galaxy VALUES (6, 60000, 'sombrero_galaxy', 12000, 'spiral', 28000000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 0.0123, 'Rocky', false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 0.0000018, 'Irregular', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0, 0.0000002, 'Irregular', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1, 0.015, 'Volcanic', false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1, 0.008, 'Icy', true, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2, 0.025, 'Icy', true, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1, 0.018, 'Icy', false, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1, 0.022, 'Icy', true, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 0, 0.0004, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 0, 0.00025, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 0, 0.000018, 'Icy', true, true, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 0, 0.0001, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 0, 0.00018, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 0, 0.00003, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 0, 0.0002, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (16, 'Umbriel', 0, 0.0002, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (17, 'Titania', 0, 0.0006, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (18, 'Oberon', 0, 0.0005, 'Icy', false, true, 6);
INSERT INTO public.moon VALUES (19, 'Sirius B Moon', 0, 0.0001, 'Rocky', false, true, 7);
INSERT INTO public.moon VALUES (20, 'Mirach Moon A', 1, 0.001, 'Rocky', false, true, 8);
INSERT INTO public.moon VALUES (21, 'Mirach Moon B', 0, 0.0005, 'Icy', false, true, 8);
INSERT INTO public.moon VALUES (22, 'Almach Moon', 1, 0.002, 'Rocky', false, true, 9);
INSERT INTO public.moon VALUES (23, 'Triangulum Moon', 0, 0.001, 'Rocky', false, true, 10);
INSERT INTO public.moon VALUES (24, 'Whirlpool Moon', 1, 0.003, 'Icy', false, true, 11);
INSERT INTO public.moon VALUES (25, 'Sombrero Moon', 1, 0.002, 'Rocky', false, true, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.055, 0.39, 'Rocky', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815, 0.72, 'Rocky', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 1.00, 'Rocky', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107, 1.52, 'Rocky', false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11, 317.8, 5.20, 'Gas giant', false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9, 95.2, 9.58, 'Gas giant', false, false, 1);
INSERT INTO public.planet VALUES (7, 'Sirius B Planet', 1, 0.8, 2.00, 'Rocky', false, false, 2);
INSERT INTO public.planet VALUES (8, 'Mirach b', 2, 5.0, 1.50, 'Gas giant', false, false, 3);
INSERT INTO public.planet VALUES (9, 'Almach b', 3, 8.0, 2.30, 'Gas giant', false, false, 4);
INSERT INTO public.planet VALUES (10, 'Triangulum Prime', 2, 3.2, 1.80, 'Rocky', false, true, 5);
INSERT INTO public.planet VALUES (11, 'Whirlpool Prime', 4, 12.0, 3.50, 'Gas giant', false, false, 6);
INSERT INTO public.planet VALUES (12, 'M87 Prime', 5, 20.0, 4.00, 'Gas giant', false, false, 7);
INSERT INTO public.planet VALUES (13, 'M87 Blue World', 2, 2.5, 1.20, 'Rocky', false, false, 8);
INSERT INTO public.planet VALUES (14, 'Sombrero Prime', 3, 7.5, 2.10, 'Rocky', false, true, 9);
INSERT INTO public.planet VALUES (15, 'Sombrero B World', 2, 4.0, 1.70, 'Rocky', false, true, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 4600, 'G-type', true, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 2.02, 242, 'A-type', true, false, 1);
INSERT INTO public.star VALUES (3, 'Mirach', 100, 3, 5000, 'Red giant', true, false, 2);
INSERT INTO public.star VALUES (4, 'Almach', 80, 5, 200, 'Binary star', true, false, 2);
INSERT INTO public.star VALUES (5, 'Triangulum Star A', 2, 1.5, 3000, 'Blue star', true, false, 3);
INSERT INTO public.star VALUES (6, 'Whirlpool Star Cluster', 50, 10, 50, 'Young star', false, false, 4);
INSERT INTO public.star VALUES (7, 'M87 Supergiant Star', 200, 15, 10000, 'Giant star', false, false, 5);
INSERT INTO public.star VALUES (8, 'M87 Blue Star', 20, 8, 100, 'Blue giant', false, false, 5);
INSERT INTO public.star VALUES (9, 'Sombrero Star A', 70, 6, 8000, 'Red giant', false, false, 6);
INSERT INTO public.star VALUES (10, 'Sombrero Star B', 30, 4, 5000, 'Yellow star', false, true, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

