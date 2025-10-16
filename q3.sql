SELECT e.nome AS editora, AVG(l.ano_publicacao) AS media_ano
FROM livros l
JOIN editoras e ON l.editora_id = e.editora_id
GROUP BY e.nome;
