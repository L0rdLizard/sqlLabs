CREATE PROCEDURE DeleteAuthorWithBookCheck(IN p_id INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM BookAuthor WHERE author_id = p_id) THEN
        DELETE FROM Author WHERE id = p_id;
    END IF;
END

-- удаление с пополнением справочников
-- удаляет автора только в том случае, если у автора нет связанных книг в таблице BookAuthor