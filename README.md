# Projeto Final de BI 2020.2

## Integrantes:
- David
- Farid
- Leonardo
- Luiz
- Rodrigo

## Fontes de dados:
- [dados de empresas](https://www.kaggle.com/gui230/cnpj-brasil-05092020)
    - [arquivo csv](https://storage.googleapis.com/kaggle-data-sets/1072214/1814771/compressed/csv_dados_qsa_cnpj_05-09-20/cnpj_dados_cadastrais_pj.csv.zip?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=gcp-kaggle-com%40kaggle-161607.iam.gserviceaccount.com%2F20210213%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20210213T194048Z&X-Goog-Expires=259199&X-Goog-SignedHeaders=host&X-Goog-Signature=714e44986ebbbceb4dc916bbd0f10b5075356ed877a0592a2a5636456f523475a32c148e99f4802000b1c50749d2561b916a3b5663113f4dd787842cff3c1db3a35fc575d4faa32ce206a1441b0a44bc1e748e538484789cbe48228a105b345e62d0f63612346c5b56344b9a2eeaa4894ed0a96ca8b3a3dc88392b0c95e3aeedfa1819f9bfd25bd13e6bd6667c51053ee0e9d9c80b492356af873baaae160d4f23a467dad4d9bc2f0109c7c17e184ef9b66519e704326e20eded15bc330dda2a6adc37b734dc2396e6c809a99c229ec0abc4efce87d5b9345aca03196628157e7ca3cb249de7d40dff9bcd3c23b8ce393be822a5ddef768472d08a061016efc5)
- dados de gastos parlamentares:
    - [2021](https://www.camara.leg.br/cotas/Ano-2021.csv.zip)
    - [2020](https://www.camara.leg.br/cotas/Ano-2020.csv.zip)
    - [2019](https://www.camara.leg.br/cotas/Ano-2019.csv.zip)
    - [2018](https://www.camara.leg.br/cotas/Ano-2018.csv.zip)
    - [2017](https://www.camara.leg.br/cotas/Ano-2017.csv.zip)
    - [2016](https://www.camara.leg.br/cotas/Ano-2016.csv.zip)
    - [2015](https://www.camara.leg.br/cotas/Ano-2015.csv.zip)
    - [2014](https://www.camara.leg.br/cotas/Ano-2014.csv.zip)
    - [2013](https://www.camara.leg.br/cotas/Ano-2013.csv.zip)
    - [2012](https://www.camara.leg.br/cotas/Ano-2012.csv.zip)
    - [2011](https://www.camara.leg.br/cotas/Ano-2011.csv.zip)
    - [2010](https://www.camara.leg.br/cotas/Ano-2010.csv.zip)
    - [2009](https://www.camara.leg.br/cotas/Ano-2009.csv.zip)
    - [2008](https://www.camara.leg.br/cotas/Ano-2008.csv.zip)
- dados de parlamentares:
    - [lista](https://dadosabertos.camara.leg.br/api/v2/deputados)
    - [detalhes](https://dadosabertos.camara.leg.br/api/v2/deputados/idDeputado)

## Etapas do ETL:

## TODO
- Descrever etapas com screenshots e texto descritivo
- Substituir script de criação de tabelas do DW aqui por link para schemas_and_data

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

### Carregar DW
- A partir dos dados do stage1, montam-se as dimensões e a tabela fato;
- Para dimensão 'data' especificamente utilizou-se um script cedido pelo professor Anderson. Para todas as demais,
utilizou-se o PDI;

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

### Stage 01

#### Tabela st1_gastos
```
CREATE TABLE public.st1_gastos
(
    nm_parlamentar character varying(40) COLLATE pg_catalog."default",
    cpf character varying(15) COLLATE pg_catalog."default",
    sg_uf character varying(3) COLLATE pg_catalog."default",
    sg_partido character varying(16) COLLATE pg_catalog."default",
    nm_fornecedor character varying(240) COLLATE pg_catalog."default",
    cnpjcpf character varying(24) COLLATE pg_catalog."default",
    dt_emissao date,
    vl_documento double precision,
    vl_glosa double precision,
    vl_liquido double precision,
    vl_restituicao double precision,
    tx_descricao character varying(320) COLLATE pg_catalog."default",
    trecho character varying(320) COLLATE pg_catalog."default",
    nm_passageiro character varying(320) COLLATE pg_catalog."default",
    especificacao character varying(320) COLLATE pg_catalog."default",
    legislatura integer,
    natureza character varying(8) COLLATE pg_catalog."default",
    id integer NOT NULL DEFAULT nextval('st1_gastos_id_seq'::regclass),
    CONSTRAINT st1_gastos_pkey PRIMARY KEY (id)
)
```

#### Tabela st1_parlamentares
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
    dt_falecimento date,
    id integer NOT NULL DEFAULT nextval('st1_parlamentares_id_seq'::regclass),
    CONSTRAINT st1_parlamentares_pkey PRIMARY KEY (id)
)
```

#### Tabela st1_partidos
```
CREATE TABLE public.st1_partidos
(
    sg_partido character varying(16) COLLATE pg_catalog."default",
    id integer NOT NULL DEFAULT nextval('st1_partidos_id_seq'::regclass),
    CONSTRAINT st1_partidos_pkey PRIMARY KEY (id)
)
```

#### Tabela st1_cnpj
```
CREATE TABLE public.st1_cnpj
(
    id integer NOT NULL DEFAULT nextval('st1_cnpj_id_seq'::regclass),
    cnpj character varying(21) COLLATE pg_catalog."default",
    nome_fantasia text COLLATE pg_catalog."default",
    nm_pais character varying(120) COLLATE pg_catalog."default",
    uf character varying(2) COLLATE pg_catalog."default",
    cidade text COLLATE pg_catalog."default",
    CONSTRAINT st1_cnpj_pkey PRIMARY KEY (id)
)
```

### DW

#### Tabela Fato Gastos
```
CREATE TABLE dw.ft_gastos
(
    sk_partido integer NOT NULL,
    sk_fornecedor integer NOT NULL,
    sk_dispendio integer NOT NULL,
    sk_data integer NOT NULL,
    sk_local integer NOT NULL,
    vl_glosa real NOT NULL,
    vl_restituicao character varying COLLATE pg_catalog."default" NOT NULL,
    vl_documento real NOT NULL,
    vl_liquido real NOT NULL,
    legislatura integer NOT NULL,
    sk_parlamentar integer NOT NULL,
    sk_gastos integer NOT NULL DEFAULT nextval('dw.ft_gastos_sk_gastos_seq'::regclass),
    CONSTRAINT ft_gastos_pkey PRIMARY KEY (sk_gastos),
    CONSTRAINT dim_data_ft_gastos_fk FOREIGN KEY (sk_data)
        REFERENCES dw.dim_data (sk_data) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dim_dispendio_ft_gastos_fk FOREIGN KEY (sk_dispendio)
        REFERENCES dw.dim_dispendio (sk_dispendio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dim_fornecedor_ft_gastos_fk FOREIGN KEY (sk_fornecedor)
        REFERENCES dw.dim_fornecedor (sk_fornecedor) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dim_local_ft_gastos_fk FOREIGN KEY (sk_local)
        REFERENCES dw.dim_local (sk_local) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dim_parlamentar_ft_gastos_fk FOREIGN KEY (sk_parlamentar)
        REFERENCES dw.dim_parlamentar (sk_parlamentar) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dim_partido_ft_gastos_fk FOREIGN KEY (sk_partido)
        REFERENCES dw.dim_partido (sk_partido) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
```

#### Tabela Dimensão Data
```
CREATE TABLE dw.dim_data
(
    sk_data integer NOT NULL,
    nk_data date NOT NULL,
    desc_data_completa character varying(60) COLLATE pg_catalog."default" NOT NULL,
    nr_ano integer NOT NULL,
    nm_trimestre character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nr_ano_trimestre character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nr_mes integer NOT NULL,
    nm_mes character varying(20) COLLATE pg_catalog."default" NOT NULL,
    ano_mes character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nr_semana integer NOT NULL,
    ano_semana character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nr_dia integer NOT NULL,
    nr_dia_ano integer NOT NULL,
    nm_dia_semana character varying(20) COLLATE pg_catalog."default" NOT NULL,
    flag_final_semana character(3) COLLATE pg_catalog."default" NOT NULL,
    flag_feriado character(3) COLLATE pg_catalog."default" NOT NULL,
    nm_feriado character varying(60) COLLATE pg_catalog."default" NOT NULL,
    dt_final timestamp without time zone NOT NULL,
    dt_carga timestamp without time zone NOT NULL,
    CONSTRAINT sk_data_pk PRIMARY KEY (sk_data)
)
```

#### Tabela Dimensão Dispendio
```
CREATE TABLE dw.dim_dispendio
(
    sk_dispendio serial PRIMARY KEY,
    descricao character varying(60) COLLATE pg_catalog."default" NOT NULL,
    nm_passageiro character varying(120) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    trecho character varying(100) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    especificacao character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    CONSTRAINT sk_dispendio PRIMARY KEY (sk_dispendio)
)
```

#### Tabela Dimensão Fornecedor
```
CREATE TABLE dw.dim_fornecedor
(
    sk_fornecedor serial PRIMARY KEY,
    natureza character varying(8) COLLATE pg_catalog."default" NOT NULL,
    nm_fornecedor character varying(150) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    cadastro character varying(24) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT sk_fornecedor PRIMARY KEY (sk_fornecedor)
)
```

#### Tabela Dimensão Local
```
CREATE TABLE dw.dim_local
(
    sk_local serial PRIMARY KEY,
    nm_cidade character varying(32) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    sg_estado character(3) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::bpchar,
    nm_pais character varying(40) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    CONSTRAINT sk_local PRIMARY KEY (sk_local)
)
```

#### Tabela Dimensão Parlamentar
```
CREATE TABLE dw.dim_parlamentar
(
    sk_parlamentar serial PRIMARY KEY,
    nm_parlamentar character varying(36) COLLATE pg_catalog."default" NOT NULL,
    sexo character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    dt_nascimento date NOT NULL,
    sg_estado_eleitor character(3) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::bpchar,
    escolaridade character varying(24) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    nk_parlamentar integer,
    CONSTRAINT sk_parlamentar PRIMARY KEY (sk_parlamentar)
)
```

#### Tabela Dimensão Partido
```
CREATE TABLE dw.dim_partido
(
    sk_partido serial PRIMARY KEY,
    nk_partido integer NOT NULL,
    sg_partido character varying(16) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N/A'::character varying,
    CONSTRAINT sk_partido PRIMARY KEY (sk_partido)
)
```

#### Dimensões degeneradas
> A tabela fato Gastos incorporou a dimensão degenerada 'legislatura' que representa o período de 4 anos ao qual aquele
> gasto é também associado.

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

### Arquivos
- [projeto-bi-gastos-paralamentares-v0.2.pbix.zip](https://drive.google.com/file/d/1nmTHuA5PreAV-j_S5SE8htkhrYJ1lr2K/view?usp=sharing)

