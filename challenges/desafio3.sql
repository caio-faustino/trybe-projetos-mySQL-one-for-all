SELECT 
-- Seleciona a coluna "nome_usuario" e atribui um alias "pessoa_usuaria" ao resultado
    nome_usuario AS pessoa_usuaria, 
-- Conta a quantidade de ocorrências da coluna "id_musica_historico" da tabela "historico_base_dados" e atribui um alias "musicas_ouvidas" ao resultado
    COUNT(historico_base_dados.id_musica_historico) AS musicas_ouvidas, 
-- Calcula a soma da coluna "duracao_musica_sec" da tabela "musicas_base_dados", divide por 60 e arredonda para duas casas decimais. Atribui um alias "total_minutos" ao resultado
    ROUND(SUM(duracao_musica_sec) / 60, 2) AS total_minutos 
FROM
-- Especifica a tabela "usuario" da base de dados "SpotifyClone" e atribui um alias "usuario_base_dados"
    SpotifyClone.usuario AS usuario_base_dados, 
-- Especifica a tabela "historico_reproducao" da base de dados "SpotifyClone" e atribui um alias "historico_base_dados"
    SpotifyClone.historico_reproducao AS historico_base_dados, 
-- Especifica a tabela "musicas" da base de dados "SpotifyClone" e atribui um alias "musicas_base_dados"
    SpotifyClone.musicas AS musicas_base_dados 
WHERE
-- Define a condição de junção entre a coluna "id_usuario_historico" da tabela "historico_base_dados" e a coluna "id_usuario" da tabela "usuario_base_dados"
    historico_base_dados.id_usuario_historico = usuario_base_dados.id_usuario 
-- Define a condição de junção entre a coluna "id_musica_historico" da tabela "historico_base_dados" e a coluna "id_musica" da tabela "musicas_base_dados"
        AND historico_base_dados.id_musica_historico = musicas_base_dados.id_musica 
-- Agrupa os resultados pelo alias "pessoa_usuaria"
GROUP BY pessoa_usuaria 
-- Ordena os resultados em ordem ascendente com base no alias "pessoa_usuaria"
ORDER BY pessoa_usuaria ASC; 
