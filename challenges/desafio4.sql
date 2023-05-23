SELECT 
-- Seleciona a coluna "nome_usuario" da tabela "usuario_base_dados" e atribui um alias "pessoa_usuaria" ao resultado
    usuario_base_dados.nome_usuario AS pessoa_usuaria, 
-- Verifica se o ano máximo da coluna "data_reproducao" da tabela "historico_base_dados" é maior ou igual a 2021. Se for, atribui o valor 'Ativa', caso contrário, atribui o valor 'Inativa'. O resultado é atribuído ao alias "status_pessoa_usuaria"
    IF(YEAR(MAX(historico_base_dados.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria 
FROM
-- Especifica a tabela "usuario" da base de dados "SpotifyClone" e atribui um alias "usuario_base_dados"
    SpotifyClone.usuario AS usuario_base_dados 
-- Realiza uma junção interna entre a tabela "usuario_base_dados" e a tabela "historico_base_dados" com base na condição de igualdade entre as colunas "id_usuario_historico" e "id_usuario"
    INNER JOIN SpotifyClone.historico_reproducao AS historico_base_dados ON historico_base_dados.id_usuario_historico = usuario_base_dados.id_usuario 
-- Agrupa os resultados pelo alias "pessoa_usuaria"
GROUP BY pessoa_usuaria 
-- Ordena os resultados em ordem ascendente com base no alias "pessoa_usuaria"
ORDER BY pessoa_usuaria ASC; 
