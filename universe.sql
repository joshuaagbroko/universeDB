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
    name character varying(100) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    orbit_path character varying(50) NOT NULL,
    is_spherical boolean,
    composition text
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
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    description text,
    number_of_stars bigint,
    has_life boolean,
    is_spherical boolean DEFAULT true
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
    name character varying(100) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    planet_id integer,
    is_spherical boolean,
    has_life boolean,
    description text
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
    name character varying(100) NOT NULL,
    planet_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    star_id integer,
    is_spherical boolean DEFAULT true,
    has_life boolean,
    atmosphere_composition text
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
    name character varying(100) NOT NULL,
    star_type character varying(50) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer NOT NULL,
    galaxy_id integer,
    is_spherical boolean DEFAULT true,
    has_planetary_system boolean,
    description text
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 4500, 0, 'Asteroid Belt', true, 'Rock, Ice');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 4500, 0, 'Asteroid Belt', true, 'Rocky');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 4500, 0, 'Asteroid Belt', true, 'Rocky');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, 'Our home galaxy', 250000000000, NULL, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2500000, 'Nearest large galaxy', 1000000000000, NULL, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3000000, 'A member of the Local Group', 40000000000, NULL, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 15000, 23000000, 'Interacting galaxy with companion', 100000000000, NULL, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 13000, 21000000, 'Has bright star-forming regions', 100000000000, NULL, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 13000, 163000, 'Satellite galaxy of Milky Way', 30000000, NULL, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (61, 'Moon', 4500, 0, 15, true, false, 'Earth’s only natural satellite');
INSERT INTO public.moon VALUES (62, 'Phobos', 4500, 0, 16, true, false, 'A small, irregularly shaped moon of Mars');
INSERT INTO public.moon VALUES (63, 'Deimos', 4500, 0, 16, true, false, 'Mars’ smaller, more distant moon');
INSERT INTO public.moon VALUES (64, 'Io', 4500, 0, 17, true, false, 'A volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (65, 'Europa', 4500, 0, 17, true, NULL, 'Icy moon with potential subsurface ocean');
INSERT INTO public.moon VALUES (66, 'Ganymede', 4500, 0, 17, true, false, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (67, 'Callisto', 4500, 0, 17, true, false, 'One of Jupiter’s Galilean moons');
INSERT INTO public.moon VALUES (68, 'Titan', 4500, 0, 18, true, NULL, 'Saturn’s largest moon with atmosphere');
INSERT INTO public.moon VALUES (69, 'Rhea', 4500, 0, 18, true, false, 'Icy moon with thin atmosphere');
INSERT INTO public.moon VALUES (70, 'Iapetus', 4500, 0, 18, true, false, 'Known for two-tone coloring');
INSERT INTO public.moon VALUES (71, 'Dione', 4500, 0, 18, true, false, 'Icy moon with bright streaks');
INSERT INTO public.moon VALUES (72, 'Tethys', 4500, 0, 18, true, false, 'Moon of Saturn with impact crater');
INSERT INTO public.moon VALUES (73, 'Enceladus', 4500, 0, 18, true, NULL, 'Saturn moon with geysers');
INSERT INTO public.moon VALUES (74, 'Miranda', 4500, 0, 19, true, false, 'Uranus moon with canyons');
INSERT INTO public.moon VALUES (75, 'Ariel', 4500, 0, 19, true, false, 'Major moon of Uranus');
INSERT INTO public.moon VALUES (76, 'Umbriel', 4500, 0, 19, true, false, 'Dark moon with ancient surface');
INSERT INTO public.moon VALUES (77, 'Titania', 4500, 0, 19, true, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (78, 'Oberon', 4500, 0, 19, true, false, 'Second-largest moon of Uranus');
INSERT INTO public.moon VALUES (79, 'Triton', 4500, 0, 20, true, false, 'Neptune’s largest moon with retrograde orbit');
INSERT INTO public.moon VALUES (80, 'Nereid', 4500, 0, 20, true, false, 'Neptune’s outermost moon with eccentric orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 'Terrestrial', 4500, 0, 7, true, false, NULL);
INSERT INTO public.planet VALUES (14, 'Venus', 'Terrestrial', 4500, 0, 7, true, false, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet VALUES (15, 'Earth', 'Terrestrial', 4500, 0, 7, true, true, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (16, 'Mars', 'Terrestrial', 4500, 0, 7, true, false, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet VALUES (17, 'Jupiter', 'Gas Giant', 4500, 0, 7, true, false, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (18, 'Saturn', 'Gas Giant', 4500, 0, 7, true, false, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (19, 'Uranus', 'Ice Giant', 4500, 0, 7, true, false, 'Hydrogen, Helium, Methane');
INSERT INTO public.planet VALUES (20, 'Neptune', 'Ice Giant', 4500, 0, 7, true, false, 'Hydrogen, Helium, Methane');
INSERT INTO public.planet VALUES (21, 'Proxima b', 'Exoplanet', 0, 4, 11, true, NULL, NULL);
INSERT INTO public.planet VALUES (22, 'Kepler-22b', 'Exoplanet', 0, 600, 8, true, NULL, NULL);
INSERT INTO public.planet VALUES (23, 'Gliese 581g', 'Exoplanet', 0, 20, 10, true, NULL, NULL);
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1e', 'Exoplanet', 0, 39, 12, true, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 'Yellow Dwarf', 4600, 0, 1, true, true, 'The star at the center of our Solar System');
INSERT INTO public.star VALUES (8, 'Sirius', 'Main Sequence', 300, 8, 1, true, true, 'Brightest star in Earth’s night sky');
INSERT INTO public.star VALUES (9, 'Betelgeuse', 'Red Supergiant', 8000, 642, 1, true, false, 'A semi-regular variable star in Orion');
INSERT INTO public.star VALUES (10, 'Alpha Centauri', 'Binary', 4600, 4, 2, true, true, 'The closest star system to Earth');
INSERT INTO public.star VALUES (11, 'Proxima Centauri', 'Red Dwarf', 4500, 4, 2, true, true, 'A member of the Alpha Centauri star system');
INSERT INTO public.star VALUES (12, 'Rigel', 'Blue Supergiant', 8000, 860, 2, true, false, 'Brightest star in the constellation Orion');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 80, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE SET NULL;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE SET NULL;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

