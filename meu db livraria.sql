create database livraria;

use livraria;

  create table Editor(
  `idEditor` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL UNIQUE,
  `cnpj` VARCHAR(20) NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `país` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEditor`)
  );
  
    create table Categoria(
  `idCategoria` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(150) NOT NULL,
  `titulo` VARCHAR(150) NOT NULL UNIQUE,
    PRIMARY KEY (`idCategoria`)
  );
  
create table cliente(
  `idCliente` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(20) NOT NULL,
  `cpf` VARCHAR(14),
  `cnpj` VARCHAR(20) ,
  `cep` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`idCliente`)
  );

create table Autor(
  `idAutor` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL UNIQUE,
  `nacionalidade` VARCHAR(1000) NOT NULL,
  `biografia` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idAutor`)
  );
  
create table livro(
`idLivro` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(150) NOT NULL,
  `descritivo` VARCHAR(1000) NOT NULL,
  `ano` DATE NOT NULL,
  `preco` DECIMAL NOT NULL,
  `Editor_idEditor` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idLivro`),
  FOREIGN KEY (`Editor_idEditor`) REFERENCES `livraria`.`Editor` (`idEditor`)
  );
    
  create table Livro_Autor(
   `Livro_idLivro` INT ZEROFILL NOT NULL UNIQUE,
  `Autor_idAutor` INT ZEROFILL NOT NULL UNIQUE ,
  `idLivro_Autor` INT  NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (`idLivro_Autor`),
    FOREIGN KEY (`Livro_idLivro`) REFERENCES `livraria`.`Livro` (`idLivro`),
    FOREIGN KEY (`Autor_idAutor`) REFERENCES `livraria`.`Autor` (`idAutor`)
  );
  

  create table Livro_Categoria(
   `Livro_idLivro` INT ZEROFILL NOT NULL,
  `Categoria_idCategoria` INT ZEROFILL NOT NULL,
 PRIMARY KEY (`Livro_idLivro`, `Categoria_idCategoria`),
    FOREIGN KEY (`Livro_idLivro`) REFERENCES `livraria`.`Livro` (`idLivro`),
    FOREIGN KEY (`Categoria_idCategoria`) REFERENCES `livraria`.`Categoria` (`idCategoria`)
  );
  
  create table venda(
  `Cliente_idCliente` INT ZEROFILL NOT NULL ,
   `Livro_idLivro` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `numeroNotaFiscal` VARCHAR(150) NOT NULL,
  `data` DATETIME,
  `valorTotal` FLOAT NOT NULL,
  PRIMARY KEY (`numeroNotaFiscal`),
   FOREIGN KEY (`Cliente_idCliente`) REFERENCES `livraria`.`Cliente` (`idCliente`),
    FOREIGN KEY (`Livro_idLivro`) REFERENCES `livraria`.`Livro` (`idLivro`)
  );
  
  create table Transportadora(
 `idTransportadora` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `cnpj` VARCHAR(20),
  `cep` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idTransportadora`)
  );
  
  create table Entrega(
  `numeroProtocolo` INT ZEROFILL NOT NULL ,
  `Venda_numeroNotaFiscal` VARCHAR(150) NOT NULL,
  `Transportadora_idTransportadora` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`numeroProtocolo`),
  FOREIGN KEY (`Venda_numeroNotaFiscal`) REFERENCES `livraria`.`Venda` (`numeroNotaFiscal`),
    FOREIGN KEY (`Transportadora_idTransportadora`) REFERENCES `livraria`.`Transportadora` (`idTransportadora`)
  );
  
  
ALTER TABLE Entrega
ADD nomeFantasma VARCHAR(155);

ALTER TABLE Entrega
ADD meioEntrega VARCHAR(155);
  
ALTER TABLE Autor
MODIFY COLUMN biografia VARCHAR(1000);
  
show tables;

  
  
  
  


    