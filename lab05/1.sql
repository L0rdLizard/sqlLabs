CREATE PROCEDURE InsertAuthorWithCountryCheck(IN p_name TEXT, IN p_country VARCHAR(64))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Author WHERE name = p_name AND country = p_country) THEN
        INSERT INTO Author (name, country) VALUES (p_name, p_country);
    END IF;
END;

-- вставку с пополнением справочников
-- вставляет нового автора только в том случае, если автора с таким именем и страной еще нет в таблице Author