/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     02/04/2025 23:35:47                          */
/*==============================================================*/


alter table ABASTECE
   drop constraint FK_ABASTECE_ABASTECE_COMPARTI;

alter table ABASTECE
   drop constraint FK_ABASTECE_ABASTECE2_VISITA;

alter table ARMAZENA
   drop constraint FK_ARMAZENA_ARMAZENA_PRODUTO;

alter table ARMAZENA
   drop constraint FK_ARMAZENA_ARMAZENA2_ARMAZEM;

alter table COMPARTIMENTO
   drop constraint FK_COMPARTI_POSSUI_MAQUINA;

alter table CONTEM
   drop constraint FK_CONTEM_CONTEM2_VIAGEM;

alter table CONTEM
   drop constraint FK_CONTEM_CONTEM3_PRODUTO;

alter table ESTA
   drop constraint FK_ESTA_ESTA_ROTA;

alter table ESTA
   drop constraint FK_ESTA_ESTA2_ARMAZEM;

alter table FAZ
   drop constraint FK_FAZ_FAZ_VIAGEM;

alter table FAZ
   drop constraint FK_FAZ_FAZ2_VISITA;

alter table FAZEM
   drop constraint FK_FAZEM_FAZEM_ARMAZEM;

alter table FAZEM
   drop constraint FK_FAZEM_FAZEM2_ENCOMEND;

alter table GUARDA
   drop constraint FK_GUARDA_GUARDA_COMPARTI;

alter table GUARDA
   drop constraint FK_GUARDA_GUARDA2_PRODUTO;

alter table PERTENCE
   drop constraint FK_PERTENCE_PERTENCE_ROTA;

alter table PERTENCE
   drop constraint FK_PERTENCE_PERTENCE2_MAQUINA;

alter table TEM
   drop constraint FK_TEM_TEM_VISITA;

alter table TEM
   drop constraint FK_TEM_TEM2_MAQUINA;

alter table TEM2
   drop constraint FK_TEM2_TEM3_ENCOMEND;

alter table TEM2
   drop constraint FK_TEM2_TEM4_PRODUTO;

alter table VEICULO
   drop constraint FK_VEICULO_CONTEM_ARMAZEM;

alter table VENDA
   drop constraint FK_VENDA_REGISTA_COMPARTI;

alter table VENDA
   drop constraint FK_VENDA_VENDE_SE_PRODUTO;

alter table VIAGEM
   drop constraint FK_VIAGEM_EXECUTA_FUNCIONA;

alter table VIAGEM
   drop constraint FK_VIAGEM_REALIZA_VEICULO;

alter table VIAGEM
   drop constraint FK_VIAGEM_SEGUE_ROTA;

drop index ABASTECE2_FK;

drop index ABASTECE_FK;

drop table ABASTECE cascade constraints;

drop table ARMAZEM cascade constraints;

drop index ARMAZENA2_FK;

drop index ARMAZENA_FK;

drop table ARMAZENA cascade constraints;

drop index POSSUI_FK;

drop table COMPARTIMENTO cascade constraints;

drop index CONTEM3_FK;

drop index CONTEM2_FK;

drop table CONTEM cascade constraints;

drop table ENCOMENDA cascade constraints;

drop index ESTA2_FK;

drop index ESTA_FK;

drop table ESTA cascade constraints;

drop index FAZ2_FK;

drop index FAZ_FK;

drop table FAZ cascade constraints;

drop index FAZEM2_FK;

drop index FAZEM_FK;

drop table FAZEM cascade constraints;

drop table FUNCIONARIO cascade constraints;

drop index GUARDA2_FK;

drop index GUARDA_FK;

drop table GUARDA cascade constraints;

drop table MAQUINA cascade constraints;

drop index PERTENCE2_FK;

drop index PERTENCE_FK;

drop table PERTENCE cascade constraints;

drop table PRODUTO cascade constraints;

drop table ROTA cascade constraints;

drop index TEM2_FK;

drop index TEM_FK;

drop table TEM cascade constraints;

drop index TEM4_FK;

drop index TEM3_FK;

drop table TEM2 cascade constraints;

drop index CONTEM_FK;

drop table VEICULO cascade constraints;

drop index REGISTA_FK;

drop index VENDE_SE_FK;

drop table VENDA cascade constraints;

drop index EXECUTA_FK;

drop index REALIZA_FK;

drop index SEGUE_FK;

drop table VIAGEM cascade constraints;

drop table VISITA cascade constraints;

