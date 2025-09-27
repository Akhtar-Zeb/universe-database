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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    typical_size_ly numeric NOT NULL,
    has_central_black_hole boolean NOT NULL,
    average_star_count integer NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbital_period_days numeric NOT NULL,
    discovery_year integer
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    diameter_km integer NOT NULL,
    mass_relative_to_earth numeric NOT NULL,
    orbital_period_days numeric NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    mass_relative_to_sun numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, true, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, false, true, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in Local Group', 5000, false, true, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Galaxy with famous black hole', 13200, false, true, 53500000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Edge-on spiral galaxy', 13000, false, true, 29000000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting grand-design spiral galaxy', 8000, false, true, 23000000);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'Disk-shaped with spiral arms', 100000, true, 10000000);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Ellipsoidal shape, little gas/dust', 300000, true, 10000000);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'No distinct regular shape', 20000, false, 1000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, false, 27.3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 0.3, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 1.3, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, false, 1.8, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, false, 3.6, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, false, 7.2, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, false, 16.7, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 396, false, 0.9, 1789);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, false, 1.4, 1789);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1062, false, 1.9, 1684);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, false, 2.7, 1684);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1528, false, 4.5, 1672);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 5150, true, 16.0, 1655);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1470, false, 79.3, 1671);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 472, false, 1.4, 1948);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, false, 2.5, 1851);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, false, 4.1, 1851);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1578, false, 8.7, 1787);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1523, false, 13.5, 1787);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, false, 5.9, 1846);
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, false, 360.1, 1949);
INSERT INTO public.moon VALUES (22, 'Charon', 9, 1212, false, 6.4, 1978);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 4879, 0.055, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 12104, 0.815, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 12742, 1.0, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 6779, 0.107, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 139820, 317.8, 4333);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 116460, 95.2, 10759);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 50724, 14.5, 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 49244, 17.1, 60190);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6, false, true, 14000, 1.17, 11.2);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 1, true, true, 12000, 1.11, 129.9);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 1, false, true, 7800, 0.39, 4.05);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 1, false, true, 140000, 0.73, 3.5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, 1.0, 4600);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true, 2.02, 300);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5790, true, 1.10, 6000);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, false, 11.6, 10);
INSERT INTO public.star VALUES (5, 'Vega', 1, 9602, true, 2.14, 455);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 3042, true, 0.12, 4800);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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

