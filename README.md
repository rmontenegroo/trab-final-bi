# Projeto Final de BI 2020.2

## Integrantes:
- David
- Farid
- Leonardo
- Luiz
- Rodrigo

## Etapas do ETL:

### Stage 0
- Obtenção dos dados brutos de diversas fontes: download de arquivos CSV e consumo de APIs;
- Mínima transformação dos dados, definindo no máximo tipos;
- Carga dos dados em tabelas no relacional no schema *public* para tratamento nas próximas etapas;

### Stage 1
- Remoção de caracteres com acentuação;
- Aplicação de *trim* e transformação dos caracteres em caixa alta;
- Transformação de campos referentes a sexo para que só contenham os valores 'M' ou 'F';
- Transformação dos campos txtdescricao, txtdescricaoespecificao, txtpassageiro e txttrecho em campo único no caso de passagem aérea;
- Substituição do campo CPF por 'LIDERANÇA' na tabela de gastos quando o gasto é de uma liderança;
- Substituição de NULL por 'SEM PARTIDO' quando parlamentar não apresenta partido;
- Modificados alguns nomes de parlamentares na tabela de emendas para que fossem iguais aos dos campos nm_eleitoral em st1_parlamentares, e nm_senador em st1_senadores;

## Fontes de dados disponíveis

### Stage 0

#### Tabela CNPJ (st0_cnpj)
```
CREATE TABLE public.st0_cnpj
(
    cnpj character varying(21) COLLATE pg_catalog."default",
    razao_social character varying(320) COLLATE pg_catalog."default",
    nome_fantasia character varying(120) COLLATE pg_catalog."default",
    nm_cidade_exterior character varying(120) COLLATE pg_catalog."default",
    nm_pais character varying(120) COLLATE pg_catalog."default",
    data_inicio_atividade date,
    descricao_tipo_logradouro character varying(32) COLLATE pg_catalog."default",
    logradouro character varying(240) COLLATE pg_catalog."default",
    numero character varying(12) COLLATE pg_catalog."default",
    complemento character varying(240) COLLATE pg_catalog."default",
    bairro character varying(120) COLLATE pg_catalog."default",
    cep character varying(12) COLLATE pg_catalog."default",
    uf character varying(2) COLLATE pg_catalog."default",
    municipio character varying(32) COLLATE pg_catalog."default"
)
```

#### Tabela Gastos (st0_gastos)
```
CREATE TABLE public.st0_gastos
(
    txnomeparlamentar character varying(320) COLLATE pg_catalog."default",
    cpf character varying(15) COLLATE pg_catalog."default",
    idecadastro integer,
    nucarteiraparlamentar integer,
    nulegislatura integer,
    sguf character(2) COLLATE pg_catalog."default",
    sgpartido character varying(32) COLLATE pg_catalog."default",
    codlegislatura integer,
    numsubcota integer,
    txtdescricao character varying(320) COLLATE pg_catalog."default",
    numespecificacaosubcota integer,
    txtdescricaoespecificacao character varying(320) COLLATE pg_catalog."default",
    txtfornecedor character varying(320) COLLATE pg_catalog."default",
    txtcnpjcpf character varying(24) COLLATE pg_catalog."default",
    txtnumero character varying(160) COLLATE pg_catalog."default",
    indtipodocumento integer,
    datemissao date,
    vlrdocumento double precision,
    vlrglosa double precision,
    vlrliquido double precision,
    nummes integer,
    numano integer,
    numparcela integer,
    txtpassageiro character varying(320) COLLATE pg_catalog."default",
    txttrecho character varying(320) COLLATE pg_catalog."default",
    numlote integer,
    numressarcimento integer,
    vlrrestituicao double precision,
    nudeputadoid integer,
    idedocumento integer,
    urldocumento character varying(1024) COLLATE pg_catalog."default"
)
```

#### Tabela Parlamentares (st0_parlamentares)
```
CREATE TABLE public.st0_parlamentares
(
    idecadastro integer NOT NULL,
    nomecivil character varying(320) COLLATE pg_catalog."default",
    siglapartido character varying(32) COLLATE pg_catalog."default",
    nome character varying(320) COLLATE pg_catalog."default",
    siglauf character(2) COLLATE pg_catalog."default",
    email character varying(120) COLLATE pg_catalog."default",
    data date,
    nomeeleitoral character varying(320) COLLATE pg_catalog."default",
    sexo character(1) COLLATE pg_catalog."default",
    datanascimento date,
    ufnascimento character(2) COLLATE pg_catalog."default",
    municipionascimento character varying(160) COLLATE pg_catalog."default",
    escolaridade character varying(32) COLLATE pg_catalog."default",
    uri character varying(1024) COLLATE pg_catalog."default",
    uripartido character varying(1024) COLLATE pg_catalog."default",
    idlegislatura integer,
    urlfoto character varying(1024) COLLATE pg_catalog."default",
    condicaoeleitoral character varying(64) COLLATE pg_catalog."default",
    situacao character varying(64) COLLATE pg_catalog."default",
    descricaostatus text COLLATE pg_catalog."default",
    cpf character varying(11) COLLATE pg_catalog."default",
    urlwebsite character varying(1024) COLLATE pg_catalog."default",
    redesocial character varying(1024) COLLATE pg_catalog."default",
    datafalecimento date,
    CONSTRAINT st0_parlamentares_pkey PRIMARY KEY (idecadastro)
)
```

