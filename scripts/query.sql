/*
Etablissement
*/

--SELECT * FROM Etablissement WHERE libelleCommuneEtablissement = "DIJON";

--SELECT siret, denominationUsuelleEtablissement, enseigne1Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE codePostalEtablissement LIKE "21%" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O";

--SELECT siret, denominationUsuelleEtablissement, enseigne1Etablissement, enseigne2Etablissement, enseigne3Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE libelleCommuneEtablissement = "DIJON" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O" AND statutDiffusionEtablissement = "O" AND trancheEffectifsEtablissement IS NOT NULL;

--SELECT siret, enseigne1Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE codePostalEtablissement LIKE "21___" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O" AND statutDiffusionEtablissement = "O" AND trancheEffectifsEtablissement IS NOT NULL AND enseigne1Etablissement IS NOT NULL;

/*
Geolocalisation
*/

--SELECT siret, x_longitude, y_latitude FROM Geolocalisation;

/*
Etablissement JOIN Geolocalisation
*/

--SELECT * FROM Geolocalisation JOIN Etablissement ON Geolocalisation.siret = Etablissement.siret;


SELECT
Geolocalisation.x_longitude,
Geolocalisation.y_latitude,
Geolocalisation.siret,
Etablissement.enseigne1Etablissement,
Etablissement.numeroVoieEtablissement,
Etablissement.typeVoieEtablissement,
Etablissement.libelleVoieEtablissement,
Etablissement.codePostalEtablissement,
Etablissement.libelleCommuneEtablissement,
Etablissement.activitePrincipaleEtablissement,
ActiviteNIV5.Libelle,
ActiviteNIV1.Code,
ActiviteNIV1.Libelle,
EffectifsCode.description
FROM Etablissement
JOIN Geolocalisation ON Geolocalisation.siret = Etablissement.siret
LEFT JOIN EffectifsCode ON EffectifsCode.code = Etablissement.trancheEffectifsEtablissement
LEFT JOIN ActiviteNiveau ON ActiviteNiveau.NIV5 = Etablissement.activitePrincipaleEtablissement
LEFT JOIN ActiviteNIV5 ON ActiviteNiveau.NIV5 = ActiviteNIV5.Code
LEFT JOIN ActiviteNIV4 ON ActiviteNiveau.NIV4 = ActiviteNIV4.Code
LEFT JOIN ActiviteNIV3 ON ActiviteNiveau.NIV3 = ActiviteNIV3.Code
LEFT JOIN ActiviteNIV2 ON ActiviteNiveau.NIV2 = ActiviteNIV2.Code
LEFT JOIN ActiviteNIV1 ON ActiviteNiveau.NIV1 = ActiviteNIV1.Code
WHERE Etablissement.codePostalEtablissement LIKE "21___"
AND Etablissement.etatAdministratifEtablissement = "A"
AND Etablissement.caractereEmployeurEtablissement = "O"
AND Etablissement.statutDiffusionEtablissement = "O"
AND Etablissement.trancheEffectifsEtablissement IS NOT NULL
AND Etablissement.enseigne1Etablissement IS NOT NULL;


--SELECT * FROM ActiviteNiveau;

--SELECT * FROM ActiviteNIV1;

--SELECT * FROM ActiviteNIV2;

--SELECT * FROM ActiviteNIV3;

--SELECT * FROM ActiviteNIV4;

--SELECT * FROM ActiviteNIV5;

/*
SELECT * FROM ActiviteNiveau
JOIN ActiviteNIV5 ON ActiviteNiveau.NIV5 = ActiviteNIV5.Code
JOIN ActiviteNIV4 ON ActiviteNiveau.NIV4 = ActiviteNIV4.Code
JOIN ActiviteNIV3 ON ActiviteNiveau.NIV3 = ActiviteNIV3.Code
JOIN ActiviteNIV2 ON ActiviteNiveau.NIV2 = ActiviteNIV2.Code
JOIN ActiviteNIV1 ON ActiviteNiveau.NIV1 = ActiviteNIV1.Code
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
