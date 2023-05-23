-- A consulta abaixo retorna o nome dos usuários e seu status de atividade com base na última data de reprodução.

SELECT 
-- Seleciona o nome do usuário e atribui o alias 'pessoa_usuaria'.
    base_dados_usuario.nome_usuario AS pessoa_usuaria, 
-- Verifica se o ano da última data de reprodução é maior ou igual a 2021.
    IF(YEAR(MAX(data_reproducao)) >= 2021, 
        'Ativa', -- Se a condição for verdadeira, atribui o valor 'Ativa' ao status da pessoa usuária.
        'Inativa') AS status_pessoa_usuaria -- Se a condição for falsa, atribui o valor 'Inativa' ao status da pessoa usuária.
FROM
-- Tabela 'usuarios' é referenciada pelo alias 'base_dados_usuario'.
    SpotifyClone.usuarios AS base_dados_usuario 
        INNER JOIN
-- Realiza um join interno entre as tabelas 'usuarios' e 'historico_reproducao' utilizando a coluna 'id_reproducao_usuario' da tabela 'historico_reproducao' e 'id_usuario' da tabela 'usuarios'.
    SpotifyClone.historico_reproducao AS base_dados_reproducao ON base_dados_reproducao.id_reproducao_usuario = base_dados_usuario.id_usuario 
-- Agrupa os resultados pelo nome do usuário.
GROUP BY pessoa_usuaria 
-- Ordena os resultados em ordem ascendente pelo nome do usuário.
ORDER BY pessoa_usuaria ASC; 
