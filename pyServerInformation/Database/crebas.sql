/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/15/2015 10:48:08 AM                       */
/*==============================================================*/


drop table if exists COMPONENTE;

drop table if exists CONFIGURACION_CUENTA;

drop table if exists CUENTA;

drop table if exists ESTADO;

drop table if exists PARAMETRO;

drop table if exists TIPO_ESTADO;

/*==============================================================*/
/* Table: COMPONENTE                                            */
/*==============================================================*/
create table COMPONENTE
(
   ID                   int not null,
   NOMBRE               varchar(50),
   primary key (ID)
);

/*==============================================================*/
/* Table: CONFIGURACION_CUENTA                                  */
/*==============================================================*/
create table CONFIGURACION_CUENTA
(
   ID                   int not null,
   CUENTA_ID            int,
   COMPONENTE_ID        int,
   PARAMETRO_ID         int,
   VALOR                varchar(100),
   primary key (ID)
);

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
create table CUENTA
(
   ID                   int not null,
   USUARIO              varchar(50),
   PASSWORD             varchar(255),
   EMAIL                varchar(255),
   FECHA_REGISTRO       date,
   primary key (ID)
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO
(
   ID                   int not null,
   NOMBRE               varchar(50),
   TIPO_ESTADO_ID       int,
   primary key (ID)
);

/*==============================================================*/
/* Table: PARAMETRO                                             */
/*==============================================================*/
create table PARAMETRO
(
   ID                   int not null,
   NOMBRE               varchar(50),
   COMPONENTE_ID        int,
   primary key (ID)
);

/*==============================================================*/
/* Table: TIPO_ESTADO                                           */
/*==============================================================*/
create table TIPO_ESTADO
(
   ID                   int not null,
   NOMBRE               varchar(50),
   primary key (ID)
);

alter table CONFIGURACION_CUENTA add constraint FK_REFERENCE_1 foreign key (CUENTA_ID)
      references CUENTA (ID) on delete restrict on update restrict;

alter table CONFIGURACION_CUENTA add constraint FK_REFERENCE_3 foreign key (ID)
      references COMPONENTE (ID) on delete restrict on update restrict;

alter table ESTADO add constraint FK_REFERENCE_4 foreign key (TIPO_ESTADO_ID)
      references TIPO_ESTADO (ID) on delete restrict on update restrict;

alter table PARAMETRO add constraint FK_REFERENCE_2 foreign key (COMPONENTE_ID)
      references COMPONENTE (ID) on delete restrict on update restrict;

