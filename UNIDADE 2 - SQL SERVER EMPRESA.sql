-- script base de dados empresa_db

--criando base de dados
create database empresa_db;

--mostrando todas as tabelas da base de dados
SELECT name
FROM sys.databases;  

--usando a base de dados empresa_db
use empresa_db;

--criando tabela Departamento
CREATE TABLE Departamento (
  idDepartamento INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  localizacao VARCHAR(45) NOT NULL,
  orcamento VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (idDepartamento)
);


--criando tabela empregado
CREATE TABLE Empregado (
  idEmpregado INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  idGerente INT NULL,
  funcao VARCHAR(45) NULL,
  Departamento_idDepartamento INT NOT NULL,
  dataAdmissao DATE NOT NULL,
  sala INT NULL,
  comissao INT NULL,
  
  PRIMARY KEY (idEmpregado, Departamento_idDepartamento),
  INDEX fk_Empregado_Departamento_idx (Departamento_idDepartamento ASC),
  
  CONSTRAINT fk_Empregado_Departamento
    FOREIGN KEY (Departamento_idDepartamento)
    REFERENCES Departamento (idDepartamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

--inserindo dados nas tabelas
INSERT INTO Departamento VALUES('1','Banco de Dados','Porto Alegre','2346');
INSERT INTO Departamento VALUES('2','Balconistas','Pelotas','10000');
INSERT INTO Departamento VALUES('3','Inteligência Artific','Pelotas','333');
INSERT INTO Departamento VALUES('4','Compiladores','Novo Hamburgo','5050');
INSERT INTO Departamento VALUES('5','Redes','Taquara','12122');

INSERT INTO Empregado VALUES('1','Mariewa',NULL,'Gerente','1','2000-04-05','2300','0');
INSERT INTO Empregado VALUES('2','Zico','1','Operário','1','1999-08-13','100','0');
INSERT INTO Empregado VALUES('3','Lula',NULL,'Presidente','5','1950-01-01','10000','0');
INSERT INTO Empregado VALUES('4','Vera Fixer','5','Balconista','2','1999-05-05','3300','0');
INSERT INTO Empregado VALUES('5','Luana Pyovany',NULL,'Gerente','2','1998-06-23','2300','0');
INSERT INTO Empregado VALUES('6','Daniela Schicarelli',NULL,'Gerente','3','1999-10-10','2300','0');
INSERT INTO Empregado VALUES('7','Luize Altenhofen',NULL,'Gerente','4','1999-04-26','2300','0');
INSERT INTO Empregado VALUES('8','Helo Pinheiro',NULL,'Gerente','5','1997-09-25','2300','0');
INSERT INTO Empregado VALUES('9','Pelé','1','Operário','1','2000-09-09','100',NULL);
INSERT INTO Empregado VALUES('10','Romário','1','Operário','5','2001-12-25','100','0');
INSERT INTO Empregado VALUES('11','Malu Mader','5','Balconista','2','2001-10-20','3400','0');
INSERT INTO Empregado VALUES('12','Antônio Fagundes','7','Vendedor','3','2002-12-22','5000','10');


--comandos gerais em SQL

-- Seleção de todos os campos (ou colunas) da tabela de Departamentos.
SELECT  *  FROM  Departamento;

-- where
--
-- Operadores lógicos
--
-- operador significado
-- =  igual a
-- >  maior que
-- >= maior que ou igual a
-- <  menor que
-- <= menor que ou igual a

SELECT  Empregado.nome, Empregado.funcao
FROM  Empregado
WHERE  Empregado.Departamento_idDepartamento > 3;

SELECT  Empregado.nome, Empregado.funcao
FROM  Empregado
WHERE Empregado.funcao = 'GERENTE';

-- Selecione todos os departamentos cujo orçamento mensal
--seja maior que 10000. Apresente o Nome de tal departamento
--e seu orçamento anual, que será obtido multiplicando-se o
--orçamento mensal por 12.

select Departamento.nome, Departamento.orcamento * 12
from Departamento
where Departamento.orcamento >= 10000;

select Departamento.nome 'DEPARTAMENTO', Departamento.orcamento * 12 'ORÇAMENTO'
from Departamento
where Departamento.orcamento >= 10000;

SELECT DISTINCT Empregado.funcao
FROM Empregado;

select empregado.nome
from empregado order by nome;


select empregado.nome
from empregado order by nome desc;

select Empregado.nome
from Empregado 
where Empregado.sala BETWEEN 20 and 30;

select Empregado.nome
from Empregado
inner join Departamento on Departamento.idDepartamento = Empregado.Departamento_idDepartamento
where Departamento.idDepartamento = 3 or Departamento.idDepartamento = 5

select Empregado.nome
from Empregado 
where Empregado.nome LIKE 'L%'	;

select empregado.nome , Empregado.comissao
from Empregado 
where Empregado.comissao is NULL	;






