-- Questão 1: Selecionar todos os títulos dos livros e seus respectivos anos de publicação
SELECT titulo, ano_publicacao FROM livros;

-- Questão 2: Quantos livros foram publicados?
SELECT COUNT(*) AS total_livros FROM livros;

-- Questão 3: Calcule a média do ano de publicação dos livros para cada editora
SELECT e.nome AS editora, AVG(l.ano_publicacao) AS media_ano
FROM editoras e
JOIN livros l ON e.editora_id = l.editora_id
GROUP BY e.nome;

-- Questão 4: Qual é o livro mais antigo e o mais recente
SELECT titulo, ano_publicacao FROM livros
ORDER BY ano_publicacao ASC LIMIT 1; -- mais antigo
SELECT titulo, ano_publicacao FROM livros
ORDER BY ano_publicacao DESC LIMIT 1; -- mais recente

-- Questão 5: Liste todos os livros publicados após o ano 2000
SELECT titulo, ano_publicacao FROM livros
WHERE ano_publicacao > 2000;

-- Questão 6: Autores em ordem alfabética
SELECT nome, nacionalidade FROM autores
ORDER BY nome ASC;

-- Questão 7: Editoras com mais de 2 livros
SELECT e.nome AS editora, COUNT(l.livro_id) AS total_livros
FROM editoras e
JOIN livros l ON e.editora_id = l.editora_id
GROUP BY e.nome
HAVING COUNT(l.livro_id) > 2;

-- Questão 8: Status dos livros
SELECT l.titulo,
       CASE 
           WHEN e.data_devolucao IS NULL THEN 'Emprestado'
           ELSE 'Disponível'
       END AS Status
FROM livros l
LEFT JOIN emprestimos e ON l.livro_id = e.livro_id;

-- Questão 9: Livros com nome do autor e da editora
SELECT l.titulo, a.nome AS autor, e.nome AS editora
FROM livros l
INNER JOIN autores a ON l.autor_id = a.autor_id
INNER JOIN editoras e ON l.editora_id = e.editora_id;

-- Questão 10: Livros sem autor cadastrado
SELECT l.titulo
FROM livros l
LEFT JOIN autores a ON l.autor_id = a.autor_id
WHERE a.autor_id IS NULL;
