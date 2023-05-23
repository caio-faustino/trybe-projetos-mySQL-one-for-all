SELECT
	album_base_dados.nome_album AS album,
    COUNT(musicas_base_dados.song_name) AS favoritadas
FROM
	SpotifyClone.albums AS album_base_dados,
    SpotifyClone.songs AS musicas_base_dados,
    SpotifyClone.favorite_songs AS favoritebd 
WHERE
    favoritebd.id_song = musicas_base_dados.id_song
    AND musicas_base_dados.songs_id_album = album_base_dados.id_album
GROUP BY album
ORDER BY favoritadas DESC
LIMIT 3;