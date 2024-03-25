CREATE FUNCTION GetTotalBooks(
) RETURNS INT
    reads sql data
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Book;
    RETURN total;
END;

-- Вычисление и возврат значения агрегатной функции
-- возвращает общее количество книг в таблице Book