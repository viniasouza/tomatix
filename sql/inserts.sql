-- INSERTS INDIVIDUAIS DA TOMATIX 

use tomatix;


-- Insert tabela empresa
INSERT INTO empresa (nomeFantasia, cnpj) VALUES
('Fazenda Tomateiro', '12345678000199'),
('Agro Meu Tomate', '98765432000188');

-- Insert de usuários
INSERT INTO usuario (email, senha, telefone, nomeEmpresa, nivel) VALUES
('joao@gmail.com', '123456', '11988562209', 'Fazenda Tomateiro', 'adm'),
('maria@gmail.com', '123456', '11988728832', 'Agro Tomate', 'adm'),
('lucas@gmail.com', '123456', '11983203322', 'Fazenda Tomateiro', 'funcionario');

-- Insert tabela estufa
INSERT INTO estufa (nomeEmpresa, nome, area, dtInicio, statusEstufa) VALUES
('Fazenda Tomateiro', 'Estufa 1 - Tomate-Cereja', 500.00, '2026-09-10', 'ativa'), 
('Fazenda Tomateiro', 'Estufa 2 - Tomate-Cereja', 500.00, '2026-07-20', 'ativa'),   
('Agro Meu Tomate', 'Estufa 1', 1000.00, '2026-05-15', 'ativa'),  
('Agro Meu Tomate', 'Estufa 2', 300.00, '2025-10-10', 'desativada');

-- Insert dos sensores
INSERT INTO sensor (nomeEstufa, statusSensor, dtAtivacao) VALUES
('Estufa 1 - Tomate-Cereja', 'ativado','2026-08-10'),   
('Estufa 2 - Tomate-Cereja', 'ativado','2026-07-20'),  
('Estufa 1', 'ativado','2026-05-15'),    
('Estufa 2', 'desativado', '2025-10-10');


-- Insert Registro luminosidade
-- Simulando leituras em LUX
INSERT INTO registroLuminosidade (idSensor, valorLeitura) VALUES
(1, 15500.00),
(2, 16200.50),
(3, 22300.00);
