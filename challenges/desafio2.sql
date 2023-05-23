-- A consulta abaixo retorna a contagem de músicas distintas, artistas distintos e álbuns distintos.

SELECT 
-- Conta a quantidade de músicas distintas e atribui o alias 'cancoes'.
    COUNT(DISTINCT id_musica) AS cancoes, 
-- Conta a quantidade de artistas distintos e atribui o alias 'artistas'.
    COUNT(DISTINCT id_artista) AS artistas, 
-- Conta a quantidade de álbuns distintos e atribui o alias 'albuns'.
    COUNT(DISTINCT id_album) AS albuns 
FROM
-- Tabela 'musicas' é referenciada.
    SpotifyClone.musicas, 
-- Tabela 'artistas' é referenciada.
    SpotifyClone.artistas, 
-- Tabela 'albuns' é referenciada.
    SpotifyClone.albuns; 
