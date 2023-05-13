 -- Desafio 01
 -- Neste passo criamos a base de dados
 
 
 DROP DATABASE IF EXISTS SpotifyClone;
 CREATE DATABASE IF NOT EXISTS SpotifyClone;
 USE SpotifyClone;

 CREATE TABLE SpotifyClone.plan(
    id_plan INT PRIMARY KEY AUTO_INCREMENT,
    type_plan VARCHAR(50) NOT NULL,
    value_plan DECIMAL(5, 2) NOT NULL
 ) engine = InnoDB;


 CREATE TABLE SpotifyClone.users(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(100) NOT NULL,
    age_user INT NOT NULL,
    signature_date DATETIME,
    id_plan INT NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES plan (id_plan)
 ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL
 ) engine = InnoDB;


  CREATE TABLE SpotifyClone.following_artists(
    id_user INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users (id_user),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
    PRIMARY KEY (id_user, artist_id)
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    album_release INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.song(
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    song_duration INT,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.playback_history(
    id_user INT NOT NULL,
    played_date DATETIME NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users (id_user),
    FOREIGN KEY (song_id) REFERENCES song (song_id),
    PRIMARY KEY (id_user, played_date, song_id)
 ) engine = InnoDB;

 INSERT INTO SpotifyClone.plan (type_plan, value_plan)
 VALUES
   ('Gratuito', 0.00),
   ('Familiar', 7.99),
   ('Universitário', 5.99),
   ('Pessoal', 6.99);

 INSERT INTO SpotifyClone.artist (artist_name)
 VALUES
   ('Nina Simone'),
   ('Blind Guardina'),
   ('Baco Exu do BLues'),
   ('Elis Regina'),   
   ('Queen'),
   ('Beyoncé');

 INSERT INTO SpotifyClone.users (name_user, age_user, signature_date, id_plan)
 VALUES
   ('Barbara Liskov', 82, '2019-10-20', 1),
   ('Robert Cecil Martin', 58, '2017-01-06', 1),
   ('Ada Lovelace', 37, '2017-12-30', 2),
   ('Martin Fowler', 46, '2017-01-17', 2),
   ('Sandi Metz', 58, '2018-04-29', 2),
   ('Paulo Freire', 19, '2018-02-14', 3),
   ('Bell Hooks', 26, '2018-01-05', 3),
   ('Christopher Alexander', 85, '2019-06-05', 4),
   ('Judith Butler', 45, '2020-05-13', 4),
   ('Jorge Amado', 58, '2017-02-17', 4);

 INSERT INTO SpotifyClone.album (album_name, album_release, artist_id)
 VALUES
   ('Renaissance', 2022, 6),
   ('Jazz', 1978, 5),
   ('Hot Space', 1982, 5),
   ('Falso Brilhante', 1998, 4),
   ('Vento de Maio', 2001, 4),
   ('QVVJFA?', 2003, 3),
   ('Somewhere Far Beyond', 2007, 2),
   ('I Put A Spell On You', 2012, 1);

 INSERT INTO SpotifyClone.song (song_name, song_duration, album_id)
 VALUES
   ('BREAK MY SOUL', 279, 1),
   ('VIRGO''S GROOVE', 369, 1),
   ('ALIEN SUPERSTAR', 116, 1),
   ('Don''t Stop Me Now', 203, 2),
   ('Under Pressure', 152, 3),
   ('Como Nossos Pais', 105, 4),
   ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
   ('Samba em Paris', 267, 6),
   ('The Bard''s Song', 244, 7),
   ('Feeling Good', 100, 8);

 INSERT INTO SpotifyClone.following_artists (id_user, artist_id)
 VALUES
   (1, 6),
   (1, 5),
   (1, 4),
   (2, 6),
   (2, 4),
   (3, 5),
   (4, 3),
   (5, 2),
   (5, 1),
   (6, 6),
   (6, 1),
   (7, 1),
   (9, 4),
   (10, 5);

 INSERT INTO SpotifyClone.playback_history (id_user, played_date, song_id)
 VALUES
   (1, '2022-02-28 10:45:55', 8),
   (1, '2020-05-02 05:30:35', 2),
   (1, '2020-03-06 11:22:33', 10),
   (2, '2022-08-05 08:05:17', 10),
   (2, '2020-01-02 07:40:33', 7),
   (3, '2020-11-13 16:55:13', 10),
   (3, '2020-12-05 18:38:30', 2),
   (4, '2021-08-15 17:10:10', 8),
   (5, '2022-01-09 01:44:33', 8),
   (5, '2020-08-06 15:23:43', 5),
   (6, '2017-01-24 00:31:17', 7),
   (6, '2017-10-12 12:35:20', 1),
   (7, '2011-12-15 22:30:49', 4),
   (8, '2012-03-17 14:56:41', 4),
   (9, '2022-02-24 21:14:22', 9),
   (10,'2015-12-13 08:30:22', 3);