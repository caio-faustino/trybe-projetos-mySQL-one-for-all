-- A consulta abaixo retorna o nome do artista e o ranking de popularidade com base na contagem de músicas favoritas.

SELECT 
-- Seleciona o nome do artista e atribui o alias 'artista'.
    base_dados_artista.nome_artista AS artista, 
    CASE
-- Se a contagem de músicas favoritas estiver entre 1 e 2, atribui o ranking 'C'.
        WHEN COUNT(base_dados_favoritos.id_musica) IN (1 , 2) THEN 'C' 
-- Se a contagem de músicas favoritas estiver entre 3 e 4, atribui o ranking 'B'.
        WHEN COUNT(base_dados_favoritos.id_musica) IN (3 , 4) THEN 'B' 
-- Se a contagem de músicas favoritas for igual ou maior que 5, atribui o ranking 'A'.
        WHEN COUNT(base_dados_favoritos.id_musica) >= 5 THEN 'A' 
-- Caso contrário, atribui '-' como ranking.
        ELSE '-' 
-- Atribui o alias 'ranking' para a expressão CASE.
    END AS ranking 

FROM
-- Tabela 'musicas_favoritas' é referenciada pelo alias 'base_dados_favoritos'.
    SpotifyClone.musicas_favoritas AS base_dados_favoritos 
        JOIN
-- Condição de junção: igualdade entre a coluna 'id_musica' da tabela 'musicas_favoritas' e a coluna 'id_musica' da tabela 'musicas'.
    SpotifyClone.musicas AS base_dados_musica ON base_dados_favoritos.id_musica = base_dados_musica.id_musica 
        JOIN
-- Condição de junção: igualdade entre a coluna 'id_album' da tabela 'albuns' e a coluna 'id_album_musicas' da tabela 'musicas'.
    SpotifyClone.albuns AS base_dados_album ON base_dados_album.id_album = base_dados_musica.id_album_musicas 
        RIGHT JOIN
-- Condição de junção: igualdade entre a coluna 'id_artista' da tabela 'artistas' e a coluna 'id_album_artista' da tabela 'albuns'.
    SpotifyClone.artistas AS base_dados_artista ON base_dados_artista.id_artista = base_dados_album.id_album_artista 
-- Agrupa os resultados pelo nome do artista.
GROUP BY artista 
-- Ordena os resultados em ordem descendente pela contagem de músicas favoritas e em ordem ascendente pelo nome do artista.
ORDER BY COUNT(base_dados_favoritos.id_musica) DESC , artista; 
