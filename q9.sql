SELECT l.titulo, a.nome AS autor, e.nome AS editora
FROM livros l
INNER JOIN autores a ON l.autor_id = a.autor_id
INNER JOIN editoras e ON l.editora_id = e.editora_id;
