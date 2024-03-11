update Author
set name = ('Lev Tolstoy')
where country = 'Russia'
  and id in (select author_id from BookAuthor where book_id = (select id from Book where book_name = 'Modern Journey'));