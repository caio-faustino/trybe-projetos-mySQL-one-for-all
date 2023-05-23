-- A consulta abaixo retorna informações sobre o faturamento dos planos de usuários.

SELECT 
-- Seleciona o valor mínimo do plano e atribui o alias 'faturamento_minimo'.
    MIN(base_dados_plano.valor_plano) AS faturamento_minimo, 
-- Seleciona o valor máximo do plano e atribui o alias 'faturamento_maximo'.
    MAX(base_dados_plano.valor_plano) AS faturamento_maximo, 
-- Calcula o valor médio do plano, arredondado para 2 casas decimais, e atribui o alias 'faturamento_medio'.
    ROUND(AVG(base_dados_plano.valor_plano), 2) AS faturamento_medio, 
-- Calcula o valor total do faturamento somando todos os valores do plano e atribui o alias 'faturamento_total'.
    SUM(base_dados_plano.valor_plano) AS faturamento_total 
FROM
-- Tabela 'usuarios' é referenciada pelo alias 'base_dados_usuario'.
    SpotifyClone.usuarios AS base_dados_usuario 
        INNER JOIN
-- Realiza um join interno entre as tabelas 'usuarios' e 'planos' utilizando a coluna 'id_plano_usuario' da tabela 'usuarios' e 'id_plano' da tabela 'planos'.
    SpotifyClone.planos AS base_dados_plano ON base_dados_usuario.id_plano_usuario = base_dados_plano.id_plano; 
