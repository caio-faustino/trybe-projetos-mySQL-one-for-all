SELECT 
-- Conta o número de ocorrências do campo "id_musica_historico" na tabela "historico_reproducao" e atribui um alias "musicas_no_historico" ao resultado
    COUNT(historico_base_dados.id_musica_historico) AS musicas_no_historico 
FROM
-- Define a tabela "historico_reproducao" com um alias "historico_base_dados"
    SpotifyClone.historico_reproducao AS historico_base_dados, 
-- Define a tabela "usuario" com um alias "usuario_base_dados"
    SpotifyClone.usuario AS usuario_base_dados 
WHERE
-- Aplica a condição de junção entre as tabelas "historico_reproducao" e "usuario" usando as colunas "id_usuario_historico" e "id_usuario"
    historico_base_dados.id_usuario_historico = usuario_base_dados.id_usuario 
-- Aplica a condição de filtragem onde o valor da coluna "nome_usuario" da tabela "usuario" é igual a 'Barbara Liskov'
        AND usuario_base_dados.nome_usuario = 'Barbara Liskov'; 
