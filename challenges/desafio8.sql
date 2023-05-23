-- A consulta abaixo retorna o nome do artista e o nome do álbum de um determinado artista.

SELECT 
-- Seleciona o nome do artista e atribui o alias 'artista'.
    base_dados_artista.nome_artista AS artista, 
-- Seleciona o nome do álbum e atribui o alias 'album'.
    base_dados_album.nome_album AS album 
FROM
-- Tabela 'artistas' é referenciada pelo alias 'base_dados_artista'.
    SpotifyClone.artistas AS base_dados_artista, 
-- Tabela 'albuns' é referenciada pelo alias 'base_dados_album'.
    SpotifyClone.albuns AS base_dados_album 
WHERE
-- Condição para a junção entre as tabelas usando as colunas 'id_artista' da tabela 'artistas' e 'id_album_artista' da tabela 'albuns'.
    base_dados_artista.id_artista = base_dados_album.id_album_artista 
-- Condição para filtrar os registros onde o nome do artista é "Elis Regina".
        AND base_dados_artista.nome_artista = "Elis Regina"; 
