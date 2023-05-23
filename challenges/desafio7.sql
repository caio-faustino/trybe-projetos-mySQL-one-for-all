SELECT 
-- Seleciona a coluna "nome_artista" da tabela "artistas" e a renomeia como "artista"
    artistas_base_dados.nome_artista AS artista,
-- Seleciona a coluna "nome_album" da tabela "albuns" e a renomeia como "album" 
    album_base_dados.nome_album AS album, 
-- Conta o número de ocorrências da coluna "id_artista" da tabela "seguidor_artista" e a renomeia como "pessoas_seguidoras"
    COUNT(seguidor_base_dados.id_artista) AS pessoas_seguidoras 

FROM
-- Define a tabela "artistas" com um alias "artistas_base_dados"
    SpotifyClone.artistas AS artistas_base_dados, 
-- Define a tabela "albuns" com um alias "album_base_dados"
    SpotifyClone.albuns AS album_base_dados, 
-- Define a tabela "seguidor_artista" com um alias "seguidor_base_dados"
    SpotifyClone.seguidor_artista AS seguidor_base_dados 

WHERE
-- Aplica a condição de junção entre as tabelas "artistas" e "albuns" usando as colunas "id_artista" e "id_album_artista"
    artistas_base_dados.id_artista = album_base_dados.id_album_artista 
-- Aplica a condição de junção entre as tabelas "seguidor_artista" e "albuns" usando as colunas "id_artista" e "id_album_artista"
        AND seguidor_base_dados.id_artista = album_base_dados.id_album_artista 


-- Agrupa os resultados pelo valor das colunas "artista" e "album"
GROUP BY artista, album 
-- Ordena os resultados de forma decrescente pela coluna "pessoas_seguidoras" e, em caso de empate, pelo valor das colunas "artista" e "album"
ORDER BY pessoas_seguidoras DESC, artista, album; 
