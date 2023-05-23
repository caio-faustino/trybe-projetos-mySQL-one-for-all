SELECT 
    artistbd.artist_name AS artista,
    CASE
        WHEN COUNT(favoritebd.id_song) IN (1 , 2) THEN 'C'
        WHEN COUNT(favoritebd.id_song) IN (3 , 4) THEN 'B'
        WHEN COUNT(favoritebd.id_song) >= 5 THEN 'A'
        ELSE '-'
    END AS ranking
FROM
    SpotifyClone.favorite_songs AS favoritebd
        JOIN
    SpotifyClone.songs AS musicas_base_dados ON favoritebd.id_song = musicas_base_dados.id_song
        JOIN
    SpotifyClone.albums AS album_base_dados ON album_base_dados.id_album = musicas_base_dados.songs_id_album
        RIGHT JOIN
    SpotifyClone.artists AS artistbd ON artistbd.id_artist = album_base_dados.artist_id_album
GROUP BY artista
ORDER BY COUNT(favoritebd.id_song) DESC , artista;