/*==============================================================*/
/* Table: ABASTECE                                              */
/*==============================================================*/
create table ABASTECE 
(
   ID_COMPARTIMENTO     NUMBER               not null,
   ID_VISITA            NUMBER               not null,
   QUANT_ABASTECIDA     NUMBER,
   constraint PK_ABASTECE primary key (ID_COMPARTIMENTO, ID_VISITA)
);

/*==============================================================*/
/* Index: ABASTECE_FK                                           */
/*==============================================================*/
create index ABASTECE_FK on ABASTECE (
   ID_COMPARTIMENTO ASC
);

/*==============================================================*/
/* Index: ABASTECE2_FK                                          */
/*==============================================================*/
create index ABASTECE2_FK on ABASTECE (
   ID_VISITA ASC
);

/*==============================================================*/
/* Table: ARMAZEM                                               */
/*==============================================================*/
create table ARMAZEM 
(
   ID_ARMAZEM           NUMBER               not null,
   LONGITUDE            NUMBER,
   CAPACIDADE           NUMBER,
   LATITUDE             NUMBER,
   constraint PK_ARMAZEM primary key (ID_ARMAZEM)
);

/*==============================================================*/
/* Table: ARMAZENA                                              */
/*==============================================================*/
create table ARMAZENA 
(
   ID_PRODUTO           NUMBER               not null,
   ID_ARMAZEM           NUMBER               not null,
   QUANTIDADE_ARMAZENADA NUMBER,
   constraint PK_ARMAZENA primary key (ID_PRODUTO, ID_ARMAZEM)
);

