-- EXEMPLOS DE CONSULTAS EM SQL (BASEADOS SOMENTE NO SCRIPT FORNECIDO, COMPATÍVEIS COM MySQL)
-- Base: editora_db

-- CONSULTAS BÁSICAS:
-- Seleciona todos os autores ordenados por nome
SELECT nome FROM Autor ORDER BY nome;

-- Seleciona livros com título e preço, ordenando pelo preço (crescente)
SELECT titulo, preco FROM Livro ORDER BY preco;

-- Seleciona livros com título e preço, ordenando pelo preço (decrescente)
SELECT titulo, preco FROM Livro ORDER BY preco DESC;

-- Consulta usando LIKE (autores que começam com 'M')
SELECT nome FROM Autor WHERE nome LIKE 'M%' ORDER BY nome;

-- Consulta usando NOT LIKE (autores que não começam com 'L')
SELECT nome FROM Autor WHERE nome NOT LIKE 'L%' ORDER BY nome;


-- CONSULTAS COM JOIN (INNER JOIN):
-- Título dos livros com nome da editora
SELECT titulo, Editora.nome FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora;

-- Título dos livros com descrição do gênero
SELECT titulo, Genero.descricao FROM Livro
INNER JOIN Genero ON Livro.idGenero = Genero.idGenero;

-- Título dos livros com nome da editora e gênero
SELECT Livro.titulo, Editora.nome, Genero.descricao
FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora
INNER JOIN Genero ON Livro.idGenero = Genero.idGenero;

-- Livros e autores relacionados
SELECT Livro.titulo, Autor.nome
FROM Livro_Autor
INNER JOIN Autor ON Livro_Autor.idAutor = Autor.idAutor
INNER JOIN Livro ON Livro_Autor.idLivro = Livro.idLivro
ORDER BY Livro.titulo;


-- GROUP BY e FUNÇÕES DE AGREGAÇÃO:
-- Quantidade de autores
SELECT COUNT(*) AS total_autores FROM Autor;

-- Quantidade de livros por editora
SELECT idEditora, COUNT(*) AS total_livros
FROM Livro
GROUP BY idEditora;

-- Preço médio dos livros por editora
SELECT idEditora, AVG(preco) AS preco_medio
FROM Livro
GROUP BY idEditora;

-- Soma de livros por gênero, com filtro no HAVING (exibindo só gêneros com mais de 1 livro)
SELECT idGenero, COUNT(*) AS qtd_livros
FROM Livro
GROUP BY idGenero
HAVING COUNT(*) > 1;


-- LEFT JOIN:
-- Todos os autores e seus livros (mesmo que não tenham livros)
SELECT Autor.nome, Livro.titulo
FROM Autor
LEFT JOIN Livro_Autor ON Autor.idAutor = Livro_Autor.idAutor
LEFT JOIN Livro ON Livro_Autor.idLivro = Livro.idLivro;

-- RIGHT JOIN:
-- Todos os livros e seus autores (mesmo que não tenham autores)
SELECT Livro.titulo, Autor.nome
FROM Livro
RIGHT JOIN Livro_Autor ON Livro.idLivro = Livro_Autor.idLivro
RIGHT JOIN Autor ON Livro_Autor.idAutor = Autor.idAutor;


-- SUBQUERIES:
-- Livros com preço acima da média geral
SELECT titulo, preco
FROM Livro
WHERE preco > (SELECT AVG(preco) FROM Livro);

-- Autores que escreveram mais de 1 livro
SELECT idAutor, COUNT(*) AS total_livros
FROM Livro_Autor
GROUP BY idAutor
HAVING total_livros > 1;

-- Título do livro mais caro
SELECT titulo FROM Livro
WHERE preco = (SELECT MAX(preco) FROM Livro);


-- DISTINCT:
-- Autores que já escreveram livros
SELECT DISTINCT Autor.nome
FROM Autor
INNER JOIN Livro_Autor ON Autor.idAutor = Livro_Autor.idAutor;

-- Editores distintos de livros do gênero 'Infantil'
SELECT DISTINCT Livro.idEditora, Editora.nome
FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora
INNER JOIN Genero ON Livro.idGenero = Genero.idGenero
WHERE Genero.descricao = 'Infantil';


-- ORDER BY COM MAIS DE UMA COLUNA:
-- Ordenar por nome da editora e depois por título do livro
SELECT titulo, Editora.nome
FROM Livro
INNER JOIN Editora ON Livro.idEditora = Editora.idEditora
ORDER BY Editora.nome, titulo;


-- TOP N / LIMIT:
-- Top 1 livro com mais semanas consecutivas na 1ª posição
SELECT titulo, semanasConsecutivas
FROM Livro
INNER JOIN Ranking_Semanal ON Livro.idLivro = Ranking_Semanal.idLivro
WHERE posicao = 1
ORDER BY semanasConsecutivas DESC
LIMIT 1;


-- JOIN COM CONDIÇÃO DE DATA:
-- Autores e livros que estavam no ranking de 24 a 30 de agosto de 2003
SELECT Autor.nome, Livro.titulo, Ranking.dataInicial, Ranking.dataFinal
FROM Livro_Autor
INNER JOIN Livro ON Livro.idLivro = Livro_Autor.idLivro
INNER JOIN Ranking_Semanal ON Ranking_Semanal.idLivro = Livro.idLivro
INNER JOIN Ranking ON Ranking.idRanking = Ranking_Semanal.idRanking
INNER JOIN Autor ON Autor.idAutor = Livro_Autor.idAutor
WHERE Ranking.dataInicial = '2003-08-24' AND Ranking.dataFinal = '2003-08-30';


-- FUNÇÕES AGREGADAS SIMPLES:
-- Média dos preços dos livros da Editora 2
SELECT AVG(preco) AS media_preco
FROM Livro
WHERE idEditora = 2;

-- Livros e suas posições semanais anteriores
SELECT titulo, posicao, posicaoSemanaAnterior
FROM Livro
INNER JOIN Ranking_Semanal ON Livro.idLivro = Ranking_Semanal.idLivro;


-- FILTROS COM OR E AND:
-- Livros das editoras 1 ou 5 com gênero 'Infantil'
SELECT titulo
FROM Livro
WHERE (idEditora = 1 OR idEditora = 5)
AND idGenero = (SELECT idGenero FROM Genero WHERE descricao = 'Infantil');


-- COUNT COM DISTINCT:
-- Quantidade de gêneros diferentes utilizados
SELECT COUNT(DISTINCT idGenero) AS total_generos
FROM Livro;


-- EXERCÍCIO EXTRA - Encontrar o número de livros por autor (com nome)
SELECT Autor.nome, COUNT(Livro_Autor.idLivro) AS total_livros
FROM Autor
LEFT JOIN Livro_Autor ON Autor.idAutor = Livro_Autor.idAutor
GROUP BY Autor.idAutor, Autor.nome
ORDER BY total_livros DESC;
