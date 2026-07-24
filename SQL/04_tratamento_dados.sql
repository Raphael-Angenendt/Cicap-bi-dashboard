/*
====================================================
Projeto: CICAP BI Dashboard
Autor: Raphael Angenendt

Descrição:
Tratamento dos dados importados, incluindo conversão
de datas, criação de colunas calculadas e classificação
das coletas por turno.

Versão: 1.0
====================================================
*/


/*
====================================================
Adicionar colunas de data
====================================================
*/

ALTER TABLE coletas
ADD COLUMN data_coleta_dt DATETIME,
ADD COLUMN data_rechecagem_dt DATETIME;

/*
====================================================
Converter texto para DATETIME
====================================================
*/

UPDATE coletas
SET
data_coleta_dt = STR_TO_DATE(
    LEFT(data_coleta,20),
    '%d %b %Y %H:%i:%s'
),
data_rechecagem_dt = STR_TO_DATE(
    LEFT(data_rechecagem,20),
    '%d %b %Y %H:%i:%s'
)
WHERE id > 0;

/*
====================================================
Criar tempo de rechecagem
====================================================
*/


ALTER TABLE coletas
ADD COLUMN tempo_rechecagem_min INT;

/*
====================================================
Calcular tempo
====================================================
*/

UPDATE coletas
SET tempo_rechecagem_min =
TIMESTAMPDIFF(
    MINUTE,
    data_coleta_dt,
    data_rechecagem_dt
)
WHERE id > 0;

/*
====================================================
Hora da coleta
====================================================
*/

ALTER TABLE coletas
ADD COLUMN hora_coleta TIME;

UPDATE coletas
SET hora_coleta = TIME(data_coleta_dt)
WHERE id > 0;

/*
====================================================
Turno
====================================================
*/

ALTER TABLE coletas
ADD COLUMN turno VARCHAR(20);

UPDATE coletas
SET turno =
CASE
    WHEN HOUR(data_coleta_dt) BETWEEN 6 AND 11 THEN 'Manhã'
    WHEN HOUR(data_coleta_dt) BETWEEN 12 AND 17 THEN 'Tarde'
    ELSE 'Noite'
END
WHERE id > 0;