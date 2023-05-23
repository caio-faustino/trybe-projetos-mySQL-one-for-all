-- A consulta abaixo retorna o número de músicas no histórico de reprodução de um usuário específico.

SELECT 
-- Conta o número de registros no histórico de reprodução para o usuário e atribui o alias 'musicas_no_historico'.
    COUNT(base_dados_reproducao.id_historico_reproducao_musica) AS musicas_no_historico 
FROM
-- Tabela 'historico_reproducao' é referenciada pelo alias 'base_dados_reproducao'.
    SpotifyClone.historico_reproducao AS base_dados_reproducao, 
-- Tabela 'usuarios' é referenciada pelo alias 'base_dados_usuario'.
    SpotifyClone.usuarios AS base_dados_usuario 
WHERE
-- Condição para a junção entre as tabelas usando as colunas 'id_reproducao_usuario' da tabela 'historico_reproducao' e 'id_usuario' da tabela 'usuarios'.
    base_dados_reproducao.id_reproducao_usuario = base_dados_usuario.id_usuario 
-- Condição para filtrar os registros onde o nome do usuário é 'Barbara Liskov'.
        AND base_dados_usuario.nome_usuario = 'Barbara Liskov'; 
