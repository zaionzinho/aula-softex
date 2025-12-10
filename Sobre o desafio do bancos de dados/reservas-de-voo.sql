create database ReservasDeVoos;

use ReservasDeVoos;

create table LinhaAerea (
    id_linha_aerea INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(255),
    site VARCHAR(100),
    ano_fundacao YEAR,
    sigla VARCHAR(10) UNIQUE,
    PRIMARY KEY (id_linha_aerea)
);

create table Aeroporto (
    id_aeroporto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(255),
    ano_fundacao YEAR,
    area DECIMAL(10,2),
    qntd_pistas INT,
    PRIMARY KEY (id_aeroporto)
);

create table Voo (
    id_voo INT NOT NULL AUTO_INCREMENT,
    id_linha_aerea INT NOT NULL,
    id_aeroporto_origem INT NOT NULL,
    id_aeroporto_destino INT NOT NULL,
    numero_voo VARCHAR(10) UNIQUE NOT NULL,
    status_voo ENUM('Programado', 'Em_Voo', 'Atrasado', 'Cancelado') DEFAULT 'Programado',
    tipo ENUM('Nacional', 'Internacional') NOT NULL,
    duracao_prevista TIME NOT NULL,
    paradas INT DEFAULT 0,
    trecho VARCHAR(100) NOT NULL,
    data_hora_partida DATETIME NOT NULL,
    data_hora_chegada DATETIME NOT NULL,
    PRIMARY KEY (id_voo),
    FOREIGN KEY (id_linha_aerea) REFERENCES LinhaAerea(id_linha_aerea),
    FOREIGN KEY (id_aeroporto_origem) REFERENCES Aeroporto(id_aeroporto),
    FOREIGN KEY (id_aeroporto_destino) REFERENCES Aeroporto(id_aeroporto)
);

create table Cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    CPF VARCHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(255),
    sexo ENUM('Masculino', 'Feminino', 'Outro'),
    passaporte VARCHAR(20) UNIQUE,
    idade INT,
    PRIMARY KEY (id_cliente)
);

create table Reserva (
    id_reserva INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_voo INT NOT NULL,
    numero_reserva VARCHAR(20) UNIQUE NOT NULL,
    forma_de_pagamento ENUM('Cartão de Crédito', 'Cartão de Débito', 'Boleto Bancário', 'Pix') NOT NULL,
    qntd_passageiros INT NOT NULL,
    classe ENUM('Economica', 'Executiva', 'PrimeiraClasse') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_reserva ENUM('Ativa', 'Cancelada', 'Concluída', 'Reembolsada', 'Reagendada') DEFAULT 'Ativa',
    observacoes TEXT,
    PRIMARY KEY (id_reserva),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_voo) REFERENCES Voo(id_voo)
);

insert into LinhaAerea (nome, cnpj, telefone, email, endereco, site, ano_fundacao, sigla) values
('Latam Airlines', '12345678000190', '(11) 4002-8922', 'contato@latam.com.br', 'Avenida Washington Luís, 3000 - São Paulo, SP', 'www.latam.com.br', 2010, 'LA'),
('Gol Linhas Aéreas', '98765432000100', '(11) 3506-4002', 'contato@gol.com.br', 'Avenida do Estado, 777 - São Paulo, SP', 'www.gol.com.br', 2001, 'G3' ),
('Azul Linhas Aéreas', '11223344000155', '(21) 4003-1118', 'contato@azul.com.br', 'Avenida das Nações, 1000 - São Paulo, SP', 'www.azul.com.br', 2008, 'AD'),
('American Airlines', '22334455000166', '(21) 4004-4000', 'contato@american.com', 'Avenida das Américas, 500 - Rio de Janeiro, RJ', 'www.american.com', 1930, 'AA'),
('Delta Air Lines', '33445566000177', '(21) 4005-5000', 'contato@delta.com', 'Avenida das Américas, 1000 - Rio de Janeiro, RJ', 'www.delta.com', 1924, 'DL'),
('United Airlines', '44556677000188', '(21) 4006-6000', 'contato@united.com', 'Avenida das Américas, 1500 - Rio de Janeiro, RJ', 'www.united.com', 1926, 'UA'),
('Emirates', '55667788000199', '(21) 4007-7000', 'contato@emirates.com', 'Avenida das Américas, 2000 - Rio de Janeiro, RJ', 'www.emirates.com', 1985, 'EK'),
('Qatar Airways', '66778899000100', '(21) 4008-8000', 'contato@qatar.com', 'Avenida das Américas, 2500 - Rio de Janeiro, RJ', 'www.qatar.com', 1997, 'QR'),
('Lufthansa', '77889900112233', '(21) 4009-9000', 'contato@lufthansa.com', 'Avenida das Américas, 3000 - Rio de Janeiro, RJ', 'www.lufthansa.com', 1955, 'LH'),
('Air France', '88990011223344', '(21) 4010-1000', 'contato@airfrance.com', 'Avenida das Américas, 3500 - Rio de Janeiro, RJ', 'www.airfrance.com', 1933, 'AF');

