-- Criação do Modelo Físico
-- Nome: Rafael Rosa Balaban Borba
-- Data: 03/06/2024

------------- CRIAÇÃO DAS TABELAS ----------------------------------------

-- Tabela Telefone ---------------------------------------
create table telefones
(
    num_telefone    NUMBER(11) primary key,
    cod_construtora NUMBER(5)
);

-- Tabela Construtora -------------------------------------
create table construtoras
(
    cod_construtora		NUMBER(5)    primary key,
    nome				VARCHAR(100) NOT NULL,
    site				VARCHAR(100) NOT NULL,
    nome_fantasia		VARCHAR(100)
);

-- Tabela Obra ------------------------------------------
CREATE TABLE obras
(
    cod_obra 			NUMBER(5)    primary key,
    nome 				VARCHAR(100) NOT NULL,
    logradouro 			VARCHAR(100) NOT NULL,
    numero 				NUMBER(5)	 NOT NULL,
    complemento 		VARCHAR(25)	 NOT NULL,
    cod_construtora 	NUMBER(5)    NOT NULL
);

-- Tabela Trabalhador ----------------------------------
CREATE TABLE trabalhadores
(
    cpf NUMBER(11)      primary key,
    nome VARCHAR(100)   NOT NULL,
    salario NUMBER(8,2) NOT NULL check (salario > 0),
    cod_obra NUMBER(5)  NOT NULL
);

-- Tabela Categoria ----------------------------------
CREATE TABLE categorias
(
    cod_categoria NUMBER(5) primary key,
    descricao VARCHAR(100)   NOT NULL
);

-- Tabela Equipamento ------------------------------
CREATE TABLE equipamentos
(
    cod_equipamento NUMBER(5)  primary key,
    nome VARCHAR(100)          NOT NULL,
    valor_diario NUMBER(6,2)   NOT NULL check (valor_diario > 0),
    cod_categoria NUMBER(5)    NOT NULL
);

-- Tabela Obra-Equipamento ----------------------------
CREATE TABLE obra_equipamento
(
    cod_equipamento NUMBER(5),
    cod_obra NUMBER(5),
    data_inicio DATE      NOT NULL,
    data_termino DATE     NOT NULL,

    constraint pk_obra_equipamento primary key (cod_equipamento, cod_obra)
);

------- FOREIGN KEYS -------------------------------------

ALTER TABLE telefones ADD CONSTRAINT fk_telefones_construtoras
    FOREIGN KEY (cod_construtora)
    REFERENCES construtoras (cod_construtora);

ALTER TABLE obras ADD CONSTRAINT fk_obras_construtoras
    FOREIGN KEY (cod_construtora)
    REFERENCES construtoras (cod_construtora);

ALTER TABLE trabalhadores ADD CONSTRAINT fk_trabalhadores_obras
    FOREIGN KEY (cod_obra)
    REFERENCES obras (cod_obra);

ALTER TABLE obra_equipamento ADD CONSTRAINT fk_obra_equipamento_equipamentos
    FOREIGN KEY (cod_equipamento)
    REFERENCES equipamentos (cod_equipamento);
 
ALTER TABLE obra_equipamento ADD CONSTRAINT fk_obra_equipamento_obras
    FOREIGN KEY (cod_obra)
    REFERENCES obras (cod_obra);

ALTER TABLE equipamentos ADD CONSTRAINT fk_equipamentos_categorias
    FOREIGN KEY (cod_categoria)
    REFERENCES categorias (cod_categoria);

------------------- INSERÇÃO DE DADOS -------------------------------------

-- Construtoras -----------------------------
insert into construtoras
values(10, 'Construtora Alfa S.A.', 'construtoraALFA.com.br', 'Alfa Incorporações');
insert into construtoras
values(1, 'Rafael Rosa Balaban Borba', 'rafael.rb.borba@gmail.com', 'Rafa');

-- Telefones -----------------------------
insert into telefones values('5133333334', 10);
insert into telefones values('5133333335', 10);
insert into telefones values('5133333336', 1);
insert into telefones values('51994566177', 1);

-- Obras -----------------------------
insert into obras
values(115, 'Condomínio dos Lagos', 'Travessa dos Lagos', 100, 'Norte', 10);
insert into obras
values(116, 'Condomínio Araras', 'Avenida Rio Grande', 22, 'Lado A', 10);
insert into obras
values(117, 'Arena do Grêmio', 'Av. Padre Leopoldo Brentano', 110, 'Estádio', 1);
insert into obras
values(118, 'Parque Divertido', 'Av. Farrapos', 1, 'Leste', 1);


-- Trabalhadores -----------------------------
insert into trabalhadores
values(10110110134, 'José Chaves', 2200, 115);
insert into trabalhadores
values(10210210291, 'Pedro Passos', 3502.18, 115);
insert into trabalhadores
values(10310310318, 'Maria Aparecida', 2800.87, 115);
insert into trabalhadores
values(10410410452, 'Carlos Dutra', 3100, 116);
insert into trabalhadores
values(10510510585, 'Mário Pires', 4323.29, 116);

