-- A consulta abaixo retorna o nome dos usuários, a quantidade de músicas ouvidas por cada um e o total de minutos ouvidos.

SELECT 
-- Seleciona o nome do usuário e atribui o alias 'pessoa_usuaria'.
    nome_usuario AS pessoa_usuaria, 
-- Conta o número de registros de reprodução de música para cada usuário e atribui o alias 'musicas_ouvidas'.
    COUNT(base_dados_reproducao.id_historico_reproducao_musica) AS musicas_ouvidas, 
-- Calcula o total de minutos ouvidos por cada usuário, convertendo a duração das músicas de segundos para minutos, e atribui o alias 'total_minutos'.
    ROUND(SUM(duracao_musica_sec) / 60, 2) AS total_minutos 
FROM
-- Tabela 'usuarios' é referenciada pelo alias 'base_dados_usuario'.
    SpotifyClone.usuarios AS base_dados_usuario, 
-- Tabela 'historico_reproducao' é referenciada pelo alias 'base_dados_reproducao'.
    SpotifyClone.historico_reproducao AS base_dados_reproducao, 
-- Tabela 'musicas' é referenciada pelo alias 'base_dados_musica'.
    SpotifyClone.musicas AS base_dados_musica 
WHERE
-- Condição de junção: igualdade entre a coluna 'id_reproducao_usuario' da tabela 'historico_reproducao' e a coluna 'id_usuario' da tabela 'usuarios'.
    base_dados_reproducao.id_reproducao_usuario = base_dados_usuario.id_usuario 
-- Condição de junção: igualdade entre a coluna 'id_historico_reproducao_musica' da tabela 'historico_reproducao' e a coluna 'id_musica' da tabela 'musicas'.
        AND base_dados_reproducao.id_historico_reproducao_musica = base_dados_musica.id_musica 
-- Agrupa os resultados pelo nome do usuário.
GROUP BY pessoa_usuaria 
-- Ordena os resultados em ordem ascendente pelo nome do usuário.
ORDER BY pessoa_usuaria ASC; 
