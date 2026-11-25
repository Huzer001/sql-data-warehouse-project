/*
===========================================
Creéation de la base de données et des schémas
===========================================
Objectif du script :
  Ce script crée une nouvelle base de données appelée 'DataWarehouse' après avoir vérifié si elle existe déjà.
  Si la base de données existe, elle est supprimée et recréée. En supplément, le script met en place 3 schémas
  dans la base de données : 'bronze', 'silver', and 'gold'.

ATTENTION : 
  Exécuter ce script va supprimer entièrement la base de données 'DataWarehouse' si elle existe.
  Toutes les données seront suprimées de manière permanente. Procédez avec prudence and assurez-vous
  d'avoir des backups propres avant d'éxecuter ce script.
*/

USE master;
GO

-- Ecraser et recréer la base de données 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Créer la base de données 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Créer les schémas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
