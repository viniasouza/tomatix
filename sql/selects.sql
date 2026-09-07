-- Selects do projeto tomatix
USE tomatix;

-- Exibir todos usuários cadastrados
SELECT 
    id AS 'ID',
    email AS 'E-mail',
    senha AS 'Senha',
    telefone AS 'Telefone',
    dtCadastro AS 'Data de Cadastro',
    nomeEmpresa AS 'Empresa',
    nivel AS 'Nível de Acesso'
FROM usuario;

-- Exibir todos os sensores
SELECT 
    id AS 'ID do Sensor',
    nomeEstufa AS 'Estufa Vinculada',
    dtAtivacao AS 'Data de Ativação',
    statusSensor AS 'Status Atual'
FROM sensor;

-- Exibir sensores desativados
SELECT 
    id AS 'ID do Sensor',
    nomeEstufa AS 'Última Estufa Vinculada',
    dtAtivacao AS 'Data de Ativação',
    statusSensor AS 'Status Atual'
FROM sensor WHERE statusSensor = 'desativado';

-- Exibir todas as estufas
SELECT 
    id AS 'ID',
    nomeEmpresa AS 'Nome da Empresa',
    nome AS 'Nome da Estufa',
    area AS 'Área (m²)',
    dtInicio AS 'Data de Inicio',
    statusEstufa AS 'Status'
FROM estufa;

-- Exibir ultimos registros de uma determinada estufa
SELECT * FROM registroLuminosidade WHERE idSensor = 1;

-- Exibe as estufas e em qual fase ela está atualmente
SELECT 
    nome AS 'Nome da Estufa',
    dtInicio AS 'Data de Inicio',
    CASE 
        -- Se tem até 28 dias (4 semanas), é Muda
        WHEN DATEDIFF(NOW(), dtInicio) <= 28 THEN 'Mudas'
        
        -- Se tem até 60 dias (aprox. 8 semanas), é Vegetativo
        WHEN DATEDIFF(NOW(), dtInicio) <= 60 THEN 'Vegetativo'
        
        -- Passou de 60 dias, já entra em Frutificação
        ELSE 'Frutificação'
    END AS 'Fase Atual'
FROM estufa;


-- Exibir a fase da estufa e a qtd de lux necessária
SELECT 
    nome AS 'Nome da Estufa',
    dtInicio AS 'Data de Inicio',
    
    -- Verifica a fase atual
    CASE 
        WHEN DATEDIFF(NOW(), dtInicio) <= 28 THEN 'Mudas'
        WHEN DATEDIFF(NOW(), dtInicio) <= 60 THEN 'Vegetativo'
        ELSE 'Frutificação'
    END AS 'Fase Atual',
    
    -- Define a meta de Lux baseada na fase
    CASE 
        WHEN DATEDIFF(NOW(), dtInicio) <= 28 THEN 'Entre 7500 e 10000 Lux'
        WHEN DATEDIFF(NOW(), dtInicio) <= 60 THEN 'Entre 17500 e 20000 Lux'
        ELSE 'Entre 27500 e 37500 Lux'
    END AS 'Meta de Luminosidade'
FROM estufa;