insert into Aeroporto (nome, CNPJ, telefone, email, endereco, ano_fundacao, area, qntd_pistas) values
('Aeroporto Internacional de São Paulo-Guarulhos', '12345678000191', '(11) 2445-2945', 'contato@gru.com.br', 'Rodovia Hélio Smidt, s/n - Guarulhos, SP', 1985, 15000000.00, 3),
('Aeroporto Internacional de Congonhas', '98765432000101', '(11) 5090-6000', 'contato@congonhas.com.br', 'Avenida Washington Luís, 3000 - São Paulo, SP', 1936, 8000000.00, 2),
('Aeroporto Internacional do Rio de Janeiro-Galeão', '11223344000156', '(21) 3396-9000', 'contato@gal.com.br', 'Avenida do Galeão, s/n - Rio de Janeiro, RJ', 1977, 10000000.00, 2),
('Aeroporto Internacional de Brasília', '22334455000167', '(61) 3367-7000', 'contato@bsb.com.br', 'Avenida do Parque, s/n - Brasília, DF', 1990, 12000000.00, 2),
('Aeroporto Internacional de Viracopos-Campinas', '33445566000178', '(19) 3728-2000', 'contato@viracopos.com.br', 'Rodovia Dom Pedro I, s/n - Campinas, SP', 1998, 9000000.00, 2),
('Aeroporto Internacional de Salvador', '44556677000189', '(71) 3371-6000', 'contato@salvador.com.br', 'Avenida Luis Viana, s/n - Salvador, BA', 1998, 9000000.00, 2),
('Aeroporto Internacional de Fortaleza', '55667788000190', '(85) 4006-2000', 'contato@fortaleza.com.br', 'Avenida Francisco Sá, s/n - Fortaleza, CE', 1998, 9000000.00, 2),
('Aeroporto Internacional de Recife', '66778899000101', '(81) 4006-3000', 'contato@recife.com.br', 'Avenida Marechal Mascarenhas de Moraes, s/n - Recife, PE', 1998, 9000000.00, 2),
('Aeroporto Internacional de Porto Alegre', '77889900112234', '(51) 4006-4000', 'contato@portoalegre.com.br', 'Avenida dos Estados, s/n - Porto Alegre, RS', 1998, 9000000.00, 2),
('Aeroporto Internacional de Curitiba', '88990011223345', '(41) 4006-5000', 'contato@curitiba.com.br', 'Avenida das Torres, s/n - Curitiba, PR', 1998, 9000000.00, 2);

insert into Voo (id_linha_aerea, id_aeroporto_origem, id_aeroporto_destino, numero_voo, status_voo, tipo, duracao_prevista, paradas, trecho, data_hora_partida, data_hora_chegada) values
(1, 1, 3, 'LA123', 'Programado', 'Internacional', '10:00:00', 0, 'São Paulo - Rio de Janeiro', '2024-07-01 08:00:00', '2024-07-01 18:00:00'),
(2, 2, 4, 'G3456', 'Em_Voo', 'Nacional', '02:30:00', 0, 'São Paulo - Brasília', '2024-07-01 09:00:00', '2024-07-01 11:30:00'),
(3, 3, 5, 'AD789', 'Atrasado', 'Nacional', '03:00:00', 1, 'Rio de Janeiro - Campinas', '2024-07-01 10:00:00', '2024-07-01 13:30:00'),
(4, 4, 6, 'AA101', 'Cancelado', 'Internacional', '12:00:00', 0, 'Brasília - Salvador', '2024-07-01 11:00:00', '2024-07-01 23:00:00'),
(5, 5, 7, 'DL202', 'Programado', 'Internacional', '11:30:00', 0, 'Salvador - Fortaleza', '2024-07-01 12:00:00', '2024-07-01 23:30:00'),
(6, 6, 8, 'UA303', 'Em_Voo', 'Internacional', '10:15:00', 0, 'Fortaleza - Recife', '2024-07-01 13:00:00', '2024-07-01 23:15:00'),
(7, 7, 9, 'EK404', 'Atrasado', 'Internacional', '14:00:00', 1, 'Recife - Porto Alegre', '2024-07-01 14:00:00', '2024-07-02 04:00:00'),
(8, 8, 10, 'QR505', 'Cancelado', 'Internacional', '13:30:00', 0, 'Porto Alegre - Curitiba', '2024-07-01 15:00:00', '2024-07-02 04:30:00'),
(9, 9, 1, 'LH606', 'Programado', 'Internacional', '12:45:00', 0, 'Curitiba - São Paulo', '2024-07-01 16:00:00', '2024-07-02 04:45:00'),
(10, 10, 2, 'AF707', 'Em_Voo', 'Internacional', '11:15:00', 0, 'São Paulo - Rio de Janeiro', '2024-07-01 17:00:00', '2024-07-02 04:15:00');

