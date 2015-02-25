/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     02/03/2014 03:40:01 p.m.                     */
/*==============================================================*/


drop table if exists APLICACION;

drop table if exists CONTROLES;

drop table if exists ControlEvento;

drop table if exists ControlPropiedad;

drop table if exists EVENTOS;

drop table if exists Estado;

drop table if exists Formato;

drop table if exists PROCESOS;

drop table if exists PROPIEDADES;

drop table if exists ProcesoControl;

drop table if exists ProcesoPropiedad;

drop table if exists ProcesoRequerimientoFuncional;

drop table if exists REQUERIMIENTOSFUNCIONALES;

drop table if exists SYSOPCIONESAPLICACION;

drop table if exists SysAplicacion;

drop table if exists TipoEstado;

/*==============================================================*/
/* Table: APLICACION                                            */
/*==============================================================*/
create table APLICACION
(
   id                   int not null auto_increment,
   nombre               varchar(250),
   fechaRegistro        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: CONTROLES                                             */
/*==============================================================*/
create table CONTROLES
(
   id                   int not null,
   nombre               varchar(250),
   fechaRegistro        datetime,
   fechaUltAct          datetime,
   estadoId             int,
   primary key (id)
);

/*==============================================================*/
/* Table: ControlEvento                                         */
/*==============================================================*/
create table ControlEvento
(
   id                   int not null auto_increment,
   ControlId            int,
   EventoId             int,
   FechaRegistro        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: ControlPropiedad                                      */
/*==============================================================*/
create table ControlPropiedad
(
   ControlId            int,
   PropiedadId          int
);

/*==============================================================*/
/* Table: EVENTOS                                               */
/*==============================================================*/
create table EVENTOS
(
   id                   int not null,
   nombre               varchar(250),
   fechaRegistro        datetime,
   fechaUltAct          datetime,
   estadoId             int,
   primary key (id)
);

/*==============================================================*/
/* Table: Estado                                                */
/*==============================================================*/
create table Estado
(
   id                   int not null,
   tipoEstado           int,
   nombre               varchar(100),
   abreviatura          varchar(5),
   primary key (id)
);

/*==============================================================*/
/* Table: Formato                                               */
/*==============================================================*/
create table Formato
(
   id                   int not null,
   nombre               varchar(250),
   fechaRegistro        datetime,
   fechaUltAct          datetime,
   propiedadId          int,
   primary key (id)
);

/*==============================================================*/
/* Table: PROCESOS                                              */
/*==============================================================*/
create table PROCESOS
(
   id                   int not null,
   nombre               varchar(250),
   fechaRegistro        datetime,
   AplicacionId         int,
   fechaUltAct          datetime,
   descripcion          varchar(255),
   estadoId             int,
   primary key (id)
);

/*==============================================================*/
/* Table: PROPIEDADES                                           */
/*==============================================================*/
create table PROPIEDADES
(
   id                   int not null,
   nombre               varchar(250),
   fechaRegistro        datetime,
   fechaUltAct          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: ProcesoControl                                        */
/*==============================================================*/
create table ProcesoControl
(
   id                   int not null,
   ProcesoId            int,
   fechaRegistro        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: ProcesoPropiedad                                      */
/*==============================================================*/
create table ProcesoPropiedad
(
   id                   int not null,
   fechaRegistro        datetime,
   procesoId            int,
   primary key (id)
);

/*==============================================================*/
/* Table: ProcesoRequerimientoFuncional                         */
/*==============================================================*/
create table ProcesoRequerimientoFuncional
(
   id                   int not null,
   fechaRegistro        datetime,
   procesoId            int,
   requerimientoFuncionalId int,
   primary key (id)
);

/*==============================================================*/
/* Table: REQUERIMIENTOSFUNCIONALES                             */
/*==============================================================*/
create table REQUERIMIENTOSFUNCIONALES
(
   id                   int not null,
   nombre               varchar(250),
   fechaRegistro        datetime,
   AplicacionId         int,
   primary key (id)
);

/*==============================================================*/
/* Table: SYSOPCIONESAPLICACION                                 */
/*==============================================================*/
create table SYSOPCIONESAPLICACION
(
   id                   int not null,
   SysAplicacionId      int,
   nombre               varchar(250),
   fechaRegistro        date,
   primary key (id)
);

/*==============================================================*/
/* Table: SysAplicacion                                         */
/*==============================================================*/
create table SysAplicacion
(
   id                   int not null,
   nombre               varchar(255),
   fechaRegistro        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: TipoEstado                                            */
/*==============================================================*/
create table TipoEstado
(
   id                   int not null,
   nombre               varchar(150),
   primary key (id)
);

alter table TipoEstado comment '1: Estados Generales de Mantenimientos
valores
0';

alter table CONTROLES add constraint FK_FK_CTRL_EST foreign key (estadoId)
      references Estado (id) on delete restrict on update restrict;

alter table ControlEvento add constraint FK_FK_CTRLEVENT_CTRL foreign key (ControlId)
      references CONTROLES (id) on delete restrict on update restrict;

alter table ControlEvento add constraint FK_FK_CTRLEVEN_EVEN foreign key (EventoId)
      references EVENTOS (id) on delete restrict on update restrict;

alter table ControlPropiedad add constraint FK_FK_CTRLPROP_CTRL foreign key (ControlId)
      references CONTROLES (id) on delete restrict on update restrict;

alter table ControlPropiedad add constraint FK_FK_CTRLPROP_PROP foreign key (PropiedadId)
      references PROPIEDADES (id) on delete restrict on update restrict;

alter table EVENTOS add constraint FK_FK_EVENT_ESTADO foreign key (estadoId)
      references Estado (id) on delete restrict on update restrict;

alter table Estado add constraint FK_Reference_12 foreign key (tipoEstado)
      references TipoEstado (id) on delete restrict on update restrict;

alter table Formato add constraint FK_FORMAT_PROP foreign key (propiedadId)
      references PROPIEDADES (id) on delete restrict on update restrict;

alter table PROCESOS add constraint FK_FK_PROC_APL foreign key (AplicacionId)
      references APLICACION (id) on delete restrict on update restrict;

alter table PROCESOS add constraint FK_PROC_EST foreign key (id)
      references Estado (id) on delete restrict on update restrict;

alter table ProcesoControl add constraint FK_FK_PROCCTRL_PROC foreign key (ProcesoId)
      references PROCESOS (id) on delete restrict on update restrict;

alter table ProcesoPropiedad add constraint FK_FK_PROCPROP_PROC foreign key (procesoId)
      references PROCESOS (id) on delete restrict on update restrict;

alter table ProcesoRequerimientoFuncional add constraint FK_FK_PROCREQFUNC_REQFUNC foreign key (requerimientoFuncionalId)
      references REQUERIMIENTOSFUNCIONALES (id) on delete restrict on update restrict;

alter table ProcesoRequerimientoFuncional add constraint FK_FK_REQFUNC_PROC foreign key (procesoId)
      references PROCESOS (id) on delete restrict on update restrict;

alter table REQUERIMIENTOSFUNCIONALES add constraint FK_FK_REQFUNC_APL foreign key (AplicacionId)
      references APLICACION (id) on delete restrict on update restrict;

alter table SYSOPCIONESAPLICACION add constraint FK_SYSOPCAPL_SYSAPL foreign key (SysAplicacionId)
      references SysAplicacion (id) on delete restrict on update restrict;

