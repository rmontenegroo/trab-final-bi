--- Cria tabela de gastos parlamentares stage 0 
--- 
--- DROP TABLE "public".st0_gastos;
CREATE TABLE "public".st0_gastos
(
  txNomeParlamentar VARCHAR(320)
, cpf VARCHAR(15)
, ideCadastro INTEGER
, nuCarteiraParlamentar INTEGER
, nuLegislatura INTEGER
, sgUF CHAR(2)
, sgPartido VARCHAR(32)
, codLegislatura INTEGER
, numSubCota INTEGER
, txtDescricao VARCHAR(320)
, numEspecificacaoSubCota INTEGER
, txtDescricaoEspecificacao VARCHAR(320)
, txtFornecedor VARCHAR(320)
, txtCNPJCPF VARCHAR(24)
, txtNumero VARCHAR(160)
, indTipoDocumento INTEGER
, datEmissao DATE
, vlrDocumento FLOAT
, vlrGlosa FLOAT
, vlrLiquido FLOAT
, numMes INTEGER
, numAno INTEGER
, numParcela INTEGER
, txtPassageiro VARCHAR(320)
, txtTrecho VARCHAR(320)
, numLote INTEGER
, numRessarcimento INTEGER
, vlrRestituicao FLOAT
, nuDeputadoId INTEGER
, ideDocumento INTEGER
, urlDocumento VARCHAR(1024)
)
;

--- Cria tabel de parlamentares stage 0
---
--- DROP TABLE "public".st0_parlamentares;
CREATE TABLE "public".st0_parlamentares
(
  idecadastro INTEGER
, nomeCivil VARCHAR(320)
, siglaPartido VARCHAR(32)
, nome VARCHAR(320)
, siglaUf CHAR(2)
, email VARCHAR(120)
, "data" DATE
, nomeEleitoral VARCHAR(320)
, sexo CHAR(1)
, dataNascimento DATE
, ufNascimento CHAR(2)
, municipioNascimento VARCHAR(160)
, escolaridade VARCHAR(32)
, uri VARCHAR(1024)
, uriPartido VARCHAR(1024)
, idLegislatura INTEGER
, urlFoto VARCHAR(1024)
, condicaoEleitoral VARCHAR(64)
, situacao VARCHAR(64)
, descricaoStatus TEXT
, cpf VARCHAR(11)
, urlWebsite VARCHAR(1024)
, redeSocial VARCHAR(1024)
, dataFalecimento DATE
)
;

--- Cria tabela de votos de parlamentares
---
--- DELETE FROM st0_votos_parlamentares;
--- DROP TABLE "public".st0_votos_parlamentares;
CREATE TABLE "public".st0_votos_parlamentares
(
  DT_GERACAO DATE
, HH_GERACAO VARCHAR(10)
, ANO_ELEICAO INTEGER
, CD_TIPO_ELEICAO INTEGER
, NM_TIPO_ELEICAO VARCHAR(20)
, NR_TURNO INTEGER
, CD_ELEICAO INTEGER
, DS_ELEICAO VARCHAR(60)
, DT_ELEICAO DATE
, TP_ABRANGENCIA CHAR(1)
, SG_UF CHAR(2)
, SG_UE CHAR(2)
, NM_UE VARCHAR(24)
, CD_MUNICIPIO INTEGER
, NM_MUNICIPIO VARCHAR(120)
, NR_ZONA INTEGER
, CD_CARGO INTEGER
, DS_CARGO VARCHAR(28)
, SQ_CANDIDATO BIGINT
, NR_CANDIDATO INTEGER
, NM_CANDIDATO VARCHAR(256)
, NM_URNA_CANDIDATO VARCHAR(256)
, NM_SOCIAL_CANDIDATO VARCHAR(256)
, CD_SITUACAO_CANDIDATURA INTEGER
, DS_SITUACAO_CANDIDATURA VARCHAR(24)
, CD_DETALHE_SITUACAO_CAND INTEGER
, DS_DETALHE_SITUACAO_CAND VARCHAR(32)
, TP_AGREMIACAO VARCHAR(32)
, NR_PARTIDO INTEGER
, SG_PARTIDO VARCHAR(32)
, NM_PARTIDO VARCHAR(64)
, SQ_COLIGACAO BIGINT
, NM_COLIGACAO VARCHAR(120)
, DS_COMPOSICAO_COLIGACAO VARCHAR(200)
, CD_SIT_TOT_TURNO INTEGER
, DS_SIT_TOT_TURNO VARCHAR(32)
, ST_VOTO_EM_TRANSITO BOOLEAN
, QT_VOTOS_NOMINAIS INTEGER
)
;
