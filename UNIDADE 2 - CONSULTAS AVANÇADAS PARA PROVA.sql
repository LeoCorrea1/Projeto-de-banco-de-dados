-- ############################################################
-- 5. CONSULTAS AVANÇADAS PARA PROVA: EXEMPLOS VARIADOS
-- ############################################################

-- 5.1 LEFT JOIN: listar todos os livros e, se existirem, seus autores
SELECT L.titulo, A.nome AS autor
FROM Livro L
LEFT JOIN Livro_Autor LA ON L.idLivro = LA.idLivro
LEFT JOIN Autor A ON LA.idAutor = A.idAutor
ORDER BY L.titulo;

-- 5.2 RIGHT JOIN (MySQL ou PostgreSQL) - listar todos os autores e seus livros, mesmo que não tenham livros
-- No SQL Server use LEFT JOIN invertido, pois RIGHT JOIN é raro
SELECT A.nome AS autor, L.titulo
FROM Autor A
LEFT JOIN Livro_Autor LA ON A.idAutor = LA.idAutor
LEFT JOIN Livro L ON LA.idLivro = L.idLivro
ORDER BY A.nome;

-- 5.3 FULL OUTER JOIN (livros com autores e também livros/autores sem par)
SELECT A.nome AS autor, L.titulo
FROM Autor A
FULL OUTER JOIN Livro_Autor LA ON A.idAutor = LA.idAutor
FULL OUTER JOIN Livro L ON LA.idLivro = L.idLivro;

-- 5.4 CROSS JOIN: combinações possíveis entre autores e editoras (produto cartesiano)
SELECT A.nome AS autor, E.nome AS editora
FROM Autor A
CROSS JOIN Editora E;

-- 5.5 GROUP BY simples: quantidade de livros por editora
SELECT E.nome AS editora, COUNT(*) AS total_livros
FROM Livro L
JOIN Editora E ON L.idEditora = E.idEditora
GROUP BY E.nome;

-- 5.6 GROUP BY com HAVING: gêneros com mais de 2 livros
SELECT G.descricao AS genero, COUNT(*) AS total
FROM Livro L
JOIN Genero G ON L.idGenero = G.idGenero
GROUP BY G.descricao
HAVING COUNT(*) > 2;

-- 5.7 GROUP BY múltiplos campos: número de livros por editora e gênero
SELECT E.nome AS editora, G.descricao AS genero, COUNT(*) AS total
FROM Livro L
JOIN Editora E ON L.idEditora = E.idEditora
JOIN Genero G ON L.idGenero = G.idGenero
GROUP BY E.nome, G.descricao
ORDER BY E.nome, G.descricao;

-- 5.8 Subquery: livros com preço acima da média do seu próprio gênero
SELECT titulo, preco
FROM Livro L
WHERE preco > (
  SELECT AVG(preco) 
  FROM Livro L2 
  WHERE L2.idGenero = L.idGenero
);

-- 5.9 Subquery correlacionada: autor e seu livro mais barato
SELECT DISTINCT A.nome, L.titulo, L.preco
FROM Autor A
JOIN Livro_Autor LA ON A.idAutor = LA.idAutor
JOIN Livro L ON LA.idLivro = L.idLivro
WHERE L.preco = (
  SELECT MIN(L2.preco)
  FROM Livro_Autor LA2
  JOIN Livro L2 ON LA2.idLivro = L2.idLivro
  WHERE LA2.idAutor = A.idAutor
);

-- 5.10 CASE WHEN: classificação dos livros por preço
SELECT titulo, preco,
  CASE 
    WHEN preco < 20 THEN 'Barato'
    WHEN preco BETWEEN 20 AND 70 THEN 'Médio'
    ELSE 'Caro'
  END AS classificacao
FROM Livro;

-- 5.11 CTE com agregação: média de preço por gênero e os livros acima da média
WITH MediaGenero AS (
  SELECT idGenero, AVG(preco) AS media_preco
  FROM Livro
  GROUP BY idGenero
)
SELECT L.titulo, G.descricao AS genero, L.preco
FROM Livro L
JOIN Genero G ON L.idGenero = G.idGenero
JOIN MediaGenero M ON L.idGenero = M.idGenero
WHERE L.preco > M.media_preco;

-- 5.12 Janela analítica: rankear livros por preço dentro da editora
SELECT 
  L.titulo, E.nome AS editora, L.preco,
  RANK() OVER (PARTITION BY E.idEditora ORDER BY L.preco DESC) AS rank_preco
FROM Livro L
JOIN Editora E ON L.idEditora = E.idEditora;

-- 5.13 UNION: livros da editora 1 OU do gênero 5
SELECT titulo FROM Livro WHERE idEditora = 1
UNION
SELECT titulo FROM Livro WHERE idGenero = 5;

-- 5.14 EXISTS: livros que têm pelo menos um autor
SELECT titulo
FROM Livro L
WHERE EXISTS (
  SELECT 1 FROM Livro_Autor LA WHERE LA.idLivro = L.idLivro
);

-- 5.15 NOT EXISTS: livros sem autor cadastrado
SELECT titulo
FROM Livro L
WHERE NOT EXISTS (
  SELECT 1 FROM Livro_Autor LA WHERE LA.idLivro = L.idLivro
);

-- 5.16 IN com subquery: autores que escreveram livros mais caros que R$ 100
SELECT nome FROM Autor
WHERE idAutor IN (
  SELECT DISTINCT idAutor
  FROM Livro_Autor LA
  JOIN Livro L ON LA.idLivro = L.idLivro
  WHERE L.preco > 100
);

-- 5.17 TOP N: os 5 livros mais caros
SELECT TOP 5 titulo, preco FROM Livro ORDER BY preco DESC;

-- 5.18 OFFSET-FETCH (paginação): do 6º ao 10º livro mais barato
SELECT titulo, preco
FROM Livro
ORDER BY preco
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- 5.19 CONCAT: nome completo do autor
SELECT idAutor, CONCAT('Autor: ', nome) AS nome_formatado
FROM Autor;

-- 5.20 Funções de data: rankings em mês específico (agosto de 2003)
SELECT *
FROM Ranking
WHERE MONTH(dataInicial) = 8 AND YEAR(dataInicial) = 2003;
