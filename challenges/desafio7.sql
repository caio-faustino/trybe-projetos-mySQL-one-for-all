-- A consulta abaixo retorna o nome do artista, o nome do álbum e o número de pessoas seguidoras de cada artista e álbum.

SELECT 
-- Seleciona o nome do artista e atribui o alias 'artista'.
    base_dados_artista.nome_artista AS artista, 
-- Seleciona o nome do álbum e atribui o alias 'album'.
    base_dados_album.nome_album AS album, 
-- Conta o número de registros na tabela 'artistas_seguidos' para cada artista e álbum e atribui o alias 'pessoas_seguidoras'.
    COUNT(base_dados_seguido.id_artista) AS pessoas_seguidoras 
FROM
-- Tabela 'artistas' é referenciada pelo alias 'base_dados_artista'.
    SpotifyClone.artistas AS base_dados_artista, 
-- Tabela 'albuns' é referenciada pelo alias 'base_dados_album'.
    SpotifyClone.albuns AS base_dados_album, 
-- Tabela 'artistas_seguidos' é referenciada pelo alias 'base_dados_seguido'.
    SpotifyClone.artistas_seguidos AS base_dados_seguido 
WHERE
-- Condição para a junção entre as tabelas usando as colunas 'id_artista' da tabela 'artistas' e 'id_album_artista' da tabela 'albuns'.
    base_dados_artista.id_artista = base_dados_album.id_album_artista 
-- Condição para a junção entre as tabelas usando as colunas 'id_artista' da tabela 'artistas_seguidos' e 'id_album_artista' da tabela 'albuns'.
        AND base_dados_seguido.id_artista = base_dados_album.id_album_artista 
-- Agrupa os resultados pelo nome do artista e do álbum.
GROUP BY artista, album 
-- Ordena os resultados em ordem decrescente de pessoas seguidoras, e, em caso de empate, em ordem ascendente pelo nome do artista e do álbum.
ORDER BY pessoas_seguidoras DESC, artista, album; 
