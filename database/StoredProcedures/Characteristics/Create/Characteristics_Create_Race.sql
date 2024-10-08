DROP PROCEDURE IF EXISTS Characteristics_Create_Race;

DELIMITER ;;
CREATE PROCEDURE Characteristics_Create_Race(
    IN characteristicName VARCHAR(45),
    IN parentCharacteristicId INT UNSIGNED,
    IN numAbilities TINYINT UNSIGNED,
    IN numLanguages TINYINT UNSIGNED,
    IN numSavingThrows TINYINT UNSIGNED,
    IN numSkills TINYINT UNSIGNED,
    IN numTools TINYINT UNSIGNED,
    IN spellcastingAbilityId INT UNSIGNED,

    IN raceDescription VARCHAR(1000),
    IN sizeId TINYINT UNSIGNED,
    IN isHover BIT,
    IN startingGold SMALLINT UNSIGNED,

    IN userId MEDIUMINT UNSIGNED
)
BEGIN
    DECLARE characteristicId INT UNSIGNED;

#     DECLARE EXIT HANDLER FOR SQLEXCEPTION
#     BEGIN
#         ROLLBACK;
#         SELECT -1 AS characteristic_id;
#     END;

#     START TRANSACTION;

    INSERT INTO characteristics (name, characteristic_type_id, parent_characteristic_id, num_abilities, num_languages, num_saving_throws, num_skills, num_tools, spellcasting_ability_id, user_id)
    VALUES (characteristicName, 2, parentCharacteristicId, numAbilities, numLanguages, numSavingThrows, numSkills, numTools, spellcastingAbilityId, userId);

    SET characteristicId = (SELECT LAST_INSERT_ID());
    
    INSERT INTO races (characteristic_id, description, size_id, hover, starting_gold)
    VALUES (characteristicId, raceDescription, sizeId, isHover, startingGold);

#     COMMIT;

    SELECT characteristicId AS characteristic_id;
END;;

DELIMITER ;

# CALL Characteristics_Create_Race('test', 'test_description', 1, 'tst', 1);
