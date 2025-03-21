DELIMITER $$

CREATE PROCEDURE reset_database()
BEGIN
    -- Déclaration des variables et curseurs
    DECLARE done INT DEFAULT 0;
    DECLARE tablename VARCHAR(255);
    DECLARE cur CURSOR FOR
        SELECT table_name FROM information_schema.tables WHERE table_schema = DATABASE();

    -- Désactiver les contraintes de clé étrangère
    SET FOREIGN_KEY_CHECKS = 0;

    -- Supprimer toutes les données de chaque table
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO tablename;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET @query = CONCAT('TRUNCATE TABLE ', tablename);
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE cur;

    -- Réinitialiser les auto-incréments
    SET @reset_sequences = (
        SELECT GROUP_CONCAT(CONCAT('ALTER TABLE ', table_name, ' AUTO_INCREMENT = 1') SEPARATOR '; ')
        FROM information_schema.tables
        WHERE table_schema = DATABASE() AND table_type = 'BASE TABLE'
    );
    
    -- Exécuter les commandes générées
    IF @reset_sequences IS NOT NULL THEN
        SET @final_query = @reset_sequences;
        PREPARE stmt FROM @final_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;

    -- Réactiver les contraintes de clé étrangère
    SET FOREIGN_KEY_CHECKS = 1;
END $$

DELIMITER ;
