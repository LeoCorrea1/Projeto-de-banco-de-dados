-- CONSULTAS BÁSICAS:
SELECT nome FROM Autor ORDER BY nome;

SELECT titulo, preco FROM Livro ORDER BY preco;

SELECT titulo, preco FROM Livro ORDER BY preco DESC;

SELECT nome FROM Autor WHERE nome LIKE 'M%' ORDER BY nome;

SELECT nome FROM Autor WHERE nome NOT LIKE 'L%' ORDER BY nome;


-- CONSULTAS COM INNER JOIN:
SELECT titulo, Editora.nome
FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora;

SELECT titulo, Genero.descricao
FROM Livro
INNER JOIN Genero ON Livro.idGenero = Genero.idGenero;

SELECT Livro.titulo, Editora.nome, Genero.descricao
FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora
INNER JOIN Genero ON Livro.idGenero = Genero.idGenero;

SELECT Livro.titulo, Autor.nome
FROM Livro_Autor
INNER JOIN Autor ON Livro_Autor.idAutor = Autor.idAutor
INNER JOIN Livro ON Livro_Autor.idLivro = Livro.idLivro
ORDER BY Livro.titulo;


-- GROUP BY e FUNÇÕES DE AGREGAÇÃO:
SELECT COUNT(*) AS total_autores FROM Autor;

SELECT idEditora, COUNT(*) AS total_livros
FROM Livro
GROUP BY idEditora;

SELECT idEditora, AVG(preco) AS preco_medio
FROM Livro
GROUP BY idEditora;

SELECT idGenero, COUNT(*) AS qtd_livros
FROM Livro
GROUP BY idGenero
HAVING COUNT(*) > 1;


-- LEFT JOIN:
SELECT Autor.nome, Livro.titulo
FROM Autor
LEFT JOIN Livro_Autor ON Autor.idAutor = Livro_Autor.idAutor
LEFT JOIN Livro ON Livro_Autor.idLivro = Livro.idLivro;


-- RIGHT JOIN:
SELECT Livro.titulo, Autor.nome
FROM Livro
RIGHT JOIN Livro_Autor ON Livro.idLivro = Livro_Autor.idLivro
RIGHT JOIN Autor ON Livro_Autor.idAutor = Autor.idAutor;


-- SUBQUERIES:
SELECT titulo, preco
FROM Livro
WHERE preco > (SELECT AVG(preco) FROM Livro);

SELECT idAutor, COUNT(*) AS total_livros
FROM Livro_Autor
GROUP BY idAutor
HAVING COUNT(*) > 1;

SELECT titulo FROM Livro
WHERE preco = (SELECT MAX(preco) FROM Livro);


-- DISTINCT:
SELECT DISTINCT Autor.nome
FROM Autor
INNER JOIN Livro_Autor ON Autor.idAutor = Livro_Autor.idAutor;

SELECT DISTINCT Livro.idEditora, Editora.nome
FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora
INNER JOIN Genero ON Livro.idGenero = Genero.idGenero
WHERE Genero.descricao = 'Infantil';


-- ORDER BY COM MAIS DE UMA COLUNA:
SELECT titulo, Editora.nome
FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora
ORDER BY Editora.nome, titulo;


-- TOP N / LIMIT (adaptado para SQL Server):
SELECT TOP 1 titulo, semanasConsecutivas
FROM Livro
INNER JOIN Ranking_Semanal ON Livro.idLivro = Ranking_Semanal.idLivro
WHERE posicao = 1
ORDER BY semanasConsecutivas DESC;


-- JOIN COM CONDIÇÃO DE DATA:
SELECT Autor.nome, Livro.titulo, Ranking.dataInicial, Ranking.dataFinal
FROM Livro_Autor
INNER JOIN Livro ON Livro.idLivro = Livro_Autor.idLivro
INNER JOIN Ranking_Semanal ON Ranking_Semanal.idLivro = Livro.idLivro
INNER JOIN Ranking ON Ranking.idRanking = Ranking_Semanal.idRanking
INNER JOIN Autor ON Autor.idAutor = Livro_Autor.idAutor
WHERE Ranking.dataInicial = '2003-08-24' AND Ranking.dataFinal = '2003-08-30';


-- FUNÇÕES AGREGADAS SIMPLES:
SELECT AVG(preco) AS media_preco
FROM Livro
WHERE idEditora = 2;

SELECT titulo, posicao, posicaoSemanaAnterior
FROM Livro
INNER JOIN Ranking_Semanal ON Livro.idLivro = Ranking_Semanal.idLivro;


-- FILTROS COM OR E AND:
SELECT titulo
FROM Livro
WHERE (idEditora = 1 OR idEditora = 5)
AND idGenero = (SELECT idGenero FROM Genero WHERE descricao = 'Infantil');


-- COUNT COM DISTINCT:
SELECT COUNT(DISTINCT idGenero) AS total_generos
FROM Livro;


-- EXERCÍCIO EXTRA - Número de livros por autor (com nome)
SELECT Autor.nome, COUNT(Livro_Autor.idLivro) AS total_livros
FROM Autor
LEFT JOIN Livro_Autor ON Autor.idAutor = Livro_Autor.idAutor
GROUP BY Autor.idAutor, Autor.nome
ORDER BY total_livros DESC;
