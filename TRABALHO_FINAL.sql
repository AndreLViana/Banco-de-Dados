CREATE TABLE Funcionario (
    codigo_funcionario SERIAL PRIMARY KEY,
    nome_funcionario VARCHAR(60),
    cpf_funcionario VARCHAR(60)
);

CREATE TABLE Produto (
    codigo_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(60),
    descricao VARCHAR(60),
    quantidade_estoque NUMERIC,
    data_fabricacao DATE,
    valor_unit NUMERIC,
    codigo_categoria INT
);

CREATE TABLE Cliente (
    codigo_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(60),
    nome_usuario VARCHAR(60),
    email VARCHAR(60),
    cpf VARCHAR(20),
    data_nascimento DATE,
    endereco VARCHAR(60)
);

CREATE TABLE Categoria (
    codigo_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(60),
    descricao_categoria VARCHAR(60)
);

CREATE TABLE Pedido (
    codigo_pedido SERIAL PRIMARY KEY,
    data_pedido DATE,
    codigo_produto INT,
    codigo_cliente INT
);

CREATE TABLE Itens_pedido_Contem (
    codigo_produto INT,
    codigo_pedido INT,
	quantidade NUMERIC,
	valor_venda NUMERIC,
	desconto NUMERIC
);
 
ALTER TABLE Produto ADD CONSTRAINT Produto_2
    FOREIGN KEY (codigo_categoria)
    REFERENCES Categoria (codigo_categoria)
    ON DELETE RESTRICT;
 
ALTER TABLE Pedido ADD CONSTRAINT Pedido_2
    FOREIGN KEY (codigo_cliente)
    REFERENCES Cliente (codigo_cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Itens_pedido_Contem ADD CONSTRAINT Itens_pedido_Contem_1
    FOREIGN KEY (codigo_produto)
    REFERENCES Produto (codigo_produto);
 
ALTER TABLE Itens_pedido_Contem ADD CONSTRAINT Itens_pedido_Contem_2
    FOREIGN KEY (codigo_pedido)
    REFERENCES Pedido (codigo_pedido);
	
INSERT INTO funcionario (nome_funcionario, cpf_funcionario)
VALUES ('João', '12345678912'),
       ('José', '23456789123'),
       ('Maria', '34567891234'),
       ('Manuel', '45678912345'),
       ('Rosa', '56789123457');

INSERT INTO cliente (nome, nome_usuario, email, cpf, data_nascimento, endereco)

VALUES ('João Vitor', 'j0ao123', 'jv_123@gmail.com', '160.251.105-21', '10/02/1999', 'Campo Grande'),

('Fernanda Souza', 'f3rnand', 'fefe321@gmail.com', '190.168.261-27', '10/06/2001', 'Copacabana'),

('Vitor', 'v1t0r', 'vitor@gmail.com', '150.180.222-33', '22/07/2000', 'Realengo'),

('Marcos Souza', 'm4rc0soouz', 'marco1905@gmail.com', '165.321.65-42', '10/06/1998', 'Tijuca'),

('Maria', 'm4ria456', 'mariaa4@gmail.com', '154.125.567-55', '25/06/2002', 'Angra dos Reis');	

INSERT INTO categoria (nome_categoria, descricao_categoria)

VALUES ('jaquetas','vestuario para frio'),

('camisas','camisas polo, botao ou maga longa'),

('camisetas','camistas verao'),

('acessorios','oculos, gorros, bonés e meias'),

('calcados','tenis, botas e chinelos');

INSERT INTO produto (nome_produto, descricao, quantidade_estoque, data_fabricacao, valor_unit, codigo_categoria) 

VALUES ('JAQUETA ADIDAS REZ 2', 'jaqueta corta vento impermeavel adidas',9,'10/08/2023',799,1),

('CAMISA BOTAO REDLEY STAR', 'camisa 100% algodao pima', 10,'12/06/2023',259,2),

('OCULOS OAKLEY FORGSKIN ', 'oculos polarizado prizm', 64,'18/03/2022',1250,4),

('CAMISETA NIKE SB', 'camisa 100% algodao nike',31,'21/08/2022',199,3),

('NIKE DUNK SB', 'tenis 100% couro', 55, '05/05/2023', 1599,5),

('SNAPBACK OAKLEY', 'bone impermeavel oakley',52,'02/02/2022',99,4);

INSERT INTO pedido (data_pedido, codigo_produto, codigo_cliente)

VALUES ('10/08/2023',2,1),
       ('21/11/2023',3,5),
	   ('25/08/2023',1,4),
	   ('12/09/2023',5,3),
	   ('15/10/2023',4,2);
	   
INSERT INTO itens_pedido_contem (codigo_produto,codigo_pedido, quantidade, valor_venda, desconto)

VALUES (1,2,1,799,79),
       (5,3,2,99,9),
       (4,1,1,1599,159),
       (3,5,3,199,19),
       (2,4,2,1250,125)
	   (3,4,1,199,19);
	   
SELECT p.codigo_pedido, CL.nome, pr.codigo_produto, IC.quantidade, IC.valor_venda, IC.desconto, IC.quantidade * IC.Valor_venda - ic.desconto AS Total 
FROM pedido p
INNER JOIN cliente CL on CL.codigo_cliente = p.codigo_cliente
INNER JOIN itens_pedido_contem IC ON p.codigo_pedido = IC.codigo_pedido
INNER JOIN produto pr ON pr.codigo_produto = IC.codigo_produto

INSERT INTO itens_pedido_contem (codigo_produto,codigo_pedido, quantidade, valor_venda, desconto)

VALUES (3,4,1,199,19)

SELECT p.codigo_pedido, CL.nome, pr.codigo_produto, IC.quantidade, IC.valor_venda, IC.desconto, IC.quantidade * IC.Valor_venda - ic.desconto AS Total 
FROM pedido p
INNER JOIN cliente CL on CL.codigo_cliente = p.codigo_cliente
INNER JOIN itens_pedido_contem IC ON p.codigo_pedido = IC.codigo_pedido
INNER JOIN produto pr ON pr.codigo_produto = IC.codigo_produto
where p.codigo_pedido = 4


