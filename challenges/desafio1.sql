-- Criação do banco de dados SpotifyClone
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

-- Criação da tabela planos
CREATE TABLE IF NOT EXISTS planos (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(45) NOT NULL,
    valor_plano DECIMAL(3, 2) NOT NULL
) ENGINE = InnoDB;

-- Criação da tabela usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(100) NOT NULL,
    idade_usuario INT NOT NULL,
    data_assinatura_plano DATE NOT NULL,
    id_plano_usuario INT NOT NULL,
    FOREIGN KEY (id_plano_usuario)
        REFERENCES planos (id_plano)
) ENGINE = InnoDB;

-- Criação da tabela artistas
CREATE TABLE IF NOT EXISTS artistas (
    id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

-- Criação da tabela albuns
CREATE TABLE IF NOT EXISTS albuns (
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(100) NOT NULL,
    data_lancamento_album INT NOT NULL,
    id_album_artista INT NOT NULL,
    FOREIGN KEY (id_album_artista)
        REFERENCES artistas (id_artista)
) ENGINE = InnoDB;

-- Criação da tabela musicas
CREATE TABLE IF NOT EXISTS musicas (
    id_musica INT PRIMARY KEY AUTO_INCREMENT,
    nome_musica VARCHAR(100) NOT NULL,
    duracao_musica_sec INT NOT NULL,
    id_album_musicas INT NOT NULL,
    FOREIGN KEY (id_album_musicas)
        REFERENCES albuns (id_album)
) ENGINE = InnoDB;

-- Criação da tabela artistas_seguidos
CREATE TABLE IF NOT EXISTS artistas_seguidos (
    id_usuario INT NOT NULL,
    id_artista INT NOT NULL,
    PRIMARY KEY (id_usuario, id_artista),
    FOREIGN KEY (id_usuario)
        REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_artista)
        REFERENCES artistas (id_artista)
) ENGINE = InnoDB;

-- Criação da tabela historico_reproducao
CREATE TABLE IF NOT EXISTS historico_reproducao (
    id_reproducao_usuario INT NOT NULL,
    id_historico_reproducao_musica INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (id_reproducao_usuario, id_historico_reproducao_musica),
    FOREIGN KEY (id_historico_reproducao_musica)
        REFERENCES musicas (id_musica),
    FOREIGN KEY (id_reproducao_usuario)
        REFERENCES usuarios (id_usuario)
) ENGINE = InnoDB;

-- Inserção de dados na tabela artistas
INSERT INTO artistas (id_artista, nome_artista) VALUES
    (1, "Beyoncé"),
    (2, "Queen"),
    (3, "Elis Regina"),
    (4, "Baco Exu do Blues"),
    (5, "Blind Guardian"),
    (6, "Nina Simone");

-- Inserção de dados na tabela planos
INSERT INTO planos (id_plano, nome_plano, valor_plano) VALUES
    (1, "gratuito", 0),
    (2, "familiar", 7.99),
    (3, "universitário", 5.99),
    (4, "pessoal", 6.99);

-- Inserção de dados na tabela albuns
INSERT INTO albuns (id_album, nome_album, data_lancamento_album, id_album_artista) VALUES
    (1, "Renaissance", 2022, 1),
    (2, "Jazz", 1978, 2),
    (3, "Hot Space", 1982, 2),
    (4, "Falso Brilhante", 1998, 3),
    (5, "Vento de Maio", 2001, 3),
    (6, "QVVJFA?", 2003, 4),
    (7, "Somewhere Far Beyond", 2007, 5),
    (8, "I Put A Spell On You", 2012, 6);

-- Inserção de dados na tabela musicas
INSERT INTO musicas (id_musica, nome_musica, duracao_musica_sec, id_album_musicas) VALUES
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

-- Inserção de dados na tabela usuarios
INSERT INTO usuarios (id_usuario, nome_usuario, idade_usuario, data_assinatura_plano, id_plano_usuario) VALUES
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

-- Inserção de dados na tabela artistas_seguidos
INSERT INTO artistas_seguidos (id_usuario, id_artista) VALUES
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

-- Inserção de dados na tabela historico_reproducao
INSERT INTO historico_reproducao (id_reproducao_usuario, id_historico_reproducao_musica, data_reproducao) VALUES
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
