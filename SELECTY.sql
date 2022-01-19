/*1.
vypise meno ,priezvisko a vek z tabulky register - kto ma viac ako 40 rokov a zoradi od najmensieho*/
SELECT meno,priezvisko,vek FROM register WHERE vek>40 ORDER BY vek ASC;
/*vypise vsetko z tabulky detaily_sudu kde je termin od roku 2022 a stav trestneho stihania je odsudeny*/
SELECT * FROM detaily_sudu WHERE termin >= '2022-01-01 00:00:00' AND stav_trestneho_stihania = 'Odsudeny';
/*vypise z tabulky register kolko krat je clen PZ cislo 4 zodpovedny za trestancov*/
SELECT COUNT(zodpovedny_clen_PZ_id) FROM register WHERE zodpovedny_clen_PZ_id = 4;
/*vypise z tabulky vystup kolko krat sa ake zariadenie v tabulke vyskytuje*/
SELECT zariadenie, COUNT(*) FROM vystup GROUP BY zariadenie;
/*2.
vypise meno pouzivatelov ktori maju bud v mene 'e' alebo na zaciatku priezviska 'd'*/
SELECT meno FROM pouzivatelia WHERE meno LIKE '%e%' OR priezvisko LIKE 'd%';
/*vypise vsetky info o pouzivateloch ktori maju v priezvisku 'a'*/
SELECT * FROM pouzivatelia WHERE priezvisko LIKE '%a%';
/*vypise iba tie pripady ktore maju vystupny trest*/
SELECT * FROM vystup WHERE vystupny_trest NOT IN ('-');
/*3.
spocita pravnych zastupcov pre kazdy case */
SELECT case_id, COUNT(pravny_zastupca_id) AS 'Pocet_pravnych_zastupcov' FROM register GROUP BY case_id;
/*spocita podmienecne tresty v kazdom case*/
SELECT case_id, COUNT(stav_trestneho_stihania) AS 'Ludia_s_podmienkou' FROM detaily_sudu WHERE stav_trestneho_stihania = 'podmienka' GROUP BY case_id;
/*vypise pouzivatela ktory bol pridany ako prvy*/
SELECT * FROM pouzivatelia HAVING MAX(vytvoreny);
/*4.
vypise vsetky udaje o pouzivateloch z tabulky ciselnik ktori maju id mensiu alebo rovnu 5*/
SELECT * FROM pouzivatelia INNER JOIN ciselnik ON ciselnik.id = pouzivatelia.id WHERE pouzivatelia.id <= 5 GROUP BY meno;
/*vypise udaje o sudoch a trestoch sudcu 8 kde vystupny trest nebude vypisovat udaje viac krat*/
SELECT termin,stav_trestneho_stihania,vystupny_trest,zariadenie FROM detaily_sudu INNER JOIN vystup ON vystup.case_id = detaily_sudu.case_id WHERE sudca_id = 8 GROUP BY vystupny_trest;
/*5.
vypise vsetky udaje z tabulky pouzivatelia ktori maju v tabulke ciselnik narodnost cesku*/
SELECT * FROM pouzivatelia WHERE id IN (SELECT id FROM ciselnik WHERE narodnost = 'Ceska');
/*vypise vsetky udaje z tabulky register kde je v tabulke vystup zariadenie bratislava*/
SELECT * FROM register WHERE case_id IN (SELECT case_id FROM vystup WHERE zariadenie = 'Bratislava');

