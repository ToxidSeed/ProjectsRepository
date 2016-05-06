/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/24/2015 12:41:05 PM                       */
/*==============================================================*/


drop table if exists IC;

drop table if exists UF;

/*==============================================================*/
/* Table: IC                                                    */
/*==============================================================*/
create table IC
(
   ICID                 int not null,
   UFID                 int not null,
   DESCRIPCION          varchar(250),
   QUERY                text,
   primary key (ICID, UFID)
);

/*==============================================================*/
/* Table: UF                                                    */
/*==============================================================*/
create table UF
(
   ID                   int not null auto_increment,
   NOMBRE               varchar(50),
   CODIGO               varchar(50),
   COLUMNA_PRINCIPAL    varchar(20),
   primary key (ID)
);

alter table IC add constraint FK_REFERENCE_1 foreign key (UFID)
      references UF (ID) on delete restrict on update restrict;

