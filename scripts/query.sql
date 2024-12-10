/*
Etablissement
*/
--SELECT * FROM Etablissement WHERE libelleCommuneEtablissement = "DIJON";
--SELECT siret, denominationUsuelleEtablissement, enseigne1Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE codePostalEtablissement LIKE "21%" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O";
SELECT siret, denominationUsuelleEtablissement, enseigne1Etablissement, enseigne2Etablissement, enseigne3Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE libelleCommuneEtablissement = "DIJON" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O" AND statutDiffusionEtablissement = "O" AND trancheEffectifsEtablissement IS NOT NULL;
/*
Geolocalisation
*/
--SELECT siret, x_longitude, y_latitude FROM Geolocalisation;
/*
Etablissement JOIN Geolocalisation
*/
/*
SELECT 
Geolocalisation.x_longitude, 
Geolocalisation.y_latitude, 
Geolocalisation.siret, 
Etablissement.siret, 
Etablissement.denominationUsuelleEtablissement, 
Etablissement.enseigne1Etablissement, 
Etablissement.enseigne2Etablissement, 
Etablissement.enseigne3Etablissement, 
Etablissement.numeroVoieEtablissement, 
Etablissement.typeVoieEtablissement, 
Etablissement.libelleVoieEtablissement, 
Etablissement.codePostalEtablissement, 
Etablissement.libelleCommuneEtablissement, 
Etablissement.activitePrincipaleEtablissement, 
Etablissement.nomenclatureActivitePrincipaleEtablissement, 
Etablissement.trancheEffectifsEtablissement 
FROM Etablissement JOIN Geolocalisation ON Etablissement.siret = Geolocalisation.siret
WHERE Etablissement.codePostalEtablissement LIKE "21%" 
AND Etablissement.etatAdministratifEtablissement = "A" 
AND Etablissement.caractereEmployeurEtablissement = "O"
AND Etablissement.statutDiffusionEtablissement = "O"
AND Etablissement.libelleCommuneEtablissement = "DIJON";
*/
/*
CREATE TABLE EffectifsCode (
    code VARCHAR(2) PRIMARY KEY,
    description TEXT NOT NULL
);
INSERT INTO EffectifsCode(code, description) VALUES
    ('NN', 'Etablissement non-employeur ou présumé non-employeur'),
    ('00', '0 salarié'),
    ('01', '1 ou 2 salariés'),
    ('02', '3 à 5 salariés'),
    ('03', '6 à 9 salariés'),
    ('11', '10 à 19 salariés'),
    ('12', '20 à 49 salariés'),
    ('21', '50 à 99 salariés'),
    ('22', '100 à 199 salariés'),
    ('31', '200 à 249 salariés'),
    ('32', '250 à 499 salariés'),
    ('41', '500 à 999 salariés'),
    ('42', '1 000 à 1 999 salariés'),
    ('51', '2 000 à 4 999 salariés'),
    ('52', '5 000 à 9 999 salariés'),
    ('53', '10 000 salariés et plus');
*/
