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