# Projeto Final de BI 2020.2

## Integrantes
- David
- Farid
- Leonardo
- Luiz
- Rodrigo

## Fontes de dados
- [dados de empresas](https://www.kaggle.com/gui230/cnpj-brasil-05092020)
    - arquivo csv: cnpj_dados_cadastrais_pj.csv
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
