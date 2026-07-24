/*
====================================================
Projeto: CICAP BI Dashboard
Autor: Raphael Angenendt

Descrição:
Consultas SQL utilizadas para análise dos dados,
geração de indicadores de desempenho e validação
das informações apresentadas no dashboard.

Versão: 1.0
====================================================
*/


/*
====================================================
Total de coletas
====================================================
*/

SELECT COUNT(*) AS total_coletas
FROM coletas;


/*
====================================================
Total de casos
====================================================
*/


SELECT SUM(quantidade_casos) AS total_casos
FROM coletas;


/*
====================================================
Ranking dos recolhistas
====================================================
*/

SELECT
    recolhista,
    COUNT(*) AS total_coletas,
    SUM(quantidade_casos) AS total_casos
FROM coletas
GROUP BY recolhista
ORDER BY total_coletas DESC;

/*
====================================================
Ranking dos setores
====================================================
*/

SELECT
    setor,
    COUNT(*) AS total_coletas,
    SUM(quantidade_casos) AS total_casos
FROM coletas
GROUP BY setor
ORDER BY total_coletas DESC;

/*
====================================================
Itens mais coletados
====================================================
*/


SELECT
    item_coletado,
    SUM(quantidade_coletado) AS quantidade_itens
FROM coletas
GROUP BY item_coletado
ORDER BY quantidade_itens DESC;

/*
====================================================
Tempo médio de rechecagem
====================================================
*/

SELECT
    ROUND(AVG(tempo_rechecagem_min),2) AS tempo_medio
FROM coletas;

/*
====================================================
Tempo médio por recolhista
====================================================
*/

SELECT
    recolhista,
    ROUND(AVG(tempo_rechecagem_min),2) AS tempo_medio
FROM coletas
GROUP BY recolhista
ORDER BY tempo_medio;

/*
====================================================
Casos por turno
====================================================
*/

SELECT
    turno,
    SUM(quantidade_casos) AS total_casos
FROM coletas
GROUP BY turno;


