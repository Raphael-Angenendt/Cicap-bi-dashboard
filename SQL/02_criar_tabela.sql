/*
====================================================
Projeto: CICAP BI Dashboard
Autor: Raphael Angenendt

Descrição:
Criação da tabela principal responsável pelo
armazenamento dos registros de coletas laboratoriais,
incluindo informações de recolhista, setor, itens,
datas e quantidade de casos.

Versão: 1.0
====================================================
*/

CREATE TABLE coletas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recolhista VARCHAR(100),
    data_coleta VARCHAR(50),
    setor VARCHAR(150),
    quantidade_coletado INT,
    item_coletado VARCHAR(100),
    observacao VARCHAR(255),
    data_rechecagem VARCHAR(50),
    quantidade_casos INT
);