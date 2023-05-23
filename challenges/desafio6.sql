-- Seleciona o valor mínimo do faturamento e atribui à coluna "faturamento_minimo"
SELECT MIN(plano_base_dados.valor_plano) AS faturamento_minimo,

-- Seleciona o valor máximo do faturamento e atribui à coluna "faturamento_maximo"
       MAX(plano_base_dados.valor_plano) AS faturamento_maximo,

-- Calcula a média do faturamento, arredondada para duas casas decimais, e atribui à coluna "faturamento_medio"
       ROUND(AVG(plano_base_dados.valor_plano), 2) AS faturamento_medio,

-- Calcula a soma total do faturamento e atribui à coluna "faturamento_total"
       SUM(plano_base_dados.valor_plano) AS faturamento_total
       
-- Define a tabela principal da consulta como "SpotifyClone.usuario" com alias "usuario_base_dados"
FROM SpotifyClone.usuario AS usuario_base_dados

-- Realiza uma junção interna (INNER JOIN) com a tabela "SpotifyClone.planos" com alias "plano_base_dados"
-- A junção é feita utilizando a coluna "id_plano_usuario" da tabela "usuario" e a coluna "id_plano" da tabela "planos"
INNER JOIN SpotifyClone.planos AS plano_base_dados ON usuario_base_dados.id_plano_usuario = plano_base_dados.id_plano;