insert into trabalhadores
values(12345678901, 'Mário Sérgio', 4157, 117);
insert into trabalhadores
values(56468281501, 'Cosme Viana', 7510, 117);
insert into trabalhadores
values(45815813512, 'Lacava Geovane', 1013, 117);
insert into trabalhadores
values(84651816281, 'Domingos Souza', 2512, 117);
insert into trabalhadores
values(19129813516, 'Silva Cruz', 2135, 117);

insert into trabalhadores
values(16268181232, 'Evandro Leandro', 2351, 118);
insert into trabalhadores
values(25168135481, 'Souza Paiva', 1235, 118);
insert into trabalhadores
values(81913218168, 'Daniel Rodrigues', 1897, 118);
insert into trabalhadores
values(16518135486, 'Daltro da Silva', 2981, 118);
insert into trabalhadores
values(48926841384, 'Rodrigo Santurião', 3518, 118);


-- Categorias -----------------------------
insert into categorias values(1, 'Concretagem');
insert into categorias values(2, 'Acesso e Elevação');
insert into categorias values(3, 'Geradores e Compressores');
insert into categorias values(4, 'Andaimes');
insert into categorias values(5, 'Ferramenta Elétrica');

-- Equipamentos -----------------------------
insert into equipamentos values(301, 'Betoneira', 100, 1);
insert into equipamentos values(302, 'Cortadora de Piso', 10, 1);
insert into equipamentos values(303, 'Mangote', 30.5, 1);
insert into equipamentos values(304, 'Guincho', 250, 2);
insert into equipamentos values(305, 'Gerador', 451, 3);
insert into equipamentos values(306, 'Piso Metálico', 150, 4);
insert into equipamentos values(307, 'Furadeira de bancada', 65, 5);
insert into equipamentos values(308, 'Parafusadeira', 37, 5);
insert into equipamentos values(309, 'Plaina', 25, 5);

insert into equipamentos values(310, 'Compressor de Ar', 100, 3);
insert into equipamentos values(311, 'Esmerilhadeira', 37, 5);
insert into equipamentos values(312, 'Andaime', 50, 4);
insert into equipamentos values(313, 'Carrinho de Mão', 28, 1);

-- Obra_Equipamento -----------------------------
insert into obra_equipamento
values(301, 115, '18-MAR-2022', '24-OCT-2022');
insert into obra_equipamento
values(304, 115, '20-APR-2022', '02-AUG-2022');
insert into obra_equipamento
values(306, 115, '06-JUL-2021', '18-JUL-2021');
insert into obra_equipamento
values(307, 115, '4-MAR-2022', '20-MAR-2022');
insert into obra_equipamento
values(309, 115, '04-AUG-2021', '10-AUG-2021');
insert into obra_equipamento
values(304, 116, '22-OCT-2022', '25-OCT-2022');
insert into obra_equipamento
values(305, 116, '07-MAR-2022', '10-MAR-2022');
insert into obra_equipamento
values(306, 116, '12-SEP-2022', '21-SEP-2022');
insert into obra_equipamento
values(307, 116, '16-AUG-2022', '24-AUG-2022');
insert into obra_equipamento
values(308, 116, '23-OCT-2022', '25-OCT-2022');

insert into obra_equipamento
values(310, 117, '10-JAN-2023', '16-FEB-2023');
insert into obra_equipamento
values(311, 117, '05-MAR-2023', '08-AUG-2023');
insert into obra_equipamento
values(312, 117, '18-JUN-2023', '01-JUL-2023');
insert into obra_equipamento
values(313, 117, '29-DEC-2023', '26-FEB-2024');

---------------- CONSULTAS --------------------------------

-- 1) Selecionar CPFs e nomes dos trabalhadores que ganham mais do que 2.500,00;
select cpf, nome, salario
from trabalhadores
where salario > 2500
order by nome;

-- 2) Selecionar nomes e salários dos trabalhadores da empresa ALFA, ordenados em ordem alfabética crescente;
select trabalhadores.nome, trabalhadores.salario
from trabalhadores join obras on (trabalhadores.cod_obra = obras.cod_obra)
join construtoras on (obras.cod_construtora = construtoras.cod_construtora)
where construtoras.nome like '%Alfa%'
order by trabalhadores.nome;

-- 3) Calcular e exibir a folha de pagamento de cada obra. Uma folha de pagamento é determinada pela soma dos salários dos seus trabalhadores.
select obras.nome as Nome_Obra, sum(salario) as Folha_Pagamento
from trabalhadores join obras on (trabalhadores.cod_obra = obras.cod_obra)
group by obras.nome
order by Folha_Pagamento;

-- 4) Listar as categorias de equipamentos utilizadas nas obras da construtora ALFA.
select distinct(cat.cod_categoria), cat.descricao, equ.nome as nome_equipamento
from categorias cat join equipamentos equ on (cat.cod_categoria = equ.cod_categoria)
join obra_equipamento obrequ on (equ.cod_equipamento = obrequ.cod_equipamento)
join obras on (obrequ.cod_obra = obras.cod_obra)
join construtoras on (obras.cod_construtora = construtoras.cod_construtora)
where construtoras.nome like '%Alfa%'
order by cat.cod_categoria;