CREATE TABLE cadastros (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpfcnpj VARCHAR(14) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    endereco VARCHAR(200) NOT NULL
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL
);

CREATE TABLE cadastros_tag (
    cadastro_id INT REFERENCES cadastros(id),
    tag_id INT REFERENCES tags(id),
    PRIMARY KEY (cadastro_id, tag_id)
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL
);

CREATE TABLE lancamentos (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(7) CHECK (tipo IN ('pagar', 'receber')) NOT NULL,
    status VARCHAR(9) CHECK (status IN ('aberto', 'liquidado')) NOT NULL,
    descricao TEXT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    valor_liquidado DECIMAL(10, 2),
    vencimento DATE NOT NULL,
    liquidacao DATE,
    cadastro_id INT REFERENCES cadastros(id),
    categoria_id INT REFERENCES categorias(id)
);

--Os insert de cadastros usei os dados de uma planilha que eu tinha.

INSERT INTO tags (titulo)
VALUES 
('Importante'), 
('Novo'), 
('VIP'), 
('Preferencial'),
('Fidelidade'), 
('Parceiro'), 
('Fornecedor'), 
('Cliente'), 
('Lead'),
('Revendedor');

INSERT INTO cadastros_tag (cadastro_id, tag_id)
VALUES 
(1, 2),
(2, 4),
(3, 1),
(4, 5),
(5, 6);

INSERT INTO categorias (titulo)
VALUES 
('Aluguel'), 
('Serviços'), 
('Produtos'), 
('Assinatura'),
('Serviços'), 
('Manutenção'), 
('Infraestrutura'), 
('Marketing'), 
('Treinamento'),
('Desenvolvimento');