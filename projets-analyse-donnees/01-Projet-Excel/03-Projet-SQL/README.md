# Projet SQL – Analyse des inspections et de la conformité environnementale

## 1. Présentation du projet

Ce projet consiste à exploiter une base de données de suivi environnemental afin d'analyser les résultats des inspections, d'évaluer les niveaux de conformité environnementale et d'identifier les principales situations de non-conformité.

Il met en pratique l'utilisation du langage SQL pour extraire, organiser, analyser et synthétiser des données dans le cadre du suivi de la performance environnementale.

**Important :** les données utilisées dans ce projet sont entièrement simulées à des fins pédagogiques et de démonstration. Elles ne représentent pas des inspections réelles.

## 2. Objectifs

* Analyser le nombre d'inspections réalisées.
* Évaluer le taux de conformité environnementale.
* Comparer les résultats entre les régions.
* Identifier les activités présentant le plus de non-conformités.
* Examiner les niveaux de gravité des non-conformités.
* Analyser les coûts des actions correctives.
* Suivre l'évolution mensuelle des inspections.
* Identifier les sites nécessitant une attention particulière.

## 3. Outils et technologies

* **SQL :** extraction, filtrage, regroupement et agrégation des données.
* **SQLite :** création et gestion de la base de données.
* **Python :** connexion à la base de données et exploitation des résultats.
* **Jupyter Notebook :** exécution et documentation des analyses.
* **Pandas :** manipulation et exportation des données.

## 4. Structure des données

Le jeu de données comprend 1 200 enregistrements et 16 variables relatives notamment :

* Aux dates et lieux des inspections ;
* Aux types d'activités ;
* Aux statuts de conformité ;
* Aux niveaux de gravité ;
* Aux actions correctives ;
* Aux coûts associés ;
* Aux indicateurs de gestion environnementale.

## 5. Analyses réalisées

Les analyses SQL portent sur les thématiques suivantes :

1. Répartition des inspections selon le statut de conformité.
2. Répartition des inspections par région.
3. Calcul du taux de conformité par région.
4. Identification des activités présentant le plus de non-conformités.
5. Analyse des coûts des actions correctives.
6. Répartition des non-conformités selon leur niveau de gravité.
7. Évolution mensuelle des inspections.
8. Identification des sites présentant le plus de non-conformités.
9. Élaboration d'une synthèse générale des indicateurs environnementaux.

## 6. Livrables

| Fichier                                   | Description                                            |
| ----------------------------------------- | ------------------------------------------------------ |
| Projet_SQL_Analyse_Environnementale.ipynb | Notebook contenant les requêtes SQL et leurs résultats |
| Projet_SQL_Analyses_Environnementales.sql | Script des analyses SQL                                |
| donnees_suivi_environnemental.csv         | Jeu de données utilisé                                 |
| Synthese_Analyse_SQL.csv                  | Tableau de synthèse des indicateurs                    |

## 7. Compétences démontrées

* Création et exploitation d'une base de données SQLite.
* Écriture de requêtes SQL.
* Utilisation de SELECT, WHERE, GROUP BY et ORDER BY.
* Utilisation des fonctions COUNT, SUM, AVG et ROUND.
* Utilisation de CASE WHEN.
* Calcul d'indicateurs de performance environnementale.
* Analyse et interprétation de données.
* Exportation de résultats pour leur exploitation dans Excel et Power BI.

## 8. Conclusion

Ce projet illustre l'application du SQL à l'analyse des données environnementales. Il permet de démontrer comment les données issues d'inspections peuvent être structurées et exploitées pour produire des indicateurs utiles au suivi de la conformité environnementale et à l'aide à la décision.

**Projet réalisé dans le cadre du développement de compétences en analyse de données environnementales.**

