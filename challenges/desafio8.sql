SELECT 
-- Seleciona a coluna "nome_artista" da tabela "artistas" e a renomeia como "artista"
    artistas_base_dados.nome_artista AS artista,
-- Seleciona a coluna "nome_album" da tabela "albuns" e a renomeia como "album" 
    album_base_dados.nome_album AS album 
FROM
-- Define a tabela "artistas" com um alias "artistas_base_dados"
    SpotifyClone.artistas AS artistas_base_dados,
-- Define a tabela "albuns" com um alias "album_base_dados" 
    SpotifyClone.albuns AS album_base_dados 
WHERE
-- Aplica a condição de junção entre as tabelas "artistas" e "albuns" usando as colunas "id_artista" e "id_album_artista"
    artistas_base_dados.id_artista = album_base_dados.id_album_artista 
-- Aplica a condição de filtragem onde o valor da coluna "nome_artista" da tabela "artistas" é igual a "Elis Regina"
        AND artistas_base_dados.nome_artista = "Elis Regina"; 
