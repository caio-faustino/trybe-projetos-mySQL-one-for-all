-- A consulta abaixo retorna as duas músicas mais reproduzidas, juntamente com o número de reproduções de cada uma.

SELECT 
-- Seleciona o nome da música e atribui o alias 'cancao'.
    base_dados_musica.nome_musica AS cancao, 
-- Conta o número de registros no histórico de reprodução para cada música e atribui o alias 'reproducoes'.
    COUNT(base_dados_reproducao.id_historico_reproducao_musica) AS reproducoes 
FROM
-- Tabela 'musicas' é referenciada pelo alias 'base_dados_musica'.
    SpotifyClone.musicas AS base_dados_musica 
        INNER JOIN
-- Tabela 'historico_reproducao' é referenciada pelo alias 'base_dados_reproducao'.
    SpotifyClone.historico_reproducao AS base_dados_reproducao 
-- Realiza o inner join entre as tabelas utilizando a coluna 'id_musica' da tabela 'musicas' e 'id_historico_reproducao_musica' da tabela 'historico_reproducao'.
        ON base_dados_musica.id_musica = base_dados_reproducao.id_historico_reproducao_musica 
-- Agrupa os resultados pelo nome da música.
GROUP BY cancao 
-- Ordena os resultados em ordem decrescente de reproduções e, em caso de empate, em ordem ascendente pelo nome da música.
ORDER BY reproducoes DESC, cancao ASC 
-- Limita o resultado a duas linhas.
LIMIT 2; 