#### Tabela Votos (st0_votos_parlamentares)
```
CREATE TABLE public.st0_votos_parlamentares
(
    dt_geracao date,
    hh_geracao character varying(10) COLLATE pg_catalog."default",
    ano_eleicao integer,
    cd_tipo_eleicao integer,
    nm_tipo_eleicao character varying(20) COLLATE pg_catalog."default",
    nr_turno integer,
    cd_eleicao integer,
    ds_eleicao character varying(60) COLLATE pg_catalog."default",
    dt_eleicao date,
    tp_abrangencia character(1) COLLATE pg_catalog."default",
    sg_uf character(2) COLLATE pg_catalog."default",
    sg_ue character(2) COLLATE pg_catalog."default",
    nm_ue character varying(24) COLLATE pg_catalog."default",
    cd_municipio integer,
    nm_municipio character varying(120) COLLATE pg_catalog."default",
    nr_zona integer,
    cd_cargo integer,
    ds_cargo character varying(28) COLLATE pg_catalog."default",
    sq_candidato bigint,
    nr_candidato integer,
    nm_candidato character varying(256) COLLATE pg_catalog."default",
    nm_urna_candidato character varying(256) COLLATE pg_catalog."default",
    nm_social_candidato character varying(256) COLLATE pg_catalog."default",
    cd_situacao_candidatura integer,
    ds_situacao_candidatura character varying(24) COLLATE pg_catalog."default",
    cd_detalhe_situacao_cand integer,
    ds_detalhe_situacao_cand character varying(64) COLLATE pg_catalog."default",
    tp_agremiacao character varying(32) COLLATE pg_catalog."default",
    nr_partido integer,
    sg_partido character varying(32) COLLATE pg_catalog."default",
    nm_partido character varying(64) COLLATE pg_catalog."default",
    sq_coligacao bigint,
    nm_coligacao character varying(120) COLLATE pg_catalog."default",
    ds_composicao_coligacao character varying(200) COLLATE pg_catalog."default",
    cd_sit_tot_turno integer,
    ds_sit_tot_turno character varying(32) COLLATE pg_catalog."default",
    st_voto_em_transito boolean,
    qt_votos_nominais integer
)
```

#### Tabela Senadores (st0_senadores)
```
CREATE TABLE public.st0_senadores
(
    nome_parlamentar character varying(120) COLLATE pg_catalog."default",
    sexo character varying(16) COLLATE pg_catalog."default",
    sg_partido character varying(16) COLLATE pg_catalog."default",
    sg_uf character(2) COLLATE pg_catalog."default"
)
```

#### Tabela Emendas (st0_emendas)
```
CREATE TABLE public.st0_emendas
(
    codigo character varying(15) COLLATE pg_catalog."default",
    ano integer,
    codigo_autor integer,
    nome_autor character varying(240) COLLATE pg_catalog."default",
    numero bigint,
    codigo_ibge_municipio integer,
    nome_municipio character varying(120) COLLATE pg_catalog."default",
    codigo_ibge_estado integer,
    nome_estado character varying(24) COLLATE pg_catalog."default",
    codigo_regiao character varying(2) COLLATE pg_catalog."default",
    nome_regiao character varying(16) COLLATE pg_catalog."default",
    codigo_funcao integer,
    nome_funcao character varying(32) COLLATE pg_catalog."default",
    codigo_subfuncao integer,
    nome_subfuncao character varying(64) COLLATE pg_catalog."default",
    valor_empenhado integer,
    valor_liquidado integer,
    valor_pago integer,
    valor_restos_a_pagar_inscritos integer,
    valor_restos_a_pagar_cancelados integer,
    valor_restos_a_pagar_pagos integer
)
```

### Stage 01

#### Tabela st1_emendas
```
CREATE TABLE public.st1_emendas
(
    ano integer,
    nm_autor character varying(240) COLLATE pg_catalog."default",
    nm_municipio character varying(120) COLLATE pg_catalog."default",
    nm_estado character varying(24) COLLATE pg_catalog."default",
    co_regiao character varying(2) COLLATE pg_catalog."default",
    nm_regiao character varying(16) COLLATE pg_catalog."default",
    nm_funcao character varying(32) COLLATE pg_catalog."default",
    nm_subfuncao character varying(64) COLLATE pg_catalog."default",
    vl_empenhado integer,
    vl_liquidado integer,
    vl_pago integer,
    vl_restos_a_pagar_inscritos integer,
    vl_restos_a_pagar_cancelados integer,
    vl_restos_a_pagar_pagos integer
)
```

