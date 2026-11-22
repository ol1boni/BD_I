--  Exercicios_prova_2_bimestre

EXEC dbo.PrepararQuestao 1;
-- 
SELECT nome, idade FROM dbo.Aluno
WHERE idade > 20
order by nome ASC;

EXEC dbo.PrepararQuestao 2;
--
SELECT TOP 3 ra, nome, data_cadastro 
FROM dbo.Aluno
WHERE cidade = 'Joinville' AND data_cadastro between '2026-08-01' AND '2026-08-15' 
ORDER BY data_cadastro DESC, nome ASC;

EXEC dbo.PrepararQuestao 3;
--
SELECT ra, UPPER(nome) AS nome_maiusculo, LOWER(email) email_minusculo,
LEFT (nome, 3) AS prefixo, LEN(nome) AS tamanho_nome
FROM dbo.Aluno
ORDER BY nome;

EXEC dbo.PrepararQuestao 4;
--
SELECT nome, DAY(data_nascimento) AS dia, MONTH(data_nascimento) AS mês, YEAR(data_nascimento) AS ano
FROM dbo.Aluno
WHERE MONTH(data_nascimento) = 9
ORDER BY dia ASC, nome ASC;

EXEC dbo.PrepararQuestao 5;
--
SELECT 
COUNT(*) AS total_matriculas,
COUNT(nota) AS notas_lancadas,
COUNT(*) - COUNT(nota) AS notas_pendentes,
MIN(nota) AS menor_nota,
MAX(nota) AS maior_nota,
ROUND(AVG(nota), 2) AS media_notas
FROM dbo.Matricula
WHERE id_turma = 10;

EXEC dbo.PrepararQuestao 6;
--
SELECT id_turma, 
COUNT(*) AS total_matriculas
FROM dbo.Matricula
GROUP BY id_turma
HAVING COUNT(*) >= 4
ORDER BY total_matriculas DESC, id_turma ASC;

EXEC dbo.PrepararQuestao 7;
--
INSERT INTO dbo.Aluno (ra, nome, idade, cidade, email, data_nascimento, data_cadastro)
VALUES (1099, 'Marina Lopes', 22, 'Blumenau', 'MARINA@EXEMPLO.COM', '2026-04-20', '2026-11-20')

-- verificando:
SELECT * FROM dbo.Aluno WHERE ra = 1099

UPDATE dbo.Aluno SET idade = 23, cidade = 'Joinville' WHERE email = 'MARINA@EXEMPLO.COM';

-- verificando:
SELECT * FROM dbo.Aluno WHERE email = 'MARINA@EXEMPLO.COM';

EXEC dbo.PrepararQuestao 8;
--
UPDATE dbo.Pagamento 
SET situacao = 'Pago', 
data_pagamento = '2026-11-20'
WHERE id_pagamento = 9002;

DELETE FROM dbo.Pagamento WHERE id_pagamento = 9007;

-- verificando:
SELECT * FROM DBO.Pagamento

EXEC dbo.PrepararQuestao 9;

CREATE TABLE dbo.Monitoria (
    id_monitoria INT NOT NULL,
    id_turma INT NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    horas INT NOT NULL,
    data_inicio DATE NOT NULL,
    situacao VARCHAR(20) NOT NULL
        CONSTRAINT DF_situacao DEFAULT ('Planejada'),
    CONSTRAINT PK_id_monitoria PRIMARY KEY (id_monitoria),
    CONSTRAINT FK_idTurma FOREIGN KEY (id_turma) REFERENCES dbo.Turma(id_turma),
    CONSTRAINT UQ_codigo UNIQUE (codigo),
    CONSTRAINT CK_horas CHECK (horas >= 1)
);

INSERT INTO dbo.Monitoria (id_monitoria, id_turma, codigo, horas, data_inicio)
VALUES (1, 10, 'MON-001', 8,'2026-11-21')

SELECT * FROM dbo.Monitoria