insert into Cliente (nome, email, telefone, CPF, endereco, sexo, passaporte, idade) values
('João Silva', 'joao.silva@example.com', '(11) 98765-4321', '123.456.789-00', 'Rua A, 123 - São Paulo, SP', 'Masculino', 'AB1234567', 30),
('Maria Oliveira', 'maria.oliveira@example.com', '(11) 91234-5678', '987.654.321-00', 'Rua B, 456 - São Paulo, SP', 'Feminino', 'CD2345678', 28),
('Carlos Souza', 'carlos.souza@example.com', '(11) 92345-6789', '456.789.123-00', 'Rua C, 789 - São Paulo, SP', 'Masculino', 'EF3456789', 35),
('Ana Pereira', 'ana.pereira@example.com', '(11) 93456-7890', '321.654.987-00', 'Rua D, 159 - São Paulo, SP', 'Feminino', 'GH4567890', 32),
('Pedro Lima', 'pedro.lima@example.com', '(11) 94567-8901', '654.321.987-00', 'Rua E, 258 - São Paulo, SP', 'Masculino', 'IJ5678901', 29),
('Carla Mendes', 'carla.mendes@example.com', '(11) 95678-9012', '789.012.345-00', 'Rua F, 357 - São Paulo, SP', 'Feminino', 'KL6789012', 26),
('Lucas Fernandes', 'lucas.fernandes@example.com', '(11) 96789-0123', '321.987.654-00', 'Rua G, 456 - São Paulo, SP', 'Masculino', 'MN7890123', 27),
('Juliana Rocha', 'juliana.rocha@example.com', '(11) 97890-1234', '654.321.098-76', 'Rua H, 159 - São Paulo, SP', 'Feminino', 'OP8901234', 31),
('Rafael Gomes', 'rafael.gomes@example.com', '(11) 98901-2345', '987.654.321-01', 'Rua I, 258 - São Paulo, SP', 'Masculino', 'QR9012345', 33),
('Fernanda Alves', 'fernanda.alves@example.com', '(11) 99912-3456', '123.456.789-01', 'Rua J, 357 - São Paulo, SP', 'Feminino', 'ST0123456', 30);

insert into Reserva (id_cliente, id_voo, numero_reserva, forma_de_pagamento, qntd_passageiros, classe, valor_total, data_reserva, status_reserva, observacoes) values
(1, 1, 'R001', 'Cartão de Crédito', 1, 'Econômica', 500.00, '2024-06-01', 'Cancelada', 'Solicitou cancelamento'),
(2, 2, 'R002', 'Boleto Bancário', 2, 'Executiva', 1200.00, '2024-06-02', 'Ativa', 'Preferência por assento na janela'),
(3, 3, 'R003', 'Cartão de Débito', 1, 'Primeira Classe', 2000.00, '2024-06-03', 'Reembolsada', 'Solicitou reembolso'),
(4, 4, 'R004', 'Pix', 3, 'Econômica', 1500.00, '2024-06-04', 'Concluída', 'Assento próximo à saída de emergência'),
(5, 5, 'R005', 'Cartão de Crédito', 1, 'Executiva', 800.00, '2024-06-05', 'Ativa', 'Necessita de assistência especial'),
(6, 6, 'R006', 'Boleto Bancário', 2, 'Primeira Classe', 2500.00, '2024-06-06', 'Concluída', 'Assento na frente do avião'),
(7, 7, 'R007', 'Cartão de Débito', 1, 'Econômica', 600.00, '2024-06-07', 'Reagendada', 'Atraso no voo'),
(8, 8, 'R008', 'Pix', 4, 'Executiva', 1600.00, '2024-06-08', 'Ativa', 'Assento no corredor'),
(9, 9, 'R009', 'Cartão de Crédito', 1, 'Primeira Classe', 2200.00, '2024-06-09', 'Reembolsada', 'Assento com mais espaço para as pernas'),
(10, 10, 'R010', 'Boleto Bancário', 2, 'Econômica', 700.00, '2024-06-10', 'Ativa', 'Necessita de assistência especial');
