SELECT e.nome AS editora, COUNT(l.livro_id) AS total_livros
FROM editoras e
JOIN livros l ON e.editora_id = l.editora_id
GROUP BY e.nome
HAVING COUNT(l.livro_id) > 2;
