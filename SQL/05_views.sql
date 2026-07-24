/*
====================================================
Projeto: CICAP BI Dashboard
Autor: Raphael Angenendt

Descrição:
Criação de Views para consolidar informações e
facilitar consultas analíticas utilizadas no
dashboard desenvolvido no Power BI.

Versão: 1.0
====================================================
*/

/*
====================================================
Ranking dos recolhistas
====================================================
*/

CREATE VIEW vw_ranking_recolhistas AS
SELECT
    recolhista,
    COUNT(*) AS total_coletas,
    SUM(quantidade_casos) AS total_casos,
    SUM(quantidade_coletado) AS total_itens
FROM coletas
GROUP BY recolhista;


/*
====================================================
Ranking dos setores
====================================================
*/

CREATE VIEW vw_ranking_setores AS
SELECT
    setor,
    COUNT(*) AS total_coletas,
    SUM(quantidade_casos) AS total_casos,
    SUM(quantidade_coletado) AS total_itens
FROM coletas
GROUP BY setor;

/*
====================================================
Itens coletados
====================================================
*/

CREATE VIEW vw_itens AS
SELECT
    item_coletado,
    SUM(quantidade_coletado) AS quantidade
FROM coletas
GROUP BY item_coletado;

/*
====================================================
Coletas por dia
====================================================
*/

CREATE VIEW vw_coletas_dia AS
SELECT
    LEFT(data_coleta,11) AS dia,
    COUNT(*) AS total_coletas,
    SUM(quantidade_casos) AS total_casos
FROM coletas
GROUP BY LEFT(data_coleta,11);