/*==============================================================*/
/* Index: ARMAZENA_FK                                           */
/*==============================================================*/
create index ARMAZENA_FK on ARMAZENA (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Index: ARMAZENA2_FK                                          */
/*==============================================================*/
create index ARMAZENA2_FK on ARMAZENA (
   ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: COMPARTIMENTO                                         */
/*==============================================================*/
create table COMPARTIMENTO 
(
   ID_COMPARTIMENTO     NUMBER               not null,
   ID_MAQUINA           NUMBER               not null,
   STOCK_COMPARTIMENTO  NUMBER,
   CAP_COMPARTIMENTO    NUMBER,
   PRECO_COMPARTIMENTO  NUMBER,
   QUANTIDADE_COMPARTIMENTO NUMBER,
   CODIGO_COMPARTIMENTO NUMBER,
   constraint PK_COMPARTIMENTO primary key (ID_COMPARTIMENTO)
);

/*==============================================================*/
/* Index: POSSUI_FK                                             */
/*==============================================================*/
create index POSSUI_FK on COMPARTIMENTO (
   ID_MAQUINA ASC
);

/*==============================================================*/
/* Table: CONTEM                                                */
/*==============================================================*/
create table CONTEM 
(
   ID_FUNCIONARIO       NUMBER               not null,
   ID_VIAGEM            NUMBER               not null,
   ID_PRODUTO           NUMBER               not null,
   QUANTIDADE_PRODUTO   NUMBER,
   constraint PK_CONTEM primary key (ID_FUNCIONARIO, ID_VIAGEM, ID_PRODUTO)
);

/*==============================================================*/
/* Index: CONTEM2_FK                                            */
/*==============================================================*/
create index CONTEM2_FK on CONTEM (
   ID_FUNCIONARIO ASC,
   ID_VIAGEM ASC
);

/*==============================================================*/
/* Index: CONTEM3_FK                                            */
/*==============================================================*/
create index CONTEM3_FK on CONTEM (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Table: ENCOMENDA                                             */
/*==============================================================*/
create table ENCOMENDA 
(
   QUANT_ENCOMENDA      NUMBER,
   ID_ENCOMENDA         NUMBER               not null,
   ARMAZEM_ORIGEM       NUMBER,
   ARMAZEM_DESTINO      NUMBER,
   constraint PK_ENCOMENDA primary key (ID_ENCOMENDA)
);

/*==============================================================*/
/* Table: ESTA                                                  */
/*==============================================================*/
create table ESTA 
(
   ID_ROTA              NUMBER               not null,
   ID_ARMAZEM           NUMBER               not null,
   constraint PK_ESTA primary key (ID_ROTA, ID_ARMAZEM)
);

/*==============================================================*/
/* Index: ESTA_FK                                               */
/*==============================================================*/
create index ESTA_FK on ESTA (
   ID_ROTA ASC
);

/*==============================================================*/
/* Index: ESTA2_FK                                              */
/*==============================================================*/
create index ESTA2_FK on ESTA (
   ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: FAZ                                                   */
/*==============================================================*/
create table FAZ 
(
   ID_FUNCIONARIO       NUMBER               not null,
   ID_VIAGEM            NUMBER               not null,
   ID_VISITA            NUMBER               not null,
   constraint PK_FAZ primary key (ID_FUNCIONARIO, ID_VIAGEM, ID_VISITA)
);

/*==============================================================*/
/* Index: FAZ_FK                                                */
/*==============================================================*/
create index FAZ_FK on FAZ (
   ID_FUNCIONARIO ASC,
   ID_VIAGEM ASC
);

/*==============================================================*/
/* Index: FAZ2_FK                                               */
/*==============================================================*/
create index FAZ2_FK on FAZ (
   ID_VISITA ASC
);

/*==============================================================*/
/* Table: FAZEM                                                 */
/*==============================================================*/
create table FAZEM 
(
   ID_ARMAZEM           NUMBER               not null,
   ID_ENCOMENDA         NUMBER               not null,
   constraint PK_FAZEM primary key (ID_ARMAZEM, ID_ENCOMENDA)
);

/*==============================================================*/
/* Index: FAZEM_FK                                              */
/*==============================================================*/
create index FAZEM_FK on FAZEM (
   ID_ARMAZEM ASC
);

/*==============================================================*/
/* Index: FAZEM2_FK                                             */
/*==============================================================*/
create index FAZEM2_FK on FAZEM (
   ID_ENCOMENDA ASC
);

/*==============================================================*/
/* Table: FUNCIONARIO                                           */
/*==============================================================*/
create table FUNCIONARIO 
(
   ID_FUNCIONARIO       NUMBER               not null,
   CONTACTO             NUMBER,
   NOME                 VARCHAR2(256),
   CARGO                VARCHAR2(256),
   constraint PK_FUNCIONARIO primary key (ID_FUNCIONARIO)
);

/*==============================================================*/
/* Table: GUARDA                                                */
/*==============================================================*/
create table GUARDA 
(
   ID_COMPARTIMENTO     NUMBER               not null,
   ID_PRODUTO           NUMBER               not null,
   constraint PK_GUARDA primary key (ID_COMPARTIMENTO, ID_PRODUTO)
);

/*==============================================================*/
/* Index: GUARDA_FK                                             */
/*==============================================================*/
create index GUARDA_FK on GUARDA (
   ID_COMPARTIMENTO ASC
);

/*==============================================================*/
/* Index: GUARDA2_FK                                            */
/*==============================================================*/
create index GUARDA2_FK on GUARDA (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Table: MAQUINA                                               */
/*==============================================================*/
create table MAQUINA 
(
   ID_MAQUINA           NUMBER               not null,
   QUANTIDADE_VENDIDA   NUMBER,
   ESTADO_MAQUINA       VARCHAR2(256),
   LONGITUDE            NUMBER,
   LATITUDE             NUMBER,
   constraint PK_MAQUINA primary key (ID_MAQUINA)
);

/*==============================================================*/
/* Table: PERTENCE                                              */
/*==============================================================*/
create table PERTENCE 
(
   ID_ROTA              NUMBER               not null,
   ID_MAQUINA           NUMBER               not null,
   ORDEM                VARCHAR2(256),
   constraint PK_PERTENCE primary key (ID_ROTA, ID_MAQUINA)
);

/*==============================================================*/
/* Index: PERTENCE_FK                                           */
/*==============================================================*/
create index PERTENCE_FK on PERTENCE (
   ID_ROTA ASC
);

/*==============================================================*/
/* Index: PERTENCE2_FK                                          */
/*==============================================================*/
create index PERTENCE2_FK on PERTENCE (
   ID_MAQUINA ASC
);

/*==============================================================*/
/* Table: PRODUTO                                               */
/*==============================================================*/
create table PRODUTO 
(
   ID_PRODUTO           NUMBER               not null,
   NOME                 VARCHAR2(256),
   PRECO                NUMBER,
   UNIDADES_VENDIDAS    NUMBER,
   QUANT_EM_MAQUINAS    NUMBER,
   TIPO                 VARCHAR2(256),
   constraint PK_PRODUTO primary key (ID_PRODUTO)
);

/*==============================================================*/
/* Table: ROTA                                                  */
/*==============================================================*/
create table ROTA 
(
   ID_ROTA              NUMBER               not null,
   NOME                 VARCHAR2(256),
   DISTANCIA_TOTAL      NUMBER,
   constraint PK_ROTA primary key (ID_ROTA)
);

/*==============================================================*/
/* Table: TEM                                                   */
/*==============================================================*/
create table TEM 
(
   ID_VISITA            NUMBER               not null,
   ID_MAQUINA           NUMBER               not null,
   constraint PK_TEM primary key (ID_VISITA, ID_MAQUINA)
);

/*==============================================================*/
/* Index: TEM_FK                                                */
/*==============================================================*/
create index TEM_FK on TEM (
   ID_VISITA ASC
);

/*==============================================================*/
/* Index: TEM2_FK                                               */
/*==============================================================*/
create index TEM2_FK on TEM (
   ID_MAQUINA ASC
);

/*==============================================================*/
/* Table: TEM2                                                  */
/*==============================================================*/
create table TEM2 
(
   ID_ENCOMENDA         NUMBER               not null,
   ID_PRODUTO           NUMBER               not null,
   constraint PK_TEM2 primary key (ID_ENCOMENDA, ID_PRODUTO)
);

/*==============================================================*/
/* Index: TEM3_FK                                               */
/*==============================================================*/
create index TEM3_FK on TEM2 (
   ID_ENCOMENDA ASC
);

/*==============================================================*/
/* Index: TEM4_FK                                               */
/*==============================================================*/
create index TEM4_FK on TEM2 (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Table: VEICULO                                               */
/*==============================================================*/
create table VEICULO 
(
   ID_VEICULO           NUMBER               not null,
   ID_ARMAZEM           NUMBER               not null,
   AUTONOMIA            NUMBER,
   CAPACIDADE           NUMBER,
   DISPONIVEL           VARCHAR2(1024),
   constraint PK_VEICULO primary key (ID_VEICULO)
);

/*==============================================================*/
/* Index: CONTEM_FK                                             */
/*==============================================================*/
create index CONTEM_FK on VEICULO (
   ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: VENDA                                                 */
/*==============================================================*/
create table VENDA 
(
   ID_COMPARTIMENTO     NUMBER               not null,
   ID_VENDA             NUMBER               not null,
   ID_PRODUTO           NUMBER               not null,
   METODO_PAGAMENTO     VARCHAR2(256),
   constraint PK_VENDA primary key (ID_COMPARTIMENTO, ID_VENDA)
);

/*==============================================================*/
/* Index: VENDE_SE_FK                                           */
/*==============================================================*/
create index VENDE_SE_FK on VENDA (
   ID_PRODUTO ASC
);

/*==============================================================*/
/* Index: REGISTA_FK                                            */
/*==============================================================*/
create index REGISTA_FK on VENDA (
   ID_COMPARTIMENTO ASC
);

/*==============================================================*/
/* Table: VIAGEM                                                */
/*==============================================================*/
create table VIAGEM 
(
   ID_FUNCIONARIO       NUMBER               not null,
   ID_VIAGEM            NUMBER               not null,
   ID_ROTA              NUMBER,
   ID_VEICULO           NUMBER,
   DATA_INICIO          DATE,
   DATA_FIM             DATE,
   DISTANCIA            NUMBER,
   ESTADO               VARCHAR2(256),
   constraint PK_VIAGEM primary key (ID_FUNCIONARIO, ID_VIAGEM)
);

/*==============================================================*/
/* Index: SEGUE_FK                                              */
/*==============================================================*/
create index SEGUE_FK on VIAGEM (
   ID_ROTA ASC
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create index REALIZA_FK on VIAGEM (
   ID_VEICULO ASC
);

/*==============================================================*/
/* Index: EXECUTA_FK                                            */
/*==============================================================*/
create index EXECUTA_FK on VIAGEM (
   ID_FUNCIONARIO ASC
);

/*==============================================================*/
/* Table: VISITA                                                */
/*==============================================================*/
create table VISITA 
(
   ID_VISITA            NUMBER               not null,
   DATA_VISITA          DATE,
   ESTADO_MAQUINA       VARCHAR2(256),
   constraint PK_VISITA primary key (ID_VISITA)
);

alter table ABASTECE
   add constraint FK_ABASTECE_ABASTECE_COMPARTI foreign key (ID_COMPARTIMENTO)
      references COMPARTIMENTO (ID_COMPARTIMENTO);

alter table ABASTECE
   add constraint FK_ABASTECE_ABASTECE2_VISITA foreign key (ID_VISITA)
      references VISITA (ID_VISITA);

alter table ARMAZENA
   add constraint FK_ARMAZENA_ARMAZENA_PRODUTO foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO);

alter table ARMAZENA
   add constraint FK_ARMAZENA_ARMAZENA2_ARMAZEM foreign key (ID_ARMAZEM)
      references ARMAZEM (ID_ARMAZEM);

alter table COMPARTIMENTO
   add constraint FK_COMPARTI_POSSUI_MAQUINA foreign key (ID_MAQUINA)
      references MAQUINA (ID_MAQUINA);

alter table CONTEM
   add constraint FK_CONTEM_CONTEM2_VIAGEM foreign key (ID_FUNCIONARIO, ID_VIAGEM)
      references VIAGEM (ID_FUNCIONARIO, ID_VIAGEM);

alter table CONTEM
   add constraint FK_CONTEM_CONTEM3_PRODUTO foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO);

alter table ESTA
   add constraint FK_ESTA_ESTA_ROTA foreign key (ID_ROTA)
      references ROTA (ID_ROTA);

alter table ESTA
   add constraint FK_ESTA_ESTA2_ARMAZEM foreign key (ID_ARMAZEM)
      references ARMAZEM (ID_ARMAZEM);

alter table FAZ
   add constraint FK_FAZ_FAZ_VIAGEM foreign key (ID_FUNCIONARIO, ID_VIAGEM)
      references VIAGEM (ID_FUNCIONARIO, ID_VIAGEM);

alter table FAZ
   add constraint FK_FAZ_FAZ2_VISITA foreign key (ID_VISITA)
      references VISITA (ID_VISITA);

alter table FAZEM
   add constraint FK_FAZEM_FAZEM_ARMAZEM foreign key (ID_ARMAZEM)
      references ARMAZEM (ID_ARMAZEM);

alter table FAZEM
   add constraint FK_FAZEM_FAZEM2_ENCOMEND foreign key (ID_ENCOMENDA)
      references ENCOMENDA (ID_ENCOMENDA);

alter table GUARDA
   add constraint FK_GUARDA_GUARDA_COMPARTI foreign key (ID_COMPARTIMENTO)
      references COMPARTIMENTO (ID_COMPARTIMENTO);

alter table GUARDA
   add constraint FK_GUARDA_GUARDA2_PRODUTO foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO);

alter table PERTENCE
   add constraint FK_PERTENCE_PERTENCE_ROTA foreign key (ID_ROTA)
      references ROTA (ID_ROTA);

alter table PERTENCE
   add constraint FK_PERTENCE_PERTENCE2_MAQUINA foreign key (ID_MAQUINA)
      references MAQUINA (ID_MAQUINA);

alter table TEM
   add constraint FK_TEM_TEM_VISITA foreign key (ID_VISITA)
      references VISITA (ID_VISITA);

alter table TEM
   add constraint FK_TEM_TEM2_MAQUINA foreign key (ID_MAQUINA)
      references MAQUINA (ID_MAQUINA);

alter table TEM2
   add constraint FK_TEM2_TEM3_ENCOMEND foreign key (ID_ENCOMENDA)
      references ENCOMENDA (ID_ENCOMENDA);

alter table TEM2
   add constraint FK_TEM2_TEM4_PRODUTO foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO);

alter table VEICULO
   add constraint FK_VEICULO_CONTEM_ARMAZEM foreign key (ID_ARMAZEM)
      references ARMAZEM (ID_ARMAZEM);

alter table VENDA
   add constraint FK_VENDA_REGISTA_COMPARTI foreign key (ID_COMPARTIMENTO)
      references COMPARTIMENTO (ID_COMPARTIMENTO);

alter table VENDA
   add constraint FK_VENDA_VENDE_SE_PRODUTO foreign key (ID_PRODUTO)
      references PRODUTO (ID_PRODUTO);

alter table VIAGEM
   add constraint FK_VIAGEM_EXECUTA_FUNCIONA foreign key (ID_FUNCIONARIO)
      references FUNCIONARIO (ID_FUNCIONARIO);

alter table VIAGEM
   add constraint FK_VIAGEM_REALIZA_VEICULO foreign key (ID_VEICULO)
      references VEICULO (ID_VEICULO);

alter table VIAGEM
   add constraint FK_VIAGEM_SEGUE_ROTA foreign key (ID_ROTA)
      references ROTA (ID_ROTA);

