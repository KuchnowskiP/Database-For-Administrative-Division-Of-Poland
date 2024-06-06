--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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

--
-- Name: dodajgmine(integer, integer, character varying, integer, numeric, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.dodajgmine(IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
 	next_id_gm integer := nextval('gmina_id_gm_seq');
	next_id_siedz integer := nextval('siedziby_gmin_id_siedz_seq');
	next_id_adresu_siedziby integer := nextval('adresy_siedzib_id_adresu_siedziby_seq');
BEGIN
	insert into public.gmina(
		id_gm,
		id_pow,
		nazwa_gminy,
		liczba_ludnosci,
		powierzchnia,
		id_rodzaj_gminy,
		kod_teryt
	)
	values(
		next_id_gm,
		id_powiatu_in,
		nazwa_gminy_in,
		liczba_ludnosci_in,
		powierzchnia_in,
		id_rodzaju_gminy_in,
		kod_teryt_in
	);
	
	insert into public.adresy_siedzib(
		id_adresu_siedziby,
		kod_pocztowy,
		miejscowosc,
		ulica,
		numer_budynku,
		numer_lokalu
	)values(
		next_id_adresu_siedziby,
		kod_pocztowy_in,
		miejscowosc_in,
		ulica_in,
		numer_budynku_in,
		numer_lokalu_in	
	);
	
	insert into public.siedziby_gmin(
		id_siedz,
		id_gm,
		miejscowosc_siedziby,
		id_adresu_siedziby
	)
	values(
		next_id_siedz,
		next_id_gm,
		miejscowosc_siedziby_in,
		next_id_adresu_siedziby
	);

END; $$;


ALTER PROCEDURE public.dodajgmine(IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) OWNER TO postgres;

--
-- Name: dodajpowiat(integer, character varying, boolean, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.dodajpowiat(IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
 	next_id_pow integer := nextval('powiat_id_pow_seq');
	next_id_siedz integer := nextval('siedziby_powiatow_id_siedz_seq');
	next_id_adresu_siedziby integer := nextval('adresy_siedzib_id_adresu_siedziby_seq');
BEGIN
	insert into public.powiat(
		id_pow,
		id_woj,
		nazwa_powiatu,
		miasto_na_pr_pow,
		wyroznik_tab_rej,
		kod_teryt
	)
	values(
		next_id_pow,
		id_woj_in,		
		nazwa_pow_in,
		miasto_na_pr_pow_in,
		wyroznik_tab_rej_in,
		kod_teryt_in
	);
	
	insert into public.adresy_siedzib(
		id_adresu_siedziby,
		kod_pocztowy,
		miejscowosc,
		ulica,
		numer_budynku,
		numer_lokalu
	)values(
		next_id_adresu_siedziby,
		kod_pocztowy_in,
		miejscowosc_in,
		ulica_in,
		numer_budynku_in,
		numer_lokalu_in	
	);
	
	insert into public.siedziby_powiatow(
		id_siedz,
		id_pow,
		miejscowosc_siedziby,
		id_adresu_siedziby
	)
	values(
		next_id_siedz,
		next_id_pow,
		miejscowosc_siedziby_in,
		next_id_adresu_siedziby
	);
	
END; $$;


ALTER PROCEDURE public.dodajpowiat(IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) OWNER TO postgres;

--
-- Name: dodajwojewodztwosiedzibawspolna(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.dodajwojewodztwosiedzibawspolna(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
 	next_id_woj integer := nextval('wojewodztwo_id_woj_seq');
	next_id_siedz integer := nextval('siedziby_powiatow_id_siedz_seq');
	next_id_adresu_siedziby integer := nextval('adresy_siedzib_id_adresu_siedziby_seq');
BEGIN
	insert into public.wojewodztwo(
		id_woj,
		nazwa_wojewodztwa,
		wyroznik_tab_rej,
		kod_teryt
	)
	values(
		next_id_woj,
		nazwa_woj_in,
		wyroznik_tab_rej_in,
		kod_teryt_in
	);
	
	insert into public.adresy_siedzib(
		id_adresu_siedziby,
		kod_pocztowy,
		miejscowosc,
		ulica,
		numer_budynku,
		numer_lokalu
	)values(
		next_id_adresu_siedziby,
		kod_pocztowy_in,
		miejscowosc_in,
		ulica_in,
		numer_budynku_in,
		numer_lokalu_in	
	);
	
	insert into public.siedziby_wojewodztw(
		id_siedz,
		id_woj,
		miejscowosc_siedziby,
		siedziba_wojewody,
		siedziba_sejmiku,
		id_adresu_siedziby
	)
	values(
		next_id_siedz,
		next_id_woj,
		miejscowosc_siedziby_in,
		'true',
		'true',
		next_id_adresu_siedziby
	);
	
END; $$;


ALTER PROCEDURE public.dodajwojewodztwosiedzibawspolna(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) OWNER TO postgres;

--
-- Name: dodajwojewodztwosiedzibyrozne(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.dodajwojewodztwosiedzibyrozne(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
 	next_id_woj integer := nextval('wojewodztwo_id_woj_seq');
	next_id_siedz integer := nextval('siedziby_powiatow_id_siedz_seq');
	next_id_adresu_siedziby integer := nextval('adresy_siedzib_id_adresu_siedziby_seq');
BEGIN
	insert into public.wojewodztwo(
		id_woj,
		nazwa_wojewodztwa,
		wyroznik_tab_rej,
		kod_teryt
	)
	values(
		next_id_woj,
		nazwa_woj_in,
		wyroznik_tab_rej_in,
		kod_teryt_in
	);
	
	-- siedziba wojewody
	insert into public.adresy_siedzib(
		id_adresu_siedziby,
		kod_pocztowy,
		miejscowosc,
		ulica,
		numer_budynku,
		numer_lokalu
	)values(
		next_id_adresu_siedziby,
		kod_pocztowy_siedz_woj_in,
		miejscowosc_siedz_woj_in,
		ulica_siedz_woj_in,
		numer_budynku_siedz_woj_in,
		numer_lokalu_siedz_woj_in	
	);
	
	insert into public.siedziby_wojewodztw(
		id_siedz,
		id_woj,
		miejscowosc_siedziby,
		siedziba_wojewody,
		siedziba_sejmiku,
		id_adresu_siedziby
	)
	values(
		next_id_siedz,
		next_id_woj,
		miejscowosc_siedziby_wojewody_in,
		'true',
		'false',
		next_id_adresu_siedziby
	);
	
	-- inrement
	next_id_siedz := nextval('siedziby_powiatow_id_siedz_seq');
	next_id_adresu_siedziby := nextval('adresy_siedzib_id_adresu_siedziby_seq');
	
	-- siedziba sejmiku
	insert into public.adresy_siedzib(
		id_adresu_siedziby,
		kod_pocztowy,
		miejscowosc,
		ulica,
		numer_budynku,
		numer_lokalu
	)values(
		next_id_adresu_siedziby,
		kod_pocztowy_siedz_sejm_in,
		miejscowosc_siedz_sejm_in,
		ulica_siedz_sejm_in,
		numer_budynku_siedz_sejm_in,
		numer_lokalu_siedz_sejm_in	
	);
	
	insert into public.siedziby_wojewodztw(
		id_siedz,
		id_woj,
		miejscowosc_siedziby,
		siedziba_wojewody,
		siedziba_sejmiku,
		id_adresu_siedziby
	)
	values(
		next_id_siedz,
		next_id_woj,
		miejscowosc_siedziby_sejmiku_in,
		'false',
		'true',
		next_id_adresu_siedziby
	);		
	
END; $$;


ALTER PROCEDURE public.dodajwojewodztwosiedzibyrozne(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying) OWNER TO postgres;

--
-- Name: trigger_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE OR REPLACE FUNCTION public.trigger_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE

BEGIN
	
	IF TG_TABLE_NAME = 'gmina' THEN
		INSERT INTO historia_gmin(id_gm, id_pow, nazwa_gminy, liczba_ludnosci, powierzchnia, id_rodzaj_gminy, adres_siedziby, data_poczatkowa, data_koncowa)
		VALUES(
			OLD.id_gm,
			OLD.id_pow,
			OLD.nazwa_gminy,
			OLD.liczba_ludnosci,
			OLD.powierzchnia,
			OLD.id_rodzaj_gminy,
			(SELECT CASE 
			 			WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END
				FROM gmina gm
				INNER JOIN siedziby_gmin sg ON gm.id_gm = sg.id_gm
				INNER JOIN adresy_siedzib ad ON sg.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE gm.id_gm = OLD.id_gm),
			(SELECT CASE
						WHEN (SELECT MAX(id_zm) FROM historia_gmin hg WHERE hg.id_gm = OLD.id_gm) IS NULL
							THEN
								(SELECT date((pg_stat_file('base/'||oid ||'/PG_VERSION')).modification) FROM pg_database where datname like 'podzial_administracyjny_polski')
			 				ELSE
								(SELECT MAX(data_koncowa) FROM historia_gmin hg WHERE hg.id_gm = OLD.id_gm)
					END),
			current_date
		);
		
		
	ELSIF TG_TABLE_NAME = 'siedziby_gmin' THEN 
		INSERT INTO historia_gmin(id_gm, id_pow, nazwa_gminy, liczba_ludnosci, powierzchnia, id_rodzaj_gminy, adres_siedziby, data_poczatkowa, data_koncowa)
		SELECT gm.id_gm,
				id_pow,
				nazwa_gminy,
				liczba_ludnosci, 
				powierzchnia, 
				id_rodzaj_gminy, 
				CASE 
			 		WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END,
				current_date,
				current_date
		FROM gmina gm
		INNER JOIN siedziby_gmin sg ON gm.id_gm = sg.id_gm
		INNER JOIN adresy_siedzib ad ON sg.id_adresu_siedziby = ad.id_adresu_siedziby
		WHERE gm.id_gm = OLD.id_gm;
		
	
	ELSIF TG_TABLE_NAME = 'powiat' THEN
		INSERT INTO historia_powiatow(id_pow, id_woj, nazwa_powiatu, miasto_na_pr_pow, wyroznik_tab_rej, adres_siedziby, liczba_ludnosci, powierzchnia, data_poczatkowa, data_koncowa)
		VALUES(
			OLD.id_pow,
			OLD.id_woj,
			OLD.nazwa_powiatu,
			OLD.miasto_na_pr_pow,
			OLD.wyroznik_tab_rej,
			(SELECT CASE 
			 			WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE pw.id_pow = OLD.id_pow AND sp.id_adresu_siedziby = ad.id_adresu_siedziby),
			(SELECT SUM(gm.liczba_ludnosci)
				FROM powiat pw
				INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
			 	WHERE gm.id_pow = OLD.id_pow
			 	GROUP BY gm.id_pow),
			(SELECT SUM(gm.powierzchnia)
				FROM powiat pw
				INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
			 	WHERE gm.id_pow = OLD.id_pow
			 	GROUP BY gm.id_pow),
			current_date,
			current_date
		);
		
		
	ELSIF TG_TABLE_NAME = 'siedziby_powiatow' THEN 
		INSERT INTO historia_powiatow(id_pow, id_woj, nazwa_powiatu, miasto_na_pr_pow, wyroznik_tab_rej, adres_siedziby, liczba_ludnosci, powierzchnia, data_poczatkowa, data_koncowa)
		VALUES(
			OLD.id_pow,
			(SELECT pw.id_woj
			 	FROM powiat pw
			 	INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
			 	WHERE OLD.id_pow = pw.id_pow),
			(SELECT pw.nazwa_powiatu
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				WHERE OLD.id_pow = pw.id_pow),
			(SELECT pw.miasto_na_pr_pow
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				WHERE OLD.id_pow = pw.id_pow),
			(SELECT pw.wyroznik_tab_rej
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				WHERE OLD.id_pow = pw.id_pow),
			(SELECT CASE 
			 			WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE pw.id_pow = OLD.id_pow AND sp.id_adresu_siedziby = ad.id_adresu_siedziby),
			(SELECT SUM(gm.liczba_ludnosci)
				FROM siedziby_powiatow sp
				INNER JOIN gmina gm ON sp.id_pow = gm.id_pow
			 	WHERE gm.id_pow = OLD.id_pow
			 	GROUP BY gm.id_pow),
			(SELECT SUM(gm.powierzchnia)
				FROM siedziby_powiatow sp
				INNER JOIN gmina gm ON sp.id_pow = gm.id_pow
			 	WHERE gm.id_pow = OLD.id_pow
			 	GROUP BY gm.id_pow),
			current_date,
			current_date
		);
		
		
	ELSIF TG_TABLE_NAME = 'wojewodztwo' THEN
		INSERT INTO historia_wojewodztw(id_woj, nazwa_wojewodztwa, wyroznik_tab_rej, adres_siedziby, liczba_ludnosci, powierzchnia, data_poczatkowa, data_koncowa)
		VALUES(
			OLD.id_woj,
			OLD.nazwa_wojewodztwa,
			OLD.wyroznik_tab_rej,
			(SELECT CASE 
			 			WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END
				FROM wojewodztwo woj
			 	INNER JOIN siedziby_wojewodztw sw ON woj.id_woj = sw.id_woj
			 	INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
			 	WHERE sw.id_woj = OLD.id_woj AND sw.id_adresu_siedziby = ad.id_adresu_siedziby AND sw.siedziba_wojewody = true
				LIMIT 1),
			(SELECT SUM(gm.liczba_ludnosci)
			 	FROM wojewodztwo woj
			 	INNER JOIN powiat pw ON woj.id_woj = pw.id_woj
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
			 	WHERE pw.id_woj = OLD.id_woj AND pw.id_pow = gm.id_pow
			 	GROUP BY pw.id_woj),
			(SELECT SUM(gm.powierzchnia)
			 	FROM wojewodztwo woj
			 	INNER JOIN powiat pw ON woj.id_woj = pw.id_woj
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
			 	WHERE pw.id_woj = OLD.id_woj AND pw.id_pow = gm.id_pow
			 	GROUP BY pw.id_woj),
			current_date,
			current_date
		);
	
	ELSIF TG_TABLE_NAME = 'siedziby_wojewodztw' THEN 
		INSERT INTO historia_wojewodztw(id_woj, nazwa_wojewodztwa, wyroznik_tab_rej, adres_siedziby, liczba_ludnosci, powierzchnia, data_poczatkowa, data_koncowa)
		VALUES(
			OLD.id_woj,
			(SELECT wj.nazwa_wojewodztwa
			 	FROM wojewodztwo wj
			 	INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
			 	WHERE OLD.id_woj = wj.id_woj
				LIMIT 1),
			(SELECT wj.wyroznik_tab_rej
			 	FROM wojewodztwo wj
			 	INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
			 	WHERE OLD.id_woj = wj.id_woj
				LIMIT 1),
			(SELECT CASE 
			 			WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END
				FROM wojewodztwo wj
				INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
				INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE wj.id_woj = OLD.id_woj AND sw.id_adresu_siedziby = ad.id_adresu_siedziby AND sw.siedziba_wojewody = true
				LIMIT 1),
			(SELECT SUM(gm.liczba_ludnosci)
				FROM siedziby_wojewodztw sw
				INNER JOIN powiat pw ON sw.id_woj = pw.id_woj
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
			 	WHERE pw.id_woj = OLD.id_woj AND pw.id_pow = gm.id_pow
			 	GROUP BY pw.id_woj),
			(SELECT SUM(gm.powierzchnia)
				FROM siedziby_wojewodztw sw
				INNER JOIN powiat pw ON sw.id_woj = pw.id_woj
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
			 	WHERE pw.id_woj = OLD.id_woj AND pw.id_pow = gm.id_pow
			 	GROUP BY pw.id_woj),
			current_date,
			current_date
		);
	
	ELSE
	--ponizej funkcje dla tabeli adresy_siedzib, musza byc osobno bo np. powiat i gmina moga miec ta sama siedzibe
	IF (TG_TABLE_NAME = 'adresy_siedzib' AND OLD.id_adresu_siedziby IN (SELECT id_adresu_siedziby from siedziby_gmin)) THEN
		INSERT INTO historia_gmin(id_gm, id_pow, nazwa_gminy, liczba_ludnosci, powierzchnia, id_rodzaj_gminy, adres_siedziby, data_poczatkowa, data_koncowa)
		SELECT gm.id_gm,
				gm.id_pow,
				gm.nazwa_gminy,
				gm.liczba_ludnosci,
				gm.powierzchnia,
				gm.id_rodzaj_gminy,
				CASE 
			 			WHEN OLD.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(OLD.ulica,
						  ' ', OLD.numer_budynku,
						  ' ', OLD.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(OLD.ulica,
						  ' ', OLD.numer_budynku,
						  '/', OLD.numer_lokalu,
						  ' ', OLD.kod_pocztowy,
						  ' ', OLD.miejscowosc)
			 		END,
				current_date,
				current_date
		FROM adresy_siedzib ad
		INNER JOIN siedziby_gmin sg ON ad.id_adresu_siedziby = sg.id_adresu_siedziby
		INNER JOIN gmina gm ON sg.id_gm = gm.id_gm
		WHERE gm.id_gm = sg.id_gm AND sg.id_adresu_siedziby = OLD.id_adresu_siedziby;
	
	END IF;
	
	IF (TG_TABLE_NAME = 'adresy_siedzib' AND OLD.id_adresu_siedziby IN (SELECT id_adresu_siedziby from siedziby_powiatow)) THEN
		INSERT INTO historia_powiatow(id_pow, id_woj, nazwa_powiatu, miasto_na_pr_pow, wyroznik_tab_rej, adres_siedziby, liczba_ludnosci, powierzchnia, data_poczatkowa, data_koncowa)
		VALUES(
			(SELECT pw.id_pow
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE OLD.id_adresu_siedziby = sp.id_adresu_siedziby AND sp.id_pow = pw.id_pow),
			(SELECT pw.id_woj
			 	FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE OLD.id_adresu_siedziby = sp.id_adresu_siedziby AND sp.id_pow = pw.id_pow),
			(SELECT pw.nazwa_powiatu
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sp.id_adresu_siedziby = OLD.id_adresu_siedziby AND sp.id_pow = pw.id_pow),
			(SELECT pw.miasto_na_pr_pow
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sp.id_adresu_siedziby = OLD.id_adresu_siedziby AND sp.id_pow = pw.id_pow),
			(SELECT pw.wyroznik_tab_rej
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sp.id_adresu_siedziby = OLD.id_adresu_siedziby AND sp.id_pow = pw.id_pow),
			(SELECT CASE 
			 			WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sp.id_adresu_siedziby = OLD.id_adresu_siedziby AND sp.id_pow = pw.id_pow),
			(SELECT SUM(gm.liczba_ludnosci)
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
				WHERE sp.id_adresu_siedziby = OLD.id_adresu_siedziby AND sp.id_pow = pw.id_pow AND pw.id_pow = gm.id_pow
				GROUP BY gm.id_pow),
			(SELECT SUM(gm.powierzchnia)
				FROM powiat pw
				INNER JOIN siedziby_powiatow sp ON pw.id_pow = sp.id_pow
				INNER JOIN adresy_siedzib ad ON sp.id_adresu_siedziby = ad.id_adresu_siedziby
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
				WHERE sp.id_adresu_siedziby = OLD.id_adresu_siedziby AND sp.id_pow = pw.id_pow AND pw.id_pow = gm.id_pow
				GROUP BY gm.id_pow),
			current_date,
			current_date
		); 
	END IF;
	
	IF (TG_TABLE_NAME = 'adresy_siedzib' AND OLD.id_adresu_siedziby IN (SELECT id_adresu_siedziby from siedziby_wojewodztw)) THEN
		INSERT INTO historia_wojewodztw(id_woj, nazwa_wojewodztwa, wyroznik_tab_rej, adres_siedziby, liczba_ludnosci, powierzchnia, data_poczatkowa, data_koncowa)
		VALUES(
			(SELECT wj.id_woj
				FROM wojewodztwo wj
				INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
				INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sw.id_adresu_siedziby = OLD.id_adresu_siedziby AND sw.id_woj = wj.id_woj),
			(SELECT nazwa_wojewodztwa
				FROM wojewodztwo wj
				INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
				INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sw.id_adresu_siedziby = OLD.id_adresu_siedziby AND sw.id_woj = wj.id_woj),
			(SELECT wj.wyroznik_tab_rej
				FROM wojewodztwo wj
				INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
				INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sw.id_adresu_siedziby = OLD.id_adresu_siedziby AND sw.id_woj = wj.id_woj),
			(SELECT CASE 
			 			WHEN ad.numer_lokalu IS NULL 
			 				THEN 
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
							 ELSE
			 					CONCAT(ad.ulica,
						  ' ', ad.numer_budynku,
						  '/', ad.numer_lokalu,
						  ' ', ad.kod_pocztowy,
						  ' ', ad.miejscowosc)
			 		END
				FROM wojewodztwo wj
				INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
				INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
				WHERE sw.id_adresu_siedziby = OLD.id_adresu_siedziby AND sw.id_woj = wj.id_woj AND sw.siedziba_wojewody = true
				LIMIT 1),
			(SELECT SUM(gm.liczba_ludnosci)
				FROM wojewodztwo wj
				INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
				INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
			 	INNER JOIN powiat pw ON wj.id_woj = pw.id_woj
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
				WHERE sw.id_adresu_siedziby = OLD.id_adresu_siedziby AND sw.id_woj = wj.id_woj AND pw.id_pow = gm.id_pow
				GROUP BY pw.id_woj),
			(SELECT SUM(gm.powierzchnia)
				FROM wojewodztwo wj
				INNER JOIN siedziby_wojewodztw sw ON wj.id_woj = sw.id_woj
				INNER JOIN adresy_siedzib ad ON sw.id_adresu_siedziby = ad.id_adresu_siedziby
			 	INNER JOIN powiat pw ON wj.id_woj = pw.id_woj
			 	INNER JOIN gmina gm ON pw.id_pow = gm.id_pow
				WHERE sw.id_adresu_siedziby = OLD.id_adresu_siedziby AND sw.id_woj = wj.id_woj AND pw.id_pow = gm.id_pow
				GROUP BY pw.id_woj),
			current_date,
			current_date
		);
	
	END IF;
	END IF;
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_func() OWNER TO postgres;

--
-- Name: updategminy(integer, integer, integer, character varying, integer, numeric, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.updategminy(IN id_gminy_in integer, IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
	sel_id_adresu_siedziby integer;
BEGIN
	UPDATE gmina
	SET id_rodzaj_gminy = id_rodzaju_gminy_in,
	 	id_pow = id_powiatu_in,
		nazwa_gminy = nazwa_gminy_in,
		liczba_ludnosci = liczba_ludnosci_in,
		powierzchnia = powierzchnia_in
	WHERE id_gm = id_gminy_in;
	
	SELECT id_adresu_siedziby
	INTO sel_id_adresu_siedziby
	FROM siedziby_gmin
	WHERE id_gm = id_gminy_in;
	
	UPDATE adresy_siedzib
	SET kod_pocztowy = kod_pocztowy_in,
		 miejscowosc = miejscowosc_in,
		ulica = ulica_in,
		numer_budynku = numer_budynku_in,
		numer_lokalu = numer_lokalu_in
	WHERE id_adresu_siedziby = sel_id_adresu_siedziby;
	
	UPDATE siedziby_gmin
	SET miejscowosc_siedziby = miejscowosc_siedziby_in
	WHERE id_gm = id_gminy_in;

END; $$;


ALTER PROCEDURE public.updategminy(IN id_gminy_in integer, IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) OWNER TO postgres;

--
-- Name: updatepowiaty(integer, integer, character varying, boolean, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.updatepowiaty(IN id_powiatu_in integer, IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
	sel_id_adresu_siedziby integer;
BEGIN
	UPDATE powiat
	SET id_woj = id_woj_in,
	 	nazwa_powiatu = nazwa_pow_in,
		miasto_na_pr_pow = miasto_na_pr_pow_in,
		wyroznik_tab_rej = wyroznik_tab_rej_in
	WHERE id_pow = id_powiatu_in;
	
	SELECT id_adresu_siedziby
	INTO sel_id_adresu_siedziby
	FROM siedziby_powiatow
	WHERE id_pow = id_powiatu_in;
	
	UPDATE adresy_siedzib
	SET kod_pocztowy = kod_pocztowy_in,
		miejscowosc = miejscowosc_in,
		ulica = ulica_in,
		numer_budynku = numer_budynku_in,
		numer_lokalu = numer_lokalu_in
	WHERE id_adresu_siedziby = sel_id_adresu_siedziby;
	
	UPDATE siedziby_powiatow
	SET miejscowosc_siedziby = miejscowosc_siedziby_in
	WHERE id_pow = id_powiatu_in;

END; $$;


ALTER PROCEDURE public.updatepowiaty(IN id_powiatu_in integer, IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) OWNER TO postgres;

--
-- Name: updatewojewodztwasiedzibawspolna(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.updatewojewodztwasiedzibawspolna(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
	sel_id_adresu_siedziby integer;
BEGIN
	UPDATE wojewodztwo
	SET nazwa_wojewodztwa = nazwa_woj_in,
		wyroznik_tab_rej = wyroznik_tab_rej_in,
		kod_teryt = kod_teryt_in
	WHERE id_woj = id_wojewodztwa_in;
	
	SELECT id_adresu_siedziby
	INTO sel_id_adresu_siedziby
	FROM siedziby_wojewodztw
	WHERE id_woj = id_wojewodztwa_in;
	
	UPDATE adresy_siedzib
	SET kod_pocztowy = kod_pocztowy_in,
		miejscowosc = miejscowosc_in,
		ulica = ulica_in,
		numer_budynku = numer_budynku_in,
		numer_lokalu = numer_lokalu_in
	WHERE id_adresu_siedziby = sel_id_adresu_siedziby;
	
	UPDATE siedziby_wojewodztw
	SET miejscowosc_siedziby = miejscowosc_siedziby_in
	WHERE id_woj = id_wojewodztwa_in;

END; $$;


ALTER PROCEDURE public.updatewojewodztwasiedzibawspolna(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) OWNER TO postgres;

--
-- Name: updatewojewodztwosiedzibyrozne(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE OR REPLACE PROCEDURE public.updatewojewodztwosiedzibyrozne(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE
	sel_id_adresu_siedziby_wojewody integer;
	sel_id_adresu_siedziby_sejmiku integer;
BEGIN
	UPDATE wojewodztwo
	SET nazwa_wojewodztwa = nazwa_woj_in,
		wyroznik_tab_rej = wyroznik_tab_rej_in,
		kod_teryt = kod_teryt_in
	WHERE id_woj = id_wojewodztwa_in;
	
	SELECT id_adresu_siedziby
	INTO sel_id_adresu_siedziby_wojewody
	FROM siedziby_wojewodztw
	WHERE id_woj = id_wojewodztwa_in
	AND siedziba_wojewody = 'true';
		
	SELECT id_adresu_siedziby
	INTO sel_id_adresu_siedziby_sejmiku
	FROM siedziby_wojewodztw
	WHERE id_woj = id_wojewodztwa_in
	AND siedziba_sejmiku = 'true';
	
	
	-- siedziba wojewody
	UPDATE adresy_siedzib
	SET kod_pocztowy = kod_pocztowy_siedz_woj_in,
		miejscowosc = miejscowosc_siedz_woj_in,
		ulica = ulica_siedz_woj_in,
		numer_budynku = numer_budynku_siedz_woj_in,
		numer_lokalu = numer_lokalu_siedz_woj_in
	WHERE id_adresu_siedziby = sel_id_adresu_siedziby_wojewody;
	
	UPDATE siedziby_wojewodztw
	SET miejscowosc_siedziby = miejscowosc_siedziby_wojewody_in
	WHERE id_woj = id_wojewodztwa_in
	AND siedziba_wojewody = 'true';
	
	
	-- siedziba sejmiku
	UPDATE adresy_siedzib
	SET kod_pocztowy = kod_pocztowy_siedz_sejm_in,
		miejscowosc = miejscowosc_siedz_sejm_in,
		ulica = ulica_siedz_sejm_in,
		numer_budynku = numer_budynku_siedz_sejm_in,
		numer_lokalu = numer_lokalu_siedz_sejm_in
	WHERE id_adresu_siedziby = sel_id_adresu_siedziby_sejmiku;
	
	UPDATE siedziby_wojewodztw
	SET miejscowosc_siedziby = miejscowosc_siedziby_sejmiku_in
	WHERE id_woj = id_wojewodztwa_in
	AND siedziba_sejmiku = 'true';
	
END; $$;


ALTER PROCEDURE public.updatewojewodztwosiedzibyrozne(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: administratorzy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.administratorzy (
    id_admin integer NOT NULL,
    login character varying(32) NOT NULL,
    haslo character varying(256) NOT NULL
);


ALTER TABLE public.administratorzy OWNER TO postgres;

--
-- Name: administratorzy_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.administratorzy_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.administratorzy_id_admin_seq OWNER TO postgres;

--
-- Name: administratorzy_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administratorzy_id_admin_seq OWNED BY public.administratorzy.id_admin;


--
-- Name: administratorzy_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.administratorzy_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.administratorzy_seq OWNER TO postgres;

--
-- Name: adresy_siedzib; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.adresy_siedzib (
    id_adresu_siedziby integer NOT NULL,
    kod_pocztowy character varying(6),
    miejscowosc character varying(60),
    ulica character varying(60),
    numer_budynku character varying(12),
    numer_lokalu character varying(4)
);


ALTER TABLE public.adresy_siedzib OWNER TO postgres;

--
-- Name: adresy_siedzib_id_adresu_siedziby_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.adresy_siedzib_id_adresu_siedziby_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.adresy_siedzib_id_adresu_siedziby_seq OWNER TO postgres;

--
-- Name: adresy_siedzib_id_adresu_siedziby_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adresy_siedzib_id_adresu_siedziby_seq OWNED BY public.adresy_siedzib.id_adresu_siedziby;


--
-- Name: gmina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.gmina (
    id_gm integer NOT NULL,
    id_pow integer,
    nazwa_gminy character varying(60) NOT NULL,
    liczba_ludnosci integer,
    powierzchnia real,
    id_rodzaj_gminy integer,
    kod_teryt character varying(7)
);


ALTER TABLE public.gmina OWNER TO postgres;

--
-- Name: gmina_id_gm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.gmina_id_gm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gmina_id_gm_seq OWNER TO postgres;

--
-- Name: gmina_id_gm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gmina_id_gm_seq OWNED BY public.gmina.id_gm;


--
-- Name: siedziby_gmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.siedziby_gmin (
    id_siedz integer NOT NULL,
    id_gm integer,
    miejscowosc_siedziby character varying(60) NOT NULL,
    id_adresu_siedziby integer
);


ALTER TABLE public.siedziby_gmin OWNER TO postgres;

--
-- Name: gminydaneadresowe; Type: VIEW; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.gminydaneadresowe AS
 SELECT gmina.id_gm,
    gmina.id_pow,
    gmina.nazwa_gminy,
    siedziby_gmin.miejscowosc_siedziby,
    adresy_siedzib.kod_pocztowy,
    adresy_siedzib.miejscowosc AS "miejscowość",
    adresy_siedzib.ulica,
    adresy_siedzib.numer_budynku,
    adresy_siedzib.numer_lokalu
   FROM ((public.gmina
     JOIN public.siedziby_gmin ON ((gmina.id_gm = siedziby_gmin.id_gm)))
     JOIN public.adresy_siedzib ON ((adresy_siedzib.id_adresu_siedziby = siedziby_gmin.id_adresu_siedziby)));


ALTER VIEW public.gminydaneadresowe OWNER TO postgres;

--
-- Name: historia_gmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.historia_gmin (
    id_zm integer NOT NULL,
    id_pow integer,
    id_gm integer NOT NULL,
    nazwa_gminy character varying(60) NOT NULL,
    adres_siedziby character varying(150),
    liczba_ludnosci integer,
    powierzchnia real,
    id_rodzaj_gminy integer,
    data_poczatkowa timestamp(6) without time zone NOT NULL,
    data_koncowa timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.historia_gmin OWNER TO postgres;

--
-- Name: historia_gmin_id_zm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.historia_gmin_id_zm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historia_gmin_id_zm_seq OWNER TO postgres;

--
-- Name: historia_gmin_id_zm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historia_gmin_id_zm_seq OWNED BY public.historia_gmin.id_zm;


--
-- Name: historia_powiatow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.historia_powiatow (
    id_zm integer NOT NULL,
    id_woj integer,
    id_pow integer NOT NULL,
    nazwa_powiatu character varying(120) NOT NULL,
    adres_siedziby character varying(150),
    liczba_ludnosci integer,
    powierzchnia real,
    miasto_na_pr_pow boolean,
    data_poczatkowa timestamp(6) without time zone NOT NULL,
    data_koncowa timestamp(6) without time zone NOT NULL,
    wyroznik_tab_rej character varying(2)
);


ALTER TABLE public.historia_powiatow OWNER TO postgres;

--
-- Name: historia_powiatow_id_zm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.historia_powiatow_id_zm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historia_powiatow_id_zm_seq OWNER TO postgres;

--
-- Name: historia_powiatow_id_zm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historia_powiatow_id_zm_seq OWNED BY public.historia_powiatow.id_zm;


--
-- Name: historia_wojewodztw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.historia_wojewodztw (
    id_zm integer NOT NULL,
    id_woj integer NOT NULL,
    nazwa_wojewodztwa character varying(60) NOT NULL,
    adres_siedziby character varying(150),
    liczba_ludnosci integer,
    powierzchnia real,
    wyroznik_tab_rej character varying(1) NOT NULL,
    data_poczatkowa timestamp(6) without time zone NOT NULL,
    data_koncowa timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.historia_wojewodztw OWNER TO postgres;

--
-- Name: historia_wojewodztw_id_zm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.historia_wojewodztw_id_zm_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historia_wojewodztw_id_zm_seq OWNER TO postgres;

--
-- Name: historia_wojewodztw_id_zm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historia_wojewodztw_id_zm_seq OWNED BY public.historia_wojewodztw.id_zm;


--
-- Name: lista_uprawnien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.lista_uprawnien (
    id_upr integer NOT NULL,
    id_admin integer NOT NULL,
    data_poczatkowa timestamp(6) without time zone NOT NULL,
    data_koncowa timestamp(6) without time zone
);


ALTER TABLE public.lista_uprawnien OWNER TO postgres;

--
-- Name: powiat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.powiat (
    id_pow integer NOT NULL,
    id_woj integer,
    nazwa_powiatu character varying(120) NOT NULL,
    miasto_na_pr_pow boolean,
    wyroznik_tab_rej character varying(2),
    kod_teryt character varying(7)
);


ALTER TABLE public.powiat OWNER TO postgres;

--
-- Name: powiat_id_pow_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.powiat_id_pow_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.powiat_id_pow_seq OWNER TO postgres;

--
-- Name: powiat_id_pow_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.powiat_id_pow_seq OWNED BY public.powiat.id_pow;


--
-- Name: siedziby_powiatow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.siedziby_powiatow (
    id_siedz integer NOT NULL,
    id_pow integer,
    miejscowosc_siedziby character varying(60) NOT NULL,
    id_adresu_siedziby integer
);


ALTER TABLE public.siedziby_powiatow OWNER TO postgres;

--
-- Name: powiatydaneadresowe; Type: VIEW; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.powiatydaneadresowe AS
 SELECT powiat.id_pow,
    powiat.id_woj,
    powiat.nazwa_powiatu,
    siedziby_powiatow.miejscowosc_siedziby,
    adresy_siedzib.kod_pocztowy,
    adresy_siedzib.miejscowosc AS "miejscowość",
    adresy_siedzib.ulica,
    adresy_siedzib.numer_budynku,
    adresy_siedzib.numer_lokalu
   FROM ((public.powiat
     JOIN public.siedziby_powiatow ON ((powiat.id_pow = siedziby_powiatow.id_pow)))
     JOIN public.adresy_siedzib ON ((adresy_siedzib.id_adresu_siedziby = siedziby_powiatow.id_adresu_siedziby)));


ALTER VIEW public.powiatydaneadresowe OWNER TO postgres;

--
-- Name: rodzaj_gminy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.rodzaj_gminy (
    id_rodzaju_gminy integer NOT NULL,
    nazwa_rodzaju character varying(50) NOT NULL
);


ALTER TABLE public.rodzaj_gminy OWNER TO postgres;

--
-- Name: rodzaj_gminy_id_rodzaju_gminy_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.rodzaj_gminy_id_rodzaju_gminy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rodzaj_gminy_id_rodzaju_gminy_seq OWNER TO postgres;

--
-- Name: rodzaj_gminy_id_rodzaju_gminy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rodzaj_gminy_id_rodzaju_gminy_seq OWNED BY public.rodzaj_gminy.id_rodzaju_gminy;


--
-- Name: siedziby_gmin_id_siedz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.siedziby_gmin_id_siedz_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.siedziby_gmin_id_siedz_seq OWNER TO postgres;

--
-- Name: siedziby_gmin_id_siedz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siedziby_gmin_id_siedz_seq OWNED BY public.siedziby_gmin.id_siedz;


--
-- Name: siedziby_powiatow_id_siedz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.siedziby_powiatow_id_siedz_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.siedziby_powiatow_id_siedz_seq OWNER TO postgres;

--
-- Name: siedziby_powiatow_id_siedz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siedziby_powiatow_id_siedz_seq OWNED BY public.siedziby_powiatow.id_siedz;


--
-- Name: siedziby_wojewodztw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.siedziby_wojewodztw (
    id_siedz integer NOT NULL,
    id_woj integer,
    miejscowosc_siedziby character varying(60) NOT NULL,
    siedziba_wojewody boolean,
    siedziba_sejmiku boolean,
    id_adresu_siedziby integer
);


ALTER TABLE public.siedziby_wojewodztw OWNER TO postgres;

--
-- Name: siedziby_wojewodztw_id_siedz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.siedziby_wojewodztw_id_siedz_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.siedziby_wojewodztw_id_siedz_seq OWNER TO postgres;

--
-- Name: siedziby_wojewodztw_id_siedz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siedziby_wojewodztw_id_siedz_seq OWNED BY public.siedziby_wojewodztw.id_siedz;


--
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.token (
    id integer NOT NULL,
    expired boolean NOT NULL,
    revoked boolean NOT NULL,
    token character varying(255),
    token_type character varying(255),
    id_admin integer,
    CONSTRAINT token_token_type_check CHECK (((token_type)::text = 'BEARER'::text))
);


ALTER TABLE public.token OWNER TO postgres;

--
-- Name: token_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.token_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_seq OWNER TO postgres;

--
-- Name: uprawnienia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.uprawnienia (
    id_upr integer NOT NULL,
    id_woj integer,
    id_pow integer
);


ALTER TABLE public.uprawnienia OWNER TO postgres;

--
-- Name: uprawnienia_id_upr_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.uprawnienia_id_upr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.uprawnienia_id_upr_seq OWNER TO postgres;

--
-- Name: uprawnienia_id_upr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uprawnienia_id_upr_seq OWNED BY public.uprawnienia.id_upr;


--
-- Name: wojewodztwo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.wojewodztwo (
    id_woj integer NOT NULL,
    nazwa_wojewodztwa character varying(60) NOT NULL,
    wyroznik_tab_rej character varying(1) NOT NULL,
    kod_teryt character varying(7)
);


ALTER TABLE public.wojewodztwo OWNER TO postgres;

--
-- Name: wojewodztwadaneadresowe; Type: VIEW; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.wojewodztwadaneadresowe AS
 SELECT wojewodztwo.id_woj,
    wojewodztwo.nazwa_wojewodztwa,
    siedziby_wojewodztw.miejscowosc_siedziby,
    siedziby_wojewodztw.siedziba_wojewody,
    siedziby_wojewodztw.siedziba_sejmiku,
    adresy_siedzib.kod_pocztowy,
    adresy_siedzib.miejscowosc AS "miejscowość",
    adresy_siedzib.ulica,
    adresy_siedzib.numer_budynku,
    adresy_siedzib.numer_lokalu
   FROM ((public.wojewodztwo
     JOIN public.siedziby_wojewodztw ON ((siedziby_wojewodztw.id_woj = wojewodztwo.id_woj)))
     JOIN public.adresy_siedzib ON ((adresy_siedzib.id_adresu_siedziby = siedziby_wojewodztw.id_adresu_siedziby)));


ALTER VIEW public.wojewodztwadaneadresowe OWNER TO postgres;

--
-- Name: wojewodztwo_id_woj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.wojewodztwo_id_woj_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wojewodztwo_id_woj_seq OWNER TO postgres;

--
-- Name: wojewodztwo_id_woj_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wojewodztwo_id_woj_seq OWNED BY public.wojewodztwo.id_woj;


--
-- Name: zgloszenia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.zgloszenia (
    id_zgl integer NOT NULL,
    id_woj integer NOT NULL,
    id_pow integer,
    id_gm integer,
    temat character varying(255) NOT NULL,
    tresc character varying(1000) NOT NULL,
    data_zgloszenia timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.zgloszenia OWNER TO postgres;

--
-- Name: zgloszenia_id_zgl_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE IF NOT EXISTS public.zgloszenia_id_zgl_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zgloszenia_id_zgl_seq OWNER TO postgres;

--
-- Name: zgloszenia_id_zgl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zgloszenia_id_zgl_seq OWNED BY public.zgloszenia.id_zgl;


--
-- Name: administratorzy id_admin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administratorzy ALTER COLUMN id_admin SET DEFAULT nextval('public.administratorzy_id_admin_seq'::regclass);


--
-- Name: adresy_siedzib id_adresu_siedziby; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresy_siedzib ALTER COLUMN id_adresu_siedziby SET DEFAULT nextval('public.adresy_siedzib_id_adresu_siedziby_seq'::regclass);


--
-- Name: gmina id_gm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gmina ALTER COLUMN id_gm SET DEFAULT nextval('public.gmina_id_gm_seq'::regclass);


--
-- Name: historia_gmin id_zm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_gmin ALTER COLUMN id_zm SET DEFAULT nextval('public.historia_gmin_id_zm_seq'::regclass);


--
-- Name: historia_powiatow id_zm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_powiatow ALTER COLUMN id_zm SET DEFAULT nextval('public.historia_powiatow_id_zm_seq'::regclass);


--
-- Name: historia_wojewodztw id_zm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_wojewodztw ALTER COLUMN id_zm SET DEFAULT nextval('public.historia_wojewodztw_id_zm_seq'::regclass);


--
-- Name: powiat id_pow; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.powiat ALTER COLUMN id_pow SET DEFAULT nextval('public.powiat_id_pow_seq'::regclass);


--
-- Name: rodzaj_gminy id_rodzaju_gminy; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rodzaj_gminy ALTER COLUMN id_rodzaju_gminy SET DEFAULT nextval('public.rodzaj_gminy_id_rodzaju_gminy_seq'::regclass);


--
-- Name: siedziby_gmin id_siedz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_gmin ALTER COLUMN id_siedz SET DEFAULT nextval('public.siedziby_gmin_id_siedz_seq'::regclass);


--
-- Name: siedziby_powiatow id_siedz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_powiatow ALTER COLUMN id_siedz SET DEFAULT nextval('public.siedziby_powiatow_id_siedz_seq'::regclass);


--
-- Name: siedziby_wojewodztw id_siedz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_wojewodztw ALTER COLUMN id_siedz SET DEFAULT nextval('public.siedziby_wojewodztw_id_siedz_seq'::regclass);


--
-- Name: uprawnienia id_upr; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uprawnienia ALTER COLUMN id_upr SET DEFAULT nextval('public.uprawnienia_id_upr_seq'::regclass);


--
-- Name: wojewodztwo id_woj; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wojewodztwo ALTER COLUMN id_woj SET DEFAULT nextval('public.wojewodztwo_id_woj_seq'::regclass);


--
-- Name: zgloszenia id_zgl; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zgloszenia ALTER COLUMN id_zgl SET DEFAULT nextval('public.zgloszenia_id_zgl_seq'::regclass);



DO $$ 
DECLARE
    path_to_files VARCHAR;
BEGIN
    path_to_files := '/data/';
	
--
-- Data for Name: administratorzy; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.administratorzy FROM %L DELIMITER %L', path_to_files || 'administratorzy.csv', ';');

--
-- Data for Name: adresy_siedzib; Type: TABLE DATA; Schema: public; Owner: postgres
--

	EXECUTE format('COPY public.adresy_siedzib FROM %L DELIMITER %L', path_to_files || 'adresy_siedzib.csv', ';');


--
-- Data for Name: gmina; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.gmina FROM %L DELIMITER %L', path_to_files || 'gminy.csv', ';');

--
-- Data for Name: lista_uprawnien; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.lista_uprawnien FROM %L DELIMITER %L', path_to_files || 'lista_uprawnien.csv', ';');


--
-- Data for Name: powiat; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.powiat FROM %L DELIMITER %L', path_to_files || 'powiaty.csv', ';');


--
-- Data for Name: rodzaj_gminy; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.rodzaj_gminy FROM %L DELIMITER %L', path_to_files || 'rodzaje_gmin.csv', ';');


--
-- Data for Name: siedziby_gmin; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.siedziby_gmin FROM %L DELIMITER %L', path_to_files || 'siedziby_gmin.csv', ';');


--
-- Data for Name: siedziby_powiatow; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.siedziby_powiatow FROM %L DELIMITER %L', path_to_files || 'siedziby_powiatow.csv', ';');

--
-- Data for Name: siedziby_wojewodztw; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.siedziby_wojewodztw FROM %L DELIMITER %L', path_to_files || 'siedziby_wojewodztw.csv', ';');

--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.token FROM %L DELIMITER %L', path_to_files || 'token.csv', ';');

--
-- Data for Name: uprawnienia; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.uprawnienia FROM %L DELIMITER %L', path_to_files || 'uprawnienia.csv', ';');

--
-- Data for Name: wojewodztwo; Type: TABLE DATA; Schema: public; Owner: postgres
--

    EXECUTE format('COPY public.wojewodztwo FROM %L DELIMITER %L', path_to_files || 'wojewodztwa.csv', ';');

    RAISE NOTICE 'The value of path_to_files is %', path_to_files;
END $$;



--
-- Name: administratorzy_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administratorzy_id_admin_seq', 2, true);


--
-- Name: administratorzy_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administratorzy_seq', 1, false);


--
-- Name: adresy_siedzib_id_adresu_siedziby_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adresy_siedzib_id_adresu_siedziby_seq', 2914, true);


--
-- Name: gmina_id_gm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gmina_id_gm_seq', 2483, true);


--
-- Name: historia_gmin_id_zm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historia_gmin_id_zm_seq', 14737, true);


--
-- Name: historia_powiatow_id_zm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historia_powiatow_id_zm_seq', 1633, true);


--
-- Name: historia_wojewodztw_id_zm_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historia_wojewodztw_id_zm_seq', 147, true);


--
-- Name: powiat_id_pow_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.powiat_id_pow_seq', 383, true);


--
-- Name: rodzaj_gminy_id_rodzaju_gminy_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rodzaj_gminy_id_rodzaju_gminy_seq', 3, true);


--
-- Name: siedziby_gmin_id_siedz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siedziby_gmin_id_siedz_seq', 2481, true);


--
-- Name: siedziby_powiatow_id_siedz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siedziby_powiatow_id_siedz_seq', 381, true);


--
-- Name: siedziby_wojewodztw_id_siedz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siedziby_wojewodztw_id_siedz_seq', 58, true);


--
-- Name: token_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_seq', 101, true);


--
-- Name: uprawnienia_id_upr_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uprawnienia_id_upr_seq', 18, true);


--
-- Name: wojewodztwo_id_woj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wojewodztwo_id_woj_seq', 36, true);


--
-- Name: zgloszenia_id_zgl_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zgloszenia_id_zgl_seq', 49, true);


--
-- Name: administratorzy administratorzy_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administratorzy
    ADD CONSTRAINT administratorzy_login_key UNIQUE (login);


--
-- Name: administratorzy administratorzy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administratorzy
    ADD CONSTRAINT administratorzy_pkey PRIMARY KEY (id_admin);


--
-- Name: adresy_siedzib adresy_siedzib_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresy_siedzib
    ADD CONSTRAINT adresy_siedzib_pkey PRIMARY KEY (id_adresu_siedziby);


--
-- Name: gmina gmina_kod_teryt_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gmina
    ADD CONSTRAINT gmina_kod_teryt_key UNIQUE (kod_teryt);


--
-- Name: gmina gmina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gmina
    ADD CONSTRAINT gmina_pkey PRIMARY KEY (id_gm);


--
-- Name: historia_gmin historia_gmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_gmin
    ADD CONSTRAINT historia_gmin_pkey PRIMARY KEY (id_zm);


--
-- Name: historia_powiatow historia_powiatow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_powiatow
    ADD CONSTRAINT historia_powiatow_pkey PRIMARY KEY (id_zm);


--
-- Name: historia_wojewodztw historia_wojewodztw_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_wojewodztw
    ADD CONSTRAINT historia_wojewodztw_pkey PRIMARY KEY (id_zm);


--
-- Name: powiat powiat_kod_teryt_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.powiat
    ADD CONSTRAINT powiat_kod_teryt_key UNIQUE (kod_teryt);


--
-- Name: powiat powiat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.powiat
    ADD CONSTRAINT powiat_pkey PRIMARY KEY (id_pow);


--
-- Name: rodzaj_gminy rodzaj_gminy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rodzaj_gminy
    ADD CONSTRAINT rodzaj_gminy_pkey PRIMARY KEY (id_rodzaju_gminy);


--
-- Name: siedziby_gmin siedziby_gmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_gmin
    ADD CONSTRAINT siedziby_gmin_pkey PRIMARY KEY (id_siedz);


--
-- Name: siedziby_powiatow siedziby_powiatow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_powiatow
    ADD CONSTRAINT siedziby_powiatow_pkey PRIMARY KEY (id_siedz);


--
-- Name: siedziby_wojewodztw siedziby_wojewodztw_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_wojewodztw
    ADD CONSTRAINT siedziby_wojewodztw_pkey PRIMARY KEY (id_siedz);


--
-- Name: token token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id);


--
-- Name: token uk_pddrhgwxnms2aceeku9s2ewy5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT uk_pddrhgwxnms2aceeku9s2ewy5 UNIQUE (token);


--
-- Name: uprawnienia uprawnienia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uprawnienia
    ADD CONSTRAINT uprawnienia_pkey PRIMARY KEY (id_upr);


--
-- Name: wojewodztwo wojewodztwo_kod_teryt_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wojewodztwo
    ADD CONSTRAINT wojewodztwo_kod_teryt_key UNIQUE (kod_teryt);


--
-- Name: wojewodztwo wojewodztwo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wojewodztwo
    ADD CONSTRAINT wojewodztwo_pkey PRIMARY KEY (id_woj);


--
-- Name: wojewodztwo wojewodztwo_wyroznik_tab_rej_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wojewodztwo
    ADD CONSTRAINT wojewodztwo_wyroznik_tab_rej_key UNIQUE (wyroznik_tab_rej);


--
-- Name: zgloszenia zgloszenia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zgloszenia
    ADD CONSTRAINT zgloszenia_pkey PRIMARY KEY (id_zgl);


--
-- Name: administratorzy_id_admin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX administratorzy_id_admin ON public.administratorzy USING btree (id_admin);


--
-- Name: adresy_siedzib_id_adresu_siedziby; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX adresy_siedzib_id_adresu_siedziby ON public.adresy_siedzib USING btree (id_adresu_siedziby);


--
-- Name: gmina_id_gm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gmina_id_gm ON public.gmina USING btree (id_gm);


--
-- Name: gmina_liczba_ludnosci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gmina_liczba_ludnosci ON public.gmina USING btree (liczba_ludnosci);


--
-- Name: gmina_nazwa_gminy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gmina_nazwa_gminy ON public.gmina USING btree (nazwa_gminy);


--
-- Name: gmina_powierzchnia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gmina_powierzchnia ON public.gmina USING btree (powierzchnia);


--
-- Name: historia_gmin_data_koncowa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historia_gmin_data_koncowa ON public.historia_gmin USING btree (data_koncowa);


--
-- Name: historia_gmin_data_poczatkowa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historia_gmin_data_poczatkowa ON public.historia_gmin USING btree (data_poczatkowa);


--
-- Name: historia_gmin_id_zm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX historia_gmin_id_zm ON public.historia_gmin USING btree (id_zm);


--
-- Name: historia_powiatow_data_koncowa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historia_powiatow_data_koncowa ON public.historia_powiatow USING btree (data_koncowa);


--
-- Name: historia_powiatow_data_poczatkowa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historia_powiatow_data_poczatkowa ON public.historia_powiatow USING btree (data_poczatkowa);


--
-- Name: historia_wojewodztw_data_koncowa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historia_wojewodztw_data_koncowa ON public.historia_wojewodztw USING btree (data_koncowa);


--
-- Name: historia_wojewodztw_data_poczatkowa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historia_wojewodztw_data_poczatkowa ON public.historia_wojewodztw USING btree (data_poczatkowa);


--
-- Name: historia_wojewodztw_id_zm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX historia_wojewodztw_id_zm ON public.historia_wojewodztw USING btree (id_zm);


--
-- Name: idx_gmina_powiat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gmina_powiat ON public.gmina USING btree (id_pow);


--
-- Name: idx_powiat_wojewodztwo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_powiat_wojewodztwo ON public.powiat USING btree (id_woj);


--
-- Name: powiat_id_pow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX powiat_id_pow ON public.powiat USING btree (id_pow);


--
-- Name: powiat_nazwa_powiatu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX powiat_nazwa_powiatu ON public.powiat USING btree (nazwa_powiatu);


--
-- Name: rodzaj_gminy_id__rodzaju_gminy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX rodzaj_gminy_id__rodzaju_gminy ON public.rodzaj_gminy USING btree (id_rodzaju_gminy);


--
-- Name: siedziby_gmin_id_siedz; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX siedziby_gmin_id_siedz ON public.siedziby_gmin USING btree (id_siedz);


--
-- Name: siedziby_powiatow_id_siedz; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX siedziby_powiatow_id_siedz ON public.siedziby_powiatow USING btree (id_siedz);


--
-- Name: siedziby_wojewodztw_id_siedz; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX siedziby_wojewodztw_id_siedz ON public.siedziby_wojewodztw USING btree (id_siedz);


--
-- Name: uprawnienia_id_upr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uprawnienia_id_upr ON public.uprawnienia USING btree (id_upr);


--
-- Name: wojewodztwo_id_woj; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX wojewodztwo_id_woj ON public.wojewodztwo USING btree (id_woj);


--
-- Name: wojewodztwo_nazwa_wojewodztwa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX wojewodztwo_nazwa_wojewodztwa ON public.wojewodztwo USING btree (nazwa_wojewodztwa);


--
-- Name: zgloszenia_data_zgloszenia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX zgloszenia_data_zgloszenia ON public.zgloszenia USING btree (data_zgloszenia);


--
-- Name: zgloszenia_id_zgl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX zgloszenia_id_zgl ON public.zgloszenia USING btree (id_zgl);


--
-- Name: wojewodztwaposzerzone _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.wojewodztwaposzerzone AS
 SELECT wojewodztwo.id_woj,
    wojewodztwo.nazwa_wojewodztwa,
    wojewodztwo.wyroznik_tab_rej,
    wojewodztwo.kod_teryt,
    sum(gmina.liczba_ludnosci) AS liczba_ludnosci,
    sum(gmina.powierzchnia) AS powierzchnia
   FROM ((public.wojewodztwo
     LEFT JOIN public.powiat ON ((wojewodztwo.id_woj = powiat.id_woj)))
     LEFT JOIN public.gmina ON ((powiat.id_pow = gmina.id_pow)))
  GROUP BY wojewodztwo.id_woj;
  
  ALTER VIEW public.wojewodztwaposzerzone OWNER TO postgres;


--
-- Name: powiatyposzerzone _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.powiatyposzerzone AS
 SELECT powiat.id_pow,
    powiat.id_woj,
    wojewodztwo.nazwa_wojewodztwa,
    powiat.nazwa_powiatu,
    powiat.miasto_na_pr_pow,
    concat(wojewodztwo.wyroznik_tab_rej, powiat.wyroznik_tab_rej) AS rejestracja,
    powiat.kod_teryt,
    sum(gmina.liczba_ludnosci) AS liczba_ludnosci,
    sum(gmina.powierzchnia) AS powierzchnia
   FROM ((public.powiat
     LEFT JOIN public.gmina ON ((gmina.id_pow = powiat.id_pow)))
     LEFT JOIN public.wojewodztwo ON ((wojewodztwo.id_woj = powiat.id_woj)))
  GROUP BY powiat.id_pow, wojewodztwo.nazwa_wojewodztwa, (concat(wojewodztwo.wyroznik_tab_rej, powiat.wyroznik_tab_rej));
  
  ALTER VIEW public.powiatyposzerzone OWNER TO postgres;

--
-- Name: adresy_siedzib trigger_historyczny_adresy_siedzib; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_historyczny_adresy_siedzib BEFORE UPDATE ON public.adresy_siedzib FOR EACH ROW EXECUTE FUNCTION public.trigger_func();


--
-- Name: gmina trigger_historyczny_gmina; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_historyczny_gmina BEFORE UPDATE ON public.gmina FOR EACH ROW EXECUTE FUNCTION public.trigger_func();


--
-- Name: powiat trigger_historyczny_powiat; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_historyczny_powiat BEFORE UPDATE ON public.powiat FOR EACH ROW EXECUTE FUNCTION public.trigger_func();


--
-- Name: siedziby_gmin trigger_historyczny_siedziby_gmin; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_historyczny_siedziby_gmin BEFORE UPDATE ON public.siedziby_gmin FOR EACH ROW EXECUTE FUNCTION public.trigger_func();


--
-- Name: siedziby_powiatow trigger_historyczny_siedziby_powiatow; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_historyczny_siedziby_powiatow BEFORE UPDATE ON public.siedziby_powiatow FOR EACH ROW EXECUTE FUNCTION public.trigger_func();


--
-- Name: siedziby_wojewodztw trigger_historyczny_siedziby_wojewodztw; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_historyczny_siedziby_wojewodztw BEFORE UPDATE ON public.siedziby_wojewodztw FOR EACH ROW EXECUTE FUNCTION public.trigger_func();


--
-- Name: wojewodztwo trigger_historyczny_wojewodztwo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_historyczny_wojewodztwo BEFORE UPDATE ON public.wojewodztwo FOR EACH ROW EXECUTE FUNCTION public.trigger_func();


--
-- Name: historia_gmin FK2t900rok2rgsfh4f8qaf8dbvt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historia_gmin
    ADD CONSTRAINT "FK2t900rok2rgsfh4f8qaf8dbvt" FOREIGN KEY (id_rodzaj_gminy) REFERENCES public.rodzaj_gminy(id_rodzaju_gminy);


--
-- Name: siedziby_wojewodztw FK6acao0khl4844y5re2j58o3np; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_wojewodztw
    ADD CONSTRAINT "FK6acao0khl4844y5re2j58o3np" FOREIGN KEY (id_adresu_siedziby) REFERENCES public.adresy_siedzib(id_adresu_siedziby);


--
-- Name: token FKefemoimnjds5grq5qwsrhepqf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT "FKefemoimnjds5grq5qwsrhepqf" FOREIGN KEY (id_admin) REFERENCES public.administratorzy(id_admin);


--
-- Name: lista_uprawnien fk_lista_uprawnienia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_uprawnien
    ADD CONSTRAINT fk_lista_uprawnienia FOREIGN KEY (id_upr) REFERENCES public.uprawnienia(id_upr) ON DELETE CASCADE;


--
-- Name: siedziby_gmin fk_siedziby_gmina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_gmin
    ADD CONSTRAINT fk_siedziby_gmina FOREIGN KEY (id_gm) REFERENCES public.gmina(id_gm) ON DELETE CASCADE;


--
-- Name: siedziby_powiatow fk_siedziby_powiat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_powiatow
    ADD CONSTRAINT fk_siedziby_powiat FOREIGN KEY (id_pow) REFERENCES public.powiat(id_pow) ON DELETE CASCADE;


--
-- Name: siedziby_wojewodztw fk_siedziby_wojewodztwo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_wojewodztw
    ADD CONSTRAINT fk_siedziby_wojewodztwo FOREIGN KEY (id_woj) REFERENCES public.wojewodztwo(id_woj) ON DELETE CASCADE;


--
-- Name: uprawnienia fk_uprawnienia_powiaty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uprawnienia
    ADD CONSTRAINT fk_uprawnienia_powiaty FOREIGN KEY (id_pow) REFERENCES public.powiat(id_pow) ON DELETE CASCADE;


--
-- Name: uprawnienia fk_uprawnienia_wojewodztwa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uprawnienia
    ADD CONSTRAINT fk_uprawnienia_wojewodztwa FOREIGN KEY (id_woj) REFERENCES public.wojewodztwo(id_woj) ON DELETE CASCADE;


--
-- Name: zgloszenia fk_zgloszenia_gmina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zgloszenia
    ADD CONSTRAINT fk_zgloszenia_gmina FOREIGN KEY (id_gm) REFERENCES public.gmina(id_gm) ON DELETE CASCADE;


--
-- Name: zgloszenia fk_zgloszenia_powiat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zgloszenia
    ADD CONSTRAINT fk_zgloszenia_powiat FOREIGN KEY (id_pow) REFERENCES public.powiat(id_pow) ON DELETE CASCADE;


--
-- Name: zgloszenia fk_zgloszenia_wojewodztwo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zgloszenia
    ADD CONSTRAINT fk_zgloszenia_wojewodztwo FOREIGN KEY (id_woj) REFERENCES public.wojewodztwo(id_woj) ON DELETE CASCADE;


--
-- Name: gmina fkgmina260601; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gmina
    ADD CONSTRAINT fkgmina260601 FOREIGN KEY (id_rodzaj_gminy) REFERENCES public.rodzaj_gminy(id_rodzaju_gminy);


--
-- Name: gmina fkgmina687101; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gmina
    ADD CONSTRAINT fkgmina687101 FOREIGN KEY (id_pow) REFERENCES public.powiat(id_pow);


--
-- Name: lista_uprawnien fklista_upra498444; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_uprawnien
    ADD CONSTRAINT fklista_upra498444 FOREIGN KEY (id_admin) REFERENCES public.administratorzy(id_admin);


--
-- Name: powiat fkpowiat405636; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.powiat
    ADD CONSTRAINT fkpowiat405636 FOREIGN KEY (id_woj) REFERENCES public.wojewodztwo(id_woj);


--
-- Name: siedziby_gmin fksiedziby_g903416; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_gmin
    ADD CONSTRAINT fksiedziby_g903416 FOREIGN KEY (id_adresu_siedziby) REFERENCES public.adresy_siedzib(id_adresu_siedziby);


--
-- Name: siedziby_powiatow fksiedziby_p738880; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siedziby_powiatow
    ADD CONSTRAINT fksiedziby_p738880 FOREIGN KEY (id_adresu_siedziby) REFERENCES public.adresy_siedzib(id_adresu_siedziby);

CREATE ROLE basic_user;
CREATE ROLE office_admin;
CREATE ROLE super_admin;

--
-- Name: PROCEDURE dodajgmine(IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.dodajgmine(IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.dodajgmine(IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) TO office_admin;


--
-- Name: PROCEDURE dodajpowiat(IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.dodajpowiat(IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.dodajpowiat(IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) TO office_admin;


--
-- Name: PROCEDURE dodajwojewodztwosiedzibawspolna(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.dodajwojewodztwosiedzibawspolna(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.dodajwojewodztwosiedzibawspolna(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) TO office_admin;


--
-- Name: PROCEDURE dodajwojewodztwosiedzibyrozne(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.dodajwojewodztwosiedzibyrozne(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.dodajwojewodztwosiedzibyrozne(IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying) TO office_admin;


--
-- Name: PROCEDURE updategminy(IN id_gminy_in integer, IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.updategminy(IN id_gminy_in integer, IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.updategminy(IN id_gminy_in integer, IN id_rodzaju_gminy_in integer, IN id_powiatu_in integer, IN nazwa_gminy_in character varying, IN liczba_ludnosci_in integer, IN powierzchnia_in numeric, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) TO office_admin;


--
-- Name: PROCEDURE updatepowiaty(IN id_powiatu_in integer, IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.updatepowiaty(IN id_powiatu_in integer, IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.updatepowiaty(IN id_powiatu_in integer, IN id_woj_in integer, IN nazwa_pow_in character varying, IN miasto_na_pr_pow_in boolean, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) TO office_admin;


--
-- Name: PROCEDURE updatewojewodztwasiedzibawspolna(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.updatewojewodztwasiedzibawspolna(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.updatewojewodztwasiedzibawspolna(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_in character varying, IN kod_pocztowy_in character varying, IN miejscowosc_in character varying, IN ulica_in character varying, IN numer_budynku_in character varying, IN numer_lokalu_in character varying) TO office_admin;


--
-- Name: PROCEDURE updatewojewodztwosiedzibyrozne(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON PROCEDURE public.updatewojewodztwosiedzibyrozne(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying) FROM PUBLIC;
GRANT ALL ON PROCEDURE public.updatewojewodztwosiedzibyrozne(IN id_wojewodztwa_in integer, IN nazwa_woj_in character varying, IN wyroznik_tab_rej_in character varying, IN kod_teryt_in character varying, IN miejscowosc_siedziby_wojewody_in character varying, IN miejscowosc_siedziby_sejmiku_in character varying, IN kod_pocztowy_siedz_woj_in character varying, IN miejscowosc_siedz_woj_in character varying, IN ulica_siedz_woj_in character varying, IN numer_budynku_siedz_woj_in character varying, IN numer_lokalu_siedz_woj_in character varying, IN kod_pocztowy_siedz_sejm_in character varying, IN miejscowosc_siedz_sejm_in character varying, IN ulica_siedz_sejm_in character varying, IN numer_budynku_siedz_sejm_in character varying, IN numer_lokalu_siedz_sejm_in character varying) TO office_admin;


--
-- Name: TABLE administratorzy; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.administratorzy TO super_admin;
GRANT SELECT ON TABLE public.administratorzy TO PUBLIC;


--
-- Name: SEQUENCE administratorzy_id_admin_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.administratorzy_id_admin_seq TO office_admin;


--
-- Name: TABLE adresy_siedzib; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.adresy_siedzib TO super_admin;
GRANT SELECT ON TABLE public.adresy_siedzib TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.adresy_siedzib TO office_admin;


--
-- Name: SEQUENCE adresy_siedzib_id_adresu_siedziby_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.adresy_siedzib_id_adresu_siedziby_seq TO office_admin;


--
-- Name: TABLE gmina; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.gmina TO super_admin;
GRANT SELECT ON TABLE public.gmina TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.gmina TO office_admin;


--
-- Name: SEQUENCE gmina_id_gm_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.gmina_id_gm_seq TO office_admin;


--
-- Name: TABLE siedziby_gmin; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.siedziby_gmin TO super_admin;
GRANT SELECT ON TABLE public.siedziby_gmin TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.siedziby_gmin TO office_admin;


--
-- Name: TABLE gminydaneadresowe; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.gminydaneadresowe TO PUBLIC;
GRANT SELECT,REFERENCES,UPDATE ON TABLE public.gminydaneadresowe TO office_admin;
GRANT ALL ON TABLE public.gminydaneadresowe TO super_admin;


--
-- Name: TABLE historia_gmin; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.historia_gmin TO super_admin;
GRANT SELECT ON TABLE public.historia_gmin TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.historia_gmin TO office_admin;


--
-- Name: SEQUENCE historia_gmin_id_zm_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.historia_gmin_id_zm_seq TO office_admin;


--
-- Name: TABLE historia_powiatow; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.historia_powiatow TO super_admin;
GRANT SELECT ON TABLE public.historia_powiatow TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.historia_powiatow TO office_admin;


--
-- Name: SEQUENCE historia_powiatow_id_zm_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.historia_powiatow_id_zm_seq TO office_admin;


--
-- Name: TABLE historia_wojewodztw; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.historia_wojewodztw TO super_admin;
GRANT SELECT ON TABLE public.historia_wojewodztw TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.historia_wojewodztw TO office_admin;


--
-- Name: SEQUENCE historia_wojewodztw_id_zm_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.historia_wojewodztw_id_zm_seq TO office_admin;


--
-- Name: TABLE lista_uprawnien; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lista_uprawnien TO super_admin;


--
-- Name: TABLE powiat; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.powiat TO super_admin;
GRANT SELECT ON TABLE public.powiat TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.powiat TO office_admin;


--
-- Name: SEQUENCE powiat_id_pow_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.powiat_id_pow_seq TO office_admin;


--
-- Name: TABLE siedziby_powiatow; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.siedziby_powiatow TO super_admin;
GRANT SELECT ON TABLE public.siedziby_powiatow TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.siedziby_powiatow TO office_admin;


--
-- Name: TABLE powiatydaneadresowe; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.powiatydaneadresowe TO PUBLIC;
GRANT SELECT,REFERENCES,UPDATE ON TABLE public.powiatydaneadresowe TO office_admin;
GRANT ALL ON TABLE public.powiatydaneadresowe TO super_admin;


--
-- Name: TABLE powiatyposzerzone; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.powiatyposzerzone TO PUBLIC;
GRANT SELECT,REFERENCES,UPDATE ON TABLE public.powiatyposzerzone TO office_admin;
GRANT ALL ON TABLE public.powiatyposzerzone TO super_admin;


--
-- Name: TABLE rodzaj_gminy; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rodzaj_gminy TO super_admin;
GRANT SELECT ON TABLE public.rodzaj_gminy TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.rodzaj_gminy TO office_admin;


--
-- Name: SEQUENCE rodzaj_gminy_id_rodzaju_gminy_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.rodzaj_gminy_id_rodzaju_gminy_seq TO office_admin;


--
-- Name: SEQUENCE siedziby_gmin_id_siedz_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.siedziby_gmin_id_siedz_seq TO office_admin;


--
-- Name: SEQUENCE siedziby_powiatow_id_siedz_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.siedziby_powiatow_id_siedz_seq TO office_admin;


--
-- Name: TABLE siedziby_wojewodztw; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.siedziby_wojewodztw TO super_admin;
GRANT SELECT ON TABLE public.siedziby_wojewodztw TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.siedziby_wojewodztw TO office_admin;


--
-- Name: SEQUENCE siedziby_wojewodztw_id_siedz_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.siedziby_wojewodztw_id_siedz_seq TO office_admin;


--
-- Name: TABLE uprawnienia; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.uprawnienia TO super_admin;


--
-- Name: SEQUENCE uprawnienia_id_upr_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.uprawnienia_id_upr_seq TO office_admin;


--
-- Name: TABLE wojewodztwo; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.wojewodztwo TO super_admin;
GRANT SELECT ON TABLE public.wojewodztwo TO PUBLIC;
GRANT INSERT,DELETE,UPDATE ON TABLE public.wojewodztwo TO office_admin;


--
-- Name: TABLE wojewodztwadaneadresowe; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.wojewodztwadaneadresowe TO PUBLIC;
GRANT SELECT,REFERENCES,UPDATE ON TABLE public.wojewodztwadaneadresowe TO office_admin;
GRANT ALL ON TABLE public.wojewodztwadaneadresowe TO super_admin;


--
-- Name: TABLE wojewodztwaposzerzone; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.wojewodztwaposzerzone TO PUBLIC;
GRANT SELECT,REFERENCES,UPDATE ON TABLE public.wojewodztwaposzerzone TO office_admin;
GRANT ALL ON TABLE public.wojewodztwaposzerzone TO super_admin;


--
-- Name: SEQUENCE wojewodztwo_id_woj_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.wojewodztwo_id_woj_seq TO office_admin;


--
-- Name: TABLE zgloszenia; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.zgloszenia TO super_admin;
GRANT INSERT ON TABLE public.zgloszenia TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.zgloszenia TO office_admin;


--
-- Name: SEQUENCE zgloszenia_id_zgl_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.zgloszenia_id_zgl_seq TO basic_user;
GRANT SELECT,USAGE ON SEQUENCE public.zgloszenia_id_zgl_seq TO office_admin;


--
-- PostgreSQL database dump complete
--