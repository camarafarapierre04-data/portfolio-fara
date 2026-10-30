-- PROJET SQL : Analyse du suivi de la conformité environnementale
-- SGBD conseillé : PostgreSQL (adaptable à MySQL / SQL Server)
-- Les données sont disponibles dans donnees_suivi_environnemental.csv.
-- Jeu de données synthétique : aucune donnée réelle d'entreprise ou de site.

CREATE TABLE inspections (
    id_inspection VARCHAR(20) PRIMARY KEY,
    date_inspection DATE NOT NULL,
    region VARCHAR(50),
    site VARCHAR(50),
    type_activite VARCHAR(100),
    inspecteur VARCHAR(50),
    categorie VARCHAR(100),
    statut_conformite VARCHAR(40),
    niveau_gravite VARCHAR(30),
    action_corrective VARCHAR(40),
    delai_jours INTEGER,
    cout_action_gnf NUMERIC(14,2),
    echantillon_eau_conforme VARCHAR(30),
    gestion_dechets_conforme VARCHAR(10),
    observation TEXT,
    mois CHAR(7)
);

-- Après import du CSV dans la table inspections, exécuter les analyses suivantes.

-- 1. Nombre d'inspections et répartition des statuts
SELECT statut_conformite, COUNT(*) AS nombre,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pourcentage
FROM inspections
GROUP BY statut_conformite
ORDER BY nombre DESC;

-- 2. Taux de conformité par région
SELECT region, COUNT(*) AS total_inspections,
       SUM(CASE WHEN statut_conformite = 'Conforme' THEN 1 ELSE 0 END) AS conformes,
       ROUND(100.0 * SUM(CASE WHEN statut_conformite = 'Conforme' THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*),0), 2) AS taux_conformite_pct
FROM inspections
GROUP BY region
ORDER BY taux_conformite_pct DESC;

-- 3. Catégories générant le plus de non-conformités
SELECT categorie, COUNT(*) AS nombre_non_conformites
FROM inspections
WHERE statut_conformite = 'Non conforme'
GROUP BY categorie
ORDER BY nombre_non_conformites DESC;

-- 4. Actions correctives en retard et leur coût
SELECT id_inspection, date_inspection, region, site, categorie,
       niveau_gravite, delai_jours, cout_action_gnf
FROM inspections
WHERE action_corrective = 'En retard'
ORDER BY niveau_gravite DESC, delai_jours DESC;

-- 5. Coût estimatif des actions correctives par région
SELECT region, SUM(cout_action_gnf) AS cout_total_gnf,
       ROUND(AVG(cout_action_gnf),0) AS cout_moyen_gnf
FROM inspections
WHERE cout_action_gnf > 0
GROUP BY region
ORDER BY cout_total_gnf DESC;

-- 6. Evolution mensuelle du volume d'inspections et du taux de conformité
SELECT mois, COUNT(*) AS total_inspections,
       ROUND(100.0 * SUM(CASE WHEN statut_conformite='Conforme' THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*),0),2) AS taux_conformite_pct
FROM inspections
GROUP BY mois
ORDER BY mois;

-- 7. Sites nécessitant une attention prioritaire
SELECT site, region,
       COUNT(*) AS total_inspections,
       SUM(CASE WHEN statut_conformite='Non conforme' THEN 1 ELSE 0 END) AS non_conformites,
       SUM(CASE WHEN action_corrective='En retard' THEN 1 ELSE 0 END) AS actions_en_retard
FROM inspections
GROUP BY site, region
HAVING SUM(CASE WHEN statut_conformite='Non conforme' THEN 1 ELSE 0 END) > 0
ORDER BY actions_en_retard DESC, non_conformites DESC;
