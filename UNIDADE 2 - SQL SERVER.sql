-- script base de dados da editora_db

--criando base de dados
create database editora_db;

--mostrando todas as bases de dados
SELECT name
FROM sys.databases;  

--usando a base de dados editora_db
use editora_db;

--criando a tabela Autor
CREATE TABLE Autor (
	idAutor INT NOT NULL,
	nome VARCHAR(45) NOT NULL,
	
	PRIMARY KEY (idAutor)
);

--criando a tabela Editora
CREATE TABLE Editora (
  idEditora INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (idEditora)
);

--criando a tabela Genero
CREATE TABLE Genero (
  idGenero INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (idGenero)
);

--criando a tabela Livro
CREATE TABLE Livro (
  idLivro INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  preco DECIMAL(3) NULL,
  idEditora INT NOT NULL,
  idGenero INT NOT NULL,

  PRIMARY KEY (idLivro),

  INDEX fk_Livro_Editora_idx (idEditora ASC),
  INDEX fk_Livro_Genero_idx (idGenero ASC),

  CONSTRAINT fk_Livro_Editora
    FOREIGN KEY (idEditora)
    REFERENCES Editora (idEditora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_Livro_Genero
    FOREIGN KEY (idGenero)
    REFERENCES Genero (idGenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

--criando a tabela Livro_Autor
CREATE TABLE Livro_Autor (
  idAutor INT NOT NULL,
  idLivro INT NOT NULL,
  
  PRIMARY KEY (idAutor, idLivro),
  INDEX fk_Autor_has_Livro_Livro_idx (idLivro ASC),
  INDEX fk_Autor_has_Livro_Autor_idx (idAutor ASC),
  
  CONSTRAINT fk_Autor_has_Livro_Autor
    FOREIGN KEY (idAutor)
    REFERENCES Autor (idAutor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_Autor_has_Livro_Livro
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

--criando a tabela Ranking
CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  dataInicial DATE NOT NULL,
  dataFinal DATE NOT NULL,
  
  PRIMARY KEY (idRanking)
);

--criando a tabela Ranking_Semanal
CREATE TABLE Ranking_Semanal (
  idRanking INT NOT NULL,
  idLivro INT NOT NULL,
  posicao DECIMAL(2) NULL,
  quantidadeSemanas DECIMAL(2) NULL,
  semanasConsecutivas DECIMAL(2) NULL,
  posicaoSemanaAnterior DECIMAL(2) NULL,
  
  PRIMARY KEY (idRanking, idLivro),
  INDEX fk_Ranking_has_Livro_Livro_idx (idLivro ASC),
  INDEX fk_Ranking_has_Livro_Ranking_idx (idRanking ASC),
  
  CONSTRAINT fk_Ranking_has_Livro_Ranking
    FOREIGN KEY (idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
  CONSTRAINT fk_Ranking_has_Livro_Livro
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

--inserindo dados na tabela Genero
insert into Genero values (1, 'Infantil');
insert into Genero values (2, 'Ficção');
insert into Genero values (3, 'Romance');
insert into Genero values (4, 'Auto-ajuda');
insert into Genero values (5, 'Negócios');
insert into Genero values (6, 'História');

select * from Genero;

--inserindo dados na tabela Editora
insert into Editora values (1, 'Ática');
insert into Editora values (2, 'Makron Books');
insert into Editora values (3, 'Rocco');
insert into Editora values (4, 'Scipione');
insert into Editora values (5, 'Sagra Luzato');

select * from Editora;


--inserindo dados na tabela Autor
insert into Autor values (1, 'Pedro');
insert into Autor values (2, 'Marcos');
insert into Autor values (3, 'Felipe');
insert into Autor values (4, 'Ana');
insert into Autor values (5, 'Maria');
insert into Autor values (6, 'Francisco');
insert into Autor values (7, 'Lucas');

select * from Autor;


--inserindo dados na tabela Livro
insert into Livro values (1, 'A', 25.30, 1, 1);
insert into Livro values (2, 'B', 32.45, 1, 4);
insert into Livro values (3, 'C', 122.00, 4, 2);
insert into Livro values (4, 'D', 100.99, 4, 3);
insert into Livro values (5, 'E', 16.16, 1, 5);
insert into Livro values (6, 'F', 4.56, 3, 1);
insert into Livro values (7, 'G', 85.20, 2, 5);
insert into Livro values (8, 'H', 89.90, 5, 5);
insert into Livro values (9, 'I', 63.36, 2, 2);
insert into Livro values (10, 'J', 41.40, 3, 3);
insert into Livro values (11, 'K', 200.30, 4, 6);
insert into Livro values (12, 'L', 99.99, 2, 4);

select * from Livro;


--inserindo dados na tabela Livro_Autor
insert into Livro_Autor values (1, 1);
insert into Livro_Autor values (6, 1);
insert into Livro_Autor values (6, 2);
insert into Livro_Autor values (5, 3);
insert into Livro_Autor values (1, 3);
insert into Livro_Autor values (4, 3);
insert into Livro_Autor values (4, 4);
insert into Livro_Autor values (1, 5);
insert into Livro_Autor values (5, 6);
insert into Livro_Autor values (3, 6);
insert into Livro_Autor values (3, 7);
insert into Livro_Autor values (2, 8);
insert into Livro_Autor values (6, 9);
insert into Livro_Autor values (6, 10);
insert into Livro_Autor values (1, 10);
insert into Livro_Autor values (2, 11);
insert into Livro_Autor values (2, 12);

select * from Livro_Autor;


--inserindo dados na tabela Ranking
insert into Ranking values (1, '20030817', '20030823');
insert into Ranking values (2, '20030824', '20030830');
insert into Ranking values (3, '20030831', '20030906');
insert into Ranking values (4, '20030907', '20030913');

select * from Ranking;


--inserindo dados na tabela Ranking_Semanal
insert into Ranking_Semanal values (1,1,4,6,3,3);
insert into Ranking_Semanal values (2,1,5,7,3,4);
insert into Ranking_Semanal values (3,2,1,1,1,null);
insert into Ranking_Semanal values (4,2,1,2,2,1);
insert into Ranking_Semanal values (1,3,2,2,2,null);
insert into Ranking_Semanal values (2,3,2,3,3,2);
insert into Ranking_Semanal values (3,3,8,4,4,2);
insert into Ranking_Semanal values (4,3,10,5,5,8);
insert into Ranking_Semanal values (1,4,1,50,43,1);
insert into Ranking_Semanal values (2,5,1,1,1,null);
insert into Ranking_Semanal values (3,5,2,2,2,1);
insert into Ranking_Semanal values (4,5,9,3,3,2);
insert into Ranking_Semanal values (4,6,8,1,1,null);
insert into Ranking_Semanal values (3,7,5,1,1,null);
insert into Ranking_Semanal values (4,7,5,2,2,5);
insert into Ranking_Semanal values (1,8, 3,13,12,6);
insert into Ranking_Semanal values (2,8, 3, 14,13,3);
insert into Ranking_Semanal values (3,8,3,15,14,3);
insert into Ranking_Semanal values (4,8,4,16,15,3);
insert into Ranking_Semanal values (2,9,7,1,1,null);
insert into Ranking_Semanal values (3,9,7,2,2,7);
insert into Ranking_Semanal values (1,10,8,4,4,10);
insert into Ranking_Semanal values (2,10,9,5,5,8);
insert into Ranking_Semanal values (3,11,9,1,1,null);
insert into Ranking_Semanal values (1,12,6,3,2,6);

select * from Ranking_Semanal;


-- Conta quantas tuplas/linhas há na tabela Ranking_Semanal
SELECT count(*)
from Ranking_Semanal;


select nome 
from Autor;


select nome, idAutor
from Autor;


select distinct Autor.nome, Livro_Autor.idAutor
from Autor
inner join Livro_Autor on Autor.idAutor = Livro_Autor.idAutor;


select distinct(Autor.nome)
from Autor
inner join Livro_Autor on Autor.idAutor = Livro_Autor.idAutor;


select nome 
from Autor
order by nome;


select distinct titulo, Editora.nome
from Livro
inner join Editora on Livro.idEditora = Editora.idEditora 
Where Livro.idEditora = 3 or Livro.idEditora = 4 order by Editora.nome;


select nome 
from Autor 
where nome like 'M%'
order by nome;


select nome 
from Autor 
where nome like 'L%'
order by nome;


select nome 
from Autor 
where nome NOT like 'L%'
order by nome;


select nome 
from Autor 
where nome NOT like 'M%'
order by nome;


select distinct titulo, Livro.idEditora
from Livro
inner join Editora on Livro.idEditora = Editora.idEditora
WHERE Livro.idEditora = 1  or Livro.idEditora = 5;


select Livro.titulo, Genero.descricao, Livro.idEditora, Editora.nome
from Livro
inner join Editora on Livro.idEditora = Editora.idEditora
inner join Genero on Livro.idGenero = Genero.idGenero
where  Genero.descricao = 'Infantil' and
       Livro.idGenero = Genero.idGenero and
       (Livro.idEditora = 1 or Livro.idEditora = 5) and
       Livro.idEditora = Editora.idEditora;


select idLivro ,titulo  , preco
from Livro ;


select nome 
from Autor
order by nome desc;


select titulo , preco
from Livro 
order by preco desc;


select titulo , preco
from Livro 
order by preco;


select titulo , preco , Genero.descricao
from Livro 
INNER JOIN Genero on Livro.idGenero = Genero.idGenero
where Genero.descricao = 'Auto-ajuda'
order by preco;


select count(Autor.nome)
from Autor;


Select Livro.preco , Editora.idEditora
from Livro
INNER JOIN Editora on Livro.idEditora = Editora.idEditora
where Editora.idEditora = 1
order by preco;


Select avg(Livro.preco) 
from Livro
INNER JOIN Editora on Livro.idEditora = Editora.idEditora
where Editora.idEditora = 2	


select Livro.titulo , Editora.nome as 'nome editora' , Genero.descricao as 'Genero'
from Livro 
INNER JOIN Editora on Livro.idEditora = Editora.idEditora 
INNER JOIN Genero on Livro.idGenero = Genero.idGenero;


select Livro.titulo , Autor.nome
from Livro_Autor 
INNER JOIN Autor on Livro_Autor.idAutor = Autor.idAutor
INNER JOIN Livro on Livro_Autor.idLivro = Livro.idLivro
order by titulo;


select TOP 1 Livro.titulo , Ranking_Semanal.semanasConsecutivas
from Livro
INNER JOIN Ranking_Semanal on Livro.idLivro = Ranking_Semanal.idLivro
where Ranking_Semanal.posicao = 1 
ORDER BY Ranking_Semanal.semanasConsecutivas DESC;


select Autor.nome , Livro.titulo , Ranking.dataInicial , Ranking.dataFinal
From Livro_Autor 
INNER JOIN Livro on Livro.idLivro = Livro_Autor.idLivro
INNER JOIN Ranking_Semanal on Ranking_Semanal.idLivro = Livro.idLivro
inner join Ranking on Ranking_Semanal.idRanking = Ranking.idRanking
inner join Autor on Autor.idAutor = Livro_Autor.idAutor
WHERE Ranking.datainicial = '24/08/2003' and Ranking.dataFinal = '30/08/2003';








