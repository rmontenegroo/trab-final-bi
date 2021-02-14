# Projeto Final de BI 2020.2

## Integrantes
- David
- Farid
- Leonardo
- Luiz
- Rodrigo

## Fontes de dados
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

## Etapas do ETL
  
  [Verifique aqui a descrição de todas as fases do ETL](descricao_etl/readme.md)

## Schemas (*create scripts*)
- [stage 0](schemas_and_data/schema_st0.sql)
- [stage 1](schemas_and_data/schema_st1.sql)
- [carga dw](schemas_and_data/schema_dw.sql)

## Dimensões
- data
- partido
- parlamentar
- fornecedor
- dispendio
- local
- legislatura<sup>*</sup>

<sup>*</sup> dimensão generada - carregada na tabela fato

## Fato
- gastos 

## Padrão de nomenclatura
- sg: sigla
- dt: data
- vl: valor
- tx: texto
- nm: nome
- uf: unidade federativa
- sk: *surrogate key*
- nk: *natural key*
- fk: *foreign key*
- pk: *primary key*

##   Arquivos
- [projeto-bi-gastos-paralamentares-v0.2.pbix.zip](https://drive.google.com/file/d/1nmTHuA5PreAV-j_S5SE8htkhrYJ1lr2K/view?usp=sharing)
  
## TODO
- Dashboards
