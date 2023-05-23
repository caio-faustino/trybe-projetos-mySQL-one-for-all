SELECT 
-- Seleciona a coluna "nome_musica" da tabela "musicas_base_dados" e atribui um alias "cancao" ao resultado
    musicas_base_dados.nome_musica AS cancao, 
-- Conta o número de ocorrências da coluna "id_musica_historico" da tabela "historico_base_dados" e atribui um alias "reproducoes" ao resultado
    COUNT(historico_base_dados.id_musica_historico) AS reproducoes 
FROM
-- Especifica a tabela "musicas" da base de dados "SpotifyClone" e atribui um alias "musicas_base_dados"
    SpotifyClone.musicas AS musicas_base_dados 
-- Realiza uma junção interna entre a tabela "musicas_base_dados" e a tabela "historico_base_dados" com base na condição de igualdade entre as colunas "id_musica" e "id_musica_historico"
    INNER JOIN SpotifyClone.historico_reproducao AS historico_base_dados ON musicas_base_dados.id_musica = historico_base_dados.id_musica_historico
-- Agrupa os resultados pela coluna "cancao"
GROUP BY cancao 
-- Ordena os resultados em ordem descendente com base na coluna "reproducoes" e em ordem ascendente com base na coluna "cancao"
ORDER BY reproducoes DESC, cancao ASC 
-- Limita o número de resultados retornados para 2
LIMIT 2; 
