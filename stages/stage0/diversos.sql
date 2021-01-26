-- --- Calcula a idade do parlamentar na data do gasto
-- SELECT g.txnomeparlamentar, TO_CHAR(AGE(g.datemissao, p.datanascimento), 'YY "anos"') AS idade, g.datemissao, p.datanascimento
-- FROM st0_gastos g, st0_parlamentares p
-- WHERE g.idecadastro = p.idecadastro
-- LIMIT 1;

-- --- REMOVE - . / DE CPF e CNPJ
-- SELECT g.txnomeparlamentar, trim(regexp_replace(g.txtcnpjcpf, '[\.\/\-]', '', 'g'))
-- FROM st0_gastos g
-- LIMIT 10;

--- DEFINE REGIÃO DO PAÍS DE ORIGEM DO CANDIDATO E POR ONDE FOI ELEITO
-- SELECT g.txtcnpjcpf, g.sguf, g.*,
-- 	CASE 
-- 		WHEN UPPER(g.sguf) IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO') THEN 'Norte'
-- 		WHEN UPPER(g.sguf) IN ('DF', 'GO', 'MT', 'MS')	THEN 'Centro-Oeste'
-- 		WHEN UPPER(g.sguf) IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PI', 'PE', 'RN', 'SE') THEN 'Nordeste'
-- 		WHEN UPPER(g.sguf) IN ('ES', 'MG', 'RJ', 'SP') THEN 'Sudeste'
-- 		ELSE 'Sul'
-- 	END as regiao_gasto,
-- 	p.ufnascimento,
-- 	CASE 
-- 		WHEN UPPER(p.ufnascimento) IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO') THEN 'Norte'
-- 		WHEN UPPER(p.ufnascimento) IN ('DF', 'GO', 'MT', 'MS')	THEN 'Centro-Oeste'
-- 		WHEN UPPER(p.ufnascimento) IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PI', 'PE', 'RN', 'SE') THEN 'Nordeste'
-- 		WHEN UPPER(p.ufnascimento) IN ('ES', 'MG', 'RJ', 'SP') THEN 'Sudeste'
-- 		ELSE 'Sul'
-- 	END as regiao_nascimento
-- FROM st0_gastos g, st0_parlamentares p
-- LIMIT 10;

-- --- Categoriza o fornecedor em pessoa Física ou Jurídica
-- SELECT g.txnomeparlamentar, g.txtcnpjcpf, 
-- 	CASE WHEN length(g.txtcnpjcpf) > 17 THEN 'Jurídica'
-- 		ELSE 'Física'
-- 	END as natureza_fornecedor
-- FROM st0_gastos g
-- ORDER BY 3
-- LIMIT 100;

-- --- Lista os CNPJs encontrados entre os fornecedores
-- SELECT DISTINCT(g.txtcnpjcpf), g.txtfornecedor
-- FROM st0_gastos g
-- WHERE length(g.txtcnpjcpf) > 17
-- 	AND length(g.txtfornecedor) > 5
-- ORDER BY 2;

-- -- Categoriza candidatos em faixas de votos recebidos
-- --
-- SELECT v.ano_eleicao, v.nm_urna_candidato, v.sg_partido, v.sg_uf, 
-- 	CASE 
-- 		WHEN sum(v.qt_votos_nominais) < 10000 THEN 'Menos de 10 mil'
-- 		WHEN sum(v.qt_votos_nominais) >= 10000 AND sum(v.qt_votos_nominais) < 25000 THEN 'Entre 10 e 25 mil'
-- 		WHEN sum(v.qt_votos_nominais) >= 25000 AND sum(v.qt_votos_nominais) < 50000 THEN 'Entre 25 e 50 mil'
-- 		WHEN sum(v.qt_votos_nominais) >= 50000 AND sum(v.qt_votos_nominais) < 100000 THEN 'Entre 50 e 100 mil'
-- 		WHEN sum(v.qt_votos_nominais) >= 100000 AND sum(v.qt_votos_nominais) < 200000 THEN 'Entre 100 e 200 mil'
-- 		WHEN sum(v.qt_votos_nominais) >= 200000 THEN 'Mais de 200 mil'
-- 	END faixa_de_votacao
-- FROM st0_votos_parlamentares v, st0_parlamentares p
-- WHERE p.nome = v.nm_urna_candidato
-- 	AND v.ano_eleicao != 2018
-- GROUP BY 1, 2, 3, 4
-- ORDER BY 1 DESC, sum(v.qt_votos_nominais) DESC
-- ;

-- Lista parlamentares que estão na base de gastos mas não estão na base de votos
--
SELECT DISTINCT(UPPER(p.nome)), v.ano_eleicao
FROM st0_parlamentares p, st0_votos_parlamentares v, st0_gastos g
WHERE g.idecadastro = p.idecadastro
	AND p.nome = v.nm_urna_candidato
	AND g.nulegislatura = (v.ano_eleicao + 1)
	AND UPPER(p.nome) NOT IN (SELECT DISTINCT(UPPER(nm_urna_candidato)) FROM st0_votos_parlamentares)
;