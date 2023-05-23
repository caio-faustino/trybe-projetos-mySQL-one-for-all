SELECT 
-- Conta a quantidade de valores distintos na coluna "id_musica" da tabela "musicas" e atribui um alias "cancoes" ao resultado
    COUNT(DISTINCT id_musica) AS cancoes, 
-- Conta a quantidade de valores distintos na coluna "id_artista" da tabela "artistas" e atribui um alias "artistas" ao resultado
    COUNT(DISTINCT id_artista) AS artistas,
-- Conta a quantidade de valores distintos na coluna "id_album" da tabela "albuns" e atribui um alias "albuns" ao resultado 
    COUNT(DISTINCT id_album) AS albuns 
FROM
-- Especifica a tabela "musicas" da base de dados "SpotifyClone"
    SpotifyClone.musicas, 
-- Especifica a tabela "artistas" da base de dados "SpotifyClone"
    SpotifyClone.artistas, 
-- Especifica a tabela "albuns" da base de dados "SpotifyClone"
    SpotifyClone.albuns; 
