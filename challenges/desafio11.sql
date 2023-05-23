-- A consulta abaixo retorna o nome do álbum e a contagem de músicas favoritadas desse álbum.

SELECT
-- Seleciona o nome do álbum e atribui o alias 'album'.
	base_dados_album.nome_album AS album, 
-- Conta a quantidade de músicas favoritadas desse álbum e atribui o alias 'favoritadas'.
    COUNT(base_dados_musica.nome_musica) AS favoritadas 
FROM
-- Tabela 'albuns' é referenciada pelo alias 'base_dados_album'.
	SpotifyClone.albuns AS base_dados_album, 
-- Tabela 'musicas' é referenciada pelo alias 'base_dados_musica'.
    SpotifyClone.musicas AS base_dados_musica, 
-- Tabela 'musicas_favoritas' é referenciada pelo alias 'base_dados_favoritos'.
    SpotifyClone.musicas_favoritas AS base_dados_favoritos 
WHERE
-- Condição de junção: igualdade entre a coluna 'id_musica' da tabela 'musicas_favoritas' e a coluna 'id_musica' da tabela 'musicas'.
    base_dados_favoritos.id_musica = base_dados_musica.id_musica 
-- Condição de junção: igualdade entre a coluna 'id_album_musicas' da tabela 'musicas' e a coluna 'id_album' da tabela 'albuns'.
    AND base_dados_musica.id_album_musicas = base_dados_album.id_album 
GROUP BY album -- Agrupa os resultados pelo nome do álbum.
-- Ordena os resultados em ordem descendente pela contagem de músicas favoritadas.
ORDER BY favoritadas DESC 
-- Limita o número de resultados a 3.
LIMIT 3; 
