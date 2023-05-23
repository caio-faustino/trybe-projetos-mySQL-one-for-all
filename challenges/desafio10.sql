-- O código abaixo cria uma tabela chamada 'musicas_favoritas' no banco de dados 'SpotifyClone' e insere dados nessa tabela.

DROP TABLE IF EXISTS musicas_favoritas; -- Exclui a tabela 'musicas_favoritas', caso ela exista.
USE SpotifyClone; -- Define o banco de dados 'SpotifyClone' como o banco de dados atual.

CREATE TABLE IF NOT EXISTS musicas_favoritas (
	id_usuario INT NOT NULL, -- Define a coluna 'id_usuario' como inteiro e não nula.
	id_musica INT NOT NULL, -- Define a coluna 'id_musica' como inteiro e não nula.
	PRIMARY KEY (id_usuario, id_musica), -- Define a combinação das colunas 'id_usuario' e 'id_musica' como chave primária.
	FOREIGN KEY (id_usuario) -- Define uma chave estrangeira para a coluna 'id_usuario', referenciando a tabela 'usuarios' e sua coluna 'id_usuario'.
		REFERENCES usuarios (id_usuario),
	FOREIGN KEY (id_musica) -- Define uma chave estrangeira para a coluna 'id_musica', referenciando a tabela 'musicas' e sua coluna 'id_musica'.
		REFERENCES musicas (id_musica)
) ENGINE = InnoDB; -- Define o mecanismo de armazenamento da tabela como InnoDB.

INSERT INTO musicas_favoritas (id_usuario, id_musica) VALUES
	(1, 3), -- Insere um registro com 'id_usuario' = 1 e 'id_musica' = 3.
	(1, 6), -- Insere um registro com 'id_usuario' = 1 e 'id_musica' = 6.
	(1, 10), -- Insere um registro com 'id_usuario' = 1 e 'id_musica' = 10.
	(2, 4), -- Insere um registro com 'id_usuario' = 2 e 'id_musica' = 4.
	(3, 1), -- Insere um registro com 'id_usuario' = 3 e 'id_musica' = 1.
	(3, 3), -- Insere um registro com 'id_usuario' = 3 e 'id_musica' = 3.
	(4, 4), -- Insere um registro com 'id_usuario' = 4 e 'id_musica' = 4.
	(4, 7), -- Insere um registro com 'id_usuario' = 4 e 'id_musica' = 7.
	(5, 2), -- Insere um registro com 'id_usuario' = 5 e 'id_musica' = 2.
	(5, 10), -- Insere um registro com 'id_usuario' = 5 e 'id_musica' = 10.
	(8, 4), -- Insere um registro com 'id_usuario' = 8 e 'id_musica' = 4.
	(9, 7), -- Insere um registro com 'id_usuario' = 9 e 'id_musica' = 7.
	(10, 3); -- Insere um registro com 'id_usuario' = 10 e 'id_musica' = 3.
