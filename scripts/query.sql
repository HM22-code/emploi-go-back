/*
Etablissement
*/

--SELECT * FROM Etablissement;

--SELECT * FROM Etablissement WHERE libelleCommuneEtablissement = "DIJON";

--SELECT siret, denominationUsuelleEtablissement, enseigne1Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE codePostalEtablissement LIKE "21%" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O";

--SELECT siret, denominationUsuelleEtablissement, enseigne1Etablissement, enseigne2Etablissement, enseigne3Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE libelleCommuneEtablissement = "DIJON" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O" AND statutDiffusionEtablissement = "O" AND trancheEffectifsEtablissement IS NOT NULL;

--SELECT siret, enseigne1Etablissement, numeroVoieEtablissement, typeVoieEtablissement, libelleVoieEtablissement, codePostalEtablissement, libelleCommuneEtablissement, activitePrincipaleEtablissement, trancheEffectifsEtablissement FROM Etablissement WHERE codePostalEtablissement LIKE "21___" AND etatAdministratifEtablissement = "A" AND caractereEmployeurEtablissement = "O" AND statutDiffusionEtablissement = "O" AND trancheEffectifsEtablissement IS NOT NULL AND enseigne1Etablissement IS NOT NULL;

/*
Geolocalisation
*/

--SELECT * FROM Geolocalisation;

--SELECT siret, x_longitude, y_latitude FROM Geolocalisation;

/*
Etablissement JOIN Geolocalisation
*/

--SELECT * FROM Geolocalisation JOIN Etablissement ON Geolocalisation.siret = Etablissement.siret;

/*
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
*/

/*
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
*/

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

--PRAGMA table_info(Geolocalisation);

/*
ALTER TABLE Geolocalisation
DROP COLUMN x;
ALTER TABLE Geolocalisation
DROP COLUMN y;
ALTER TABLE Geolocalisation
DROP COLUMN qualite_xy;
ALTER TABLE Geolocalisation
DROP COLUMN epsg;
ALTER TABLE Geolocalisation
DROP COLUMN plg_qp24;
ALTER TABLE Geolocalisation
DROP COLUMN plg_iris;
ALTER TABLE Geolocalisation
DROP COLUMN plg_zus;
ALTER TABLE Geolocalisation
DROP COLUMN plg_qp15;
ALTER TABLE Geolocalisation
DROP COLUMN plg_qva;
ALTER TABLE Geolocalisation
DROP COLUMN plg_code_commune;
ALTER TABLE Geolocalisation
DROP COLUMN distance_precision;
ALTER TABLE Geolocalisation
DROP COLUMN qualite_qp24;
ALTER TABLE Geolocalisation
DROP COLUMN qualite_iris;
ALTER TABLE Geolocalisation
DROP COLUMN qualite_zus;
ALTER TABLE Geolocalisation
DROP COLUMN qualite_qp15;
ALTER TABLE Geolocalisation
DROP COLUMN qualite_qva;
*/

--SELECT name FROM sqlite_master WHERE type = 'table';

--PRAGMA table_info(Etablissement);

/*
ALTER TABLE Etablissement
DROP COLUMN siren;
ALTER TABLE Etablissement
DROP COLUMN nic;
ALTER TABLE Etablissement
DROP COLUMN statutDiffusionEtablissement;
ALTER TABLE Etablissement
DROP COLUMN dateCreationEtablissement;
ALTER TABLE Etablissement
DROP COLUMN anneeEffectifsEtablissement;
ALTER TABLE Etablissement
DROP COLUMN activitePrincipaleRegistreMetiersEtablissement;
ALTER TABLE Etablissement
DROP COLUMN dateDernierTraitementEtablissement;
ALTER TABLE Etablissement
DROP COLUMN etablissementSiege;
ALTER TABLE Etablissement
DROP COLUMN nombrePeriodesEtablissement;
ALTER TABLE Etablissement
DROP COLUMN complementAdresseEtablissement;
ALTER TABLE Etablissement
DROP COLUMN indiceRepetitionDernierNumeroVoieEtablissement;
ALTER TABLE Etablissement
DROP COLUMN indiceRepetitionEtablissement;
ALTER TABLE Etablissement
DROP COLUMN dernierNumeroVoieEtablissement;
ALTER TABLE Etablissement
DROP COLUMN libelleCommuneEtrangerEtablissement;
ALTER TABLE Etablissement
DROP COLUMN distributionSpecialeEtablissement;
ALTER TABLE Etablissement
DROP COLUMN codeCommuneEtablissement;
ALTER TABLE Etablissement
DROP COLUMN codeCedexEtablissement;
ALTER TABLE Etablissement
DROP COLUMN libelleCedexEtablissement;
ALTER TABLE Etablissement
DROP COLUMN codePaysEtrangerEtablissement;
ALTER TABLE Etablissement
DROP COLUMN libellePaysEtrangerEtablissement;
ALTER TABLE Etablissement
DROP COLUMN identifiantAdresseEtablissement;
ALTER TABLE Etablissement
DROP COLUMN coordonneeLambertAbscisseEtablissement;
ALTER TABLE Etablissement
DROP COLUMN coordonneeLambertOrdonneeEtablissement;
ALTER TABLE Etablissement
DROP COLUMN complementAdresse2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN numeroVoie2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN indiceRepetition2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN typeVoie2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN libelleVoie2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN codePostal2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN libelleCommune2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN libelleCommuneEtranger2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN distributionSpeciale2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN codeCommune2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN codeCedex2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN libelleCedex2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN codePaysEtranger2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN libellePaysEtranger2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN dateDebut;
ALTER TABLE Etablissement
DROP COLUMN etatAdministratifEtablissement;
ALTER TABLE Etablissement
DROP COLUMN enseigne2Etablissement;
ALTER TABLE Etablissement
DROP COLUMN enseigne3Etablissement;
ALTER TABLE Etablissement
DROP COLUMN denominationUsuelleEtablissement;
ALTER TABLE Etablissement
DROP COLUMN nomenclatureActivitePrincipaleEtablissement;
ALTER TABLE Etablissement
DROP COLUMN caractereEmployeurEtablissement;
*/