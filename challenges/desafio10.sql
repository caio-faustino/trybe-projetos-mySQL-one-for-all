DROP TABLE IF EXISTS favorite_songs;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS favorite_songs (
	id_usuario INT NOT NULL,
	id_musica INT NOT NULL,    
	PRIMARY KEY (id_usuario, id_musica),
	FOREIGN KEY (id_usuario)
		REFERENCES users (id_usuario),
	FOREIGN KEY (id_musica)
		REFERENCES songs (id_musica)
)ENGINE = InnoDB;

INSERT INTO favorite_songs (id_usuario, id_musica) VALUES
	(1, 3),
	(1, 6),
	(1, 10),
	(2, 4),
	(3, 1),
	(3, 3),
	(4, 4),
	(4, 7),
	(5, 2),
	(5, 10),
	(8, 4),
	(9, 7),
	(10, 3);