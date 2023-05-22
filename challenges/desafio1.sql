-- Create DATABASE

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS tabela_plano (
    id_plan INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(45) NOT NULL,
    plan_value DECIMAL(3 , 2 ) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS usuarios (
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(100) NOT NULL,
    user_age INT NOT NULL,
    plan_signing_date DATE NOT NULL,
    user_id_plan INT NOT NULL,
    FOREIGN KEY (user_id_plan)
        REFERENCES tabela_plano (id_plan)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tabela_artista (
    id_artist INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(100) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tabela_album (
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(100) NOT NULL,
    album_release_year INT NOT NULL,
    artist_id_album INT NOT NULL,
    FOREIGN KEY (artist_id_album)
        REFERENCES tabela_artista (id_artist)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tabela_musica (
    id_song INT PRIMARY KEY AUTO_INCREMENT,
    nome_musica VARCHAR(100) NOT NULL,
    song_duration_seconds INT NOT NULL,
    tabela_musica_id_album INT NOT NULL,
    FOREIGN KEY (tabela_musica_id_album)
        REFERENCES tabela_album (id_album)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS artista_seguido (
    id_artista INT NOT NULL,
    id_artist INT NOT NULL,    
    PRIMARY KEY (id_artista, id_artist),
    FOREIGN KEY (id_artista)
        REFERENCES usuarios (id_artista),
    FOREIGN KEY (id_artist)
        REFERENCES tabela_artista (id_artist)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tabela_historico (
    id_musica INT NOT NULL,
    playback_id_song INT NOT NULL,
    playback_date DATETIME NOT NULL,
    PRIMARY KEY (id_musica, playback_id_song),
    FOREIGN KEY (playback_id_song)
        REFERENCES tabela_musica (id_song),
    FOREIGN KEY (id_musica)
        REFERENCES usuarios (id_artista)
)ENGINE = InnoDB;

-- Insert DATA INFOR

-- SELECT * FROM tabela_artista;

INSERT INTO tabela_artista (id_artist, nome_artista) VALUES
	(1, "Beyoncé"),
	(2, "Queen"),
	(3, "Elis Regina"),
	(4, "Baco Exu do Blues"),
	(5, "Blind Guardian"),
	(6, "Nina Simone");

-- SELECT * FROM tabela_plano;

INSERT INTO tabela_plano (id_plan, nome_plano, plan_value) VALUES
	(1, "gratuito", 0),
	(2, "familiar", 7.99),
	(3, "universitário", 5.99),
	(4, "pessoal", 6.99);

-- SELECT * FROM tabela_album;

INSERT INTO tabela_album (id_album, nome_album, album_release_year, artist_id_album) VALUES
	(1, "Renaissance", 2022, 1),
	(2, "Jazz", 1978, 2),
	(3, "Hot Space", 1982, 2),
	(4, "Falso Brilhante", 1998, 3),
	(5, "Vento de Maio", 2001, 3),
	(6, "QVVJFA?", 2003, 4),
	(7, "Somewhere Far Beyond", 2007, 5),
	(8, "I Put A Spell On You", 2012, 6);

-- SELECT * FROM tabela_musica;

INSERT INTO tabela_musica (id_song, nome_musica, song_duration_seconds, tabela_musica_id_album) VALUES
	(1, "BREAK MY SOUL", 279, 1),
	(2, "VIRGO'S GROOVE", 369, 1),
	(3, "ALIEN SUPERSTAR", 116, 1),
	(4, "Don't Stop Me Now", 203, 2),
	(5, "Under Pressure", 152, 3),
	(6, "Como Nossos Pais", 105, 4),
	(7, "O Medo de Amar é o Medo de Ser Livre", 207, 5),
	(8, "Samba em Paris", 267, 6),
	(9, "The Bard's Song", 244, 7),
	(10, "Feeling Good", 100, 8);

-- SELECT * FROM usuarios;

INSERT INTO usuarios (id_artista, usuario_nome, user_age, plan_signing_date, user_id_plan) VALUES
	(1, "Barbara Liskov", 82, "2019-10-20", 1),
	(2, "Robert Cecil Martin", 58, "2017-01-06", 1),
	(3, "Ada Lovelace", 37, "2017-12-30", 2),
	(4, "Martin Fowler", 46, "2017-01-17", 2),
	(5, "Sandi Metz", 58, "2018-04-29", 2),
	(6, "Paulo Freire", 19, "2018-02-14", 3),
	(7, "Bell Hooks", 26, "2018-01-05", 3),
	(8, "Christopher Alexander", 85, "2019-06-05", 4),
	(9, "Judith Butler", 45, "2020-05-13", 4),
	(10, "Jorge Amado", 58, "2017-02-17", 4);

-- SELECT * FROM artista_seguido;

INSERT INTO artista_seguido (id_artista, id_artist) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);

-- SELECT * FROM tabela_historico;

INSERT INTO tabela_historico (id_musica, playback_id_song, playback_date) VALUES
	(1, 8, "2022-02-28 10:45:55"),
	(1, 2, "2020-05-02 05:30:35"),
	(1, 10, "2020-03-06 11:22:33"),
	(2, 10, "2022-08-05 08:05:17"),
	(2, 7, "2020-01-02 07:40:33"),
	(3, 10, "2020-11-13 16:55:13"),
	(3, 2, "2020-12-05 18:38:30"),
	(4, 8, "2021-08-15 17:10:10"),
	(5, 8, "2022-01-09 01:44:33"),
	(5, 5, "2020-08-06 15:23:43"),
	(6, 7, "2017-01-24 00:31:17"),
	(6, 1, "2017-10-12 12:35:20"),
	(7, 4, "2011-12-15 22:30:49"),
	(8, 4, "2012-03-17 14:56:41"),
	(9, 9, "2022-02-24 21:14:22"),
	(10, 3, "2015-12-13 08:30:22");