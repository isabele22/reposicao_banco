CREATE DATABASE Loja;
USE Loja;

CREATE TABLE tb_cliente (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  tel VARCHAR(15) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
   genero ENUM("F", "M") NOT NULL
);

CREATE TABLE tb_vendedor (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  tel VARCHAR(15) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  periodo ENUM('integral', 'parcial') NOT NULL,
   salario INT(6) NOT NULL
);

CREATE TABLE produtos (
  id INT PRIMARY KEY NOT NULL,
  tamanho VARCHAR(10) NOT NULL,
  cor VARCHAR(20) NOT NULL,
  quantidade INT NOT NULL,
  preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE vendas_tb (
  id_venda INT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_vendedor INT NOT NULL,
  id_produto INT NOT NULL,
  data_venda DATE NOT NULL,
  valor_venda DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id),
  FOREIGN KEY (id_vendedor) REFERENCES tb_vendedor(id),
  FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

INSERT INTO tb_cliente (id, nome, genero, tel , endereco) VALUES
(1, 'João Silva', 'M', '103-478-7890', 'Rua silva,casa  Nº 123'),
(2, 'Carla Oliveira', 'F', ' 180-654-0000',' Avenida silva, casa Nº 06'),
(3,'Larissa', 'F', ' 505-123-7777',' Praça Cicero, casa Nº 726'),
(4 ,'Maria Gabriela', 'F', '109-808-7077', 'ponta verde, Casa Nº 38'),
(5 ,'Gabriela', 'F', '109-808-7077' ,'ponta verde,APT Nº 08'),
(6 ,'Guilherme', 'M', '109-808-7077', 'ponta verde, APT Nº 3800');

INSERT INTO tb_vendedor (id, nome, tel , endereco, periodo, salario) VALUES
(1, 'Luiza', '123-666-3215', 'ponta verde, casa Nº 50', 'integral', 200.00),
(2, 'gUILHERME tEIXEIRA', '134-654-7770', ' 404, Maceió', 'parcial', 1000.00),
(3, 'Henrique Rariel', '888-6000-3010', 'Barro de Maceió', 'integral', 1200.00),
(4, 'Carlos Wilton', '147-659-3210', 'Rua lua nova , Maceió', 'parcial', 7000.00);


INSERT INTO produtos (id, tamanho, cor, quantidade, preco) VALUES
(1, 'P', 'preto', 30, 19.90),
(2, 'M', 'vermelho', 10, 109.90),
(3, 'G', 'verde', 8, 69.90),
(4, 'P', 'amarelo', 102, 109.90),
(5, 'M', 'azul', 10, 719.90);

INSERT INTO vendas_tb (id_venda, id_cliente, id_vendedor, id_produto, data_venda, valor_venda) VALUES
(1, 6, 1, 1, '2023-11-10', 19.90),
(2, 1, 5, 2, '2023-11-11', 109.90),
(3, 2, 5, 4, '2024-10-12',109.90),
(4, 4, 3, 3, '2023-11-15', 69.90),
(5, 5, 4, 5, '2023-11-19', 719.90);

UPDATE vendedores_tb
SET salario = salario * 1.1
WHERE periodo = 'integral';

SELECT tamanho, cor, quantidade
FROM produtos;