### Tabela st1_gastos
```
CREATE TABLE public.st1_gastos
(
    nm_parlamentar character varying(320) COLLATE pg_catalog."default",
    cpf character varying(15) COLLATE pg_catalog."default",
    sg_uf character varying(2) COLLATE pg_catalog."default",
    sg_partido character varying(32) COLLATE pg_catalog."default",
    nm_fornecedor character varying(320) COLLATE pg_catalog."default",
    cnpjcpf character varying(24) COLLATE pg_catalog."default",
    dt_emissao date,
    vl_documento real,
    vl_glosa real,
    vl_liquido real,
    mes integer,
    ano integer,
    nu_parcela integer,
    nu_lote integer,
    vl_restituicao real,
    tx_descricao text COLLATE pg_catalog."default"
)
```

### Tabela st1_parlamentares
```
CREATE TABLE public.st1_parlamentares
(
    nm_civil character varying(50) COLLATE pg_catalog."default",
    sg_partido character varying(16) COLLATE pg_catalog."default",
    nm_parlamentar character varying(36) COLLATE pg_catalog."default",
    sg_uf character varying(2) COLLATE pg_catalog."default",
    nm_eleitoral character varying(36) COLLATE pg_catalog."default",
    sexo character varying(1) COLLATE pg_catalog."default",
    dt_nascimento date,
    sg_ufnascimento character varying(2) COLLATE pg_catalog."default",
    nm_municipionascimento character varying(32) COLLATE pg_catalog."default",
    escolaridade character varying(32) COLLATE pg_catalog."default",
    cpf character varying(11) COLLATE pg_catalog."default",
    dt_falecimento date
)
```

#### Tabela st1_senadores
```
CREATE TABLE public.st1_senadores
(
    nm_senador character varying(64) COLLATE pg_catalog."default",
    sexo character(1) COLLATE pg_catalog."default",
    sg_partido character varying(16) COLLATE pg_catalog."default",
    sg_uf character(2) COLLATE pg_catalog."default"
)
```

## Fatos

### Emenda
#### Métricas
- metrica 1
- metrica 2
- ...

##### Dimensões
###### Parlamentar
- atributo 1
- atributo 2

###### Tempo
- ano

###### Dispendio
- classe
- subclasse

### Despesas
#### Métricas
- metrica 1
- metrica 2
- ...

##### Dimensões
###### Parlamentar
- atributo 1
- atributo 2
- ...

###### Tempo
- data
- ano
- mês
- dia

###### Dispendio
- descrição
- descrição detalhada
- ...

###### Fornecedor
- atributo 1
- atributo 2
- ...

## Padrão de nomenclatura

- sg: sigla
- dt: data
- vl: valor
- tx: texto
- nm: nome
- nu: numero
- co: código
- uf: unidade federativa
- sk: *surrogate key*
- nk: *natural key*
- fk: *foreign key*
- pk: *primary key*

## Reunião 03

### Data: 30.01.2021

### Participantes: 
- Farid
- Rodrigo

### Conclusões
- Trabalharemos com dois assuntos, a pedido do cliente ficcional : emendas parlamentares e despesas de cota parlamentar;
- Esses dois assuntos constituem dois fatos no nosso BI: emendas e despesas; -> A confirmar com o monitor Fernando na reunião de 02.02.21;
- As dimensões relacionadas aos fatos não precisam ser comuns, ou seja, emendas pode ter um conjunto de dimensões sem interseção com o fato despesas; 
- Os atributos das dimensões no modelo multidimensional (MMD) não precisam ter paridade 1:1 com colunas do relacional, ou seja, atributos das dimensões podem ser criados pelo ETL; 
	Exemplo: Faixa da quantidade de votos que elegeu um parlamentar. Faixa etária de um parlamentar.
- Os atributos das dimensões possuem compromisso com o problema do negócio e não estritamente ao que estiver disponível no relacional, ou seja, atributos das dimensões podem ser naturais (herdados do relacional),
	e podem ser artificiais (gerados pelo ETL, com algum tratamento combinando informações do relacional);
- Fato emenda e fato despesa podem compartilhar a dimensão tempo no MMD? Fato emenda só possui a informação de ano, enquanto o fato despesa, possui ano, mês e dia; -> Como ficaria no MMD? Tabelas separadas ou tabela compartilhada com campos NULL?
- Da mesma forma que acontece com os atributos das dimensões, as métricas dos fatos não precisam ter paridade 1:1 com campos do relacional, e podem/devem ser calculadas no ETL;
- Fato despesa não possui dimensão ONDE;
- Fato emenda possui dimensão ONDE;
- Ver com o Fernando: queremos transformar a idade do parlamentar na data de um fato em atributo, mas como fazemos isso no modelo a partir da Data de Nascimento?

### Precisamos:
- Na reunião com o monitor, fechar as questões sobre fatos x dimensões;
- Definir quais sãos as métricas dos fatos e como serão calculadas;
- Definir os atributos das dimensões e como são constituídos;
- Definir se vamos continuar com o atributo de parlamentar que diz a que faixa da quantidade de votos ele recebeu na eleição que o elegeu. São muitos dados no legado para pouca informação;
- Definir se vamos utilizar UF e município do CNPJ dos fornecedores;
- Decidir como tratar os CNPJs inconsistentes (sem paridade na tabela de CNPJ) relacionados nos gastos;
- 





