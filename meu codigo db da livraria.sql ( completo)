DROP DATABASE IF EXISTS livraria;

CREATE DATABASE livraria;

USE livraria;

CREATE TABLE Editor (
  idEditor INT ZEROFILL NOT NULL AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL UNIQUE,
  cnpj VARCHAR(20) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  país VARCHAR(100) NOT NULL,
  PRIMARY KEY (idEditor)
);

INSERT INTO Editor
VALUES (100, "EditorTeste1", "31231313", "Santa Maria", "Brasil");

CREATE TABLE Categoria (
  idCategoria INT ZEROFILL NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(150) NOT NULL,
  titulo VARCHAR(150) NOT NULL UNIQUE,
  PRIMARY KEY (idCategoria)
);

INSERT INTO Categoria
VALUES (1, "Ficção Científica", "Ficção do Futuro");

CREATE TABLE Cliente (
  idCliente INT ZEROFILL NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(20) NOT NULL,
  cpf VARCHAR(14),
  nome VARCHAR(150),
  cnpj VARCHAR(20),
  cep VARCHAR(50) NOT NULL,
  PRIMARY KEY (idCliente),
  INDEX idx_nome_asc (nome ASC)
);

INSERT INTO Cliente
VALUES (1, "Pessoa Fisica", "12345678901", "João Silva", NULL, "90000-000");

CREATE TABLE Autor (
  idAutor INT ZEROFILL NOT NULL AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL UNIQUE,
  nacionalidade VARCHAR(1000) NOT NULL,
  biografia VARCHAR(100) NOT NULL,
  PRIMARY KEY (idAutor)
);

INSERT INTO Autor
VALUES (1, "Isaac Asimov", "Americano", "Autor de ficção científica e popularizador da ciência.");

CREATE TABLE Livro (
  idLivro INT ZEROFILL NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  descritivo VARCHAR(1000) NOT NULL,
  ano DATE NOT NULL,
  preco DECIMAL NOT NULL,
  Editor_idEditor INT ZEROFILL NOT NULL,
  PRIMARY KEY (idLivro),
  FOREIGN KEY (Editor_idEditor) REFERENCES livraria.Editor (idEditor) ON DELETE RESTRICT
);

INSERT INTO Livro
VALUES (1, "Fundação", "blablbalbalba.", '2025-05-05', 59.90, 100);

CREATE TABLE Livro_Autor (
  Livro_idLivro INT ZEROFILL NOT NULL UNIQUE,
  Autor_idAutor INT ZEROFILL NOT NULL UNIQUE,
  idLivro_Autor INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (idLivro_Autor),
  FOREIGN KEY (Livro_idLivro) REFERENCES livraria.Livro (idLivro) ON DELETE RESTRICT,
  FOREIGN KEY (Autor_idAutor) REFERENCES livraria.Autor (idAutor) ON DELETE RESTRICT
);

INSERT INTO Livro_Autor
VALUES (1, 1, 1);

CREATE TABLE Livro_Categoria (
  Livro_idLivro INT ZEROFILL NOT NULL,
  Categoria_idCategoria INT ZEROFILL NOT NULL,
  PRIMARY KEY (Livro_idLivro, Categoria_idCategoria),
  FOREIGN KEY (Livro_idLivro) REFERENCES livraria.Livro (idLivro) ON DELETE RESTRICT,
  FOREIGN KEY (Categoria_idCategoria) REFERENCES livraria.Categoria (idCategoria) ON DELETE RESTRICT
);

INSERT INTO Livro_Categoria
VALUES (1, 1);

CREATE TABLE Venda (
  Cliente_idCliente INT ZEROFILL NOT NULL,
  Livro_idLivro INT ZEROFILL NOT NULL AUTO_INCREMENT,
  numeroNotaFiscal VARCHAR(150) NOT NULL,
  data DATETIME,
  valorTotal FLOAT NOT NULL,
  PRIMARY KEY (numeroNotaFiscal),
  FOREIGN KEY (Cliente_idCliente) REFERENCES livraria.Cliente (idCliente) ON DELETE RESTRICT,
  FOREIGN KEY (Livro_idLivro) REFERENCES livraria.Livro (idLivro) ON DELETE RESTRICT
);

INSERT INTO Venda
VALUES (1, 1, "NF001", '2025-05-05 10:00:00', 59.90);

CREATE TABLE Transportadora (
  idTransportadora INT ZEROFILL NOT NULL AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  cnpj VARCHAR(20),
  cep VARCHAR(50) NOT NULL,
  PRIMARY KEY (idTransportadora)
);

INSERT INTO Transportadora
VALUES (1, "Transporte Rápido", "987654321", "80000-000");

CREATE TABLE Entrega (
  numeroProtocolo INT ZEROFILL NOT NULL,
  Venda_numeroNotaFiscal VARCHAR(150) NOT NULL,
  Transportadora_idTransportadora INT ZEROFILL NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (numeroProtocolo),
  FOREIGN KEY (Venda_numeroNotaFiscal) REFERENCES livraria.Venda (numeroNotaFiscal) ON DELETE RESTRICT,
  FOREIGN KEY (Transportadora_idTransportadora) REFERENCES livraria.Transportadora (idTransportadora) ON DELETE RESTRICT
);

INSERT INTO Entrega
VALUES (1, "NF001", 1);

ALTER TABLE Autor ADD nomeFantasma VARCHAR(155);

ALTER TABLE Entrega ADD meioEntrega VARCHAR(155) NOT NULL;

ALTER TABLE Autor
MODIFY COLUMN biografia VARCHAR(1000) NOT NULL;

UPDATE Autor SET nomeFantasma = "NomeFantasmaTESTE1" WHERE idAutor = 1;
UPDATE Entrega SET meioEntrega = "CorreioSul" WHERE numeroProtocolo = 1;

SELECT * FROM Editor;

SELECT * FROM Categoria;

SELECT * FROM Cliente;

SELECT * FROM Autor;

SELECT * FROM Livro;

SELECT * FROM Livro_Autor;

SELECT * FROM Livro_Categoria;

SELECT * FROM Venda;

SELECT * FROM Transportadora;

SELECT * FROM Entrega;

show tables;
