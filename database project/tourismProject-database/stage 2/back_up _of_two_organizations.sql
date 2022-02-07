?��prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by owner on ��������� 24 ��� 2020
set feedback off
set define off

prompt Creating AREA...
create table AREA
(
  a_name VARCHAR2(15) not null,
  a_id   NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AREA
  add primary key (A_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ATTRACTIONS...
create table ATTRACTIONS
(
  atraction_name         VARCHAR2(10) not null,
  atraction_number       INTEGER not null,
  atraction_open_hours   INTEGER not null,
  atraction_close_houes  INTEGER not null,
  atraction_price        INTEGER not null,
  number_of_participants INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ATTRACTIONS
  add constraint PK_ATTRACTIONS primary key (ATRACTION_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MY_GROUP...
create table MY_GROUP
(
  amount NUMBER(5) not null,
  m_g_id NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MY_GROUP
  add primary key (M_G_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CITY...
create table CITY
(
  c_id   NUMBER(5) not null,
  c_name VARCHAR2(15) not null,
  a_id   NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITY
  add primary key (C_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITY
  add foreign key (A_ID)
  references AREA (A_ID);

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  e_id      NUMBER(5) not null,
  e_name    VARCHAR2(15) not null,
  hire_date DATE not null,
  c_id      NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEE
  add primary key (E_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMPLOYEE
  add foreign key (C_ID)
  references CITY (C_ID);

prompt Creating GUIDE...
create table GUIDE
(
  g_id       NUMBER(5) not null,
  experience NUMBER(5,1) not null,
  e_id       NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GUIDE
  add primary key (G_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GUIDE
  add foreign key (E_ID)
  references EMPLOYEE (E_ID);

prompt Creating INVITATION...
create table INVITATION
(
  price  NUMBER(5) not null,
  i_date DATE not null,
  i_id   NUMBER(5) not null,
  m_g_id NUMBER(5) not null,
  g_id   NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVITATION
  add primary key (I_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVITATION
  add foreign key (M_G_ID)
  references MY_GROUP (M_G_ID);
alter table INVITATION
  add foreign key (G_ID)
  references GUIDE (G_ID);

prompt Creating DIFFICULTY...
create table DIFFICULTY
(
  d_name VARCHAR2(15) not null,
  d_id   NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DIFFICULTY
  add primary key (D_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating KIND...
create table KIND
(
  k_name VARCHAR2(15) not null,
  k_id   NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KIND
  add primary key (K_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MY_PATH...
create table MY_PATH
(
  p_name   VARCHAR2(15) not null,
  p_time   NUMBER(5,2) not null,
  p_length NUMBER(5,2) not null,
  p_id     NUMBER(5) not null,
  a_id     NUMBER(5) not null,
  d_id     NUMBER(5) not null,
  k_id     NUMBER(5) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MY_PATH
  add primary key (P_ID, A_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MY_PATH
  add foreign key (A_ID)
  references AREA (A_ID);
alter table MY_PATH
  add foreign key (D_ID)
  references DIFFICULTY (D_ID);
alter table MY_PATH
  add foreign key (K_ID)
  references KIND (K_ID);

prompt Creating BELONGS_TO...
create table BELONGS_TO
(
  i_id NUMBER(5) not null,
  p_id NUMBER(5) not null,
  a_id NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BELONGS_TO
  add primary key (I_ID, P_ID, A_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BELONGS_TO
  add foreign key (I_ID)
  references INVITATION (I_ID);
alter table BELONGS_TO
  add foreign key (P_ID, A_ID)
  references MY_PATH (P_ID, A_ID);

prompt Creating CLIENT...
create table CLIENT
(
  c_tz   NUMBER(5) not null,
  c_name VARCHAR2(15) not null,
  b_date DATE not null,
  c_id   NUMBER(5),
  m_g_id NUMBER(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add primary key (C_TZ)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add foreign key (C_ID)
  references CITY (C_ID);
alter table CLIENT
  add foreign key (M_G_ID)
  references MY_GROUP (M_G_ID);

prompt Creating PATH...
create table PATH
(
  num_of_stations INTEGER not null,
  p_id            INTEGER not null,
  begin_city      VARCHAR2(15) not null,
  end_city        VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PATH
  add constraint PK_PATH primary key (P_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SHIP...
create table SHIP
(
  ship_id            INTEGER not null,
  ship_name          VARCHAR2(10) not null,
  floors             INTEGER not null,
  capacity_of_people INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIP
  add constraint PK_SHIP primary key (SHIP_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CRUISE...
create table CRUISE
(
  begin_date    DATE not null,
  end_date      DATE not null,
  cruise_number INTEGER not null,
  cruise_name   VARCHAR2(10) not null,
  p_id          INTEGER not null,
  ship_id       INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CRUISE
  add primary key (CRUISE_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CRUISE
  add foreign key (P_ID)
  references PATH (P_ID);
alter table CRUISE
  add foreign key (SHIP_ID)
  references SHIP (SHIP_ID);

prompt Creating SPA...
create table SPA
(
  spa_number      INTEGER not null,
  spa_open_hours  INTEGER not null,
  entrence_age    INTEGER not null,
  spa_close_hours INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SPA
  add constraint PK_SPA primary key (SPA_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating GO_TO...
create table GO_TO
(
  client_id  NUMBER(5) not null,
  spa_number INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GO_TO
  add primary key (CLIENT_ID, SPA_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GO_TO
  add foreign key (CLIENT_ID)
  references CLIENT (C_TZ);
alter table GO_TO
  add foreign key (SPA_NUMBER)
  references SPA (SPA_NUMBER);

prompt Creating INCLUDE...
create table INCLUDE
(
  p_id    INTEGER not null,
  city_id NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INCLUDE
  add primary key (P_ID, CITY_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INCLUDE
  add foreign key (P_ID)
  references PATH (P_ID);
alter table INCLUDE
  add foreign key (CITY_ID)
  references CITY (C_ID);

prompt Creating PARTICIPATE...
create table PARTICIPATE
(
  client_id        NUMBER(5) not null,
  atraction_number INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPATE
  add primary key (CLIENT_ID, ATRACTION_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPATE
  add foreign key (CLIENT_ID)
  references CLIENT (C_TZ);
alter table PARTICIPATE
  add foreign key (ATRACTION_NUMBER)
  references ATTRACTIONS (ATRACTION_NUMBER);

prompt Creating ROOM...
create table ROOM
(
  room_number INTEGER not null,
  num_beds    INTEGER not null,
  room_price  INTEGER not null,
  status      CHAR(10) not null,
  ship_id     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint PK_ROOM primary key (ROOM_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint FK_ROOM_SHIP foreign key (SHIP_ID)
  references SHIP (SHIP_ID);

prompt Creating VISIT...
create table VISIT
(
  client_id NUMBER(5) not null,
  city_id   NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VISIT
  add primary key (CLIENT_ID, CITY_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VISIT
  add foreign key (CLIENT_ID)
  references CLIENT (C_TZ);
alter table VISIT
  add foreign key (CITY_ID)
  references CITY (C_ID);

prompt Creating WORKING_AT...
create table WORKING_AT
(
  e_id       NUMBER(5) not null,
  spa_number INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKING_AT
  add primary key (E_ID, SPA_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKING_AT
  add foreign key (E_ID)
  references EMPLOYEE (E_ID);
alter table WORKING_AT
  add foreign key (SPA_NUMBER)
  references SPA (SPA_NUMBER);

prompt Disabling triggers for AREA...
alter table AREA disable all triggers;
prompt Disabling triggers for ATTRACTIONS...
alter table ATTRACTIONS disable all triggers;
prompt Disabling triggers for MY_GROUP...
alter table MY_GROUP disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for GUIDE...
alter table GUIDE disable all triggers;
prompt Disabling triggers for INVITATION...
alter table INVITATION disable all triggers;
prompt Disabling triggers for DIFFICULTY...
alter table DIFFICULTY disable all triggers;
prompt Disabling triggers for KIND...
alter table KIND disable all triggers;
prompt Disabling triggers for MY_PATH...
alter table MY_PATH disable all triggers;
prompt Disabling triggers for BELONGS_TO...
alter table BELONGS_TO disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for PATH...
alter table PATH disable all triggers;
prompt Disabling triggers for SHIP...
alter table SHIP disable all triggers;
prompt Disabling triggers for CRUISE...
alter table CRUISE disable all triggers;
prompt Disabling triggers for SPA...
alter table SPA disable all triggers;
prompt Disabling triggers for GO_TO...
alter table GO_TO disable all triggers;
prompt Disabling triggers for INCLUDE...
alter table INCLUDE disable all triggers;
prompt Disabling triggers for PARTICIPATE...
alter table PARTICIPATE disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for VISIT...
alter table VISIT disable all triggers;
prompt Disabling triggers for WORKING_AT...
alter table WORKING_AT disable all triggers;
prompt Disabling foreign key constraints for CITY...
alter table CITY disable constraint SYS_C0011091;
prompt Disabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE disable constraint SYS_C0011097;
prompt Disabling foreign key constraints for GUIDE...
alter table GUIDE disable constraint SYS_C0011102;
prompt Disabling foreign key constraints for INVITATION...
alter table INVITATION disable constraint SYS_C0011109;
alter table INVITATION disable constraint SYS_C0011110;
prompt Disabling foreign key constraints for MY_PATH...
alter table MY_PATH disable constraint SYS_C0011138;
alter table MY_PATH disable constraint SYS_C0011139;
alter table MY_PATH disable constraint SYS_C0011140;
prompt Disabling foreign key constraints for BELONGS_TO...
alter table BELONGS_TO disable constraint SYS_C0011145;
alter table BELONGS_TO disable constraint SYS_C0011146;
prompt Disabling foreign key constraints for CLIENT...
alter table CLIENT disable constraint SYS_C0011122;
alter table CLIENT disable constraint SYS_C0011123;
prompt Disabling foreign key constraints for CRUISE...
alter table CRUISE disable constraint SYS_C0011265;
alter table CRUISE disable constraint SYS_C0011266;
prompt Disabling foreign key constraints for GO_TO...
alter table GO_TO disable constraint SYS_C0011408;
alter table GO_TO disable constraint SYS_C0011409;
prompt Disabling foreign key constraints for INCLUDE...
alter table INCLUDE disable constraint SYS_C0011418;
alter table INCLUDE disable constraint SYS_C0011419;
prompt Disabling foreign key constraints for PARTICIPATE...
alter table PARTICIPATE disable constraint SYS_C0011413;
alter table PARTICIPATE disable constraint SYS_C0011414;
prompt Disabling foreign key constraints for ROOM...
alter table ROOM disable constraint FK_ROOM_SHIP;
prompt Disabling foreign key constraints for VISIT...
alter table VISIT disable constraint SYS_C0011403;
alter table VISIT disable constraint SYS_C0011404;
prompt Disabling foreign key constraints for WORKING_AT...
alter table WORKING_AT disable constraint SYS_C0011423;
alter table WORKING_AT disable constraint SYS_C0011424;
prompt Deleting WORKING_AT...
delete from WORKING_AT;
commit;
prompt Deleting VISIT...
delete from VISIT;
commit;
prompt Deleting ROOM...
delete from ROOM;
commit;
prompt Deleting PARTICIPATE...
delete from PARTICIPATE;
commit;
prompt Deleting INCLUDE...
delete from INCLUDE;
commit;
prompt Deleting GO_TO...
delete from GO_TO;
commit;
prompt Deleting SPA...
delete from SPA;
commit;
prompt Deleting CRUISE...
delete from CRUISE;
commit;
prompt Deleting SHIP...
delete from SHIP;
commit;
prompt Deleting PATH...
delete from PATH;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting BELONGS_TO...
delete from BELONGS_TO;
commit;
prompt Deleting MY_PATH...
delete from MY_PATH;
commit;
prompt Deleting KIND...
delete from KIND;
commit;
prompt Deleting DIFFICULTY...
delete from DIFFICULTY;
commit;
prompt Deleting INVITATION...
delete from INVITATION;
commit;
prompt Deleting GUIDE...
delete from GUIDE;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting MY_GROUP...
delete from MY_GROUP;
commit;
prompt Deleting ATTRACTIONS...
delete from ATTRACTIONS;
commit;
prompt Deleting AREA...
delete from AREA;
commit;
prompt Loading AREA...
insert into AREA (a_name, a_id)
values ('est', 67984);
insert into AREA (a_name, a_id)
values ('west', 17792);
insert into AREA (a_name, a_id)
values ('west', 64848);
insert into AREA (a_name, a_id)
values ('south', 38778);
insert into AREA (a_name, a_id)
values ('west', 38162);
insert into AREA (a_name, a_id)
values ('north', 41225);
insert into AREA (a_name, a_id)
values ('est', 61217);
insert into AREA (a_name, a_id)
values ('est', 29534);
insert into AREA (a_name, a_id)
values ('south', 31735);
insert into AREA (a_name, a_id)
values ('west', 19667);
insert into AREA (a_name, a_id)
values ('est', 76945);
insert into AREA (a_name, a_id)
values ('est', 62161);
insert into AREA (a_name, a_id)
values ('south', 82718);
insert into AREA (a_name, a_id)
values ('west', 21438);
insert into AREA (a_name, a_id)
values ('south', 41572);
insert into AREA (a_name, a_id)
values ('west', 17995);
insert into AREA (a_name, a_id)
values ('est', 27653);
insert into AREA (a_name, a_id)
values ('est', 23743);
insert into AREA (a_name, a_id)
values ('west', 75149);
insert into AREA (a_name, a_id)
values ('est', 19355);
insert into AREA (a_name, a_id)
values ('south', 71418);
insert into AREA (a_name, a_id)
values ('south', 76895);
insert into AREA (a_name, a_id)
values ('south', 28361);
insert into AREA (a_name, a_id)
values ('south', 47713);
insert into AREA (a_name, a_id)
values ('south', 38424);
insert into AREA (a_name, a_id)
values ('south', 11914);
insert into AREA (a_name, a_id)
values ('west', 24467);
insert into AREA (a_name, a_id)
values ('est', 25651);
insert into AREA (a_name, a_id)
values ('est', 33259);
insert into AREA (a_name, a_id)
values ('south', 64151);
insert into AREA (a_name, a_id)
values ('west', 16417);
insert into AREA (a_name, a_id)
values ('north', 83192);
insert into AREA (a_name, a_id)
values ('south', 58338);
insert into AREA (a_name, a_id)
values ('south', 27819);
insert into AREA (a_name, a_id)
values ('west', 36212);
insert into AREA (a_name, a_id)
values ('south', 78677);
insert into AREA (a_name, a_id)
values ('south', 68995);
insert into AREA (a_name, a_id)
values ('south', 16221);
insert into AREA (a_name, a_id)
values ('north', 14348);
insert into AREA (a_name, a_id)
values ('south', 15211);
insert into AREA (a_name, a_id)
values ('west', 37828);
insert into AREA (a_name, a_id)
values ('north', 41971);
insert into AREA (a_name, a_id)
values ('north', 99621);
insert into AREA (a_name, a_id)
values ('south', 81773);
insert into AREA (a_name, a_id)
values ('est', 65488);
insert into AREA (a_name, a_id)
values ('west', 17947);
insert into AREA (a_name, a_id)
values ('west', 34412);
insert into AREA (a_name, a_id)
values ('west', 86817);
insert into AREA (a_name, a_id)
values ('north', 93433);
insert into AREA (a_name, a_id)
values ('west', 63298);
insert into AREA (a_name, a_id)
values ('south', 12595);
insert into AREA (a_name, a_id)
values ('est', 42952);
insert into AREA (a_name, a_id)
values ('west', 54228);
insert into AREA (a_name, a_id)
values ('north', 25955);
insert into AREA (a_name, a_id)
values ('north', 65494);
insert into AREA (a_name, a_id)
values ('north', 96253);
insert into AREA (a_name, a_id)
values ('north', 73798);
insert into AREA (a_name, a_id)
values ('est', 88294);
insert into AREA (a_name, a_id)
values ('south', 47947);
insert into AREA (a_name, a_id)
values ('west', 54422);
insert into AREA (a_name, a_id)
values ('est', 23133);
insert into AREA (a_name, a_id)
values ('west', 64333);
insert into AREA (a_name, a_id)
values ('south', 13921);
insert into AREA (a_name, a_id)
values ('south', 72726);
insert into AREA (a_name, a_id)
values ('north', 12735);
insert into AREA (a_name, a_id)
values ('south', 81362);
insert into AREA (a_name, a_id)
values ('south', 12548);
insert into AREA (a_name, a_id)
values ('est', 46884);
insert into AREA (a_name, a_id)
values ('west', 26116);
insert into AREA (a_name, a_id)
values ('west', 32471);
insert into AREA (a_name, a_id)
values ('north', 39122);
insert into AREA (a_name, a_id)
values ('west', 32942);
insert into AREA (a_name, a_id)
values ('est', 95266);
insert into AREA (a_name, a_id)
values ('south', 82324);
insert into AREA (a_name, a_id)
values ('west', 36745);
insert into AREA (a_name, a_id)
values ('south', 27968);
insert into AREA (a_name, a_id)
values ('west', 56877);
insert into AREA (a_name, a_id)
values ('est', 72914);
insert into AREA (a_name, a_id)
values ('north', 25482);
insert into AREA (a_name, a_id)
values ('west', 88178);
insert into AREA (a_name, a_id)
values ('est', 37727);
insert into AREA (a_name, a_id)
values ('est', 88554);
insert into AREA (a_name, a_id)
values ('west', 17223);
insert into AREA (a_name, a_id)
values ('west', 89976);
insert into AREA (a_name, a_id)
values ('north', 33144);
insert into AREA (a_name, a_id)
values ('south', 66499);
insert into AREA (a_name, a_id)
values ('est', 36157);
insert into AREA (a_name, a_id)
values ('south', 97398);
insert into AREA (a_name, a_id)
values ('est', 95839);
insert into AREA (a_name, a_id)
values ('west', 66317);
insert into AREA (a_name, a_id)
values ('west', 89847);
insert into AREA (a_name, a_id)
values ('south', 87382);
insert into AREA (a_name, a_id)
values ('south', 13553);
insert into AREA (a_name, a_id)
values ('west', 92366);
insert into AREA (a_name, a_id)
values ('north', 29924);
insert into AREA (a_name, a_id)
values ('west', 95145);
insert into AREA (a_name, a_id)
values ('south', 55375);
insert into AREA (a_name, a_id)
values ('north', 44737);
insert into AREA (a_name, a_id)
values ('south', 69679);
insert into AREA (a_name, a_id)
values ('est', 19638);
commit;
prompt 100 records committed...
insert into AREA (a_name, a_id)
values ('south', 96179);
insert into AREA (a_name, a_id)
values ('north', 64547);
insert into AREA (a_name, a_id)
values ('west', 92237);
insert into AREA (a_name, a_id)
values ('north', 25429);
insert into AREA (a_name, a_id)
values ('north', 27838);
insert into AREA (a_name, a_id)
values ('north', 94135);
insert into AREA (a_name, a_id)
values ('south', 65296);
insert into AREA (a_name, a_id)
values ('west', 59648);
insert into AREA (a_name, a_id)
values ('est', 88774);
insert into AREA (a_name, a_id)
values ('west', 46485);
insert into AREA (a_name, a_id)
values ('south', 97417);
insert into AREA (a_name, a_id)
values ('north', 42951);
insert into AREA (a_name, a_id)
values ('north', 43818);
insert into AREA (a_name, a_id)
values ('north', 13798);
insert into AREA (a_name, a_id)
values ('est', 38135);
insert into AREA (a_name, a_id)
values ('north', 36649);
insert into AREA (a_name, a_id)
values ('north', 18515);
insert into AREA (a_name, a_id)
values ('west', 33755);
insert into AREA (a_name, a_id)
values ('north', 13951);
insert into AREA (a_name, a_id)
values ('est', 71982);
insert into AREA (a_name, a_id)
values ('south', 87166);
insert into AREA (a_name, a_id)
values ('south', 78725);
insert into AREA (a_name, a_id)
values ('north', 54997);
insert into AREA (a_name, a_id)
values ('est', 22623);
insert into AREA (a_name, a_id)
values ('west', 53412);
insert into AREA (a_name, a_id)
values ('south', 25127);
insert into AREA (a_name, a_id)
values ('est', 75545);
insert into AREA (a_name, a_id)
values ('north', 97781);
insert into AREA (a_name, a_id)
values ('est', 28213);
insert into AREA (a_name, a_id)
values ('north', 37388);
insert into AREA (a_name, a_id)
values ('south', 42272);
insert into AREA (a_name, a_id)
values ('west', 78984);
insert into AREA (a_name, a_id)
values ('west', 95615);
insert into AREA (a_name, a_id)
values ('north', 75998);
insert into AREA (a_name, a_id)
values ('north', 86738);
insert into AREA (a_name, a_id)
values ('north', 28636);
insert into AREA (a_name, a_id)
values ('est', 72484);
insert into AREA (a_name, a_id)
values ('north', 39678);
insert into AREA (a_name, a_id)
values ('south', 14876);
insert into AREA (a_name, a_id)
values ('west', 82267);
insert into AREA (a_name, a_id)
values ('est', 36265);
insert into AREA (a_name, a_id)
values ('west', 86618);
insert into AREA (a_name, a_id)
values ('south', 34588);
insert into AREA (a_name, a_id)
values ('north', 95246);
insert into AREA (a_name, a_id)
values ('north', 74114);
insert into AREA (a_name, a_id)
values ('south', 22714);
insert into AREA (a_name, a_id)
values ('north', 42149);
insert into AREA (a_name, a_id)
values ('north', 77966);
insert into AREA (a_name, a_id)
values ('south', 14791);
insert into AREA (a_name, a_id)
values ('north', 24759);
insert into AREA (a_name, a_id)
values ('north', 86442);
insert into AREA (a_name, a_id)
values ('est', 27196);
insert into AREA (a_name, a_id)
values ('north', 51842);
insert into AREA (a_name, a_id)
values ('south', 16272);
insert into AREA (a_name, a_id)
values ('south', 87571);
insert into AREA (a_name, a_id)
values ('west', 66731);
insert into AREA (a_name, a_id)
values ('north', 44824);
insert into AREA (a_name, a_id)
values ('north', 15234);
insert into AREA (a_name, a_id)
values ('west', 49674);
insert into AREA (a_name, a_id)
values ('west', 44298);
insert into AREA (a_name, a_id)
values ('west', 72226);
insert into AREA (a_name, a_id)
values ('south', 54238);
insert into AREA (a_name, a_id)
values ('west', 33654);
insert into AREA (a_name, a_id)
values ('north', 64646);
insert into AREA (a_name, a_id)
values ('west', 74963);
insert into AREA (a_name, a_id)
values ('north', 39133);
insert into AREA (a_name, a_id)
values ('est', 29752);
insert into AREA (a_name, a_id)
values ('est', 23818);
insert into AREA (a_name, a_id)
values ('north', 16367);
insert into AREA (a_name, a_id)
values ('est', 84956);
insert into AREA (a_name, a_id)
values ('north', 27118);
insert into AREA (a_name, a_id)
values ('west', 57189);
insert into AREA (a_name, a_id)
values ('est', 99195);
insert into AREA (a_name, a_id)
values ('est', 98362);
insert into AREA (a_name, a_id)
values ('south', 82767);
insert into AREA (a_name, a_id)
values ('west', 59453);
insert into AREA (a_name, a_id)
values ('west', 28264);
insert into AREA (a_name, a_id)
values ('south', 14937);
insert into AREA (a_name, a_id)
values ('south', 47526);
insert into AREA (a_name, a_id)
values ('est', 61112);
insert into AREA (a_name, a_id)
values ('est', 76832);
insert into AREA (a_name, a_id)
values ('est', 11653);
insert into AREA (a_name, a_id)
values ('north', 11515);
insert into AREA (a_name, a_id)
values ('est', 14329);
insert into AREA (a_name, a_id)
values ('south', 23821);
insert into AREA (a_name, a_id)
values ('est', 59522);
insert into AREA (a_name, a_id)
values ('west', 37871);
insert into AREA (a_name, a_id)
values ('north', 63461);
insert into AREA (a_name, a_id)
values ('est', 72897);
insert into AREA (a_name, a_id)
values ('est', 76338);
insert into AREA (a_name, a_id)
values ('est', 16735);
insert into AREA (a_name, a_id)
values ('west', 32466);
insert into AREA (a_name, a_id)
values ('est', 99887);
insert into AREA (a_name, a_id)
values ('north', 27714);
insert into AREA (a_name, a_id)
values ('south', 61436);
insert into AREA (a_name, a_id)
values ('north', 21912);
insert into AREA (a_name, a_id)
values ('south', 85416);
insert into AREA (a_name, a_id)
values ('south', 63863);
insert into AREA (a_name, a_id)
values ('west', 45835);
insert into AREA (a_name, a_id)
values ('north', 27723);
commit;
prompt 200 records committed...
insert into AREA (a_name, a_id)
values ('est', 34565);
insert into AREA (a_name, a_id)
values ('north', 75857);
insert into AREA (a_name, a_id)
values ('est', 59348);
insert into AREA (a_name, a_id)
values ('west', 15225);
insert into AREA (a_name, a_id)
values ('north', 18874);
insert into AREA (a_name, a_id)
values ('west', 12169);
insert into AREA (a_name, a_id)
values ('north', 59916);
insert into AREA (a_name, a_id)
values ('north', 19728);
insert into AREA (a_name, a_id)
values ('south', 56938);
insert into AREA (a_name, a_id)
values ('north', 11176);
insert into AREA (a_name, a_id)
values ('south', 71146);
insert into AREA (a_name, a_id)
values ('south', 67337);
insert into AREA (a_name, a_id)
values ('north', 15233);
insert into AREA (a_name, a_id)
values ('est', 44748);
insert into AREA (a_name, a_id)
values ('south', 35131);
insert into AREA (a_name, a_id)
values ('south', 55261);
insert into AREA (a_name, a_id)
values ('Center', 1);
insert into AREA (a_name, a_id)
values ('Jerusalem', 2);
insert into AREA (a_name, a_id)
values ('North', 3);
insert into AREA (a_name, a_id)
values ('South', 4);
insert into AREA (a_name, a_id)
values ('Shomron', 5);
insert into AREA (a_name, a_id)
values ('Yehuda', 6);
insert into AREA (a_name, a_id)
values ('North', 185);
insert into AREA (a_name, a_id)
values ('West', 961);
insert into AREA (a_name, a_id)
values ('Center', 936);
insert into AREA (a_name, a_id)
values ('Center', 271);
insert into AREA (a_name, a_id)
values ('Center', 673);
insert into AREA (a_name, a_id)
values ('Center', 848);
insert into AREA (a_name, a_id)
values ('Center', 962);
insert into AREA (a_name, a_id)
values ('West', 790);
insert into AREA (a_name, a_id)
values ('Center', 312);
insert into AREA (a_name, a_id)
values ('South', 296);
insert into AREA (a_name, a_id)
values ('West', 972);
insert into AREA (a_name, a_id)
values ('East', 242);
insert into AREA (a_name, a_id)
values ('Center', 537);
insert into AREA (a_name, a_id)
values ('Center', 27);
insert into AREA (a_name, a_id)
values ('North', 611);
insert into AREA (a_name, a_id)
values ('South', 709);
insert into AREA (a_name, a_id)
values ('East', 808);
insert into AREA (a_name, a_id)
values ('West', 946);
insert into AREA (a_name, a_id)
values ('East', 452);
insert into AREA (a_name, a_id)
values ('West', 575);
insert into AREA (a_name, a_id)
values ('Center', 933);
insert into AREA (a_name, a_id)
values ('East', 698);
insert into AREA (a_name, a_id)
values ('Center', 368);
insert into AREA (a_name, a_id)
values ('North', 9);
insert into AREA (a_name, a_id)
values ('Center', 592);
insert into AREA (a_name, a_id)
values ('North', 459);
insert into AREA (a_name, a_id)
values ('East', 781);
insert into AREA (a_name, a_id)
values ('South', 487);
insert into AREA (a_name, a_id)
values ('Center', 176);
insert into AREA (a_name, a_id)
values ('East', 377);
insert into AREA (a_name, a_id)
values ('North', 763);
insert into AREA (a_name, a_id)
values ('Center', 319);
insert into AREA (a_name, a_id)
values ('West', 272);
insert into AREA (a_name, a_id)
values ('South', 725);
insert into AREA (a_name, a_id)
values ('Center', 32);
insert into AREA (a_name, a_id)
values ('North', 998);
insert into AREA (a_name, a_id)
values ('East', 734);
insert into AREA (a_name, a_id)
values ('East', 641);
insert into AREA (a_name, a_id)
values ('South', 68);
insert into AREA (a_name, a_id)
values ('South', 468);
insert into AREA (a_name, a_id)
values ('South', 766);
insert into AREA (a_name, a_id)
values ('North', 997);
insert into AREA (a_name, a_id)
values ('West', 859);
insert into AREA (a_name, a_id)
values ('Center', 466);
insert into AREA (a_name, a_id)
values ('Center', 205);
insert into AREA (a_name, a_id)
values ('North', 39);
insert into AREA (a_name, a_id)
values ('South', 153);
insert into AREA (a_name, a_id)
values ('North', 657);
insert into AREA (a_name, a_id)
values ('East', 444);
insert into AREA (a_name, a_id)
values ('West', 305);
insert into AREA (a_name, a_id)
values ('West', 82);
insert into AREA (a_name, a_id)
values ('Center', 343);
insert into AREA (a_name, a_id)
values ('South', 238);
insert into AREA (a_name, a_id)
values ('West', 619);
insert into AREA (a_name, a_id)
values ('Center', 939);
insert into AREA (a_name, a_id)
values ('East', 254);
insert into AREA (a_name, a_id)
values ('West', 839);
insert into AREA (a_name, a_id)
values ('North', 457);
insert into AREA (a_name, a_id)
values ('Center', 582);
insert into AREA (a_name, a_id)
values ('East', 35);
insert into AREA (a_name, a_id)
values ('West', 307);
insert into AREA (a_name, a_id)
values ('South', 877);
insert into AREA (a_name, a_id)
values ('East', 733);
insert into AREA (a_name, a_id)
values ('East', 328);
insert into AREA (a_name, a_id)
values ('East', 121);
insert into AREA (a_name, a_id)
values ('South', 243);
insert into AREA (a_name, a_id)
values ('East', 854);
insert into AREA (a_name, a_id)
values ('East', 963);
insert into AREA (a_name, a_id)
values ('West', 881);
insert into AREA (a_name, a_id)
values ('Center', 111);
insert into AREA (a_name, a_id)
values ('South', 878);
insert into AREA (a_name, a_id)
values ('East', 362);
insert into AREA (a_name, a_id)
values ('East', 624);
insert into AREA (a_name, a_id)
values ('North', 803);
insert into AREA (a_name, a_id)
values ('South', 303);
insert into AREA (a_name, a_id)
values ('East', 646);
insert into AREA (a_name, a_id)
values ('West', 314);
insert into AREA (a_name, a_id)
values ('West', 823);
commit;
prompt 300 records committed...
insert into AREA (a_name, a_id)
values ('East', 281);
insert into AREA (a_name, a_id)
values ('West', 847);
insert into AREA (a_name, a_id)
values ('North', 119);
insert into AREA (a_name, a_id)
values ('North', 515);
insert into AREA (a_name, a_id)
values ('Center', 261);
insert into AREA (a_name, a_id)
values ('North', 852);
insert into AREA (a_name, a_id)
values ('West', 75);
insert into AREA (a_name, a_id)
values ('South', 441);
insert into AREA (a_name, a_id)
values ('Center', 424);
insert into AREA (a_name, a_id)
values ('Center', 20);
insert into AREA (a_name, a_id)
values ('East', 978);
insert into AREA (a_name, a_id)
values ('South', 769);
insert into AREA (a_name, a_id)
values ('Center', 764);
insert into AREA (a_name, a_id)
values ('South', 394);
insert into AREA (a_name, a_id)
values ('East', 565);
insert into AREA (a_name, a_id)
values ('East', 234);
insert into AREA (a_name, a_id)
values ('South', 214);
insert into AREA (a_name, a_id)
values ('West', 352);
insert into AREA (a_name, a_id)
values ('West', 411);
insert into AREA (a_name, a_id)
values ('Center', 146);
insert into AREA (a_name, a_id)
values ('East', 280);
insert into AREA (a_name, a_id)
values ('North', 277);
insert into AREA (a_name, a_id)
values ('West', 948);
insert into AREA (a_name, a_id)
values ('West', 846);
insert into AREA (a_name, a_id)
values ('North', 579);
insert into AREA (a_name, a_id)
values ('Center', 567);
insert into AREA (a_name, a_id)
values ('Center', 735);
insert into AREA (a_name, a_id)
values ('West', 719);
insert into AREA (a_name, a_id)
values ('North', 123);
insert into AREA (a_name, a_id)
values ('East', 895);
insert into AREA (a_name, a_id)
values ('West', 367);
insert into AREA (a_name, a_id)
values ('South', 866);
insert into AREA (a_name, a_id)
values ('Center', 558);
insert into AREA (a_name, a_id)
values ('East', 824);
insert into AREA (a_name, a_id)
values ('West', 818);
insert into AREA (a_name, a_id)
values ('Center', 728);
insert into AREA (a_name, a_id)
values ('South', 138);
insert into AREA (a_name, a_id)
values ('North', 674);
insert into AREA (a_name, a_id)
values ('South', 921);
insert into AREA (a_name, a_id)
values ('West', 909);
insert into AREA (a_name, a_id)
values ('North', 265);
insert into AREA (a_name, a_id)
values ('North', 393);
insert into AREA (a_name, a_id)
values ('North', 29);
insert into AREA (a_name, a_id)
values ('South', 714);
insert into AREA (a_name, a_id)
values ('North', 80);
insert into AREA (a_name, a_id)
values ('North', 142);
insert into AREA (a_name, a_id)
values ('South', 784);
insert into AREA (a_name, a_id)
values ('North', 419);
insert into AREA (a_name, a_id)
values ('East', 653);
insert into AREA (a_name, a_id)
values ('South', 860);
insert into AREA (a_name, a_id)
values ('East', 154);
insert into AREA (a_name, a_id)
values ('South', 402);
insert into AREA (a_name, a_id)
values ('West', 370);
insert into AREA (a_name, a_id)
values ('North', 635);
insert into AREA (a_name, a_id)
values ('Center', 458);
insert into AREA (a_name, a_id)
values ('West', 585);
insert into AREA (a_name, a_id)
values ('South', 731);
insert into AREA (a_name, a_id)
values ('Center', 831);
insert into AREA (a_name, a_id)
values ('North', 529);
insert into AREA (a_name, a_id)
values ('South', 287);
insert into AREA (a_name, a_id)
values ('North', 713);
insert into AREA (a_name, a_id)
values ('West', 798);
insert into AREA (a_name, a_id)
values ('East', 203);
insert into AREA (a_name, a_id)
values ('North', 955);
insert into AREA (a_name, a_id)
values ('East', 409);
insert into AREA (a_name, a_id)
values ('North', 891);
insert into AREA (a_name, a_id)
values ('East', 339);
insert into AREA (a_name, a_id)
values ('East', 366);
insert into AREA (a_name, a_id)
values ('South', 584);
insert into AREA (a_name, a_id)
values ('South', 335);
insert into AREA (a_name, a_id)
values ('Center', 873);
insert into AREA (a_name, a_id)
values ('West', 50);
insert into AREA (a_name, a_id)
values ('North', 785);
insert into AREA (a_name, a_id)
values ('Center', 890);
insert into AREA (a_name, a_id)
values ('South', 437);
insert into AREA (a_name, a_id)
values ('North', 799);
insert into AREA (a_name, a_id)
values ('Center', 691);
insert into AREA (a_name, a_id)
values ('East', 897);
insert into AREA (a_name, a_id)
values ('South', 288);
insert into AREA (a_name, a_id)
values ('North', 718);
insert into AREA (a_name, a_id)
values ('Center', 115);
insert into AREA (a_name, a_id)
values ('East', 131);
insert into AREA (a_name, a_id)
values ('West', 559);
insert into AREA (a_name, a_id)
values ('East', 499);
insert into AREA (a_name, a_id)
values ('South', 486);
insert into AREA (a_name, a_id)
values ('South', 318);
insert into AREA (a_name, a_id)
values ('North', 94);
insert into AREA (a_name, a_id)
values ('North', 835);
insert into AREA (a_name, a_id)
values ('West', 384);
insert into AREA (a_name, a_id)
values ('East', 775);
insert into AREA (a_name, a_id)
values ('South', 497);
insert into AREA (a_name, a_id)
values ('Center', 598);
insert into AREA (a_name, a_id)
values ('North', 233);
insert into AREA (a_name, a_id)
values ('South', 17);
insert into AREA (a_name, a_id)
values ('West', 647);
insert into AREA (a_name, a_id)
values ('Center', 944);
insert into AREA (a_name, a_id)
values ('South', 596);
insert into AREA (a_name, a_id)
values ('West', 293);
insert into AREA (a_name, a_id)
values ('West', 195);
insert into AREA (a_name, a_id)
values ('North', 615);
commit;
prompt 400 records committed...
insert into AREA (a_name, a_id)
values ('West', 705);
insert into AREA (a_name, a_id)
values ('West', 925);
insert into AREA (a_name, a_id)
values ('East', 985);
insert into AREA (a_name, a_id)
values ('North', 349);
insert into AREA (a_name, a_id)
values ('North', 526);
insert into AREA (a_name, a_id)
values ('South', 697);
insert into AREA (a_name, a_id)
values ('South', 476);
insert into AREA (a_name, a_id)
values ('West', 152);
insert into AREA (a_name, a_id)
values ('Center', 116);
insert into AREA (a_name, a_id)
values ('West', 940);
insert into AREA (a_name, a_id)
values ('East', 792);
insert into AREA (a_name, a_id)
values ('Center', 332);
insert into AREA (a_name, a_id)
values ('South', 903);
insert into AREA (a_name, a_id)
values ('East', 417);
insert into AREA (a_name, a_id)
values ('Center', 650);
insert into AREA (a_name, a_id)
values ('East', 552);
insert into AREA (a_name, a_id)
values ('North', 290);
insert into AREA (a_name, a_id)
values ('West', 777);
insert into AREA (a_name, a_id)
values ('North', 263);
insert into AREA (a_name, a_id)
values ('West', 931);
insert into AREA (a_name, a_id)
values ('South', 18);
insert into AREA (a_name, a_id)
values ('North', 757);
insert into AREA (a_name, a_id)
values ('Center', 677);
insert into AREA (a_name, a_id)
values ('South', 382);
insert into AREA (a_name, a_id)
values ('South', 150);
insert into AREA (a_name, a_id)
values ('West', 408);
insert into AREA (a_name, a_id)
values ('Center', 282);
insert into AREA (a_name, a_id)
values ('North', 299);
insert into AREA (a_name, a_id)
values ('West', 630);
insert into AREA (a_name, a_id)
values ('West', 129);
insert into AREA (a_name, a_id)
values ('South', 222);
insert into AREA (a_name, a_id)
values ('Center', 45);
insert into AREA (a_name, a_id)
values ('West', 754);
insert into AREA (a_name, a_id)
values ('North', 118);
insert into AREA (a_name, a_id)
values ('Center', 767);
insert into AREA (a_name, a_id)
values ('West', 57);
insert into AREA (a_name, a_id)
values ('Center', 291);
insert into AREA (a_name, a_id)
values ('South', 423);
insert into AREA (a_name, a_id)
values ('East', 535);
insert into AREA (a_name, a_id)
values ('East', 201);
insert into AREA (a_name, a_id)
values ('East', 524);
insert into AREA (a_name, a_id)
values ('West', 484);
insert into AREA (a_name, a_id)
values ('East', 851);
insert into AREA (a_name, a_id)
values ('North', 306);
insert into AREA (a_name, a_id)
values ('East', 41);
insert into AREA (a_name, a_id)
values ('South', 49);
insert into AREA (a_name, a_id)
values ('South', 668);
insert into AREA (a_name, a_id)
values ('East', 113);
insert into AREA (a_name, a_id)
values ('East', 517);
insert into AREA (a_name, a_id)
values ('North', 796);
insert into AREA (a_name, a_id)
values ('East', 648);
insert into AREA (a_name, a_id)
values ('West', 801);
insert into AREA (a_name, a_id)
values ('Center', 688);
insert into AREA (a_name, a_id)
values ('Center', 814);
insert into AREA (a_name, a_id)
values ('West', 63);
insert into AREA (a_name, a_id)
values ('South', 511);
insert into AREA (a_name, a_id)
values ('South', 446);
insert into AREA (a_name, a_id)
values ('North', 442);
insert into AREA (a_name, a_id)
values ('West', 678);
insert into AREA (a_name, a_id)
values ('East', 91);
insert into AREA (a_name, a_id)
values ('South', 554);
insert into AREA (a_name, a_id)
values ('South', 262);
insert into AREA (a_name, a_id)
values ('Center', 283);
insert into AREA (a_name, a_id)
values ('North', 285);
insert into AREA (a_name, a_id)
values ('South', 28);
insert into AREA (a_name, a_id)
values ('West', 392);
insert into AREA (a_name, a_id)
values ('West', 739);
insert into AREA (a_name, a_id)
values ('North', 198);
insert into AREA (a_name, a_id)
values ('West', 595);
insert into AREA (a_name, a_id)
values ('North', 979);
insert into AREA (a_name, a_id)
values ('Center', 373);
insert into AREA (a_name, a_id)
values ('Center', 530);
insert into AREA (a_name, a_id)
values ('West', 810);
insert into AREA (a_name, a_id)
values ('South', 15);
insert into AREA (a_name, a_id)
values ('South', 671);
insert into AREA (a_name, a_id)
values ('East', 465);
insert into AREA (a_name, a_id)
values ('Center', 404);
insert into AREA (a_name, a_id)
values ('South', 992);
insert into AREA (a_name, a_id)
values ('East', 492);
insert into AREA (a_name, a_id)
values ('West', 920);
insert into AREA (a_name, a_id)
values ('North', 652);
insert into AREA (a_name, a_id)
values ('North', 952);
insert into AREA (a_name, a_id)
values ('West', 126);
insert into AREA (a_name, a_id)
values ('Center', 870);
insert into AREA (a_name, a_id)
values ('South', 672);
insert into AREA (a_name, a_id)
values ('Center', 644);
insert into AREA (a_name, a_id)
values ('Center', 954);
insert into AREA (a_name, a_id)
values ('West', 470);
insert into AREA (a_name, a_id)
values ('Center', 773);
insert into AREA (a_name, a_id)
values ('West', 347);
insert into AREA (a_name, a_id)
values ('West', 729);
insert into AREA (a_name, a_id)
values ('South', 655);
insert into AREA (a_name, a_id)
values ('Center', 658);
insert into AREA (a_name, a_id)
values ('South', 64);
insert into AREA (a_name, a_id)
values ('East', 758);
insert into AREA (a_name, a_id)
values ('South', 425);
insert into AREA (a_name, a_id)
values ('South', 898);
insert into AREA (a_name, a_id)
values ('East', 578);
insert into AREA (a_name, a_id)
values ('West', 568);
insert into AREA (a_name, a_id)
values ('South', 12);
commit;
prompt 500 records committed...
insert into AREA (a_name, a_id)
values ('North', 953);
insert into AREA (a_name, a_id)
values ('West', 638);
insert into AREA (a_name, a_id)
values ('East', 194);
insert into AREA (a_name, a_id)
values ('North', 71);
insert into AREA (a_name, a_id)
values ('East', 975);
insert into AREA (a_name, a_id)
values ('Center', 498);
insert into AREA (a_name, a_id)
values ('South', 430);
insert into AREA (a_name, a_id)
values ('Center', 120);
insert into AREA (a_name, a_id)
values ('Center', 660);
insert into AREA (a_name, a_id)
values ('East', 821);
insert into AREA (a_name, a_id)
values ('Center', 833);
insert into AREA (a_name, a_id)
values ('South', 856);
insert into AREA (a_name, a_id)
values ('North', 681);
insert into AREA (a_name, a_id)
values ('Center', 514);
insert into AREA (a_name, a_id)
values ('West', 204);
insert into AREA (a_name, a_id)
values ('North', 941);
insert into AREA (a_name, a_id)
values ('East', 862);
insert into AREA (a_name, a_id)
values ('West', 965);
insert into AREA (a_name, a_id)
values ('Center', 572);
insert into AREA (a_name, a_id)
values ('Center', 563);
insert into AREA (a_name, a_id)
values ('South', 86);
insert into AREA (a_name, a_id)
values ('North', 48);
insert into AREA (a_name, a_id)
values ('South', 503);
insert into AREA (a_name, a_id)
values ('Center', 546);
insert into AREA (a_name, a_id)
values ('South', 227);
insert into AREA (a_name, a_id)
values ('South', 270);
insert into AREA (a_name, a_id)
values ('East', 89);
insert into AREA (a_name, a_id)
values ('Center', 491);
insert into AREA (a_name, a_id)
values ('Center', 134);
insert into AREA (a_name, a_id)
values ('Center', 768);
commit;
prompt 530 records loaded
prompt Loading ATTRACTIONS...
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 10, 8, 21, 50, 15);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBAL', 13, 8, 21, 10, 30);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 18, 8, 21, 10, 30);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('VISIT', 19, 8, 21, 100, 15);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 15, 8, 21, 50, 30);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7281, 10, 18, 46, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 7268, 8, 21, 45, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3213, 9, 21, 28, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1141, 9, 22, 14, 66);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 7759, 9, 17, 79, 12);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 5684, 8, 22, 13, 46);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 1643, 8, 19, 89, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 8444, 10, 20, 22, 67);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 4442, 10, 23, 76, 17);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 3291, 8, 22, 89, 82);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 2542, 8, 17, 99, 74);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 6259, 8, 21, 96, 56);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 8289, 7, 22, 66, 99);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8772, 10, 20, 53, 11);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 7965, 9, 21, 64, 34);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8827, 7, 19, 79, 42);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 1352, 10, 23, 44, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 1189, 9, 21, 37, 83);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 9876, 8, 21, 82, 88);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 5354, 8, 21, 85, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 1964, 9, 22, 47, 51);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 9986, 8, 18, 23, 17);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5381, 7, 18, 84, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4926, 7, 18, 64, 91);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 5585, 8, 23, 58, 89);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 7375, 8, 20, 26, 66);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 2959, 7, 21, 76, 29);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 5786, 9, 22, 95, 14);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 8468, 10, 23, 63, 84);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4955, 8, 21, 57, 71);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 9567, 9, 20, 17, 53);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4268, 7, 18, 61, 94);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3888, 9, 20, 96, 29);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 6112, 9, 17, 57, 97);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3518, 7, 18, 25, 75);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3832, 9, 21, 56, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4657, 10, 18, 52, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1743, 10, 20, 62, 97);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 1262, 8, 18, 55, 15);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 1233, 9, 21, 87, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 7198, 7, 20, 75, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3724, 10, 21, 55, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 8932, 9, 17, 19, 29);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1236, 7, 23, 21, 83);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 6797, 10, 20, 92, 84);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 6947, 7, 22, 65, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2893, 8, 19, 57, 68);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 9372, 10, 21, 66, 99);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3776, 9, 17, 27, 35);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5114, 10, 22, 18, 97);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3756, 8, 18, 26, 84);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 4335, 8, 22, 14, 25);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1767, 9, 20, 76, 27);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4661, 8, 20, 82, 14);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 9975, 7, 18, 64, 35);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4615, 7, 17, 53, 39);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 5699, 10, 23, 16, 96);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 4963, 10, 22, 98, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 9724, 7, 18, 11, 34);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 8635, 8, 19, 19, 54);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 5988, 9, 23, 94, 72);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 9344, 10, 23, 76, 75);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2735, 10, 17, 29, 37);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 3969, 8, 17, 47, 61);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3494, 10, 22, 96, 16);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 8893, 9, 20, 26, 28);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6843, 10, 17, 58, 52);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 1712, 7, 19, 54, 91);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 3142, 9, 17, 77, 86);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 8726, 7, 18, 99, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 5331, 7, 18, 96, 19);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3531, 8, 18, 28, 75);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3233, 9, 18, 38, 57);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4465, 7, 20, 39, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 9355, 8, 18, 86, 33);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 7865, 10, 21, 26, 36);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6366, 7, 21, 37, 72);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 6775, 10, 18, 76, 18);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 2462, 8, 17, 64, 63);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 9378, 9, 17, 26, 91);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 9223, 8, 17, 31, 81);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 8459, 8, 21, 82, 71);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 7276, 8, 21, 68, 75);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 5455, 7, 20, 48, 98);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 1143, 7, 23, 15, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5412, 8, 22, 69, 28);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6126, 8, 20, 74, 89);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 2352, 7, 18, 75, 26);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 9711, 9, 22, 62, 39);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4858, 7, 20, 21, 97);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 3279, 7, 22, 28, 61);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 8367, 10, 19, 15, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 5541, 9, 18, 91, 65);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 6143, 7, 21, 91, 92);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 8215531, 9, 22, 61, 64);
commit;
prompt 100 records committed...
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3823252, 8, 19, 47, 78);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5337748, 10, 18, 42, 74);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 5352485, 9, 21, 92, 78);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 6433621, 10, 17, 12, 79);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 9612716, 8, 19, 42, 45);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 6968586, 7, 18, 77, 47);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 3663829, 10, 19, 96, 62);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7858183, 9, 17, 14, 34);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5156135, 7, 20, 45, 91);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 8235225, 8, 17, 64, 98);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3966936, 10, 20, 93, 85);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3359658, 8, 18, 69, 17);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 8165693, 7, 21, 95, 62);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 6297628, 10, 18, 83, 19);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 4713432, 8, 23, 38, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 4186644, 10, 17, 87, 63);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 3826116, 7, 18, 12, 13);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2847971, 8, 21, 35, 71);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 1246599, 7, 18, 21, 15);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3627822, 8, 19, 43, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2317221, 9, 22, 91, 61);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5779523, 9, 20, 53, 74);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 7656197, 10, 22, 93, 63);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 6954142, 7, 19, 27, 24);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1526764, 10, 20, 85, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1217475, 10, 19, 66, 77);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2254895, 10, 19, 14, 54);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1252155, 9, 21, 19, 83);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 7254646, 10, 18, 86, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2647771, 8, 21, 59, 21);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4761534, 9, 19, 54, 92);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3827577, 8, 19, 89, 39);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1593648, 10, 23, 92, 12);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2349772, 7, 22, 83, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 9117592, 8, 22, 96, 73);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 9213891, 9, 22, 41, 15);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 6834126, 7, 18, 69, 96);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6383497, 7, 20, 43, 78);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 5232769, 10, 22, 62, 71);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 2213241, 10, 20, 91, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3966952, 10, 21, 59, 89);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 9432255, 10, 20, 66, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3959835, 10, 21, 74, 35);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 9584932, 10, 21, 18, 73);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3127165, 9, 18, 73, 98);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 5169512, 10, 23, 21, 62);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 9654785, 9, 21, 35, 73);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 5964426, 8, 20, 98, 46);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 6256743, 7, 19, 12, 53);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 2811812, 8, 23, 79, 24);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 3722581, 9, 23, 51, 71);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 2315884, 7, 23, 33, 86);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4524476, 7, 21, 88, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 6441562, 8, 23, 85, 24);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 7915834, 10, 19, 59, 68);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2488885, 9, 23, 42, 13);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 7212299, 10, 20, 89, 87);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 8556983, 7, 17, 34, 77);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2568555, 9, 18, 66, 72);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5863476, 7, 22, 69, 77);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4971685, 9, 19, 85, 64);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3854872, 10, 17, 67, 36);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 7771682, 7, 19, 93, 82);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7819757, 10, 22, 53, 45);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3989919, 8, 17, 99, 75);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 9965964, 8, 22, 36, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2367226, 9, 20, 37, 19);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 2273438, 10, 17, 95, 17);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7993336, 7, 17, 23, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 6333191, 7, 23, 59, 87);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 5893237, 8, 21, 89, 21);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 1141689, 10, 20, 38, 42);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3471233, 7, 21, 15, 65);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 4411333, 7, 21, 32, 88);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 7726278, 9, 20, 35, 46);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1368865, 8, 19, 31, 12);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 9897167, 7, 18, 62, 32);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1124462, 7, 21, 17, 65);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2687883, 10, 19, 95, 93);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 1968358, 9, 20, 15, 13);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3417915, 8, 18, 17, 35);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8712915, 9, 17, 61, 81);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 6665866, 8, 20, 33, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7491145, 10, 18, 51, 96);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 8124725, 8, 17, 62, 58);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 7346323, 10, 17, 39, 11);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 6496727, 8, 20, 14, 62);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 5412521, 8, 21, 66, 34);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 5127348, 9, 23, 28, 32);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 8427751, 9, 20, 84, 92);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 6575677, 8, 17, 21, 85);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3494842, 7, 20, 24, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 2593112, 10, 23, 74, 12);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 7575298, 7, 18, 66, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 7548353, 10, 18, 37, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4913259, 7, 21, 71, 57);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 2124746, 7, 21, 45, 88);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 2289436, 7, 18, 89, 35);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2768311, 8, 21, 96, 35);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 9216123, 7, 21, 35, 75);
commit;
prompt 200 records committed...
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2995372, 8, 22, 13, 78);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 7585752, 7, 22, 45, 29);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2256761, 9, 22, 32, 48);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2753455, 10, 19, 22, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 7562944, 10, 19, 77, 93);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 5138627, 7, 20, 36, 61);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2727592, 7, 17, 71, 13);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3538464, 10, 23, 35, 82);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3334984, 9, 18, 13, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3176881, 8, 18, 16, 67);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 6876963, 7, 19, 62, 55);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4447583, 8, 19, 58, 61);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 3146867, 10, 23, 76, 21);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 6933244, 7, 17, 72, 99);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 8457358, 9, 23, 42, 19);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 5265636, 10, 18, 59, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 4711831, 7, 17, 74, 24);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2871533, 8, 23, 64, 79);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6793556, 8, 23, 91, 69);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8752133, 8, 23, 57, 58);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1632135, 8, 22, 28, 87);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7472717, 10, 20, 55, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 9461856, 10, 23, 31, 39);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 9414657, 9, 22, 53, 27);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 6317291, 9, 19, 88, 94);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 5363394, 7, 20, 53, 84);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2862827, 8, 18, 72, 23);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 3393168, 9, 23, 73, 45);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 7471468, 10, 23, 48, 83);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 1734946, 8, 23, 16, 93);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 9612931, 10, 23, 61, 92);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7883465, 7, 19, 46, 27);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 1151818, 9, 20, 23, 94);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3159189, 8, 22, 79, 55);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 8654419, 7, 21, 95, 33);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 1769875, 7, 19, 47, 83);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 8478283, 7, 19, 58, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4665399, 7, 18, 37, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 1246541, 8, 19, 35, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 5428914, 10, 20, 11, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 8321973, 8, 20, 31, 29);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8592354, 7, 22, 31, 96);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2895457, 9, 23, 92, 45);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 8362483, 7, 21, 31, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 1434588, 10, 22, 76, 19);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 8832747, 10, 18, 24, 17);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2967286, 8, 18, 83, 96);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4124957, 9, 23, 55, 98);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2329733, 7, 23, 19, 62);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 3748783, 7, 22, 21, 51);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2294252, 9, 20, 67, 23);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6546994, 8, 18, 54, 26);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3729997, 10, 21, 52, 13);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7336187, 8, 21, 53, 57);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8826918, 8, 21, 14, 63);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6565111, 10, 20, 27, 72);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 5964633, 7, 19, 73, 53);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5172914, 9, 22, 11, 45);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 9833988, 8, 22, 43, 83);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 9365739, 8, 21, 85, 12);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 7534913, 7, 20, 49, 42);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4642252, 9, 19, 57, 53);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 7381584, 7, 23, 96, 93);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 8354638, 7, 21, 46, 86);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 6612915, 7, 18, 12, 54);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 9337154, 7, 21, 44, 84);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 3929467, 8, 20, 85, 97);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 2728413, 7, 20, 76, 19);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4327568, 7, 22, 77, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 1319675, 7, 17, 44, 29);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3189293, 9, 21, 77, 93);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6219954, 7, 19, 22, 36);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 4324184, 9, 18, 24, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 4961916, 7, 23, 89, 75);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 9982119, 9, 22, 24, 11);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7454456, 10, 18, 58, 53);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4481767, 9, 19, 12, 38);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3156232, 7, 21, 33, 71);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 1243116, 8, 23, 15, 52);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 6694516, 10, 23, 55, 75);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 5912851, 7, 21, 37, 91);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 9887274, 9, 18, 32, 97);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1331989, 7, 18, 91, 83);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4145866, 9, 21, 86, 61);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 5414458, 10, 22, 11, 38);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 9977574, 8, 19, 51, 61);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4774975, 8, 17, 61, 56);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 4754973, 8, 19, 59, 77);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 7423247, 10, 23, 26, 73);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3195355, 10, 23, 91, 57);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4575489, 9, 21, 91, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2639199, 10, 21, 93, 89);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 7114432, 8, 23, 13, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 8397683, 10, 17, 33, 42);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 1539673, 8, 23, 14, 34);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3742587, 9, 21, 63, 46);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3643375, 10, 20, 16, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 7593791, 7, 21, 33, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 1479931, 7, 21, 55, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 2515841, 8, 21, 19, 26);
commit;
prompt 300 records committed...
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 8921543, 10, 17, 71, 34);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3995487, 8, 23, 78, 92);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 9114659, 8, 19, 78, 66);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 1623325, 7, 23, 42, 69);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3821911, 8, 18, 22, 32);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8186878, 10, 17, 94, 76);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4465847, 10, 20, 29, 19);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3232591, 8, 18, 58, 47);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 9533847, 7, 21, 37, 43);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 1788372, 10, 20, 56, 28);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 1516623, 9, 19, 72, 64);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 5866336, 9, 21, 41, 97);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3975578, 7, 18, 87, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3268932, 9, 22, 83, 24);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1545615, 9, 22, 85, 66);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 3144773, 9, 18, 27, 67);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1813381, 7, 21, 93, 67);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 3963755, 7, 18, 32, 74);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 7176338, 7, 20, 33, 22);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 6287195, 7, 22, 68, 51);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 5959178, 10, 18, 21, 46);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2664697, 9, 21, 14, 65);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 9644488, 10, 23, 48, 15);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 9248969, 10, 18, 16, 26);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 8359239, 9, 18, 35, 26);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 5288153, 7, 17, 41, 21);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 8115277, 8, 23, 16, 55);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7733232, 10, 19, 78, 94);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 1833442, 7, 18, 29, 72);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 6613533, 9, 23, 94, 98);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 4195967, 8, 20, 57, 47);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3521494, 9, 18, 73, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 7333361, 7, 20, 35, 38);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3379497, 7, 20, 96, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 4862444, 8, 20, 43, 17);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4462123, 7, 19, 68, 99);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 7711256, 8, 22, 96, 94);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 4174561, 7, 19, 55, 58);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2129167, 7, 19, 72, 36);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 3161679, 9, 22, 92, 48);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 9615354, 8, 21, 72, 35);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2943871, 9, 19, 65, 53);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 2331118, 7, 22, 74, 14);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 7812489, 8, 23, 45, 32);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 3995671, 7, 19, 13, 41);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 4264622, 10, 20, 74, 17);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 5194729, 7, 21, 74, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 2259613, 10, 18, 64, 27);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 8716648, 8, 22, 54, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 9566852, 10, 20, 22, 89);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 4293442, 7, 17, 95, 95);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 2516764, 7, 23, 22, 49);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 4899613, 7, 21, 18, 14);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 4698525, 8, 17, 95, 87);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5719247, 7, 20, 72, 31);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 4166513, 9, 20, 35, 91);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('FOOTBALL', 3424122, 8, 22, 45, 93);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 9335617, 9, 18, 42, 63);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('POOL', 8199435, 8, 20, 69, 27);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('YOGA', 8226872, 8, 22, 67, 59);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BOAT', 8619153, 7, 19, 56, 36);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('DANCE', 2476162, 9, 21, 87, 98);
insert into ATTRACTIONS (atraction_name, atraction_number, atraction_open_hours, atraction_close_houes, atraction_price, number_of_participants)
values ('BASKETBALL', 5656398, 10, 22, 86, 71);
commit;
prompt 363 records loaded
prompt Loading MY_GROUP...
insert into MY_GROUP (amount, m_g_id)
values (300, 268);
insert into MY_GROUP (amount, m_g_id)
values (89, 4);
insert into MY_GROUP (amount, m_g_id)
values (105, 5);
insert into MY_GROUP (amount, m_g_id)
values (27, 6);
insert into MY_GROUP (amount, m_g_id)
values (38, 7);
insert into MY_GROUP (amount, m_g_id)
values (122, 8);
insert into MY_GROUP (amount, m_g_id)
values (80, 9);
insert into MY_GROUP (amount, m_g_id)
values (93, 10);
insert into MY_GROUP (amount, m_g_id)
values (12, 11);
insert into MY_GROUP (amount, m_g_id)
values (105, 12);
insert into MY_GROUP (amount, m_g_id)
values (122, 13);
insert into MY_GROUP (amount, m_g_id)
values (57, 14);
insert into MY_GROUP (amount, m_g_id)
values (31, 15);
insert into MY_GROUP (amount, m_g_id)
values (70, 16);
insert into MY_GROUP (amount, m_g_id)
values (124, 17);
insert into MY_GROUP (amount, m_g_id)
values (18, 18);
insert into MY_GROUP (amount, m_g_id)
values (83, 19);
insert into MY_GROUP (amount, m_g_id)
values (50, 20);
insert into MY_GROUP (amount, m_g_id)
values (106, 21);
insert into MY_GROUP (amount, m_g_id)
values (108, 22);
insert into MY_GROUP (amount, m_g_id)
values (93, 23);
insert into MY_GROUP (amount, m_g_id)
values (77, 24);
insert into MY_GROUP (amount, m_g_id)
values (120, 25);
insert into MY_GROUP (amount, m_g_id)
values (75, 26);
insert into MY_GROUP (amount, m_g_id)
values (145, 27);
insert into MY_GROUP (amount, m_g_id)
values (33, 28);
insert into MY_GROUP (amount, m_g_id)
values (71, 29);
insert into MY_GROUP (amount, m_g_id)
values (131, 30);
insert into MY_GROUP (amount, m_g_id)
values (67, 31);
insert into MY_GROUP (amount, m_g_id)
values (81, 32);
insert into MY_GROUP (amount, m_g_id)
values (92, 33);
insert into MY_GROUP (amount, m_g_id)
values (85, 34);
insert into MY_GROUP (amount, m_g_id)
values (80, 35);
insert into MY_GROUP (amount, m_g_id)
values (117, 36);
insert into MY_GROUP (amount, m_g_id)
values (57, 37);
insert into MY_GROUP (amount, m_g_id)
values (67, 38);
insert into MY_GROUP (amount, m_g_id)
values (18, 39);
insert into MY_GROUP (amount, m_g_id)
values (149, 40);
insert into MY_GROUP (amount, m_g_id)
values (47, 41);
insert into MY_GROUP (amount, m_g_id)
values (131, 42);
insert into MY_GROUP (amount, m_g_id)
values (98, 43);
insert into MY_GROUP (amount, m_g_id)
values (91, 44);
insert into MY_GROUP (amount, m_g_id)
values (92, 45);
insert into MY_GROUP (amount, m_g_id)
values (145, 46);
insert into MY_GROUP (amount, m_g_id)
values (49, 47);
insert into MY_GROUP (amount, m_g_id)
values (147, 48);
insert into MY_GROUP (amount, m_g_id)
values (10, 49);
insert into MY_GROUP (amount, m_g_id)
values (149, 50);
insert into MY_GROUP (amount, m_g_id)
values (69, 51);
insert into MY_GROUP (amount, m_g_id)
values (40, 52);
insert into MY_GROUP (amount, m_g_id)
values (96, 53);
insert into MY_GROUP (amount, m_g_id)
values (17, 54);
insert into MY_GROUP (amount, m_g_id)
values (64, 55);
insert into MY_GROUP (amount, m_g_id)
values (133, 56);
insert into MY_GROUP (amount, m_g_id)
values (104, 57);
insert into MY_GROUP (amount, m_g_id)
values (143, 58);
insert into MY_GROUP (amount, m_g_id)
values (137, 59);
insert into MY_GROUP (amount, m_g_id)
values (134, 60);
insert into MY_GROUP (amount, m_g_id)
values (122, 61);
insert into MY_GROUP (amount, m_g_id)
values (65, 62);
insert into MY_GROUP (amount, m_g_id)
values (120, 63);
insert into MY_GROUP (amount, m_g_id)
values (41, 64);
insert into MY_GROUP (amount, m_g_id)
values (97, 65);
insert into MY_GROUP (amount, m_g_id)
values (121, 66);
insert into MY_GROUP (amount, m_g_id)
values (87, 67);
insert into MY_GROUP (amount, m_g_id)
values (116, 68);
insert into MY_GROUP (amount, m_g_id)
values (24, 69);
insert into MY_GROUP (amount, m_g_id)
values (21, 70);
insert into MY_GROUP (amount, m_g_id)
values (52, 71);
insert into MY_GROUP (amount, m_g_id)
values (115, 72);
insert into MY_GROUP (amount, m_g_id)
values (74, 73);
insert into MY_GROUP (amount, m_g_id)
values (46, 74);
insert into MY_GROUP (amount, m_g_id)
values (11, 75);
insert into MY_GROUP (amount, m_g_id)
values (147, 76);
insert into MY_GROUP (amount, m_g_id)
values (99, 77);
insert into MY_GROUP (amount, m_g_id)
values (81, 78);
insert into MY_GROUP (amount, m_g_id)
values (146, 79);
insert into MY_GROUP (amount, m_g_id)
values (47, 80);
insert into MY_GROUP (amount, m_g_id)
values (75, 81);
insert into MY_GROUP (amount, m_g_id)
values (34, 82);
insert into MY_GROUP (amount, m_g_id)
values (35, 83);
insert into MY_GROUP (amount, m_g_id)
values (147, 84);
insert into MY_GROUP (amount, m_g_id)
values (32, 85);
insert into MY_GROUP (amount, m_g_id)
values (136, 86);
insert into MY_GROUP (amount, m_g_id)
values (130, 87);
insert into MY_GROUP (amount, m_g_id)
values (130, 88);
insert into MY_GROUP (amount, m_g_id)
values (107, 89);
insert into MY_GROUP (amount, m_g_id)
values (104, 90);
insert into MY_GROUP (amount, m_g_id)
values (55, 91);
insert into MY_GROUP (amount, m_g_id)
values (16, 92);
insert into MY_GROUP (amount, m_g_id)
values (36, 93);
insert into MY_GROUP (amount, m_g_id)
values (107, 94);
insert into MY_GROUP (amount, m_g_id)
values (149, 95);
insert into MY_GROUP (amount, m_g_id)
values (68, 96);
insert into MY_GROUP (amount, m_g_id)
values (84, 97);
insert into MY_GROUP (amount, m_g_id)
values (40, 98);
insert into MY_GROUP (amount, m_g_id)
values (44, 99);
insert into MY_GROUP (amount, m_g_id)
values (53, 100);
insert into MY_GROUP (amount, m_g_id)
values (92, 101);
insert into MY_GROUP (amount, m_g_id)
values (119, 102);
commit;
prompt 100 records committed...
insert into MY_GROUP (amount, m_g_id)
values (55, 103);
insert into MY_GROUP (amount, m_g_id)
values (80, 104);
insert into MY_GROUP (amount, m_g_id)
values (137, 105);
insert into MY_GROUP (amount, m_g_id)
values (81, 106);
insert into MY_GROUP (amount, m_g_id)
values (89, 107);
insert into MY_GROUP (amount, m_g_id)
values (140, 108);
insert into MY_GROUP (amount, m_g_id)
values (122, 109);
insert into MY_GROUP (amount, m_g_id)
values (73, 110);
insert into MY_GROUP (amount, m_g_id)
values (111, 111);
insert into MY_GROUP (amount, m_g_id)
values (71, 112);
insert into MY_GROUP (amount, m_g_id)
values (11, 113);
insert into MY_GROUP (amount, m_g_id)
values (18, 114);
insert into MY_GROUP (amount, m_g_id)
values (150, 115);
insert into MY_GROUP (amount, m_g_id)
values (104, 116);
insert into MY_GROUP (amount, m_g_id)
values (95, 117);
insert into MY_GROUP (amount, m_g_id)
values (46, 118);
insert into MY_GROUP (amount, m_g_id)
values (26, 119);
insert into MY_GROUP (amount, m_g_id)
values (123, 120);
insert into MY_GROUP (amount, m_g_id)
values (92, 121);
insert into MY_GROUP (amount, m_g_id)
values (117, 122);
insert into MY_GROUP (amount, m_g_id)
values (112, 123);
insert into MY_GROUP (amount, m_g_id)
values (120, 124);
insert into MY_GROUP (amount, m_g_id)
values (73, 125);
insert into MY_GROUP (amount, m_g_id)
values (97, 126);
insert into MY_GROUP (amount, m_g_id)
values (98, 127);
insert into MY_GROUP (amount, m_g_id)
values (39, 128);
insert into MY_GROUP (amount, m_g_id)
values (119, 129);
insert into MY_GROUP (amount, m_g_id)
values (22, 130);
insert into MY_GROUP (amount, m_g_id)
values (134, 131);
insert into MY_GROUP (amount, m_g_id)
values (30, 132);
insert into MY_GROUP (amount, m_g_id)
values (57, 133);
insert into MY_GROUP (amount, m_g_id)
values (49, 134);
insert into MY_GROUP (amount, m_g_id)
values (119, 135);
insert into MY_GROUP (amount, m_g_id)
values (59, 136);
insert into MY_GROUP (amount, m_g_id)
values (89, 137);
insert into MY_GROUP (amount, m_g_id)
values (47, 138);
insert into MY_GROUP (amount, m_g_id)
values (150, 139);
insert into MY_GROUP (amount, m_g_id)
values (121, 140);
insert into MY_GROUP (amount, m_g_id)
values (45, 141);
insert into MY_GROUP (amount, m_g_id)
values (88, 142);
insert into MY_GROUP (amount, m_g_id)
values (117, 143);
insert into MY_GROUP (amount, m_g_id)
values (71, 144);
insert into MY_GROUP (amount, m_g_id)
values (116, 145);
insert into MY_GROUP (amount, m_g_id)
values (27, 146);
insert into MY_GROUP (amount, m_g_id)
values (90, 147);
insert into MY_GROUP (amount, m_g_id)
values (106, 148);
insert into MY_GROUP (amount, m_g_id)
values (40, 149);
insert into MY_GROUP (amount, m_g_id)
values (66, 150);
insert into MY_GROUP (amount, m_g_id)
values (127, 151);
insert into MY_GROUP (amount, m_g_id)
values (134, 152);
insert into MY_GROUP (amount, m_g_id)
values (80, 153);
insert into MY_GROUP (amount, m_g_id)
values (132, 154);
insert into MY_GROUP (amount, m_g_id)
values (109, 155);
insert into MY_GROUP (amount, m_g_id)
values (130, 156);
insert into MY_GROUP (amount, m_g_id)
values (128, 157);
insert into MY_GROUP (amount, m_g_id)
values (51, 158);
insert into MY_GROUP (amount, m_g_id)
values (103, 159);
insert into MY_GROUP (amount, m_g_id)
values (57, 160);
insert into MY_GROUP (amount, m_g_id)
values (69, 161);
insert into MY_GROUP (amount, m_g_id)
values (94, 162);
insert into MY_GROUP (amount, m_g_id)
values (122, 163);
insert into MY_GROUP (amount, m_g_id)
values (122, 164);
insert into MY_GROUP (amount, m_g_id)
values (73, 165);
insert into MY_GROUP (amount, m_g_id)
values (144, 166);
insert into MY_GROUP (amount, m_g_id)
values (126, 167);
insert into MY_GROUP (amount, m_g_id)
values (10, 168);
insert into MY_GROUP (amount, m_g_id)
values (49, 169);
insert into MY_GROUP (amount, m_g_id)
values (102, 170);
insert into MY_GROUP (amount, m_g_id)
values (47, 171);
insert into MY_GROUP (amount, m_g_id)
values (45, 172);
insert into MY_GROUP (amount, m_g_id)
values (125, 173);
insert into MY_GROUP (amount, m_g_id)
values (121, 174);
insert into MY_GROUP (amount, m_g_id)
values (54, 175);
insert into MY_GROUP (amount, m_g_id)
values (52, 176);
insert into MY_GROUP (amount, m_g_id)
values (39, 177);
insert into MY_GROUP (amount, m_g_id)
values (119, 178);
insert into MY_GROUP (amount, m_g_id)
values (62, 179);
insert into MY_GROUP (amount, m_g_id)
values (40, 180);
insert into MY_GROUP (amount, m_g_id)
values (49, 181);
insert into MY_GROUP (amount, m_g_id)
values (59, 182);
insert into MY_GROUP (amount, m_g_id)
values (130, 183);
insert into MY_GROUP (amount, m_g_id)
values (145, 184);
insert into MY_GROUP (amount, m_g_id)
values (90, 185);
insert into MY_GROUP (amount, m_g_id)
values (148, 186);
insert into MY_GROUP (amount, m_g_id)
values (27, 187);
insert into MY_GROUP (amount, m_g_id)
values (49, 188);
insert into MY_GROUP (amount, m_g_id)
values (79, 189);
insert into MY_GROUP (amount, m_g_id)
values (129, 190);
insert into MY_GROUP (amount, m_g_id)
values (118, 191);
insert into MY_GROUP (amount, m_g_id)
values (126, 192);
insert into MY_GROUP (amount, m_g_id)
values (15, 193);
insert into MY_GROUP (amount, m_g_id)
values (10, 1);
insert into MY_GROUP (amount, m_g_id)
values (15, 2);
insert into MY_GROUP (amount, m_g_id)
values (38, 3);
insert into MY_GROUP (amount, m_g_id)
values (62, 194);
insert into MY_GROUP (amount, m_g_id)
values (61, 195);
insert into MY_GROUP (amount, m_g_id)
values (140, 196);
insert into MY_GROUP (amount, m_g_id)
values (86, 197);
insert into MY_GROUP (amount, m_g_id)
values (24, 198);
insert into MY_GROUP (amount, m_g_id)
values (41, 199);
commit;
prompt 200 records committed...
insert into MY_GROUP (amount, m_g_id)
values (121, 200);
insert into MY_GROUP (amount, m_g_id)
values (43, 201);
insert into MY_GROUP (amount, m_g_id)
values (15, 202);
insert into MY_GROUP (amount, m_g_id)
values (101, 203);
insert into MY_GROUP (amount, m_g_id)
values (58, 204);
insert into MY_GROUP (amount, m_g_id)
values (25, 205);
insert into MY_GROUP (amount, m_g_id)
values (41, 206);
insert into MY_GROUP (amount, m_g_id)
values (27, 207);
insert into MY_GROUP (amount, m_g_id)
values (50, 208);
insert into MY_GROUP (amount, m_g_id)
values (80, 209);
insert into MY_GROUP (amount, m_g_id)
values (61, 210);
insert into MY_GROUP (amount, m_g_id)
values (59, 211);
insert into MY_GROUP (amount, m_g_id)
values (109, 212);
insert into MY_GROUP (amount, m_g_id)
values (113, 213);
insert into MY_GROUP (amount, m_g_id)
values (25, 214);
insert into MY_GROUP (amount, m_g_id)
values (25, 215);
insert into MY_GROUP (amount, m_g_id)
values (89, 216);
insert into MY_GROUP (amount, m_g_id)
values (129, 217);
insert into MY_GROUP (amount, m_g_id)
values (49, 218);
insert into MY_GROUP (amount, m_g_id)
values (65, 219);
insert into MY_GROUP (amount, m_g_id)
values (128, 220);
insert into MY_GROUP (amount, m_g_id)
values (46, 221);
insert into MY_GROUP (amount, m_g_id)
values (24, 222);
insert into MY_GROUP (amount, m_g_id)
values (110, 223);
insert into MY_GROUP (amount, m_g_id)
values (143, 224);
insert into MY_GROUP (amount, m_g_id)
values (127, 225);
insert into MY_GROUP (amount, m_g_id)
values (22, 226);
insert into MY_GROUP (amount, m_g_id)
values (114, 227);
insert into MY_GROUP (amount, m_g_id)
values (123, 228);
insert into MY_GROUP (amount, m_g_id)
values (123, 229);
insert into MY_GROUP (amount, m_g_id)
values (67, 230);
insert into MY_GROUP (amount, m_g_id)
values (113, 231);
insert into MY_GROUP (amount, m_g_id)
values (115, 232);
insert into MY_GROUP (amount, m_g_id)
values (72, 233);
insert into MY_GROUP (amount, m_g_id)
values (58, 234);
insert into MY_GROUP (amount, m_g_id)
values (134, 235);
insert into MY_GROUP (amount, m_g_id)
values (59, 236);
insert into MY_GROUP (amount, m_g_id)
values (42, 237);
insert into MY_GROUP (amount, m_g_id)
values (48, 238);
insert into MY_GROUP (amount, m_g_id)
values (69, 239);
insert into MY_GROUP (amount, m_g_id)
values (57, 240);
insert into MY_GROUP (amount, m_g_id)
values (10, 241);
insert into MY_GROUP (amount, m_g_id)
values (69, 242);
insert into MY_GROUP (amount, m_g_id)
values (111, 243);
insert into MY_GROUP (amount, m_g_id)
values (114, 244);
insert into MY_GROUP (amount, m_g_id)
values (64, 245);
insert into MY_GROUP (amount, m_g_id)
values (110, 246);
insert into MY_GROUP (amount, m_g_id)
values (86, 247);
insert into MY_GROUP (amount, m_g_id)
values (128, 248);
insert into MY_GROUP (amount, m_g_id)
values (104, 249);
insert into MY_GROUP (amount, m_g_id)
values (40, 250);
insert into MY_GROUP (amount, m_g_id)
values (118, 251);
insert into MY_GROUP (amount, m_g_id)
values (63, 252);
insert into MY_GROUP (amount, m_g_id)
values (17, 253);
insert into MY_GROUP (amount, m_g_id)
values (120, 254);
insert into MY_GROUP (amount, m_g_id)
values (144, 255);
insert into MY_GROUP (amount, m_g_id)
values (88, 256);
insert into MY_GROUP (amount, m_g_id)
values (58, 257);
insert into MY_GROUP (amount, m_g_id)
values (73, 258);
insert into MY_GROUP (amount, m_g_id)
values (132, 259);
insert into MY_GROUP (amount, m_g_id)
values (138, 260);
insert into MY_GROUP (amount, m_g_id)
values (75, 261);
insert into MY_GROUP (amount, m_g_id)
values (82, 262);
insert into MY_GROUP (amount, m_g_id)
values (58, 263);
insert into MY_GROUP (amount, m_g_id)
values (105, 264);
insert into MY_GROUP (amount, m_g_id)
values (19, 265);
insert into MY_GROUP (amount, m_g_id)
values (67, 266);
insert into MY_GROUP (amount, m_g_id)
values (135, 267);
commit;
prompt 268 records loaded
prompt Loading CITY...
insert into CITY (c_id, c_name, a_id)
values (39663, 'Altamonte Sprin', 25429);
insert into CITY (c_id, c_name, a_id)
values (96494, 'Tilst', 44824);
insert into CITY (c_id, c_name, a_id)
values (64716, 'Rockland', 87166);
insert into CITY (c_id, c_name, a_id)
values (92879, 'Ciudad del Este', 92237);
insert into CITY (c_id, c_name, a_id)
values (93965, 'Sacramento', 82267);
insert into CITY (c_id, c_name, a_id)
values (78146, 'Nagoya', 63863);
insert into CITY (c_id, c_name, a_id)
values (19985, 'Belgrad', 59522);
insert into CITY (c_id, c_name, a_id)
values (83152, 'Scottsdale', 63863);
insert into CITY (c_id, c_name, a_id)
values (98971, 'Northampton', 37828);
insert into CITY (c_id, c_name, a_id)
values (61621, 'Athens', 46884);
insert into CITY (c_id, c_name, a_id)
values (23388, 'Bloomington', 22714);
insert into CITY (c_id, c_name, a_id)
values (28733, 'Hanover', 22623);
insert into CITY (c_id, c_name, a_id)
values (15669, 'Salzburg', 71146);
insert into CITY (c_id, c_name, a_id)
values (78576, 'Cary', 31735);
insert into CITY (c_id, c_name, a_id)
values (31966, 'Sugar Land', 21912);
insert into CITY (c_id, c_name, a_id)
values (58319, 'Huntsville', 96179);
insert into CITY (c_id, c_name, a_id)
values (59867, 'Ebersdorf', 12595);
insert into CITY (c_id, c_name, a_id)
values (51336, 'Ellicott City', 99195);
insert into CITY (c_id, c_name, a_id)
values (51454, 'Santa Clarita', 38424);
insert into CITY (c_id, c_name, a_id)
values (68464, 'Stony Point', 59916);
insert into CITY (c_id, c_name, a_id)
values (35534, 'Cypress', 23821);
insert into CITY (c_id, c_name, a_id)
values (19631, 'Bellevue', 17947);
insert into CITY (c_id, c_name, a_id)
values (54323, 'Moscow', 99621);
insert into CITY (c_id, c_name, a_id)
values (68783, 'Vallauris', 82767);
insert into CITY (c_id, c_name, a_id)
values (67826, 'League city', 27196);
insert into CITY (c_id, c_name, a_id)
values (47943, 'Debary', 53412);
insert into CITY (c_id, c_name, a_id)
values (39232, 'Ipswich', 11914);
insert into CITY (c_id, c_name, a_id)
values (41987, 'Coburg', 23133);
insert into CITY (c_id, c_name, a_id)
values (21743, 'Ankara', 12735);
insert into CITY (c_id, c_name, a_id)
values (97814, 'Glen allen', 28264);
insert into CITY (c_id, c_name, a_id)
values (54577, 'Zipf', 23743);
insert into CITY (c_id, c_name, a_id)
values (15814, 'Fukui', 68995);
insert into CITY (c_id, c_name, a_id)
values (31476, 'Kochi', 54238);
insert into CITY (c_id, c_name, a_id)
values (37216, 'Lippetal', 95266);
insert into CITY (c_id, c_name, a_id)
values (53251, 'Ft. Lauderdale', 47947);
insert into CITY (c_id, c_name, a_id)
values (84164, 'Augsburg', 13798);
insert into CITY (c_id, c_name, a_id)
values (83674, 'Ponta grossa', 11914);
insert into CITY (c_id, c_name, a_id)
values (54532, 'El Dorado Hills', 25482);
insert into CITY (c_id, c_name, a_id)
values (12162, 'Adamstown', 63298);
insert into CITY (c_id, c_name, a_id)
values (37779, 'Wetzlar', 98362);
insert into CITY (c_id, c_name, a_id)
values (53283, 'El Masnou', 38135);
insert into CITY (c_id, c_name, a_id)
values (47638, 'Salem', 17792);
insert into CITY (c_id, c_name, a_id)
values (35978, 'Lucca', 59648);
insert into CITY (c_id, c_name, a_id)
values (71549, 'Kaysville', 89976);
insert into CITY (c_id, c_name, a_id)
values (71348, 'Cuenca', 71982);
insert into CITY (c_id, c_name, a_id)
values (44266, 'Casselberry', 87571);
insert into CITY (c_id, c_name, a_id)
values (23738, 'Mito', 64646);
insert into CITY (c_id, c_name, a_id)
values (43678, 'Hanover', 59348);
insert into CITY (c_id, c_name, a_id)
values (24219, 'Koeln', 17792);
insert into CITY (c_id, c_name, a_id)
values (25119, 'Ani?¨res', 65494);
insert into CITY (c_id, c_name, a_id)
values (27926, 'K?¸benhavn', 47713);
insert into CITY (c_id, c_name, a_id)
values (74527, 'Juazeiro', 11176);
insert into CITY (c_id, c_name, a_id)
values (96859, 'Holliston', 98362);
insert into CITY (c_id, c_name, a_id)
values (19365, 'Gainesville', 17792);
insert into CITY (c_id, c_name, a_id)
values (21971, 'Bedford', 41225);
insert into CITY (c_id, c_name, a_id)
values (54397, 'Essex', 97417);
insert into CITY (c_id, c_name, a_id)
values (99869, 'Kuopio', 29752);
insert into CITY (c_id, c_name, a_id)
values (87465, 'Oklahoma city', 75857);
insert into CITY (c_id, c_name, a_id)
values (58375, 'Vejle', 23818);
insert into CITY (c_id, c_name, a_id)
values (29413, 'Aiken', 57189);
insert into CITY (c_id, c_name, a_id)
values (65637, 'Manchester', 12595);
insert into CITY (c_id, c_name, a_id)
values (97956, 'Marietta', 19667);
insert into CITY (c_id, c_name, a_id)
values (74868, 'Santorso', 41225);
insert into CITY (c_id, c_name, a_id)
values (45553, 'Peachtree City', 66317);
insert into CITY (c_id, c_name, a_id)
values (69152, 'St Kilda', 94135);
insert into CITY (c_id, c_name, a_id)
values (93343, 'Tampa', 27714);
insert into CITY (c_id, c_name, a_id)
values (94968, 'West Chester', 13553);
insert into CITY (c_id, c_name, a_id)
values (49362, 'Ulsteinvik', 54422);
insert into CITY (c_id, c_name, a_id)
values (69778, 'Kaysville', 15225);
insert into CITY (c_id, c_name, a_id)
values (44887, 'Eschborn', 23818);
insert into CITY (c_id, c_name, a_id)
values (26678, 'Oslo', 96179);
insert into CITY (c_id, c_name, a_id)
values (26252, 'Fleet', 15211);
insert into CITY (c_id, c_name, a_id)
values (21342, 'Yamaguchi', 89847);
insert into CITY (c_id, c_name, a_id)
values (94794, 'Kagoshima', 55261);
insert into CITY (c_id, c_name, a_id)
values (74481, 'Alexandria', 66499);
insert into CITY (c_id, c_name, a_id)
values (29195, 'Bad Camberg', 15233);
insert into CITY (c_id, c_name, a_id)
values (13547, 'Sihung-si', 96179);
insert into CITY (c_id, c_name, a_id)
values (45612, 'Smyrna', 89976);
insert into CITY (c_id, c_name, a_id)
values (39192, 'Battle Creek', 54228);
insert into CITY (c_id, c_name, a_id)
values (18138, 'Mariano Comense', 36265);
insert into CITY (c_id, c_name, a_id)
values (64833, 'Hounslow', 28213);
insert into CITY (c_id, c_name, a_id)
values (39612, 'Santa rita sapu', 81362);
insert into CITY (c_id, c_name, a_id)
values (69791, 'Cobham', 27723);
insert into CITY (c_id, c_name, a_id)
values (49514, 'Scottsdale', 63298);
insert into CITY (c_id, c_name, a_id)
values (25353, 'Bartlesville', 83192);
insert into CITY (c_id, c_name, a_id)
values (86623, 'Palo Alto', 88294);
insert into CITY (c_id, c_name, a_id)
values (31567, 'Seoul', 82324);
insert into CITY (c_id, c_name, a_id)
values (13596, 'Treviso', 78725);
insert into CITY (c_id, c_name, a_id)
values (27647, 'Wehrheim', 14876);
insert into CITY (c_id, c_name, a_id)
values (43293, 'Paraju', 75857);
insert into CITY (c_id, c_name, a_id)
values (28285, 'Huntington Beac', 47713);
insert into CITY (c_id, c_name, a_id)
values (15758, 'Stuttgart', 15225);
insert into CITY (c_id, c_name, a_id)
values (76719, 'Palma de Mallor', 28264);
insert into CITY (c_id, c_name, a_id)
values (96266, 'Glenshaw', 13798);
insert into CITY (c_id, c_name, a_id)
values (18843, 'Calgary', 75149);
insert into CITY (c_id, c_name, a_id)
values (43347, 'Gettysburg', 28213);
insert into CITY (c_id, c_name, a_id)
values (93571, 'Springfield', 14348);
insert into CITY (c_id, c_name, a_id)
values (68413, 'Verdun', 72484);
insert into CITY (c_id, c_name, a_id)
values (25856, 'Dublin', 97398);
insert into CITY (c_id, c_name, a_id)
values (26546, 'Brno', 84956);
commit;
prompt 100 records committed...
insert into CITY (c_id, c_name, a_id)
values (74147, 'Schlieren', 45835);
insert into CITY (c_id, c_name, a_id)
values (76933, 'Boston', 14791);
insert into CITY (c_id, c_name, a_id)
values (46256, 'Buffalo Grove', 23133);
insert into CITY (c_id, c_name, a_id)
values (22758, 'San Mateo', 78984);
insert into CITY (c_id, c_name, a_id)
values (61686, 'Saitama', 14348);
insert into CITY (c_id, c_name, a_id)
values (17534, 'Foster City', 12595);
insert into CITY (c_id, c_name, a_id)
values (57122, 'Avon', 21438);
insert into CITY (c_id, c_name, a_id)
values (74765, 'Pointe-claire', 78677);
insert into CITY (c_id, c_name, a_id)
values (86198, 'Agoncillo', 59522);
insert into CITY (c_id, c_name, a_id)
values (87711, 'Portland', 64646);
insert into CITY (c_id, c_name, a_id)
values (65287, 'Altst?¤tten', 14791);
insert into CITY (c_id, c_name, a_id)
values (78666, 'Milwaukee', 11914);
insert into CITY (c_id, c_name, a_id)
values (44338, 'Milwaukee', 25955);
insert into CITY (c_id, c_name, a_id)
values (35599, 'Woking', 19355);
insert into CITY (c_id, c_name, a_id)
values (35385, 'Joinville', 76338);
insert into CITY (c_id, c_name, a_id)
values (84983, 'Balmoral', 75149);
insert into CITY (c_id, c_name, a_id)
values (67138, 'Sendai', 35131);
insert into CITY (c_id, c_name, a_id)
values (64313, 'Chaam', 99195);
insert into CITY (c_id, c_name, a_id)
values (66952, 'Sheffield', 83192);
insert into CITY (c_id, c_name, a_id)
values (24544, 'Naha', 16272);
insert into CITY (c_id, c_name, a_id)
values (91393, 'Wellington', 85416);
insert into CITY (c_id, c_name, a_id)
values (62716, 'Ben-Gurion', 73798);
insert into CITY (c_id, c_name, a_id)
values (47415, 'N. ft. Myers', 74114);
insert into CITY (c_id, c_name, a_id)
values (35442, 'Pusan', 99195);
insert into CITY (c_id, c_name, a_id)
values (43592, 'Saudarkrokur', 54997);
insert into CITY (c_id, c_name, a_id)
values (46824, 'Bedfordshire', 55375);
insert into CITY (c_id, c_name, a_id)
values (74946, 'Reno', 59348);
insert into CITY (c_id, c_name, a_id)
values (83728, 'Tempe', 68995);
insert into CITY (c_id, c_name, a_id)
values (67288, 'Lexington', 75149);
insert into CITY (c_id, c_name, a_id)
values (54799, 'Ohtsu', 13921);
insert into CITY (c_id, c_name, a_id)
values (72641, 'Lahr', 39678);
insert into CITY (c_id, c_name, a_id)
values (56798, 'West Chester', 47526);
insert into CITY (c_id, c_name, a_id)
values (67933, 'Neuch?¢tel', 11176);
insert into CITY (c_id, c_name, a_id)
values (56812, 'Silver Spring', 75998);
insert into CITY (c_id, c_name, a_id)
values (15136, 'Albany', 14329);
insert into CITY (c_id, c_name, a_id)
values (24621, 'Rorschach', 64547);
insert into CITY (c_id, c_name, a_id)
values (34738, 'Lake worth', 39122);
insert into CITY (c_id, c_name, a_id)
values (58928, 'Obfelden', 64333);
insert into CITY (c_id, c_name, a_id)
values (83261, 'Chapeco', 72484);
insert into CITY (c_id, c_name, a_id)
values (47762, 'Olsztyn', 64848);
insert into CITY (c_id, c_name, a_id)
values (42858, 'Ulm', 31735);
insert into CITY (c_id, c_name, a_id)
values (95551, 'New orleans', 69679);
insert into CITY (c_id, c_name, a_id)
values (57739, 'Buffalo', 25955);
insert into CITY (c_id, c_name, a_id)
values (34565, 'Piacenza', 61436);
insert into CITY (c_id, c_name, a_id)
values (28468, 'Storrington', 47947);
insert into CITY (c_id, c_name, a_id)
values (88824, 'Cambridge', 28636);
insert into CITY (c_id, c_name, a_id)
values (71955, 'Melbourne', 59522);
insert into CITY (c_id, c_name, a_id)
values (86863, 'Olsztyn', 27838);
insert into CITY (c_id, c_name, a_id)
values (26597, 'Biella', 19667);
insert into CITY (c_id, c_name, a_id)
values (13778, 'Aomori', 78725);
insert into CITY (c_id, c_name, a_id)
values (57129, 'Maryville', 45835);
insert into CITY (c_id, c_name, a_id)
values (14297, 'Goslar', 81362);
insert into CITY (c_id, c_name, a_id)
values (42385, 'Cuenca', 25127);
insert into CITY (c_id, c_name, a_id)
values (74168, 'Pretoria', 33755);
insert into CITY (c_id, c_name, a_id)
values (85767, 'Hamburg', 88554);
insert into CITY (c_id, c_name, a_id)
values (35969, 'Birmingham', 62161);
insert into CITY (c_id, c_name, a_id)
values (71124, 'Vallauris', 87571);
insert into CITY (c_id, c_name, a_id)
values (15945, 'Fort Saskatchew', 89976);
insert into CITY (c_id, c_name, a_id)
values (46554, 'St Kilda', 86442);
insert into CITY (c_id, c_name, a_id)
values (98451, 'Campana', 36745);
insert into CITY (c_id, c_name, a_id)
values (25715, 'Redhill', 12735);
insert into CITY (c_id, c_name, a_id)
values (51373, 'West Lafayette', 24759);
insert into CITY (c_id, c_name, a_id)
values (56695, 'Manaus', 76832);
insert into CITY (c_id, c_name, a_id)
values (22312, 'Dubai', 44737);
insert into CITY (c_id, c_name, a_id)
values (14681, 'Eiksmarka', 72484);
insert into CITY (c_id, c_name, a_id)
values (71315, 'Berkeley', 84956);
insert into CITY (c_id, c_name, a_id)
values (37368, 'Uetikon am See', 15225);
insert into CITY (c_id, c_name, a_id)
values (37472, 'Melrose park', 99195);
insert into CITY (c_id, c_name, a_id)
values (23895, 'Herford', 67337);
insert into CITY (c_id, c_name, a_id)
values (25742, 'Mobile', 46884);
insert into CITY (c_id, c_name, a_id)
values (66332, 'El Segundo', 88294);
insert into CITY (c_id, c_name, a_id)
values (76886, 'Unionville', 51842);
insert into CITY (c_id, c_name, a_id)
values (91524, 'Toronto', 11515);
insert into CITY (c_id, c_name, a_id)
values (34767, 'Warren', 81362);
insert into CITY (c_id, c_name, a_id)
values (87287, 'Thame', 64333);
insert into CITY (c_id, c_name, a_id)
values (12747, 'Dartmouth', 27723);
insert into CITY (c_id, c_name, a_id)
values (34524, 'Reading', 63863);
insert into CITY (c_id, c_name, a_id)
values (28566, 'East Peoria', 88178);
insert into CITY (c_id, c_name, a_id)
values (68475, 'Padova', 15233);
insert into CITY (c_id, c_name, a_id)
values (59816, 'Alleroed', 11914);
insert into CITY (c_id, c_name, a_id)
values (38447, 'Vilnius', 22623);
insert into CITY (c_id, c_name, a_id)
values (88487, 'Oldenburg', 19667);
insert into CITY (c_id, c_name, a_id)
values (16153, 'Berlin-Adlersho', 64333);
insert into CITY (c_id, c_name, a_id)
values (36437, 'Douala', 28264);
insert into CITY (c_id, c_name, a_id)
values (44541, 'Laurel', 34588);
insert into CITY (c_id, c_name, a_id)
values (62184, 'Ljubljana', 95839);
insert into CITY (c_id, c_name, a_id)
values (33257, 'Ulsteinvik', 89847);
insert into CITY (c_id, c_name, a_id)
values (74438, 'Ramat Gan', 17947);
insert into CITY (c_id, c_name, a_id)
values (35988, 'Bolton', 82267);
insert into CITY (c_id, c_name, a_id)
values (68667, 'Park Ridge', 61112);
insert into CITY (c_id, c_name, a_id)
values (69226, 'Oldenburg', 13553);
insert into CITY (c_id, c_name, a_id)
values (45736, 'Summerside', 16735);
insert into CITY (c_id, c_name, a_id)
values (75745, 'Cromwell', 64848);
insert into CITY (c_id, c_name, a_id)
values (68132, 'Fuchstal-asch', 36265);
insert into CITY (c_id, c_name, a_id)
values (83296, 'Banbury', 59453);
insert into CITY (c_id, c_name, a_id)
values (68226, 'Fambach', 99887);
insert into CITY (c_id, c_name, a_id)
values (73455, 'Koufu', 22714);
insert into CITY (c_id, c_name, a_id)
values (12279, 'Encinitas', 33755);
insert into CITY (c_id, c_name, a_id)
values (45393, 'St-bruno', 99621);
insert into CITY (c_id, c_name, a_id)
values (97631, 'Stafford', 47526);
commit;
prompt 200 records committed...
insert into CITY (c_id, c_name, a_id)
values (42929, 'Koeln', 81362);
insert into CITY (c_id, c_name, a_id)
values (21497, 'Berwyn', 24759);
insert into CITY (c_id, c_name, a_id)
values (51228, 'Eschen', 21438);
insert into CITY (c_id, c_name, a_id)
values (17975, 'Kochi', 17223);
insert into CITY (c_id, c_name, a_id)
values (34649, 'Coventry', 44737);
insert into CITY (c_id, c_name, a_id)
values (95552, 'Berwyn', 81362);
insert into CITY (c_id, c_name, a_id)
values (26738, 'Edison', 13798);
insert into CITY (c_id, c_name, a_id)
values (87589, 'Kozani', 29924);
insert into CITY (c_id, c_name, a_id)
values (74459, 'Haverhill', 45835);
insert into CITY (c_id, c_name, a_id)
values (19185, 'Philadelphia', 92237);
insert into CITY (c_id, c_name, a_id)
values (22292, 'Tooele', 55375);
insert into CITY (c_id, c_name, a_id)
values (98616, 'Koeln', 95266);
insert into CITY (c_id, c_name, a_id)
values (76793, 'St Leonards', 28264);
insert into CITY (c_id, c_name, a_id)
values (27129, 'Biella', 13951);
insert into CITY (c_id, c_name, a_id)
values (56245, 'Niigata', 88774);
insert into CITY (c_id, c_name, a_id)
values (48844, 'Springfield', 37727);
insert into CITY (c_id, c_name, a_id)
values (79847, 'Ribeirao preto', 27723);
insert into CITY (c_id, c_name, a_id)
values (89844, 'Wavre', 72914);
insert into CITY (c_id, c_name, a_id)
values (31443, 'Debary', 89847);
insert into CITY (c_id, c_name, a_id)
values (46196, 'Tilburg', 38162);
insert into CITY (c_id, c_name, a_id)
values (27848, 'Budapest', 84956);
insert into CITY (c_id, c_name, a_id)
values (65476, 'Milan', 97417);
insert into CITY (c_id, c_name, a_id)
values (24153, 'Saint Ouen', 27723);
insert into CITY (c_id, c_name, a_id)
values (16248, 'Claymont', 96253);
insert into CITY (c_id, c_name, a_id)
values (41737, 'Bracknell', 62161);
insert into CITY (c_id, c_name, a_id)
values (21271, 'Taoyuan', 38778);
insert into CITY (c_id, c_name, a_id)
values (13752, 'Kista', 25955);
insert into CITY (c_id, c_name, a_id)
values (52655, 'Edinburgh', 36649);
insert into CITY (c_id, c_name, a_id)
values (82864, 'Lake worth', 33755);
insert into CITY (c_id, c_name, a_id)
values (37837, 'Leeds', 44748);
insert into CITY (c_id, c_name, a_id)
values (39132, 'Montreal', 65494);
insert into CITY (c_id, c_name, a_id)
values (54183, 'Americana', 95839);
insert into CITY (c_id, c_name, a_id)
values (73568, 'Brno', 99621);
insert into CITY (c_id, c_name, a_id)
values (94728, 'Kungki', 66317);
insert into CITY (c_id, c_name, a_id)
values (62424, 'Yomgok-dong', 88774);
insert into CITY (c_id, c_name, a_id)
values (24374, 'Germantown', 37828);
insert into CITY (c_id, c_name, a_id)
values (29411, 'Shizuoka', 67337);
insert into CITY (c_id, c_name, a_id)
values (76199, 'Saga', 66317);
insert into CITY (c_id, c_name, a_id)
values (98684, 'Waite Park', 99195);
insert into CITY (c_id, c_name, a_id)
values (94356, 'Ringwood', 69679);
insert into CITY (c_id, c_name, a_id)
values (58334, 'Warley', 92366);
insert into CITY (c_id, c_name, a_id)
values (98216, 'Kumamoto', 44298);
insert into CITY (c_id, c_name, a_id)
values (81149, 'Longueuil', 35131);
insert into CITY (c_id, c_name, a_id)
values (93325, 'Rothenburg', 35131);
insert into CITY (c_id, c_name, a_id)
values (45647, 'Tualatin', 73798);
insert into CITY (c_id, c_name, a_id)
values (72361, 'Wilmington', 23743);
insert into CITY (c_id, c_name, a_id)
values (37197, 'Longueuil', 37871);
insert into CITY (c_id, c_name, a_id)
values (76379, 'Hackensack', 72726);
insert into CITY (c_id, c_name, a_id)
values (38784, 'Erpe-Mere', 75149);
insert into CITY (c_id, c_name, a_id)
values (89279, 'Vejle', 12735);
insert into CITY (c_id, c_name, a_id)
values (78633, 'Royersford', 51842);
insert into CITY (c_id, c_name, a_id)
values (55157, 'Las Vegas', 24467);
insert into CITY (c_id, c_name, a_id)
values (82637, 'Belo Horizonte', 78984);
insert into CITY (c_id, c_name, a_id)
values (61256, 'Sundsvall', 59453);
insert into CITY (c_id, c_name, a_id)
values (32125, 'Solikamsk', 94135);
insert into CITY (c_id, c_name, a_id)
values (39855, 'Colombo', 27819);
insert into CITY (c_id, c_name, a_id)
values (89943, 'East Peoria', 78725);
insert into CITY (c_id, c_name, a_id)
values (59927, 'Aomori', 11653);
insert into CITY (c_id, c_name, a_id)
values (23677, 'Tbilisi', 72726);
insert into CITY (c_id, c_name, a_id)
values (34788, 'Buffalo Grove', 11653);
insert into CITY (c_id, c_name, a_id)
values (86265, 'Protvino', 61112);
insert into CITY (c_id, c_name, a_id)
values (54552, 'Americana', 19638);
insert into CITY (c_id, c_name, a_id)
values (41118, 'Boulogne', 42951);
insert into CITY (c_id, c_name, a_id)
values (41641, 'Rockville', 86442);
insert into CITY (c_id, c_name, a_id)
values (49189, 'Groton', 59916);
insert into CITY (c_id, c_name, a_id)
values (92974, 'Matsue', 42149);
insert into CITY (c_id, c_name, a_id)
values (65857, 'Edinburgh', 44748);
insert into CITY (c_id, c_name, a_id)
values (37552, 'Wetzlar', 28264);
insert into CITY (c_id, c_name, a_id)
values (83225, 'Juneau', 22714);
insert into CITY (c_id, c_name, a_id)
values (24574, 'Riverdale', 53412);
insert into CITY (c_id, c_name, a_id)
values (48492, 'Naestved', 61112);
insert into CITY (c_id, c_name, a_id)
values (49695, 'Fountain Hills', 24467);
insert into CITY (c_id, c_name, a_id)
values (56921, 'Laredo', 54422);
insert into CITY (c_id, c_name, a_id)
values (31622, 'Smyrna', 29752);
insert into CITY (c_id, c_name, a_id)
values (76464, 'Sparrows Point', 32942);
insert into CITY (c_id, c_name, a_id)
values (85492, 'Chennai', 78677);
insert into CITY (c_id, c_name, a_id)
values (36157, 'Macau', 61112);
insert into CITY (c_id, c_name, a_id)
values (25956, 'Vienna', 17995);
insert into CITY (c_id, c_name, a_id)
values (56648, 'Trenton', 41572);
insert into CITY (c_id, c_name, a_id)
values (79913, 'Oakland', 67984);
insert into CITY (c_id, c_name, a_id)
values (7, 'Bat Yam', 1);
insert into CITY (c_id, c_name, a_id)
values (8, 'Beer Sheva', 4);
insert into CITY (c_id, c_name, a_id)
values (9, 'Afula', 3);
insert into CITY (c_id, c_name, a_id)
values (1, 'Tiberias', 3);
insert into CITY (c_id, c_name, a_id)
values (2, 'Jerusalem', 2);
insert into CITY (c_id, c_name, a_id)
values (3, 'Tel Aviv', 1);
insert into CITY (c_id, c_name, a_id)
values (4, ' Ariel', 5);
insert into CITY (c_id, c_name, a_id)
values (5, ' Haifa', 3);
insert into CITY (c_id, c_name, a_id)
values (6, ' Ashkelon', 4);
insert into CITY (c_id, c_name, a_id)
values (2745, 'Mariano Comense', 134);
insert into CITY (c_id, c_name, a_id)
values (1116, 'Dublin', 287);
insert into CITY (c_id, c_name, a_id)
values (3984, 'Oxford', 63);
insert into CITY (c_id, c_name, a_id)
values (2668, 'M?nchengladbach', 877);
insert into CITY (c_id, c_name, a_id)
values (2980, 'Abbotsford', 784);
insert into CITY (c_id, c_name, a_id)
values (1338, 'Fort worth', 992);
insert into CITY (c_id, c_name, a_id)
values (1525, 'Dallas', 856);
insert into CITY (c_id, c_name, a_id)
values (3412, 'Ittigen', 965);
insert into CITY (c_id, c_name, a_id)
values (2342, 'Olivette', 32);
insert into CITY (c_id, c_name, a_id)
values (252, 'Johannesburg', 808);
insert into CITY (c_id, c_name, a_id)
values (814, 'Sugar Hill', 234);
commit;
prompt 300 records committed...
insert into CITY (c_id, c_name, a_id)
values (711, 'Hounslow', 763);
insert into CITY (c_id, c_name, a_id)
values (319, 'S. Bernardo do ', 484);
insert into CITY (c_id, c_name, a_id)
values (3091, 'Reading', 287);
insert into CITY (c_id, c_name, a_id)
values (155, 'Di Savigliano', 288);
insert into CITY (c_id, c_name, a_id)
values (1754, 'Graz', 554);
insert into CITY (c_id, c_name, a_id)
values (2897, 'Pompton Plains', 367);
insert into CITY (c_id, c_name, a_id)
values (1425, 'Hunt Valley', 681);
insert into CITY (c_id, c_name, a_id)
values (1341, 'Pasadena', 194);
insert into CITY (c_id, c_name, a_id)
values (3831, 'Alleroed', 306);
insert into CITY (c_id, c_name, a_id)
values (3066, 'Pasadena', 262);
insert into CITY (c_id, c_name, a_id)
values (3688, 'Spresiano', 653);
insert into CITY (c_id, c_name, a_id)
values (1464, 'Tadley', 731);
insert into CITY (c_id, c_name, a_id)
values (1884, 'Bangalore', 497);
insert into CITY (c_id, c_name, a_id)
values (3772, 'Bartlett', 1);
insert into CITY (c_id, c_name, a_id)
values (1517, 'Mainz-kastel', 63);
insert into CITY (c_id, c_name, a_id)
values (3838, 'Valladolid', 75);
insert into CITY (c_id, c_name, a_id)
values (597, 'Draper', 909);
insert into CITY (c_id, c_name, a_id)
values (1073, 'Magstadt', 792);
insert into CITY (c_id, c_name, a_id)
values (846, 'Fuerth', 979);
insert into CITY (c_id, c_name, a_id)
values (1954, 'Adamstown', 367);
insert into CITY (c_id, c_name, a_id)
values (598, 'Bernex', 668);
insert into CITY (c_id, c_name, a_id)
values (2986, 'Hiroshima', 578);
insert into CITY (c_id, c_name, a_id)
values (3357, 'Boise', 873);
insert into CITY (c_id, c_name, a_id)
values (157, 'Silverdale', 437);
insert into CITY (c_id, c_name, a_id)
values (1062, 'Cambridge', 404);
insert into CITY (c_id, c_name, a_id)
values (2261, 'Stoneham', 419);
insert into CITY (c_id, c_name, a_id)
values (3558, 'Redhill', 41);
insert into CITY (c_id, c_name, a_id)
values (202, 'K?ln', 961);
insert into CITY (c_id, c_name, a_id)
values (1943, 'Augst', 672);
insert into CITY (c_id, c_name, a_id)
values (391, 'Key Biscayne', 979);
insert into CITY (c_id, c_name, a_id)
values (3041, 'Springfield', 517);
insert into CITY (c_id, c_name, a_id)
values (179, 'Canberra', 808);
insert into CITY (c_id, c_name, a_id)
values (3285, 'Bellevue', 860);
insert into CITY (c_id, c_name, a_id)
values (3575, 'Carlsbad', 673);
insert into CITY (c_id, c_name, a_id)
values (3858, 'Rio Rancho', 585);
insert into CITY (c_id, c_name, a_id)
values (1219, 'Bismarck', 839);
insert into CITY (c_id, c_name, a_id)
values (3645, 'Laurel', 758);
insert into CITY (c_id, c_name, a_id)
values (576, 'New Haven', 126);
insert into CITY (c_id, c_name, a_id)
values (859, 'Reston', 262);
insert into CITY (c_id, c_name, a_id)
values (1096, 'S. Bernardo do ', 790);
insert into CITY (c_id, c_name, a_id)
values (2765, 'Monterey', 965);
insert into CITY (c_id, c_name, a_id)
values (1960, 'Bedford', 129);
insert into CITY (c_id, c_name, a_id)
values (2329, 'Alleroed', 116);
insert into CITY (c_id, c_name, a_id)
values (3400, 'Holts Summit', 635);
insert into CITY (c_id, c_name, a_id)
values (3697, 'Bad Camberg', 185);
insert into CITY (c_id, c_name, a_id)
values (3639, 'Annandale', 417);
insert into CITY (c_id, c_name, a_id)
values (2347, 'Tampa', 847);
insert into CITY (c_id, c_name, a_id)
values (3194, 'Dietikon', 948);
insert into CITY (c_id, c_name, a_id)
values (311, 'Ohita', 262);
insert into CITY (c_id, c_name, a_id)
values (3836, 'North bethesda', 803);
insert into CITY (c_id, c_name, a_id)
values (1091, 'Dinslaken', 487);
insert into CITY (c_id, c_name, a_id)
values (3006, 'Reno', 579);
insert into CITY (c_id, c_name, a_id)
values (3493, 'Yomgok-dong', 781);
insert into CITY (c_id, c_name, a_id)
values (3107, 'Grand Rapids', 898);
insert into CITY (c_id, c_name, a_id)
values (3769, 'Gaithersburg', 688);
insert into CITY (c_id, c_name, a_id)
values (3561, 'St. Petersburg', 944);
insert into CITY (c_id, c_name, a_id)
values (3184, 'Mobile', 3);
insert into CITY (c_id, c_name, a_id)
values (3303, 'Schaumburg', 592);
insert into CITY (c_id, c_name, a_id)
values (2384, 'Hunt Valley', 831);
insert into CITY (c_id, c_name, a_id)
values (330, 'Lefkosa', 781);
insert into CITY (c_id, c_name, a_id)
values (2601, 'Nepean', 411);
insert into CITY (c_id, c_name, a_id)
values (3374, 'Anyang-si', 126);
insert into CITY (c_id, c_name, a_id)
values (655, 'Hartford', 402);
insert into CITY (c_id, c_name, a_id)
values (2683, 'Rocklin', 784);
insert into CITY (c_id, c_name, a_id)
values (301, 'Toulouse', 773);
insert into CITY (c_id, c_name, a_id)
values (129, 'Suwon-city', 393);
insert into CITY (c_id, c_name, a_id)
values (2103, 'Irati', 773);
insert into CITY (c_id, c_name, a_id)
values (90, 'Tulsa', 487);
insert into CITY (c_id, c_name, a_id)
values (3072, 'Tustin', 314);
insert into CITY (c_id, c_name, a_id)
values (3408, 'Des Plaines', 394);
insert into CITY (c_id, c_name, a_id)
values (53, 'St-laurent', 939);
insert into CITY (c_id, c_name, a_id)
values (1023, 'Harrisburg', 129);
insert into CITY (c_id, c_name, a_id)
values (658, 'Noumea', 796);
insert into CITY (c_id, c_name, a_id)
values (31, 'Alcobendas', 877);
insert into CITY (c_id, c_name, a_id)
values (1613, 'Middleburg Heig', 115);
insert into CITY (c_id, c_name, a_id)
values (3584, 'Rothenburg', 430);
insert into CITY (c_id, c_name, a_id)
values (2352, 'Naestved', 781);
insert into CITY (c_id, c_name, a_id)
values (991, 'Dubai', 773);
insert into CITY (c_id, c_name, a_id)
values (2937, 'Rothenburg', 584);
insert into CITY (c_id, c_name, a_id)
values (1377, 'Lexington', 592);
insert into CITY (c_id, c_name, a_id)
values (2685, 'Tokushima', 71);
insert into CITY (c_id, c_name, a_id)
values (2066, 'Farmington Hill', 940);
insert into CITY (c_id, c_name, a_id)
values (2061, 'Woodland Hills', 948);
insert into CITY (c_id, c_name, a_id)
values (2374, 'Sutton', 596);
insert into CITY (c_id, c_name, a_id)
values (2783, 'Vilnius', 63);
insert into CITY (c_id, c_name, a_id)
values (3214, 'Miami', 624);
insert into CITY (c_id, c_name, a_id)
values (1092, 'North Point', 48);
insert into CITY (c_id, c_name, a_id)
values (3152, 'Singapore', 595);
insert into CITY (c_id, c_name, a_id)
values (1316, 'Grand Rapids', 362);
insert into CITY (c_id, c_name, a_id)
values (162, 'Miami', 565);
insert into CITY (c_id, c_name, a_id)
values (3807, 'Rome', 63);
insert into CITY (c_id, c_name, a_id)
values (3256, 'Loveland', 49);
insert into CITY (c_id, c_name, a_id)
values (166, 'Drogenbos', 5);
insert into CITY (c_id, c_name, a_id)
values (680, 'Bautzen', 860);
insert into CITY (c_id, c_name, a_id)
values (3513, 'Potsdam', 288);
insert into CITY (c_id, c_name, a_id)
values (368, 'Neuch?tel', 784);
insert into CITY (c_id, c_name, a_id)
values (3693, 'League city', 291);
insert into CITY (c_id, c_name, a_id)
values (1767, 'Tyne & Wear', 129);
insert into CITY (c_id, c_name, a_id)
values (1828, 'Stans', 801);
insert into CITY (c_id, c_name, a_id)
values (1368, 'Zwolle', 287);
commit;
prompt 400 records committed...
insert into CITY (c_id, c_name, a_id)
values (1366, 'Oldenburg', 898);
insert into CITY (c_id, c_name, a_id)
values (2777, 'Ulm', 725);
insert into CITY (c_id, c_name, a_id)
values (3649, 'Jakarta', 9);
insert into CITY (c_id, c_name, a_id)
values (2652, 'Araras', 824);
insert into CITY (c_id, c_name, a_id)
values (618, 'Ribeirao preto', 486);
insert into CITY (c_id, c_name, a_id)
values (3740, 'Juazeiro', 194);
insert into CITY (c_id, c_name, a_id)
values (238, 'Research Triang', 442);
insert into CITY (c_id, c_name, a_id)
values (1676, 'Rtp', 833);
insert into CITY (c_id, c_name, a_id)
values (648, 'Seoul', 91);
insert into CITY (c_id, c_name, a_id)
values (1407, 'Ribeirao preto', 94);
insert into CITY (c_id, c_name, a_id)
values (2906, 'Shelton', 5);
insert into CITY (c_id, c_name, a_id)
values (1509, 'Yomgok-dong', 441);
insert into CITY (c_id, c_name, a_id)
values (2828, 'Budapest', 784);
insert into CITY (c_id, c_name, a_id)
values (2421, 'Fredericia', 437);
insert into CITY (c_id, c_name, a_id)
values (3714, 'Thames Ditton', 498);
insert into CITY (c_id, c_name, a_id)
values (1156, 'Nagasaki', 953);
insert into CITY (c_id, c_name, a_id)
values (521, 'Cromwell', 526);
insert into CITY (c_id, c_name, a_id)
values (1818, 'Pasadena', 91);
insert into CITY (c_id, c_name, a_id)
values (1265, 'Thames Ditton', 931);
insert into CITY (c_id, c_name, a_id)
values (177, 'Vienna', 20);
insert into CITY (c_id, c_name, a_id)
values (1415, 'Mendoza', 903);
insert into CITY (c_id, c_name, a_id)
values (2243, 'Trieste', 288);
insert into CITY (c_id, c_name, a_id)
values (608, 'Singapore', 457);
insert into CITY (c_id, c_name, a_id)
values (2500, 'Sao roque', 972);
insert into CITY (c_id, c_name, a_id)
values (760, 'Graz', 652);
insert into CITY (c_id, c_name, a_id)
values (2180, 'Houston', 419);
insert into CITY (c_id, c_name, a_id)
values (3598, 'Rtp', 339);
insert into CITY (c_id, c_name, a_id)
values (3093, 'Fort Lee', 486);
insert into CITY (c_id, c_name, a_id)
values (1470, 'Portland', 860);
insert into CITY (c_id, c_name, a_id)
values (221, 'Coslada', 280);
insert into CITY (c_id, c_name, a_id)
values (908, 'San Ramon', 465);
insert into CITY (c_id, c_name, a_id)
values (1831, 'Herford', 709);
insert into CITY (c_id, c_name, a_id)
values (251, 'Koufu', 650);
insert into CITY (c_id, c_name, a_id)
values (1817, 'Longview', 860);
insert into CITY (c_id, c_name, a_id)
values (2138, 'Lancaster', 497);
insert into CITY (c_id, c_name, a_id)
values (1030, 'Sale', 578);
insert into CITY (c_id, c_name, a_id)
values (3018, 'Highton', 831);
insert into CITY (c_id, c_name, a_id)
values (2545, 'Augsburg', 39);
insert into CITY (c_id, c_name, a_id)
values (3134, 'Richmond Hill', 972);
insert into CITY (c_id, c_name, a_id)
values (857, 'El Segundo', 270);
insert into CITY (c_id, c_name, a_id)
values (3348, 'Stone Mountain', 962);
insert into CITY (c_id, c_name, a_id)
values (407, 'Morioka', 784);
insert into CITY (c_id, c_name, a_id)
values (1371, 'Kochi', 91);
insert into CITY (c_id, c_name, a_id)
values (2811, 'Winnipeg', 796);
insert into CITY (c_id, c_name, a_id)
values (3375, 'Omaha', 28);
insert into CITY (c_id, c_name, a_id)
values (1315, 'Kanazawa', 962);
insert into CITY (c_id, c_name, a_id)
values (1553, 'Ludbreg', 6);
insert into CITY (c_id, c_name, a_id)
values (163, 'Utsunomiya', 119);
insert into CITY (c_id, c_name, a_id)
values (3331, 'Pasadena', 596);
insert into CITY (c_id, c_name, a_id)
values (479, 'Archbold', 80);
insert into CITY (c_id, c_name, a_id)
values (480, 'Stockholm', 205);
insert into CITY (c_id, c_name, a_id)
values (1422, 'Tadley', 729);
insert into CITY (c_id, c_name, a_id)
values (1310, 'Runcorn', 254);
insert into CITY (c_id, c_name, a_id)
values (1280, 'Macclesfield', 466);
insert into CITY (c_id, c_name, a_id)
values (2825, 'Natal', 154);
insert into CITY (c_id, c_name, a_id)
values (1990, 'King of Prussia', 790);
insert into CITY (c_id, c_name, a_id)
values (3857, 'Milton Keynes', 572);
insert into CITY (c_id, c_name, a_id)
values (1565, 'Sihung-si', 954);
insert into CITY (c_id, c_name, a_id)
values (3259, 'Mechanicsburg', 146);
insert into CITY (c_id, c_name, a_id)
values (3398, 'Boise', 878);
insert into CITY (c_id, c_name, a_id)
values (3247, 'Samrand', 985);
insert into CITY (c_id, c_name, a_id)
values (3338, 'Ettlingen', 709);
insert into CITY (c_id, c_name, a_id)
values (1647, 'Luedenscheid', 277);
insert into CITY (c_id, c_name, a_id)
values (404, 'New Delhi', 458);
insert into CITY (c_id, c_name, a_id)
values (1478, 'Ternitz', 615);
insert into CITY (c_id, c_name, a_id)
values (3170, 'Valladolid', 835);
insert into CITY (c_id, c_name, a_id)
values (3310, 'Birmingham', 814);
insert into CITY (c_id, c_name, a_id)
values (3994, 'Maceio', 655);
insert into CITY (c_id, c_name, a_id)
values (2993, 'Essex', 446);
insert into CITY (c_id, c_name, a_id)
values (1952, 'Tulsa', 799);
insert into CITY (c_id, c_name, a_id)
values (2477, 'Mainz-kastel', 307);
insert into CITY (c_id, c_name, a_id)
values (3187, 'Research Triang', 728);
insert into CITY (c_id, c_name, a_id)
values (686, 'Leawood', 962);
insert into CITY (c_id, c_name, a_id)
values (931, 'Naha', 430);
insert into CITY (c_id, c_name, a_id)
values (1079, 'Delafield', 763);
insert into CITY (c_id, c_name, a_id)
values (2615, 'Koblenz', 714);
insert into CITY (c_id, c_name, a_id)
values (2313, 'Trenton', 946);
insert into CITY (c_id, c_name, a_id)
values (1067, 'Birmensdorf', 839);
insert into CITY (c_id, c_name, a_id)
values (2114, 'Niigata', 784);
insert into CITY (c_id, c_name, a_id)
values (377, 'Gdansk', 194);
insert into CITY (c_id, c_name, a_id)
values (1361, 'Groton', 688);
insert into CITY (c_id, c_name, a_id)
values (1439, 'Durban', 283);
insert into CITY (c_id, c_name, a_id)
values (3043, 'Marburg', 641);
insert into CITY (c_id, c_name, a_id)
values (2814, 'Pusan', 568);
insert into CITY (c_id, c_name, a_id)
values (1355, 'Leawood', 349);
insert into CITY (c_id, c_name, a_id)
values (3293, 'Hunt Valley', 4);
insert into CITY (c_id, c_name, a_id)
values (2413, 'Nashua', 739);
insert into CITY (c_id, c_name, a_id)
values (780, 'Paramus', 476);
insert into CITY (c_id, c_name, a_id)
values (2657, 'Westfield', 648);
insert into CITY (c_id, c_name, a_id)
values (2728, 'Fort Collins', 271);
insert into CITY (c_id, c_name, a_id)
values (3627, 'St Jean de Soud', 86);
insert into CITY (c_id, c_name, a_id)
values (1789, 'Karlstad', 486);
insert into CITY (c_id, c_name, a_id)
values (1706, 'Crete', 646);
insert into CITY (c_id, c_name, a_id)
values (1031, 'Herzogenrath', 773);
insert into CITY (c_id, c_name, a_id)
values (3326, 'Miami', 515);
insert into CITY (c_id, c_name, a_id)
values (1461, 'San Mateo', 111);
insert into CITY (c_id, c_name, a_id)
values (1052, 'Turku', 672);
insert into CITY (c_id, c_name, a_id)
values (2106, 'Trenton', 877);
insert into CITY (c_id, c_name, a_id)
values (140, 'Houma', 831);
insert into CITY (c_id, c_name, a_id)
values (2035, 'Taipei', 668);
commit;
prompt 500 records committed...
insert into CITY (c_id, c_name, a_id)
values (3114, 'Cheshire', 222);
insert into CITY (c_id, c_name, a_id)
values (2550, 'Southampton', 94);
insert into CITY (c_id, c_name, a_id)
values (1642, 'Redmond', 677);
insert into CITY (c_id, c_name, a_id)
values (2631, 'Huntington Beac', 150);
insert into CITY (c_id, c_name, a_id)
values (418, 'Karlstad', 658);
insert into CITY (c_id, c_name, a_id)
values (2317, 'Athens', 272);
insert into CITY (c_id, c_name, a_id)
values (1721, 'Edison', 129);
insert into CITY (c_id, c_name, a_id)
values (3037, 'Farmington Hill', 238);
insert into CITY (c_id, c_name, a_id)
values (260, 'Edenbridge', 154);
insert into CITY (c_id, c_name, a_id)
values (2933, 'Portland', 975);
insert into CITY (c_id, c_name, a_id)
values (2900, 'Pa?o de Arcos', 833);
insert into CITY (c_id, c_name, a_id)
values (1693, 'Boulogne', 803);
insert into CITY (c_id, c_name, a_id)
values (150, 'Sao roque', 15);
insert into CITY (c_id, c_name, a_id)
values (2798, 'Duesseldorf', 242);
insert into CITY (c_id, c_name, a_id)
values (3004, 'Schlieren', 572);
insert into CITY (c_id, c_name, a_id)
values (3827, 'W?rzburg', 261);
insert into CITY (c_id, c_name, a_id)
values (1576, 'Montr?al', 931);
insert into CITY (c_id, c_name, a_id)
values (660, 'Wetzlar', 565);
insert into CITY (c_id, c_name, a_id)
values (616, 'Charlottesville', 814);
insert into CITY (c_id, c_name, a_id)
values (2022, 'Milan', 442);
insert into CITY (c_id, c_name, a_id)
values (1294, 'Tokyo', 781);
insert into CITY (c_id, c_name, a_id)
values (1288, 'Oak Park', 18);
insert into CITY (c_id, c_name, a_id)
values (2091, 'Lodi', 234);
insert into CITY (c_id, c_name, a_id)
values (1779, 'Burr Ridge', 668);
insert into CITY (c_id, c_name, a_id)
values (1609, 'Huntsville', 277);
insert into CITY (c_id, c_name, a_id)
values (905, 'Laguna Bbeach', 630);
insert into CITY (c_id, c_name, a_id)
values (2566, 'St. Louis', 575);
insert into CITY (c_id, c_name, a_id)
values (1118, 'Hilton', 89);
insert into CITY (c_id, c_name, a_id)
values (1042, 'Nara', 64);
insert into CITY (c_id, c_name, a_id)
values (2757, 'Bergara', 821);
insert into CITY (c_id, c_name, a_id)
values (3958, 'New Delhi', 271);
insert into CITY (c_id, c_name, a_id)
values (1055, 'Caracas', 476);
insert into CITY (c_id, c_name, a_id)
values (2681, 'Lisbon', 142);
insert into CITY (c_id, c_name, a_id)
values (111, 'Aracruz', 4);
insert into CITY (c_id, c_name, a_id)
values (695, 'Balmoral', 565);
insert into CITY (c_id, c_name, a_id)
values (1503, 'Okayama', 409);
insert into CITY (c_id, c_name, a_id)
values (2709, 'Archbold', 866);
insert into CITY (c_id, c_name, a_id)
values (2494, 'Baltimore', 332);
insert into CITY (c_id, c_name, a_id)
values (3373, 'Bellevue', 50);
insert into CITY (c_id, c_name, a_id)
values (830, 'Sydney', 63);
insert into CITY (c_id, c_name, a_id)
values (1167, 'Fukuoka', 814);
insert into CITY (c_id, c_name, a_id)
values (3073, 'Holts Summit', 660);
insert into CITY (c_id, c_name, a_id)
values (528, 'Santa rita sapu', 535);
insert into CITY (c_id, c_name, a_id)
values (2673, 'Maarssen', 530);
insert into CITY (c_id, c_name, a_id)
values (44, 'Santiago', 64);
insert into CITY (c_id, c_name, a_id)
values (3158, 'Olsztyn', 39);
insert into CITY (c_id, c_name, a_id)
values (2832, 'Lexington', 50);
insert into CITY (c_id, c_name, a_id)
values (2797, 'Rueil-Malmaison', 343);
insert into CITY (c_id, c_name, a_id)
values (2208, 'Boston', 442);
insert into CITY (c_id, c_name, a_id)
values (749, 'Lancaster', 343);
insert into CITY (c_id, c_name, a_id)
values (2737, 'Stans', 997);
insert into CITY (c_id, c_name, a_id)
values (3410, 'Karlsruhe', 71);
insert into CITY (c_id, c_name, a_id)
values (1058, 'Lisboa', 952);
insert into CITY (c_id, c_name, a_id)
values (1155, 'Maintenon', 681);
insert into CITY (c_id, c_name, a_id)
values (2409, 'Mason', 831);
insert into CITY (c_id, c_name, a_id)
values (1978, 'Verwood', 303);
insert into CITY (c_id, c_name, a_id)
values (1930, 'East Providence', 965);
insert into CITY (c_id, c_name, a_id)
values (3990, 'Greenwood Villa', 764);
insert into CITY (c_id, c_name, a_id)
values (498, 'Lenexa', 939);
insert into CITY (c_id, c_name, a_id)
values (2747, 'Milton Keynes', 138);
insert into CITY (c_id, c_name, a_id)
values (3142, 'Algermissen', 565);
insert into CITY (c_id, c_name, a_id)
values (1163, 'Dalmine', 953);
insert into CITY (c_id, c_name, a_id)
values (457, 'Bend', 270);
insert into CITY (c_id, c_name, a_id)
values (2188, 'Woking', 57);
insert into CITY (c_id, c_name, a_id)
values (1402, 'Solikamsk', 57);
insert into CITY (c_id, c_name, a_id)
values (1378, 'Porto alegre', 584);
insert into CITY (c_id, c_name, a_id)
values (1442, 'Chapeco', 392);
insert into CITY (c_id, c_name, a_id)
values (3907, 'Neuch?tel', 650);
insert into CITY (c_id, c_name, a_id)
values (2394, 'Royersford', 955);
insert into CITY (c_id, c_name, a_id)
values (3468, 'Noumea', 673);
insert into CITY (c_id, c_name, a_id)
values (822, 'Traralgon', 768);
insert into CITY (c_id, c_name, a_id)
values (747, 'Sao roque', 452);
insert into CITY (c_id, c_name, a_id)
values (1840, 'Barueri', 27);
insert into CITY (c_id, c_name, a_id)
values (1566, 'Kagoshima', 222);
insert into CITY (c_id, c_name, a_id)
values (2233, 'Dartmouth', 866);
insert into CITY (c_id, c_name, a_id)
values (1929, 'Istanbul', 734);
insert into CITY (c_id, c_name, a_id)
values (1672, 'Nashua', 558);
insert into CITY (c_id, c_name, a_id)
values (1396, 'Rueil-Malmaison', 3);
commit;
prompt 578 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7209, 'Ethan', to_date('08-06-1985', 'dd-mm-yyyy'), 2208);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4965, 'Eric', to_date('21-04-2005', 'dd-mm-yyyy'), 1613);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2165, 'Elisabeth', to_date('05-09-1987', 'dd-mm-yyyy'), 2980);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9367, 'Emerson', to_date('16-06-2017', 'dd-mm-yyyy'), 3584);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8191, 'Joe', to_date('12-07-2001', 'dd-mm-yyyy'), 1960);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9072, 'Gordie', to_date('19-11-2010', 'dd-mm-yyyy'), 1565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5804, 'April', to_date('20-04-2010', 'dd-mm-yyyy'), 140);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2271, 'Joey', to_date('27-10-2009', 'dd-mm-yyyy'), 1789);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5333, 'Melba', to_date('22-03-1985', 'dd-mm-yyyy'), 1470);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1034, 'Lynn', to_date('10-01-2005', 'dd-mm-yyyy'), 2765);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4393, 'Hilton', to_date('03-04-1983', 'dd-mm-yyyy'), 3107);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8265, 'John', to_date('06-10-1970', 'dd-mm-yyyy'), 1118);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2372, 'Charlize', to_date('26-09-2008', 'dd-mm-yyyy'), 3575);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2855, 'Jaime', to_date('18-04-1975', 'dd-mm-yyyy'), 3575);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2665, 'Hex', to_date('07-07-1981', 'dd-mm-yyyy'), 2384);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3960, 'Cheryl', to_date('20-10-1983', 'dd-mm-yyyy'), 1461);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7860, 'Diamond', to_date('20-12-1979', 'dd-mm-yyyy'), 2342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7708, 'Mena', to_date('14-05-1996', 'dd-mm-yyyy'), 1219);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1394, 'Sheryl', to_date('16-08-2020', 'dd-mm-yyyy'), 660);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8603, 'Tori', to_date('26-09-1993', 'dd-mm-yyyy'), 260);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1483, 'Glenn', to_date('27-09-1982', 'dd-mm-yyyy'), 1647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3603, 'Marisa', to_date('10-01-2013', 'dd-mm-yyyy'), 2814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1858, 'Laurence', to_date('12-03-2000', 'dd-mm-yyyy'), 3907);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3399, 'Kitty', to_date('16-04-1997', 'dd-mm-yyyy'), 3984);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1122, 'Donal', to_date('10-05-1991', 'dd-mm-yyyy'), 1509);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2819, 'Nastassja', to_date('06-05-1982', 'dd-mm-yyyy'), 618);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4933, 'Merrilee', to_date('18-07-2013', 'dd-mm-yyyy'), 1055);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2753, 'Jim', to_date('18-04-2003', 'dd-mm-yyyy'), 177);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5561, 'Dom', to_date('23-01-2002', 'dd-mm-yyyy'), 830);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9068, 'Joely', to_date('07-07-2004', 'dd-mm-yyyy'), 2180);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1358, 'Pablo', to_date('27-08-2007', 'dd-mm-yyyy'), 2681);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3039, 'Mel', to_date('24-02-1977', 'dd-mm-yyyy'), 1079);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2283, 'Sarah', to_date('15-09-1974', 'dd-mm-yyyy'), 1439);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9500, 'Isabella', to_date('15-08-1983', 'dd-mm-yyyy'), 1609);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7106, 'Raymond', to_date('12-12-2005', 'dd-mm-yyyy'), 2394);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5793, 'Taylor', to_date('18-01-1997', 'dd-mm-yyyy'), 166);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1761, 'Kevin', to_date('15-09-1997', 'dd-mm-yyyy'), 1779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1663, 'Lynette', to_date('06-08-1983', 'dd-mm-yyyy'), 3836);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3055, 'Petula', to_date('08-01-2004', 'dd-mm-yyyy'), 1073);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4533, 'Curt', to_date('29-09-2005', 'dd-mm-yyyy'), 3194);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7633, 'Gloria', to_date('05-03-1994', 'dd-mm-yyyy'), 2631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4152, 'Neve', to_date('18-10-1989', 'dd-mm-yyyy'), 3073);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8570, 'Cyndi', to_date('01-08-2020', 'dd-mm-yyyy'), 3990);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7533, 'Roscoe', to_date('12-11-2014', 'dd-mm-yyyy'), 695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1785, 'Vondie', to_date('13-09-2011', 'dd-mm-yyyy'), 1156);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6451, 'Kurtwood', to_date('13-11-2014', 'dd-mm-yyyy'), 177);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3293, 'Marty', to_date('23-11-1992', 'dd-mm-yyyy'), 391);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7715, 'Clint', to_date('04-09-2019', 'dd-mm-yyyy'), 2900);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2877, 'Russell', to_date('06-08-1985', 'dd-mm-yyyy'), 1415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3160, 'Regina', to_date('06-06-1989', 'dd-mm-yyyy'), 1156);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7932, 'Mekhi', to_date('05-10-1973', 'dd-mm-yyyy'), 3772);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5175, 'Liv', to_date('29-10-2002', 'dd-mm-yyyy'), 1096);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6962, 'Paul', to_date('04-01-1993', 'dd-mm-yyyy'), 1396);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5437, 'Miko', to_date('31-08-1998', 'dd-mm-yyyy'), 1052);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1919, 'Daryle', to_date('20-01-1992', 'dd-mm-yyyy'), 695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7057, 'Delroy', to_date('02-04-2015', 'dd-mm-yyyy'), 479);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8950, 'Harvey', to_date('01-07-2013', 'dd-mm-yyyy'), 1425);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7730, 'Merrill', to_date('23-12-1977', 'dd-mm-yyyy'), 1415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2979, 'Julia', to_date('24-08-2008', 'dd-mm-yyyy'), 3331);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3247, 'Judge', to_date('04-07-1982', 'dd-mm-yyyy'), 3066);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2153, 'Alice', to_date('25-11-1986', 'dd-mm-yyyy'), 2811);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7428, 'Lupe', to_date('25-11-2007', 'dd-mm-yyyy'), 2421);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6392, 'Tia', to_date('17-07-2009', 'dd-mm-yyyy'), 3331);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7289, 'Stockard', to_date('21-04-2005', 'dd-mm-yyyy'), 3331);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4238, 'Sam', to_date('26-01-2015', 'dd-mm-yyyy'), 2545);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3692, 'Richie', to_date('10-02-1994', 'dd-mm-yyyy'), 830);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1937, 'Roy', to_date('07-04-1988', 'dd-mm-yyyy'), 2180);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9472, 'Moe', to_date('07-08-1971', 'dd-mm-yyyy'), 2897);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8923, 'Howard', to_date('23-08-2012', 'dd-mm-yyyy'), 2329);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4927, 'Rosie', to_date('19-08-1998', 'dd-mm-yyyy'), 680);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9126, 'Juliana', to_date('06-03-1985', 'dd-mm-yyyy'), 1);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6051, 'Milla', to_date('03-03-1979', 'dd-mm-yyyy'), 1642);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8835, 'Debra', to_date('09-12-1987', 'dd-mm-yyyy'), 3398);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1786, 'Eric', to_date('23-11-1982', 'dd-mm-yyyy'), 1167);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6802, 'John', to_date('14-05-2011', 'dd-mm-yyyy'), 2615);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2299, 'Roger', to_date('26-05-2008', 'dd-mm-yyyy'), 1355);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6737, 'Night', to_date('17-03-1982', 'dd-mm-yyyy'), 1565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4781, 'Murray', to_date('16-02-2002', 'dd-mm-yyyy'), 140);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5733, 'Rebecca', to_date('13-07-1999', 'dd-mm-yyyy'), 3158);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3148, 'Ruth', to_date('09-11-2016', 'dd-mm-yyyy'), 1960);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4163, 'Laura', to_date('27-05-2017', 'dd-mm-yyyy'), 1553);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5572, 'Carol', to_date('11-06-1989', 'dd-mm-yyyy'), 2566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3578, 'Amy', to_date('25-03-1987', 'dd-mm-yyyy'), 686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7908, 'Lonnie', to_date('13-01-1978', 'dd-mm-yyyy'), 2747);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9754, 'Kathleen', to_date('27-04-2012', 'dd-mm-yyyy'), 3142);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4197, 'Lupe', to_date('17-10-1992', 'dd-mm-yyyy'), 686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7518, 'Nicholas', to_date('02-02-1995', 'dd-mm-yyyy'), 163);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6138, 'Geraldine', to_date('02-02-1992', 'dd-mm-yyyy'), 3310);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7174, 'Terry', to_date('21-01-1978', 'dd-mm-yyyy'), 2811);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9064, 'Christine', to_date('31-07-1981', 'dd-mm-yyyy'), 407);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3601, 'Alex', to_date('19-09-1995', 'dd-mm-yyyy'), 2777);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2570, 'Amanda', to_date('03-10-1971', 'dd-mm-yyyy'), 1721);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3538, 'Nicole', to_date('29-10-1985', 'dd-mm-yyyy'), 822);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2415, 'Christina', to_date('04-10-2016', 'dd-mm-yyyy'), 53);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4057, 'Gilberto', to_date('16-11-2001', 'dd-mm-yyyy'), 576);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6292, 'Molly', to_date('08-03-2015', 'dd-mm-yyyy'), 3285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4228, 'Talvin', to_date('22-10-1981', 'dd-mm-yyyy'), 1647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2567, 'Radney', to_date('17-12-1973', 'dd-mm-yyyy'), 457);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9037, 'Meredith', to_date('26-06-1987', 'dd-mm-yyyy'), 2421);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4195, 'Richie', to_date('11-12-1975', 'dd-mm-yyyy'), 1831);
commit;
prompt 100 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3946, 'Percy', to_date('19-02-2012', 'dd-mm-yyyy'), 3338);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8615, 'Bobbi', to_date('02-11-2014', 'dd-mm-yyyy'), 3513);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6399, 'Fisher', to_date('20-08-1972', 'dd-mm-yyyy'), 2783);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3996, 'Radney', to_date('21-06-2000', 'dd-mm-yyyy'), 252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3104, 'Davey', to_date('29-04-1978', 'dd-mm-yyyy'), 3187);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9786, 'Edie', to_date('26-04-1983', 'dd-mm-yyyy'), 368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2195, 'Jaime', to_date('24-01-1979', 'dd-mm-yyyy'), 2601);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9661, 'Nils', to_date('01-02-2016', 'dd-mm-yyyy'), 1517);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4423, 'Elijah', to_date('11-07-1970', 'dd-mm-yyyy'), 1091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6445, 'Joy', to_date('01-04-2016', 'dd-mm-yyyy'), 3043);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6923, 'Franz', to_date('11-05-2002', 'dd-mm-yyyy'), 2233);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1191, 'Bruce', to_date('01-05-2014', 'dd-mm-yyyy'), 1091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2311, 'Kyra', to_date('03-05-1995', 'dd-mm-yyyy'), 1288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5732, 'Adrien', to_date('24-11-2007', 'dd-mm-yyyy'), 908);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5992, 'Judi', to_date('07-01-1985', 'dd-mm-yyyy'), 3639);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9911, 'Rebecca', to_date('06-09-1981', 'dd-mm-yyyy'), 1884);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7125, 'Christian', to_date('03-10-2011', 'dd-mm-yyyy'), 1030);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3778, 'Loreena', to_date('23-05-2009', 'dd-mm-yyyy'), 905);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9849, 'Steve', to_date('21-12-1979', 'dd-mm-yyyy'), 2832);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6065, 'David', to_date('23-12-2003', 'dd-mm-yyyy'), 129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6879, 'Alessandro', to_date('19-09-1992', 'dd-mm-yyyy'), 1118);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9736, 'Merrilee', to_date('30-11-1980', 'dd-mm-yyyy'), 1978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5475, 'Radney', to_date('07-10-2001', 'dd-mm-yyyy'), 3375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3899, 'Fred', to_date('27-09-1975', 'dd-mm-yyyy'), 4);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2769, 'Julia', to_date('01-03-1994', 'dd-mm-yyyy'), 44);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8885, 'Bobbi', to_date('30-09-1995', 'dd-mm-yyyy'), 1840);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9920, 'Kris', to_date('04-09-1981', 'dd-mm-yyyy'), 3066);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2610, 'Tanya', to_date('31-10-2019', 'dd-mm-yyyy'), 238);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6321, 'Kenneth', to_date('08-05-1974', 'dd-mm-yyyy'), 3994);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2959, 'Murray', to_date('13-09-1993', 'dd-mm-yyyy'), 3994);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8410, 'Garland', to_date('02-10-2003', 'dd-mm-yyyy'), 3107);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7175, 'Rick', to_date('14-04-2016', 'dd-mm-yyyy'), 2342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9993, 'Maxine', to_date('27-09-1974', 'dd-mm-yyyy'), 749);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7302, 'Harry', to_date('01-12-2006', 'dd-mm-yyyy'), 157);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9441, 'Edgar', to_date('20-04-2004', 'dd-mm-yyyy'), 1954);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4397, 'Carolyn', to_date('03-04-1975', 'dd-mm-yyyy'), 1167);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3931, 'Chris', to_date('07-03-1977', 'dd-mm-yyyy'), 2035);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7124, 'Vanessa', to_date('02-09-1980', 'dd-mm-yyyy'), 1553);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9907, 'Lily', to_date('06-02-1993', 'dd-mm-yyyy'), 3043);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7086, 'Renee', to_date('03-03-1973', 'dd-mm-yyyy'), 658);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4499, 'Spencer', to_date('16-04-1986', 'dd-mm-yyyy'), 3990);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7933, 'Will', to_date('18-12-2003', 'dd-mm-yyyy'), 3043);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2105, 'Holly', to_date('08-02-2001', 'dd-mm-yyyy'), 53);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8526, 'Debby', to_date('06-12-1987', 'dd-mm-yyyy'), 2347);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1451, 'Etta', to_date('24-12-1973', 'dd-mm-yyyy'), 2342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5838, 'Elle', to_date('05-02-2002', 'dd-mm-yyyy'), 3858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1283, 'Breckin', to_date('28-10-1990', 'dd-mm-yyyy'), 3);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5264, 'Mos', to_date('05-01-2016', 'dd-mm-yyyy'), 2601);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4692, 'Joaquin', to_date('11-08-1988', 'dd-mm-yyyy'), 2828);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3836, 'Melba', to_date('21-03-1988', 'dd-mm-yyyy'), 1960);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6750, 'Ossie', to_date('27-02-1985', 'dd-mm-yyyy'), 1031);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8833, 'Emily', to_date('27-10-1988', 'dd-mm-yyyy'), 3836);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2116, 'Christmas', to_date('10-01-1971', 'dd-mm-yyyy'), 457);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3096, 'Holland', to_date('22-01-1998', 'dd-mm-yyyy'), 660);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5042, 'Ronny', to_date('04-06-1990', 'dd-mm-yyyy'), 418);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5923, 'Norm', to_date('28-09-2007', 'dd-mm-yyyy'), 2757);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3226, 'Sara', to_date('31-05-1992', 'dd-mm-yyyy'), 1517);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3940, 'Colleen', to_date('28-08-2010', 'dd-mm-yyyy'), 1422);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4396, 'Dean', to_date('26-06-2008', 'dd-mm-yyyy'), 3827);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1965, 'Penelope', to_date('14-04-1981', 'dd-mm-yyyy'), 3688);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8203, 'Jeffrey', to_date('19-02-2019', 'dd-mm-yyyy'), 3827);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9274, 'Morgan', to_date('24-10-1992', 'dd-mm-yyyy'), 2615);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2803, 'Sophie', to_date('14-03-2008', 'dd-mm-yyyy'), 140);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2378, 'Gladys', to_date('21-08-1982', 'dd-mm-yyyy'), 3468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6430, 'Daniel', to_date('26-12-1979', 'dd-mm-yyyy'), 3714);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8522, 'Horace', to_date('27-07-2017', 'dd-mm-yyyy'), 1442);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4833, 'Bret', to_date('23-01-2017', 'dd-mm-yyyy'), 2114);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3959, 'Maury', to_date('17-08-1987', 'dd-mm-yyyy'), 1439);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2802, 'Charlize', to_date('04-11-2013', 'dd-mm-yyyy'), 908);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9383, 'Christina', to_date('30-03-2004', 'dd-mm-yyyy'), 1062);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4578, 'Ike', to_date('03-01-2016', 'dd-mm-yyyy'), 3408);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9498, 'Rhona', to_date('20-02-1982', 'dd-mm-yyyy'), 251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2091, 'Merillee', to_date('15-09-1982', 'dd-mm-yyyy'), 1366);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1518, 'Joanna', to_date('24-11-1999', 'dd-mm-yyyy'), 179);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3616, 'Jackson', to_date('30-06-1987', 'dd-mm-yyyy'), 1079);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5461, 'Nicky', to_date('25-04-1980', 'dd-mm-yyyy'), 3357);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8543, 'Holland', to_date('21-06-2016', 'dd-mm-yyyy'), 3398);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8423, 'Horace', to_date('11-08-1970', 'dd-mm-yyyy'), 521);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4494, 'Hazel', to_date('17-01-1976', 'dd-mm-yyyy'), 2477);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1083, 'Anna', to_date('19-11-2010', 'dd-mm-yyyy'), 6);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1826, 'Tia', to_date('21-01-1991', 'dd-mm-yyyy'), 3693);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5592, 'Helen', to_date('10-04-1997', 'dd-mm-yyyy'), 3310);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6457, 'Derrick', to_date('02-08-1982', 'dd-mm-yyyy'), 3018);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7098, 'Deborah', to_date('06-03-1983', 'dd-mm-yyyy'), 2747);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7002, 'Keanu', to_date('19-07-2020', 'dd-mm-yyyy'), 1167);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9888, 'Heather', to_date('04-11-1979', 'dd-mm-yyyy'), 3375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6700, 'Donal', to_date('12-09-1970', 'dd-mm-yyyy'), 3043);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1551, 'Carrie-Anne', to_date('27-01-1981', 'dd-mm-yyyy'), 3398);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9978, 'Doug', to_date('27-06-2004', 'dd-mm-yyyy'), 2980);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5413, 'Joaquim', to_date('12-01-1996', 'dd-mm-yyyy'), 2233);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3975, 'Angelina', to_date('23-01-1994', 'dd-mm-yyyy'), 2066);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3559, 'Mili', to_date('09-04-2013', 'dd-mm-yyyy'), 3907);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2330, 'Carrie-Anne', to_date('29-10-1990', 'dd-mm-yyyy'), 3400);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9905, 'Garth', to_date('13-06-1975', 'dd-mm-yyyy'), 166);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9209, 'Donald', to_date('21-10-1981', 'dd-mm-yyyy'), 1553);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1051, 'Cameron', to_date('12-02-1989', 'dd-mm-yyyy'), 3373);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2120, 'Jeffrey', to_date('18-03-2014', 'dd-mm-yyyy'), 1425);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1434, 'Ving', to_date('12-10-2015', 'dd-mm-yyyy'), 111);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6096, 'Rutger', to_date('02-10-1998', 'dd-mm-yyyy'), 311);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9958, 'Grace', to_date('11-04-1973', 'dd-mm-yyyy'), 2233);
commit;
prompt 200 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2528, 'Carrie-Anne', to_date('27-01-2013', 'dd-mm-yyyy'), 2783);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9771, 'Lea', to_date('22-08-1973', 'dd-mm-yyyy'), 1073);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5231, 'Alana', to_date('19-04-1975', 'dd-mm-yyyy'), 2);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3840, 'Desmond', to_date('11-06-1988', 'dd-mm-yyyy'), 780);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1625, 'Richard', to_date('28-04-1986', 'dd-mm-yyyy'), 608);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6450, 'Kiefer', to_date('23-03-2008', 'dd-mm-yyyy'), 2022);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2658, 'Gailard', to_date('10-06-2006', 'dd-mm-yyyy'), 1960);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5018, 'Lindsay', to_date('22-12-1970', 'dd-mm-yyyy'), 480);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7701, 'Barry', to_date('12-07-1995', 'dd-mm-yyyy'), 3285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3203, 'Minnie', to_date('17-07-1994', 'dd-mm-yyyy'), 1840);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6593, 'Leon', to_date('24-11-2012', 'dd-mm-yyyy'), 1721);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7028, 'Chuck', to_date('26-07-1998', 'dd-mm-yyyy'), 3247);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6382, 'Maggie', to_date('16-11-1999', 'dd-mm-yyyy'), 1789);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83001, 'Kirsten  Duke', to_date('15-12-2006', 'dd-mm-yyyy'), 85492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30795, 'Meryl  Grant', to_date('13-10-2010', 'dd-mm-yyyy'), 54799);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95456, 'Spike  Sobieski', to_date('20-01-2018', 'dd-mm-yyyy'), 59816);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58034, 'Chi  Ferrer', to_date('14-12-1999', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27625, 'Simon  Nighting', to_date('06-07-2002', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80953, 'Kenneth  Delta', to_date('09-09-1993', 'dd-mm-yyyy'), 13778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73206, 'Queen  Holly', to_date('27-02-1990', 'dd-mm-yyyy'), 15758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20864, 'Roberta  Winger', to_date('08-01-1998', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58858, 'Nik  Caan', to_date('29-06-1997', 'dd-mm-yyyy'), 66952);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21580, 'Junior  Bonham', to_date('23-04-1992', 'dd-mm-yyyy'), 73568);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62921, 'Lari  Kleinenbe', to_date('25-03-2003', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99322, 'Cary  Nakai', to_date('13-12-2011', 'dd-mm-yyyy'), 98216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16698, 'Teri  Rain', to_date('22-11-2013', 'dd-mm-yyyy'), 21971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68533, 'Gena  Heatherly', to_date('30-01-2019', 'dd-mm-yyyy'), 98616);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56852, 'Frederic  Rooke', to_date('21-03-1993', 'dd-mm-yyyy'), 49362);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16134, 'Fisher  Beck', to_date('30-07-2015', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74443, 'Uma  Burmester', to_date('12-01-1999', 'dd-mm-yyyy'), 34649);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75675, 'Kris  Cazale', to_date('29-12-1993', 'dd-mm-yyyy'), 95552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53839, 'Kathy  Frakes', to_date('09-07-2004', 'dd-mm-yyyy'), 83152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55684, 'Forest  Logue', to_date('06-04-2020', 'dd-mm-yyyy'), 45612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63668, 'Ani  Carter', to_date('30-08-2018', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43109, 'Johnnie  Ferry', to_date('17-03-2020', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11730, 'Bret  McCain', to_date('02-03-1994', 'dd-mm-yyyy'), 43592);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22847, 'Bob  Kier', to_date('26-02-1990', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47617, 'Austin  Travers', to_date('13-08-2001', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97637, 'Carolyn  Soul', to_date('24-03-2001', 'dd-mm-yyyy'), 74481);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93249, 'Percy  Rucker', to_date('11-10-2017', 'dd-mm-yyyy'), 57129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74711, 'Christmas  Will', to_date('14-08-2013', 'dd-mm-yyyy'), 95551);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83699, 'Delbert  Lopez', to_date('11-10-1990', 'dd-mm-yyyy'), 62184);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29280, 'Gates  Avital', to_date('08-10-2020', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75712, 'Bret  Moraz', to_date('07-02-1996', 'dd-mm-yyyy'), 95552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26921, 'Mike  Scorsese', to_date('27-05-2018', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92124, 'Olympia  Pollac', to_date('08-11-2005', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59927, 'Colm  Tisdale', to_date('28-02-2014', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68211, 'Larenz  Astin', to_date('29-01-2008', 'dd-mm-yyyy'), 53283);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64499, 'Saul  Weiss', to_date('13-03-2010', 'dd-mm-yyyy'), 95551);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15292, 'Denny  Vannelli', to_date('20-06-2006', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83763, 'Elizabeth  Wolf', to_date('28-01-2004', 'dd-mm-yyyy'), 49514);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71078, 'Samantha  Hatos', to_date('29-06-1999', 'dd-mm-yyyy'), 67138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97232, 'Elijah  Glenn', to_date('27-09-2000', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45035, 'Sinead  Cale', to_date('17-05-2006', 'dd-mm-yyyy'), 21342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89877, 'Vanessa  Tempes', to_date('07-01-2008', 'dd-mm-yyyy'), 29411);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91074, 'Colleen  Belles', to_date('18-04-2004', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90893, 'Kenny  Chestnut', to_date('28-07-1997', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79926, 'Bebe  Aiken', to_date('21-04-2009', 'dd-mm-yyyy'), 51373);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55735, 'Davis  Bonham', to_date('26-09-1996', 'dd-mm-yyyy'), 82637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21673, 'Glen  Sobieski', to_date('09-10-2011', 'dd-mm-yyyy'), 34738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94139, 'Temuera  Willia', to_date('10-12-1995', 'dd-mm-yyyy'), 87589);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64357, 'Rhea  McDowall', to_date('18-07-2017', 'dd-mm-yyyy'), 52655);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60688, 'Roddy  Quinones', to_date('11-03-2001', 'dd-mm-yyyy'), 21342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41058, 'Emma  Lemmon', to_date('19-11-2006', 'dd-mm-yyyy'), 83296);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42399, 'Leon  Holiday', to_date('07-12-2009', 'dd-mm-yyyy'), 18138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62412, 'Lauren  Ali', to_date('20-03-2005', 'dd-mm-yyyy'), 13778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83569, 'Harrison  Starr', to_date('15-07-2016', 'dd-mm-yyyy'), 25353);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48482, 'Julie  Shaye', to_date('25-03-2018', 'dd-mm-yyyy'), 83261);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25138, 'Rhona  Rooker', to_date('31-03-2016', 'dd-mm-yyyy'), 79847);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52926, 'Raymond  Colema', to_date('14-04-2006', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14531, 'Rebecca  Imperi', to_date('06-04-2002', 'dd-mm-yyyy'), 43678);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66674, 'Rowan  Remar', to_date('02-01-2016', 'dd-mm-yyyy'), 43347);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58148, 'Ozzy  Paltrow', to_date('05-12-2009', 'dd-mm-yyyy'), 67933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55949, 'Raul  DiBiasio', to_date('12-08-2020', 'dd-mm-yyyy'), 48844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12913, 'Nathan  Parker', to_date('27-05-1993', 'dd-mm-yyyy'), 39612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83583, 'Celia  Smith', to_date('24-05-2005', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21158, 'Alessandro  Mol', to_date('25-03-2017', 'dd-mm-yyyy'), 54323);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21297, 'Joaquim  Bosco', to_date('09-02-1999', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45347, 'Marty  Myers', to_date('12-02-2009', 'dd-mm-yyyy'), 88824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97069, 'Cloris  Barkin', to_date('31-10-1991', 'dd-mm-yyyy'), 68132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91246, 'Arnold  De Alme', to_date('20-03-2003', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74027, 'Tommy  Savage', to_date('02-02-2006', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70825, 'Simon  Jamal', to_date('26-06-2009', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44997, 'Jerry  Farris', to_date('21-10-1990', 'dd-mm-yyyy'), 71549);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24174, 'Darius  Walken', to_date('14-12-2014', 'dd-mm-yyyy'), 28566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21954, 'Clint  Bacharac', to_date('18-07-2004', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54694, 'Cesar  Utada', to_date('06-02-2007', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54901, 'Ike  Street', to_date('23-12-2003', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40605, 'Lea  Beckinsale', to_date('29-09-2007', 'dd-mm-yyyy'), 44541);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14107, 'Anna  Berenger', to_date('03-01-1994', 'dd-mm-yyyy'), 13596);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86804, 'Joan  Nivola', to_date('08-09-2005', 'dd-mm-yyyy'), 87589);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47944, 'Geraldine  Alda', to_date('25-07-2012', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91327, 'Gil  Martinez', to_date('27-11-2004', 'dd-mm-yyyy'), 25742);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66694, 'Teri  Haynes', to_date('14-10-2011', 'dd-mm-yyyy'), 79847);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23879, 'Franco  Anderso', to_date('01-08-2003', 'dd-mm-yyyy'), 53251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26859, 'Scott  Rydell', to_date('19-12-2001', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95089, 'Jay  Furay', to_date('26-07-1999', 'dd-mm-yyyy'), 31476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83273, 'Remy  Hutton', to_date('02-04-2000', 'dd-mm-yyyy'), 59867);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73070, 'Jonatha  Suchet', to_date('08-04-2009', 'dd-mm-yyyy'), 54397);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87026, 'Taye  Wine', to_date('06-04-2020', 'dd-mm-yyyy'), 35978);
commit;
prompt 300 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (51635, 'Freda  Branch', to_date('17-01-1995', 'dd-mm-yyyy'), 21971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49714, 'Sharon  Beck', to_date('18-06-2020', 'dd-mm-yyyy'), 15945);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87532, 'Allison  Osborn', to_date('13-09-2014', 'dd-mm-yyyy'), 61686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54460, 'Scott  Ferry', to_date('21-02-2001', 'dd-mm-yyyy'), 75745);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70436, 'Milla  Visnjic', to_date('05-10-2011', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72141, 'Illeana  Abraha', to_date('31-07-2012', 'dd-mm-yyyy'), 78666);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92319, 'Anita  Saxon', to_date('26-11-2001', 'dd-mm-yyyy'), 18138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42882, 'Marina  Barrymo', to_date('04-04-2004', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60255, 'Allison  Hayek', to_date('28-01-1999', 'dd-mm-yyyy'), 25353);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78866, 'Rodney  Worrell', to_date('17-08-1999', 'dd-mm-yyyy'), 34738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11959, 'Scott  Hopper', to_date('15-09-2018', 'dd-mm-yyyy'), 74438);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10324, 'Darius  Shaw', to_date('21-01-2006', 'dd-mm-yyyy'), 68464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34388, 'Nicky  Maxwell', to_date('13-12-1997', 'dd-mm-yyyy'), 68667);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23041, 'Lupe  Stamp', to_date('18-03-1995', 'dd-mm-yyyy'), 65857);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15814, 'Nina  Owen', to_date('12-12-2007', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18252, 'Gerald  Hackman', to_date('08-01-1991', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28915, 'Christmas  Sway', to_date('25-04-2010', 'dd-mm-yyyy'), 29411);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95234, 'Selma  LaPaglia', to_date('24-09-1997', 'dd-mm-yyyy'), 94968);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39820, 'Max  Dorn', to_date('08-06-2010', 'dd-mm-yyyy'), 75745);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38658, 'Shirley  Starr', to_date('07-12-2017', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93825, 'Judge  Tierney', to_date('28-04-1998', 'dd-mm-yyyy'), 74765);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27662, 'Gin  Jeffreys', to_date('23-01-1997', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35692, 'Murray  Zane', to_date('24-03-2008', 'dd-mm-yyyy'), 76199);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67105, 'Eugene  Cox', to_date('08-05-2005', 'dd-mm-yyyy'), 59816);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29331, 'Martha  Liotta', to_date('18-01-2011', 'dd-mm-yyyy'), 49514);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14289, 'Dennis  Hackman', to_date('14-04-2020', 'dd-mm-yyyy'), 95551);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91200, 'Bradley  Olypha', to_date('28-01-2013', 'dd-mm-yyyy'), 67826);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62190, 'Lea  Alda', to_date('18-06-2009', 'dd-mm-yyyy'), 44887);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92247, 'Mark  Macy', to_date('08-09-2010', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33514, 'Crispin  Romijn', to_date('17-04-2003', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37597, 'Ted  Dzundza', to_date('22-06-1991', 'dd-mm-yyyy'), 98616);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64382, 'Rosanne  Murdoc', to_date('30-04-2011', 'dd-mm-yyyy'), 38447);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49749, 'Vern  David', to_date('23-04-1999', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52665, 'Joaquin  Payton', to_date('19-06-1994', 'dd-mm-yyyy'), 76886);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72805, 'Andrea  Mantegn', to_date('30-01-1999', 'dd-mm-yyyy'), 76199);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59727, 'Chalee  Beckins', to_date('07-02-2002', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10378, 'Miles  Henstrid', to_date('04-10-2002', 'dd-mm-yyyy'), 91393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16017, 'Rob  Day-Lewis', to_date('25-07-1997', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81443, 'Sissy  Lillard', to_date('09-09-2007', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76366, 'Vern  Midler', to_date('30-08-2017', 'dd-mm-yyyy'), 89943);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94617, 'Ty  Kutcher', to_date('10-02-2002', 'dd-mm-yyyy'), 45553);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70558, 'Rosanna  Chao', to_date('24-06-2006', 'dd-mm-yyyy'), 97956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35293, 'Ashton  Whitwam', to_date('15-08-1998', 'dd-mm-yyyy'), 39192);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34342, 'Udo  Cobbs', to_date('30-04-1998', 'dd-mm-yyyy'), 41987);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79897, 'Janeane  Cleese', to_date('21-09-2003', 'dd-mm-yyyy'), 37216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66215, 'Roddy  Van Damm', to_date('07-08-2018', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10303, 'Rip  Page', to_date('02-11-2006', 'dd-mm-yyyy'), 25353);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61679, 'Rod  Reiner', to_date('16-01-2007', 'dd-mm-yyyy'), 13778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80797, 'Nile  Mohr', to_date('03-04-1997', 'dd-mm-yyyy'), 67826);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86720, 'Jamie  Avital', to_date('31-05-2014', 'dd-mm-yyyy'), 96494);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41869, 'Armin  Khan', to_date('23-07-2002', 'dd-mm-yyyy'), 69226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38976, 'Frank  Hannah', to_date('26-09-2005', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17267, 'Joely  Sample', to_date('05-06-2005', 'dd-mm-yyyy'), 46824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59886, 'Rene  Cara', to_date('15-06-2014', 'dd-mm-yyyy'), 54397);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44256, 'Judge  Katt', to_date('13-08-2001', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25362, 'Crispin  Harmon', to_date('30-05-2017', 'dd-mm-yyyy'), 68475);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82129, 'Clay  Close', to_date('27-10-2010', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45593, 'Lonnie  Checker', to_date('06-05-2017', 'dd-mm-yyyy'), 94356);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78454, 'Jann  Purefoy', to_date('02-03-1991', 'dd-mm-yyyy'), 19185);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81676, 'Roberta  Dunn', to_date('31-07-2018', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82028, 'Udo  Sewell', to_date('17-10-2012', 'dd-mm-yyyy'), 23677);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15040, 'Sonny  Mellenca', to_date('01-11-1998', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81144, 'Rebecca  Pride', to_date('03-12-1993', 'dd-mm-yyyy'), 83296);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26050, 'Gary  Dreyfuss', to_date('01-03-1997', 'dd-mm-yyyy'), 49695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78388, 'Giovanni  Cotto', to_date('24-05-2011', 'dd-mm-yyyy'), 58334);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21368, 'Stevie  Bogguss', to_date('22-03-1992', 'dd-mm-yyyy'), 46196);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93725, 'Kyra  Close', to_date('29-05-2010', 'dd-mm-yyyy'), 15945);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90894, 'Danny  Stowe', to_date('24-03-1997', 'dd-mm-yyyy'), 28285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67554, 'Ossie  Kimball', to_date('18-12-2000', 'dd-mm-yyyy'), 51336);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94160, 'Bob  Buckingham', to_date('12-04-2011', 'dd-mm-yyyy'), 21743);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36495, 'Kiefer  Stallon', to_date('17-08-1994', 'dd-mm-yyyy'), 16248);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62888, 'Gary  LuPone', to_date('30-03-1990', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81400, 'Winona  Barnett', to_date('16-02-2008', 'dd-mm-yyyy'), 23388);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57378, 'Julianne  Conro', to_date('28-06-1994', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92861, 'George  Rippy', to_date('01-11-2008', 'dd-mm-yyyy'), 21342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89088, 'Percy  Greene', to_date('20-01-2014', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82677, 'Rhett  Chandler', to_date('08-01-2001', 'dd-mm-yyyy'), 87287);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39553, 'Breckin  Copela', to_date('19-03-2002', 'dd-mm-yyyy'), 98616);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34811, 'Harry  Brown', to_date('23-11-1997', 'dd-mm-yyyy'), 53283);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60691, 'Lucinda  Hopkin', to_date('13-11-1994', 'dd-mm-yyyy'), 25353);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92049, 'Burton  McDorma', to_date('18-09-2011', 'dd-mm-yyyy'), 37472);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76713, 'Jean  Saxon', to_date('04-09-2008', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73107, 'Spike  Thomson', to_date('27-02-1993', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93586, 'Powers  Gary', to_date('03-03-2006', 'dd-mm-yyyy'), 94356);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48257, 'Judy  Gallant', to_date('22-09-2016', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29690, 'Percy  Randal', to_date('24-01-2000', 'dd-mm-yyyy'), 14681);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47023, 'Henry  Hauer', to_date('31-03-2016', 'dd-mm-yyyy'), 71955);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36309, 'Jonny  Trippleh', to_date('17-02-1993', 'dd-mm-yyyy'), 48492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52581, 'Brooke  Tomlin', to_date('20-12-1994', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66447, 'Fred  Phoenix', to_date('14-08-2014', 'dd-mm-yyyy'), 37472);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21204, 'Benicio  Womack', to_date('10-12-2012', 'dd-mm-yyyy'), 39663);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12009, 'Minnie  Farrell', to_date('20-12-2001', 'dd-mm-yyyy'), 39663);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66080, 'Quentin  McElho', to_date('13-12-2015', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55018, 'Seann  Spader', to_date('22-06-2000', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17003, 'Gailard  Bruce', to_date('19-09-2016', 'dd-mm-yyyy'), 93325);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75733, 'Remy  Lofgren', to_date('22-05-2014', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61415, 'Lesley  Elizabe', to_date('25-08-1993', 'dd-mm-yyyy'), 35599);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19550, 'Debbie  Emmett', to_date('08-04-2000', 'dd-mm-yyyy'), 74459);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80228, 'Kristin  Posey', to_date('15-12-2012', 'dd-mm-yyyy'), 15814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81456, 'Busta  Englund', to_date('06-02-2018', 'dd-mm-yyyy'), 58375);
commit;
prompt 400 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73067, 'Zooey  Tambor', to_date('05-03-2012', 'dd-mm-yyyy'), 74168);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74389, 'Bret  Gough', to_date('15-10-2016', 'dd-mm-yyyy'), 83728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84612, 'Lupe  O''Connor', to_date('14-05-2013', 'dd-mm-yyyy'), 79913);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69867, 'Pamela  Cherry', to_date('06-06-2016', 'dd-mm-yyyy'), 16248);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (51553, 'Demi  Moody', to_date('05-09-1998', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59820, 'Ian  Patton', to_date('27-05-1990', 'dd-mm-yyyy'), 35978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75825, 'Andrew  Brosnan', to_date('15-05-2003', 'dd-mm-yyyy'), 71549);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58796, 'Eugene  Flanery', to_date('07-02-2014', 'dd-mm-yyyy'), 98216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76592, 'Garland  Foley', to_date('24-06-1996', 'dd-mm-yyyy'), 25119);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69340, 'Ted  Bruce', to_date('27-05-2000', 'dd-mm-yyyy'), 58319);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74267, 'Allison  Peters', to_date('16-04-2009', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91655, 'Wendy  Warwick', to_date('05-05-2009', 'dd-mm-yyyy'), 59927);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91856, 'Gwyneth  Hiatt', to_date('15-07-2009', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45637, 'Melba  Nosewort', to_date('20-09-2011', 'dd-mm-yyyy'), 93965);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67296, 'Gaby  Broderick', to_date('01-04-2013', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81592, 'Jean  Klein', to_date('07-04-2003', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93575, 'Woody  Boyle', to_date('24-05-1994', 'dd-mm-yyyy'), 98216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86015, 'Tramaine  Flack', to_date('03-12-2013', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72266, 'Sean  Wariner', to_date('20-06-2010', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25954, 'Victoria  Kline', to_date('01-08-2012', 'dd-mm-yyyy'), 83261);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97042, 'Vienna  LuPone', to_date('26-11-2006', 'dd-mm-yyyy'), 92879);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75688, 'Swoosie  Carlyl', to_date('12-04-2016', 'dd-mm-yyyy'), 59816);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56090, 'Garland  Oldman', to_date('24-12-2018', 'dd-mm-yyyy'), 24544);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45211, 'Suzy  Tucci', to_date('03-06-2017', 'dd-mm-yyyy'), 27647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15050, 'Maury  Shaw', to_date('14-08-1992', 'dd-mm-yyyy'), 54577);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94514, 'Ronny  Union', to_date('05-04-2020', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61774, 'Cate  David', to_date('12-03-2014', 'dd-mm-yyyy'), 54323);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14296, 'Rip  Boone', to_date('03-06-2000', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91599, 'Jeroen  Orbit', to_date('21-03-2017', 'dd-mm-yyyy'), 47638);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31196, 'Sheryl  Malkovi', to_date('15-09-2005', 'dd-mm-yyyy'), 49695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49585, 'Linda  Schwimme', to_date('11-01-2016', 'dd-mm-yyyy'), 68132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90152, 'Stephanie  Dafo', to_date('06-07-1993', 'dd-mm-yyyy'), 23895);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87372, 'Quentin  Copela', to_date('12-02-2008', 'dd-mm-yyyy'), 15814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83093, 'Carla  Jeter', to_date('24-08-2005', 'dd-mm-yyyy'), 94794);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21112, 'Avril  Conners', to_date('31-01-2007', 'dd-mm-yyyy'), 37552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44515, 'Thora  Studi', to_date('26-06-1994', 'dd-mm-yyyy'), 62184);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17322, 'Oded  Jordan', to_date('13-10-2004', 'dd-mm-yyyy'), 76379);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23550, 'Mae  Winstone', to_date('14-01-2012', 'dd-mm-yyyy'), 19985);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15111, 'Rutger  Schreib', to_date('01-12-2017', 'dd-mm-yyyy'), 79847);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46420, 'Jeff  Kane', to_date('25-09-1994', 'dd-mm-yyyy'), 87711);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44143, 'Sonny  Fichtner', to_date('19-05-2004', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92498, 'Ceili  Rourke', to_date('12-06-2019', 'dd-mm-yyyy'), 21342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15977, 'Jeanne  Khan', to_date('05-06-2011', 'dd-mm-yyyy'), 76886);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60700, 'Vincent  Guilfo', to_date('29-09-1995', 'dd-mm-yyyy'), 88487);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35942, 'Vern  Chapman', to_date('19-07-1991', 'dd-mm-yyyy'), 46256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28325, 'Chaka  Shatner', to_date('27-08-1997', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40365, 'Geggy  Gill', to_date('10-01-2001', 'dd-mm-yyyy'), 37837);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13248, 'Bill  Loring', to_date('29-04-2005', 'dd-mm-yyyy'), 23895);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76798, 'Vincent  Reno', to_date('21-10-1999', 'dd-mm-yyyy'), 27647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64857, 'Gloria  James', to_date('09-10-2002', 'dd-mm-yyyy'), 22292);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80808, 'Natasha  Whitmo', to_date('03-09-1993', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52296, 'Dustin  Oakenfo', to_date('04-04-2014', 'dd-mm-yyyy'), 35969);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77994, 'Rhona  Spader', to_date('01-04-2002', 'dd-mm-yyyy'), 51454);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64162, 'Teri  Horton', to_date('01-03-2006', 'dd-mm-yyyy'), 78146);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26893, 'Marie  Reiner', to_date('11-11-2019', 'dd-mm-yyyy'), 49189);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32818, 'Bernard  Simpso', to_date('11-05-2010', 'dd-mm-yyyy'), 35978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48835, 'Peter  Burstyn', to_date('09-06-2003', 'dd-mm-yyyy'), 91393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11431, 'Kirk  Arnold', to_date('22-01-2009', 'dd-mm-yyyy'), 57129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68773, 'Jonatha  Todd', to_date('23-12-2004', 'dd-mm-yyyy'), 48492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85337, 'April  Blanchet', to_date('06-11-2020', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83791, 'Joely  Renfro', to_date('05-11-1995', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13163, 'Franco  Shepard', to_date('19-11-1996', 'dd-mm-yyyy'), 78146);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41279, 'Claire  Broza', to_date('25-05-1998', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93539, 'Aida  Astin', to_date('14-08-2009', 'dd-mm-yyyy'), 86198);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78677, 'Chubby  Rockwel', to_date('16-12-1996', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25367, 'Ben  Depp', to_date('10-12-2011', 'dd-mm-yyyy'), 24574);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72657, 'Sigourney  Thor', to_date('03-04-2017', 'dd-mm-yyyy'), 14297);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65919, 'Famke  Tennison', to_date('01-02-2000', 'dd-mm-yyyy'), 46256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14341, 'Annie  Spine', to_date('22-11-2013', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62232, 'Hugo  Bale', to_date('21-01-1998', 'dd-mm-yyyy'), 23895);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86433, 'Ed  Cozier', to_date('03-12-2009', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11622, 'Holly  Vassar', to_date('23-05-2010', 'dd-mm-yyyy'), 64833);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41814, 'Roddy  Springfi', to_date('27-11-1996', 'dd-mm-yyyy'), 47638);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63896, 'Seann  Parish', to_date('23-02-2018', 'dd-mm-yyyy'), 94968);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60581, 'Joanna  Lerner', to_date('09-12-2019', 'dd-mm-yyyy'), 32125);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37543, 'Christina  Moor', to_date('28-06-2003', 'dd-mm-yyyy'), 15136);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71954, 'Denzel  Shandli', to_date('15-09-2005', 'dd-mm-yyyy'), 25856);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57792, 'Seth  Ryan', to_date('23-01-1999', 'dd-mm-yyyy'), 98451);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84212, 'Millie  Jay', to_date('13-12-2019', 'dd-mm-yyyy'), 53251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81963, 'Madeleine  Vinc', to_date('20-07-2000', 'dd-mm-yyyy'), 15814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20558, 'Jeffery  Tierne', to_date('22-07-2015', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38646, 'Alfie  Boone', to_date('15-07-1991', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48701, 'Danni  Kretschm', to_date('22-01-2007', 'dd-mm-yyyy'), 79913);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58693, 'Shannyn  Dern', to_date('16-10-2018', 'dd-mm-yyyy'), 94968);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77919, 'Benjamin  Patto', to_date('21-10-2004', 'dd-mm-yyyy'), 83296);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76163, 'Xander  Scott', to_date('26-03-1991', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85724, 'Karon  Boothe', to_date('16-04-1999', 'dd-mm-yyyy'), 51336);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61131, 'Robbie  Pigott-', to_date('30-07-1997', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50745, 'Pete  Rawls', to_date('18-12-2013', 'dd-mm-yyyy'), 53283);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48979, 'Chet  Ferrell', to_date('11-10-2014', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11228, 'Cary  Rhymes', to_date('17-12-2013', 'dd-mm-yyyy'), 67138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99537, 'Juan  Hunt', to_date('17-04-2008', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66368, 'Ethan  Hong', to_date('21-10-1997', 'dd-mm-yyyy'), 61256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75179, 'Manu  Collins', to_date('22-04-2018', 'dd-mm-yyyy'), 39192);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58115, 'Cameron  Laurie', to_date('30-08-1992', 'dd-mm-yyyy'), 54323);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91897, 'Danni  Joli', to_date('12-12-1998', 'dd-mm-yyyy'), 71348);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79929, 'Paul  Deejay', to_date('31-08-2011', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92436, 'Gran  Keen', to_date('04-07-1996', 'dd-mm-yyyy'), 69152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24453, 'Tracy  Serbedzi', to_date('21-08-2016', 'dd-mm-yyyy'), 67826);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26957, 'Chazz  Isaak', to_date('11-05-2003', 'dd-mm-yyyy'), 92974);
commit;
prompt 500 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80747, 'Chloe  Feore', to_date('17-11-2011', 'dd-mm-yyyy'), 46824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79444, 'Neil  Nelligan', to_date('13-12-2019', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64349, 'Anne  Burstyn', to_date('13-01-2019', 'dd-mm-yyyy'), 94794);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38848, 'Meg  Schwarzene', to_date('14-07-2019', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77284, 'Mandy  Renfro', to_date('18-08-2012', 'dd-mm-yyyy'), 65857);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18649, 'Annie  Checker', to_date('29-01-2007', 'dd-mm-yyyy'), 31476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23293, 'Ray  Harary', to_date('05-04-2003', 'dd-mm-yyyy'), 34738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15855, 'Kirsten  Hollid', to_date('17-05-2007', 'dd-mm-yyyy'), 82864);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35455, 'Tori  Bening', to_date('21-06-2018', 'dd-mm-yyyy'), 46554);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45306, 'Tea  Cohn', to_date('31-05-1994', 'dd-mm-yyyy'), 71315);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32261, 'Albertina  Gand', to_date('12-04-2020', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50644, 'Jared  Crosby', to_date('09-06-1999', 'dd-mm-yyyy'), 68132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72562, 'Dan  Mazar', to_date('21-01-1995', 'dd-mm-yyyy'), 53283);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68774, 'Mac  McAnally', to_date('26-01-2005', 'dd-mm-yyyy'), 24574);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49296, 'Yolanda  Giamat', to_date('03-03-2001', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52795, 'Liev  Garofalo', to_date('01-10-2016', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49949, 'Seth  Vannelli', to_date('09-09-1993', 'dd-mm-yyyy'), 47762);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59435, 'Steven  Guest', to_date('08-02-2016', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45931, 'Ali  Alexander', to_date('24-12-2012', 'dd-mm-yyyy'), 62716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33884, 'Lucinda  Scott', to_date('22-06-2015', 'dd-mm-yyyy'), 99869);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75451, 'Barbara  Wincot', to_date('03-12-1995', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76485, 'Russell  Wainwr', to_date('16-09-2006', 'dd-mm-yyyy'), 92974);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69497, 'Art  Bradford', to_date('19-07-1997', 'dd-mm-yyyy'), 67933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96111, 'Matthew  Leto', to_date('18-02-2005', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53203, 'Night  Haysbert', to_date('23-07-2011', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17331, 'Gino  Callow', to_date('20-04-2015', 'dd-mm-yyyy'), 79913);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57753, 'Jose  Bush', to_date('05-01-2010', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96482, 'Glen  Chilton', to_date('20-09-1991', 'dd-mm-yyyy'), 91393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56835, 'Allan  Dale', to_date('19-10-2011', 'dd-mm-yyyy'), 74765);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30608, 'Edward  Reid', to_date('13-05-2017', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34262, 'Humberto  Berke', to_date('19-03-2001', 'dd-mm-yyyy'), 35599);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87515, 'Tamala  Payton', to_date('02-09-1994', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87996, 'Thomas  Shatner', to_date('18-10-1998', 'dd-mm-yyyy'), 81149);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31516, 'Amy  Crowe', to_date('20-09-2000', 'dd-mm-yyyy'), 78666);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74727, 'Horace  Prinze', to_date('06-07-1990', 'dd-mm-yyyy'), 74168);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36439, 'Tori  Burke', to_date('21-03-1992', 'dd-mm-yyyy'), 85767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88129, 'Gilberto  Englu', to_date('13-06-1994', 'dd-mm-yyyy'), 12162);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76309, 'Cuba  Dickinson', to_date('19-09-2003', 'dd-mm-yyyy'), 43347);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30353, 'Jonathan  Prest', to_date('09-02-1998', 'dd-mm-yyyy'), 13596);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71205, 'Brothers  Melle', to_date('03-09-1997', 'dd-mm-yyyy'), 39612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20845, 'Fionnula  Tilly', to_date('26-08-2017', 'dd-mm-yyyy'), 25715);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66371, 'Janice  Willis', to_date('01-05-2013', 'dd-mm-yyyy'), 35599);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20106, 'Morgan  Gryner', to_date('09-01-2011', 'dd-mm-yyyy'), 97956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30417, 'Ozzy  Miles', to_date('14-10-2012', 'dd-mm-yyyy'), 21743);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79371, 'Jena  Li', to_date('24-01-2003', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86621, 'Malcolm  Swank', to_date('01-05-1999', 'dd-mm-yyyy'), 46824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14133, 'Pablo  Price', to_date('24-12-2016', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44615, 'Larry  David', to_date('28-05-2014', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77858, 'Dennis  Stone', to_date('01-08-1993', 'dd-mm-yyyy'), 28566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88496, 'Gerald  Collins', to_date('25-11-1996', 'dd-mm-yyyy'), 89844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79669, 'Jamie  Moraz', to_date('30-08-1993', 'dd-mm-yyyy'), 84983);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76948, 'Neve  Steiger', to_date('11-07-2014', 'dd-mm-yyyy'), 19985);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12989, 'Chrissie  Wrigh', to_date('22-01-2018', 'dd-mm-yyyy'), 51336);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57757, 'Sinead  Tobolow', to_date('19-04-2003', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38449, 'Rhea  Kinney', to_date('13-11-1995', 'dd-mm-yyyy'), 85492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92935, 'Jesus  Jamal', to_date('22-01-1994', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28349, 'Kevin  Mazar', to_date('12-12-2001', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24229, 'Don  Phoenix', to_date('14-09-2018', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13582, 'France  Browne', to_date('11-11-1995', 'dd-mm-yyyy'), 88487);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69375, 'Chrissie  Busce', to_date('24-06-2013', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49689, 'Mekhi  Perez', to_date('05-05-2004', 'dd-mm-yyyy'), 49695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66275, 'Elle  Tomlin', to_date('30-04-2012', 'dd-mm-yyyy'), 36157);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52541, 'Laurence  Yanko', to_date('27-05-2006', 'dd-mm-yyyy'), 54577);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97649, 'Melanie  Khan', to_date('21-08-2006', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22468, 'Patti  Garner', to_date('01-08-1999', 'dd-mm-yyyy'), 29413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82628, 'Julia  Mahood', to_date('10-09-2004', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96292, 'Azucar  Orlando', to_date('19-05-2002', 'dd-mm-yyyy'), 46554);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73651, 'Sammy  Willard', to_date('23-09-2009', 'dd-mm-yyyy'), 21971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49529, 'Mint  McFadden', to_date('27-06-2007', 'dd-mm-yyyy'), 94794);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84535, 'Gino  Lorenz', to_date('20-08-2000', 'dd-mm-yyyy'), 61686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61786, 'Jon  Barry', to_date('19-05-2000', 'dd-mm-yyyy'), 71315);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94812, 'Keith  Monk', to_date('25-08-2006', 'dd-mm-yyyy'), 28285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42244, 'Curtis  McPhers', to_date('22-07-1991', 'dd-mm-yyyy'), 37216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73195, 'Demi  Redgrave', to_date('02-07-2010', 'dd-mm-yyyy'), 76793);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80156, 'Wally  Askew', to_date('07-04-2013', 'dd-mm-yyyy'), 87711);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89693, 'Embeth  Gryner', to_date('13-07-2003', 'dd-mm-yyyy'), 74168);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15649, 'Nikki  Hunter', to_date('01-04-2004', 'dd-mm-yyyy'), 58334);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13264, 'Alan  Crudup', to_date('22-04-2002', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84335, 'Ruth  Nivola', to_date('24-12-2006', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64218, 'Fisher  Sandler', to_date('11-05-1993', 'dd-mm-yyyy'), 55157);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40702, 'Isaiah  Lapoint', to_date('08-03-2014', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39318, 'Ernie  Gagnon', to_date('20-11-2006', 'dd-mm-yyyy'), 34565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86162, 'Joanna  McKean', to_date('16-06-1994', 'dd-mm-yyyy'), 67933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62117, 'Jose  Weller', to_date('26-08-2005', 'dd-mm-yyyy'), 59867);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14616, 'Hex  Herrmann', to_date('13-08-2002', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68951, 'Lara  Thomas', to_date('02-09-2017', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29726, 'Cary  Sledge', to_date('25-12-2006', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16789, 'Night  Kilmer', to_date('23-06-2010', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91169, 'Christine  Berk', to_date('16-03-1996', 'dd-mm-yyyy'), 71955);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13313, 'Pete  Jones', to_date('08-05-2015', 'dd-mm-yyyy'), 82637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48955, 'Nanci  Postleth', to_date('20-07-2000', 'dd-mm-yyyy'), 19365);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42689, 'Tracy  Dafoe', to_date('17-12-2010', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11151, 'Lou  McKennitt', to_date('19-12-2019', 'dd-mm-yyyy'), 23895);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55195, 'Geggy  Bacon', to_date('08-04-1991', 'dd-mm-yyyy'), 68226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77381, 'Jeroen  Ruffalo', to_date('27-01-2010', 'dd-mm-yyyy'), 68413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38879, 'Rhea  Dupree', to_date('12-04-2016', 'dd-mm-yyyy'), 92879);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18226, 'Cheech  Heston', to_date('22-03-1993', 'dd-mm-yyyy'), 25353);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58974, 'Harris  Marin', to_date('07-10-2005', 'dd-mm-yyyy'), 27926);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97187, 'Frederic  Ceter', to_date('02-07-2005', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61697, 'Aaron  Wariner', to_date('24-02-1997', 'dd-mm-yyyy'), 86863);
commit;
prompt 600 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56287, 'Catherine  Emme', to_date('19-04-2001', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61291, 'Julianna  Hager', to_date('17-01-2016', 'dd-mm-yyyy'), 26546);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75318, 'Veruca  Coltran', to_date('01-11-1994', 'dd-mm-yyyy'), 74527);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39579, 'Albertina  Maho', to_date('12-09-2011', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78698, 'Cheech  Diehl', to_date('05-10-1995', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15472, 'Derek  Lachey', to_date('24-05-1996', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32624, 'Rod  Douglas', to_date('08-06-2005', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48166, 'Cesar  Steagall', to_date('23-06-2016', 'dd-mm-yyyy'), 21497);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42470, 'Hector  Wainwri', to_date('21-02-1995', 'dd-mm-yyyy'), 52655);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16207, 'Suzi  Beals', to_date('31-08-1993', 'dd-mm-yyyy'), 14297);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19182, 'Ricardo  Lillar', to_date('31-12-2005', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25415, 'Marianne  Fiers', to_date('12-12-2002', 'dd-mm-yyyy'), 47638);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36616, 'Denny  Jane', to_date('08-02-1991', 'dd-mm-yyyy'), 41118);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12476, 'Gailard  Wong', to_date('19-04-1996', 'dd-mm-yyyy'), 69152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23027, 'Veruca  McLachl', to_date('11-11-2004', 'dd-mm-yyyy'), 74765);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50607, 'Dar  Devine', to_date('21-11-2018', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69986, 'Tal  Schreiber', to_date('10-08-2011', 'dd-mm-yyyy'), 62716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54501, 'Howie  Gates', to_date('06-09-1991', 'dd-mm-yyyy'), 92974);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38314, 'Gino  Snider', to_date('13-01-1999', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77455, 'Donna  Paltrow', to_date('23-04-2005', 'dd-mm-yyyy'), 16248);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85097, 'Jose  Foley', to_date('04-01-1996', 'dd-mm-yyyy'), 24219);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80432, 'Naomi  Brooke', to_date('07-02-2018', 'dd-mm-yyyy'), 53251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46725, 'Russell  Tambor', to_date('08-07-1991', 'dd-mm-yyyy'), 23677);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33778, 'Ethan  Spacek', to_date('28-08-2006', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61175, 'Bill  Reilly', to_date('19-02-1992', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32839, 'Tracy  Linney', to_date('28-01-1994', 'dd-mm-yyyy'), 67138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29024, 'Brian  Stuart', to_date('04-08-2008', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83401, 'Hope  Weir', to_date('15-09-2006', 'dd-mm-yyyy'), 74946);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33358, 'Sarah  Krabbe', to_date('20-04-2018', 'dd-mm-yyyy'), 29413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36480, 'Judi  Turner', to_date('17-05-2004', 'dd-mm-yyyy'), 51373);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38470, 'Bobbi  Hurt', to_date('22-10-1990', 'dd-mm-yyyy'), 93965);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30695, 'Wang  Watley', to_date('11-03-2003', 'dd-mm-yyyy'), 56695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80296, 'Nancy  Spacey', to_date('18-10-1992', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79366, 'Lily  Leoni', to_date('18-11-2011', 'dd-mm-yyyy'), 91393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80761, 'Bo  Howard', to_date('04-05-2016', 'dd-mm-yyyy'), 46256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29998, 'Daryl  Yankovic', to_date('18-04-2010', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50428, 'Ronnie  Guzman', to_date('13-10-2003', 'dd-mm-yyyy'), 61256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56820, 'Sona  Hopper', to_date('20-04-2018', 'dd-mm-yyyy'), 45553);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43612, 'Marc  Winans', to_date('09-06-1991', 'dd-mm-yyyy'), 76933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14856, 'Colin  Balin', to_date('23-06-1995', 'dd-mm-yyyy'), 51373);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14896, 'Charlie  Miles', to_date('07-11-1990', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29643, 'Shannon  Liu', to_date('18-05-2020', 'dd-mm-yyyy'), 24219);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75623, 'Devon  Slater', to_date('18-04-1998', 'dd-mm-yyyy'), 31966);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73164, 'Jackson  Love', to_date('06-07-2010', 'dd-mm-yyyy'), 31443);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80713, 'Vondie  Weaver', to_date('02-12-2017', 'dd-mm-yyyy'), 58334);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53872, 'Debra  Aglukark', to_date('03-04-1990', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23919, 'Kay  Whitman', to_date('06-11-2020', 'dd-mm-yyyy'), 37837);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92203, 'Morgan  Mills', to_date('26-05-2003', 'dd-mm-yyyy'), 94794);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40519, 'Queen  LaSalle', to_date('03-04-2019', 'dd-mm-yyyy'), 51336);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77489, 'Ian  Conley', to_date('19-03-2003', 'dd-mm-yyyy'), 95551);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97115, 'Geraldine  McCo', to_date('29-04-1998', 'dd-mm-yyyy'), 45393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95159, 'Wang  Faithfull', to_date('01-11-2003', 'dd-mm-yyyy'), 43347);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66974, 'Armin  Hawn', to_date('01-10-1995', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41766, 'Chrissie  Hubba', to_date('31-10-2017', 'dd-mm-yyyy'), 34565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45911, 'Alessandro  Yor', to_date('13-09-2018', 'dd-mm-yyyy'), 29413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92537, 'Pat  Cochran', to_date('03-02-1991', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79646, 'Wayman  Idol', to_date('19-12-2009', 'dd-mm-yyyy'), 74481);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82976, 'Nick  Fichtner', to_date('05-09-1993', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61106, 'Lili  Dayne', to_date('23-10-2006', 'dd-mm-yyyy'), 95552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75116, 'Embeth  Savage', to_date('10-03-2020', 'dd-mm-yyyy'), 39192);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61768, 'Rowan  Kirshner', to_date('20-02-2005', 'dd-mm-yyyy'), 38784);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78325, 'Ted  Johansen', to_date('16-06-1994', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38756, 'Bobby  Costello', to_date('21-11-2006', 'dd-mm-yyyy'), 97631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73516, 'Sam  Gere', to_date('13-08-2005', 'dd-mm-yyyy'), 67933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73886, 'Coley  Brooke', to_date('16-03-2011', 'dd-mm-yyyy'), 16248);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22644, 'Tony  Vega', to_date('27-03-2009', 'dd-mm-yyyy'), 76379);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54855, 'Brothers  Whitl', to_date('30-11-2001', 'dd-mm-yyyy'), 28566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25505, 'Chubby  Henriks', to_date('24-07-1995', 'dd-mm-yyyy'), 76793);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58955, 'Lionel  Steagal', to_date('06-12-2000', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72153, 'Howie  Duke', to_date('02-01-2017', 'dd-mm-yyyy'), 76199);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44224, 'Hookah  Maxwell', to_date('24-12-2008', 'dd-mm-yyyy'), 82864);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37798, 'Fisher  McCread', to_date('24-10-2004', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28591, 'Leonardo  Summe', to_date('27-06-2002', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11675, 'Ronnie  Imbrugl', to_date('20-05-2011', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37483, 'Armin  Bratt', to_date('04-10-1993', 'dd-mm-yyyy'), 51454);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52748, 'Linda  Pesci', to_date('27-03-1994', 'dd-mm-yyyy'), 15758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99548, 'Carole  Atkinso', to_date('26-06-2011', 'dd-mm-yyyy'), 27647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83142, 'Nicolas  Goldbe', to_date('12-10-2019', 'dd-mm-yyyy'), 69778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89538, 'Rueben  Squier', to_date('04-10-2007', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92384, 'Regina  Eat Wor', to_date('16-06-2019', 'dd-mm-yyyy'), 65287);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25429, 'Juliana  Chandl', to_date('13-04-2017', 'dd-mm-yyyy'), 98616);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16417, 'Antonio  Coolid', to_date('22-05-2004', 'dd-mm-yyyy'), 21342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99785, 'Rich  Meyer', to_date('25-07-2000', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10884, 'Belinda  Conley', to_date('04-05-1991', 'dd-mm-yyyy'), 23388);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89929, 'Lou  Moss', to_date('28-11-2001', 'dd-mm-yyyy'), 45736);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73299, 'Dean  Sampson', to_date('29-03-2004', 'dd-mm-yyyy'), 27848);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41889, 'Rob  Lucien', to_date('24-10-2004', 'dd-mm-yyyy'), 93343);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50987, 'Vern  Harper', to_date('18-10-2014', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67137, 'Rhea  Danes', to_date('23-03-1994', 'dd-mm-yyyy'), 41118);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61908, 'Joey  Dickinson', to_date('26-10-2018', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93991, 'Karen  Scott', to_date('02-10-2006', 'dd-mm-yyyy'), 31567);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55654, 'Karon  Carrey', to_date('28-03-1990', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61274, 'Marley  Starr', to_date('13-04-1991', 'dd-mm-yyyy'), 57739);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77206, 'Laurence  Shock', to_date('09-01-2008', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81685, 'Martha  Yorn', to_date('01-01-1999', 'dd-mm-yyyy'), 39612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90557, 'Chi  Thornton', to_date('17-02-2001', 'dd-mm-yyyy'), 31966);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75660, 'Jennifer  Klein', to_date('29-08-2010', 'dd-mm-yyyy'), 76719);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73098, 'Liquid  Akins', to_date('09-10-1992', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36881, 'Zooey  Parm', to_date('02-05-2005', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93662, 'Clea  Hedaya', to_date('26-12-1991', 'dd-mm-yyyy'), 46554);
commit;
prompt 700 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59290, 'Victor  Reno', to_date('21-12-2019', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62857, 'Leonardo  Conne', to_date('16-11-2008', 'dd-mm-yyyy'), 87465);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84471, 'Carrie  Hannah', to_date('30-09-1999', 'dd-mm-yyyy'), 61256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14013, 'Colin  Kimball', to_date('07-09-2018', 'dd-mm-yyyy'), 87287);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65382, 'Burton  Kweller', to_date('05-02-1993', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67785, 'Brendan  Gryner', to_date('19-03-1990', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28258, 'Ahmad  Negbaur', to_date('02-03-2004', 'dd-mm-yyyy'), 64716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52363, 'Geoffrey  Elwes', to_date('16-03-2018', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48750, 'Albertina  Colt', to_date('22-08-2009', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12259, 'Dorry  Worrell', to_date('02-01-2007', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61616, 'Lara  Molina', to_date('08-05-2002', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28863, 'Lizzy  Apple', to_date('02-12-1991', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82877, 'Matt  Romijn-St', to_date('17-11-2020', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65770, 'Chuck  Carlisle', to_date('01-10-1996', 'dd-mm-yyyy'), 97631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23549, 'Clint  Dukakis', to_date('02-04-1994', 'dd-mm-yyyy'), 24374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70679, 'Oliver  Cooper', to_date('10-09-2017', 'dd-mm-yyyy'), 54577);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40352, 'Cyndi  Swank', to_date('14-11-2011', 'dd-mm-yyyy'), 16248);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41567, 'Lou  Shue', to_date('13-11-2014', 'dd-mm-yyyy'), 14297);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61982, 'Jerry  Holiday', to_date('15-06-2020', 'dd-mm-yyyy'), 35442);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80998, 'Gwyneth  Hynde', to_date('18-02-2012', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25051, 'Jimmy  Moreno', to_date('19-11-2010', 'dd-mm-yyyy'), 54323);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26916, 'Robin  Milsap', to_date('28-11-2007', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62435, 'Sinead  Atlas', to_date('05-07-2009', 'dd-mm-yyyy'), 64716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14253, 'Maxine  Hudson', to_date('07-03-2011', 'dd-mm-yyyy'), 26678);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64004, 'Mickey  Visnjic', to_date('16-11-1999', 'dd-mm-yyyy'), 92974);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27313, 'Selma  Warren', to_date('20-04-2004', 'dd-mm-yyyy'), 97814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96334, 'Mark  Logue', to_date('29-11-2000', 'dd-mm-yyyy'), 82864);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11159, 'Candice  Payton', to_date('16-10-1995', 'dd-mm-yyyy'), 35442);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19438, 'Thora  Atkins', to_date('06-01-2004', 'dd-mm-yyyy'), 23677);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29498, 'Tilda  Cooper', to_date('01-04-2016', 'dd-mm-yyyy'), 92974);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25648, 'Chubby  Tobolow', to_date('10-05-2004', 'dd-mm-yyyy'), 37837);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99661, 'Nanci  Venora', to_date('01-01-1999', 'dd-mm-yyyy'), 34565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73946, 'Harriet  Zappac', to_date('01-03-1996', 'dd-mm-yyyy'), 46196);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20608, 'Harriet  Cummin', to_date('03-03-2006', 'dd-mm-yyyy'), 74459);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23086, 'Tori  Barnett', to_date('21-07-2001', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90382, 'Carol  Hawthorn', to_date('21-10-2000', 'dd-mm-yyyy'), 69152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94264, 'Tommy  Aiken', to_date('04-09-2002', 'dd-mm-yyyy'), 26546);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63317, 'Rowan  Prinze', to_date('08-06-2000', 'dd-mm-yyyy'), 29411);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99570, 'Ned  Harper', to_date('07-08-2016', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47668, 'Paula  Atkins', to_date('13-04-1991', 'dd-mm-yyyy'), 97956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71620, 'Andre  Jolie', to_date('10-12-1999', 'dd-mm-yyyy'), 44887);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99309, 'Dennis  Arthur', to_date('16-07-2007', 'dd-mm-yyyy'), 68413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83200, 'Boyd  Trevino', to_date('12-01-2003', 'dd-mm-yyyy'), 34767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29823, 'Hector  Ribisi', to_date('14-05-2002', 'dd-mm-yyyy'), 28566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79124, 'Holly  Bachman', to_date('28-07-2003', 'dd-mm-yyyy'), 74946);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75922, 'Rhea  Lofgren', to_date('03-08-1993', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76438, 'Patty  Borden', to_date('23-01-2015', 'dd-mm-yyyy'), 76719);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64623, 'Joshua  Bachman', to_date('24-01-2009', 'dd-mm-yyyy'), 87465);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99167, 'Mel  Neill', to_date('03-01-2017', 'dd-mm-yyyy'), 57129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23313, 'Corey  Morales', to_date('29-01-1990', 'dd-mm-yyyy'), 34565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90715, 'Marc  Cassel', to_date('21-05-1993', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88710, 'Charlton  Guinn', to_date('03-02-2011', 'dd-mm-yyyy'), 74459);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96298, 'Kyra  Lennix', to_date('11-04-2009', 'dd-mm-yyyy'), 71315);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91974, 'Mindy  Hughes', to_date('30-04-2014', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10193, 'Neve  Wayans', to_date('30-11-2019', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (51961, 'Jared  Pollak', to_date('30-07-1994', 'dd-mm-yyyy'), 39232);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13550, 'Ving  Biggs', to_date('20-07-2006', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42972, 'Liam  McFadden', to_date('10-10-2016', 'dd-mm-yyyy'), 29413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68898, 'Debbie  Jenkins', to_date('07-11-2015', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50412, 'Balthazar  Reid', to_date('20-06-2007', 'dd-mm-yyyy'), 86863);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22679, 'Andrew  Fiorent', to_date('25-06-2018', 'dd-mm-yyyy'), 15136);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45719, 'Matthew  Driver', to_date('18-03-2015', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67938, 'Roger  Alda', to_date('09-08-2000', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13849, 'Meredith  Koyan', to_date('22-11-2001', 'dd-mm-yyyy'), 42858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31294, 'Sally  Renfro', to_date('02-04-1992', 'dd-mm-yyyy'), 55157);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70642, 'Cuba  Reeves', to_date('08-09-1995', 'dd-mm-yyyy'), 37472);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82026, 'Joy  Milsap', to_date('27-03-1994', 'dd-mm-yyyy'), 19365);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26643, 'Roger  Reno', to_date('18-12-2001', 'dd-mm-yyyy'), 59927);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82333, 'Talvin  Garner', to_date('01-01-1995', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46596, 'Sona  Nivola', to_date('24-04-2003', 'dd-mm-yyyy'), 23388);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27032, 'Derrick  Mifune', to_date('13-07-2015', 'dd-mm-yyyy'), 45393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42940, 'Terry  Khan', to_date('27-03-2018', 'dd-mm-yyyy'), 74765);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63865, 'Colin  McKean', to_date('22-06-1997', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95343, 'Keanu  Gere', to_date('31-01-2018', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72780, 'Pierce  Derring', to_date('10-09-2016', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29781, 'Hector  Robinso', to_date('14-04-2004', 'dd-mm-yyyy'), 38447);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49683, 'Dermot  DiFranc', to_date('28-02-2001', 'dd-mm-yyyy'), 39663);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87969, 'Jose  Calle', to_date('16-07-1992', 'dd-mm-yyyy'), 49514);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37802, 'Illeana  Griffi', to_date('02-07-2005', 'dd-mm-yyyy'), 19365);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64265, 'Lara  Green', to_date('19-10-2003', 'dd-mm-yyyy'), 46196);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93660, 'Tommy  Sinise', to_date('16-01-1990', 'dd-mm-yyyy'), 71955);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40559, 'Luis  Lithgow', to_date('22-04-2002', 'dd-mm-yyyy'), 64833);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65281, 'Kathy  Coburn', to_date('15-10-1994', 'dd-mm-yyyy'), 47943);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23325, 'Sammy  Raitt', to_date('17-07-1994', 'dd-mm-yyyy'), 37216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33321, 'Radney  Cetera', to_date('19-06-2000', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98984, 'Derek  Katt', to_date('22-04-2004', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41887, 'Olga  Levy', to_date('01-09-2014', 'dd-mm-yyyy'), 49362);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57242, 'Marlon  Blades', to_date('25-05-1995', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60631, 'Ossie  Lorenz', to_date('29-06-1991', 'dd-mm-yyyy'), 39612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55150, 'Harold  Cruz', to_date('25-10-2004', 'dd-mm-yyyy'), 35442);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13737, 'Shannon  Jordan', to_date('13-07-1997', 'dd-mm-yyyy'), 36157);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90460, 'Pete  Watley', to_date('17-02-2020', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50433, 'Cyndi  Goldwyn', to_date('28-04-2010', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69541, 'Mika  Kirshner', to_date('29-09-1992', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96195, 'Lennie  Wiedlin', to_date('29-04-2003', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35814, 'Alex  DiBiasio', to_date('10-06-1995', 'dd-mm-yyyy'), 38784);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69531, 'Janice  Cleese', to_date('03-04-2010', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67402, 'Rose  Caine', to_date('13-09-1991', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16722, 'Lari  Thorton', to_date('09-09-1991', 'dd-mm-yyyy'), 27848);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90763, 'Alfred  Raybon', to_date('14-01-2016', 'dd-mm-yyyy'), 97814);
commit;
prompt 800 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11867, 'Irene  Feuerste', to_date('19-11-2016', 'dd-mm-yyyy'), 31476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68412, 'Tori  Adler', to_date('27-12-2003', 'dd-mm-yyyy'), 68132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72504, 'Lenny  Sewell', to_date('02-05-1995', 'dd-mm-yyyy'), 88824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56711, 'Randall  Leguiz', to_date('29-07-2017', 'dd-mm-yyyy'), 74946);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17783, 'Jane  Danes', to_date('05-07-2015', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42187, 'Eric  Fisher', to_date('19-11-1998', 'dd-mm-yyyy'), 38447);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87078, 'Austin  Branch', to_date('26-06-2009', 'dd-mm-yyyy'), 69778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65025, 'Jonny  Suvari', to_date('12-06-1998', 'dd-mm-yyyy'), 46196);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27810, 'Herbie  Haysber', to_date('26-05-1992', 'dd-mm-yyyy'), 43678);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64459, 'Amy  Dickinson', to_date('01-06-2012', 'dd-mm-yyyy'), 33257);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82666, 'Eliza  Kinnear', to_date('08-02-2003', 'dd-mm-yyyy'), 96859);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75834, 'Carolyn  Ness', to_date('14-06-2010', 'dd-mm-yyyy'), 94968);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83979, 'Rob  Vannelli', to_date('03-07-2013', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41263, 'Raymond  Single', to_date('21-04-2000', 'dd-mm-yyyy'), 28566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17442, 'Edie  Blackmore', to_date('29-01-2001', 'dd-mm-yyyy'), 43347);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38200, 'Sandra  Superna', to_date('07-09-2012', 'dd-mm-yyyy'), 57129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90999, 'Red  Hughes', to_date('23-12-1990', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99453, 'Bobby  Gertner', to_date('11-09-2008', 'dd-mm-yyyy'), 69152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12770, 'CeCe  Irons', to_date('29-01-2000', 'dd-mm-yyyy'), 36437);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97000, 'Ethan  Arkensto', to_date('15-10-2009', 'dd-mm-yyyy'), 25119);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86687, 'Janice  Swank', to_date('19-02-2010', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61401, 'Chuck  Marsden', to_date('05-09-1990', 'dd-mm-yyyy'), 25856);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30480, 'Jeroen  Barkin', to_date('18-04-1990', 'dd-mm-yyyy'), 55157);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69160, 'Toshiro  Menike', to_date('01-04-1996', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33280, 'Carolyn  Sample', to_date('09-11-1998', 'dd-mm-yyyy'), 64716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33022, 'Jon  Barry', to_date('19-12-2000', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23427, 'Renee  Khan', to_date('17-06-2017', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35759, 'Zooey  Lang', to_date('21-01-2012', 'dd-mm-yyyy'), 88487);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97361, 'Toshiro  Branag', to_date('16-09-2016', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90265, 'Cameron  Quinon', to_date('26-03-2010', 'dd-mm-yyyy'), 47943);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96491, 'Eileen  Hagar', to_date('22-04-2010', 'dd-mm-yyyy'), 92974);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91552, 'Jamie  Moraz', to_date('17-05-2005', 'dd-mm-yyyy'), 74946);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29086, 'Giovanni  Skars', to_date('04-02-2008', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8067, 'Peabo', to_date('01-05-1973', 'dd-mm-yyyy'), 3285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7384, 'Demi', to_date('29-10-1979', 'dd-mm-yyyy'), 1576);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2813, 'Davy', to_date('07-07-2013', 'dd-mm-yyyy'), 1368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4987, 'Al', to_date('20-11-2016', 'dd-mm-yyyy'), 3598);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3933, 'Lara', to_date('26-05-1975', 'dd-mm-yyyy'), 179);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5448, 'Frank', to_date('02-11-1984', 'dd-mm-yyyy'), 2601);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9874, 'Mary', to_date('03-08-1986', 'dd-mm-yyyy'), 1929);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5339, 'Sheena', to_date('31-08-2001', 'dd-mm-yyyy'), 2601);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2228, 'Jesus', to_date('30-11-1986', 'dd-mm-yyyy'), 9);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9931, 'Sharon', to_date('17-08-2007', 'dd-mm-yyyy'), 2035);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4525, 'Wallace', to_date('25-07-2014', 'dd-mm-yyyy'), 3907);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5581, 'Pablo', to_date('13-07-1998', 'dd-mm-yyyy'), 31);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4257, 'Franz', to_date('15-05-2006', 'dd-mm-yyyy'), 658);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3681, 'Vincent', to_date('08-11-2010', 'dd-mm-yyyy'), 3004);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1018, 'Kazem', to_date('13-05-1979', 'dd-mm-yyyy'), 2798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6798, 'Ashley', to_date('31-05-1985', 'dd-mm-yyyy'), 905);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8654, 'Annie', to_date('01-03-1979', 'dd-mm-yyyy'), 3807);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5355, 'Lindsey', to_date('23-11-2013', 'dd-mm-yyyy'), 162);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7748, 'Donna', to_date('29-05-2008', 'dd-mm-yyyy'), 3187);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9329, 'Alan', to_date('16-06-1995', 'dd-mm-yyyy'), 2798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8041, 'Armand', to_date('08-04-1991', 'dd-mm-yyyy'), 3107);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5524, 'Cary', to_date('19-05-1999', 'dd-mm-yyyy'), 3907);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8344, 'Cyndi', to_date('08-09-2017', 'dd-mm-yyyy'), 3688);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4204, 'Ceili', to_date('28-05-1987', 'dd-mm-yyyy'), 2657);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2595, 'Karon', to_date('03-02-2000', 'dd-mm-yyyy'), 311);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9125, 'Ned', to_date('06-10-1990', 'dd-mm-yyyy'), 8);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8231, 'CeCe', to_date('13-12-1985', 'dd-mm-yyyy'), 2188);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1508, 'Frank', to_date('20-03-1995', 'dd-mm-yyyy'), 1676);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9819, 'Gil', to_date('29-04-1975', 'dd-mm-yyyy'), 1366);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8917, 'Timothy', to_date('05-02-1980', 'dd-mm-yyyy'), 1167);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3250, 'Wallace', to_date('15-12-2008', 'dd-mm-yyyy'), 129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9610, 'Gil', to_date('01-02-1991', 'dd-mm-yyyy'), 1415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3843, 'Elijah', to_date('07-07-2020', 'dd-mm-yyyy'), 2737);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6053, 'Armand', to_date('06-04-1999', 'dd-mm-yyyy'), 221);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3027, 'Juice', to_date('01-03-1973', 'dd-mm-yyyy'), 1368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4813, 'Loreena', to_date('10-01-1999', 'dd-mm-yyyy'), 1609);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9832, 'Rik', to_date('01-11-1986', 'dd-mm-yyyy'), 2652);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8915, 'Jonatha', to_date('12-12-1993', 'dd-mm-yyyy'), 2261);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7156, 'Nicole', to_date('09-02-1984', 'dd-mm-yyyy'), 2668);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9100, 'Mel', to_date('30-11-1981', 'dd-mm-yyyy'), 1884);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2995, 'Faye', to_date('17-03-1981', 'dd-mm-yyyy'), 3769);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2893, 'Lindsay', to_date('19-09-2013', 'dd-mm-yyyy'), 711);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4457, 'Liam', to_date('22-03-1979', 'dd-mm-yyyy'), 3043);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2778, 'Ali', to_date('17-12-1996', 'dd-mm-yyyy'), 2657);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8476, 'Ed', to_date('25-08-2016', 'dd-mm-yyyy'), 3561);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1701, 'Jann', to_date('12-06-1982', 'dd-mm-yyyy'), 1613);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2690, 'Jeremy', to_date('04-01-2005', 'dd-mm-yyyy'), 2828);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6932, 'Hugh', to_date('24-06-2007', 'dd-mm-yyyy'), 686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4541, 'Mickey', to_date('06-07-2005', 'dd-mm-yyyy'), 658);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9307, 'Daryle', to_date('29-01-2002', 'dd-mm-yyyy'), 695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6513, 'Sophie', to_date('15-03-2016', 'dd-mm-yyyy'), 857);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2583, 'Jesse', to_date('18-04-1996', 'dd-mm-yyyy'), 166);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1503, 'Naomi', to_date('17-09-2003', 'dd-mm-yyyy'), 3561);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6029, 'Ronny', to_date('14-07-1998', 'dd-mm-yyyy'), 3375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9249, 'Cole', to_date('17-03-2018', 'dd-mm-yyyy'), 3645);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7996, 'Herbie', to_date('22-02-1979', 'dd-mm-yyyy'), 177);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1431, 'Nile', to_date('26-12-2000', 'dd-mm-yyyy'), 1647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9467, 'Lee', to_date('09-07-2007', 'dd-mm-yyyy'), 498);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3588, 'Michelle', to_date('22-09-2013', 'dd-mm-yyyy'), 457);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3729, 'Rawlins', to_date('13-07-1978', 'dd-mm-yyyy'), 6);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7561, 'Gavin', to_date('14-06-2011', 'dd-mm-yyyy'), 3627);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5117, 'Rascal', to_date('23-10-1983', 'dd-mm-yyyy'), 1042);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8696, 'Spike', to_date('19-08-2018', 'dd-mm-yyyy'), 1693);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4389, 'Terrence', to_date('11-02-2006', 'dd-mm-yyyy'), 3184);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7393, 'Dianne', to_date('27-07-2005', 'dd-mm-yyyy'), 31);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2052, 'Jesse', to_date('29-11-1993', 'dd-mm-yyyy'), 2061);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1597, 'Rowan', to_date('09-09-1971', 'dd-mm-yyyy'), 3688);
commit;
prompt 900 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9414, 'Liev', to_date('24-06-2013', 'dd-mm-yyyy'), 1478);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6233, 'Patti', to_date('06-12-1992', 'dd-mm-yyyy'), 3194);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8398, 'Stanley', to_date('08-01-2003', 'dd-mm-yyyy'), 1943);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8425, 'Mena', to_date('30-06-1979', 'dd-mm-yyyy'), 1422);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7587, 'Rachid', to_date('05-03-1985', 'dd-mm-yyyy'), 3152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4579, 'Rosanna', to_date('25-03-1973', 'dd-mm-yyyy'), 1503);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3672, 'Connie', to_date('18-04-1990', 'dd-mm-yyyy'), 2681);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6635, 'Hilton', to_date('18-01-1991', 'dd-mm-yyyy'), 648);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7034, 'Alfie', to_date('24-12-2007', 'dd-mm-yyyy'), 3073);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1532, 'Gordie', to_date('20-03-1989', 'dd-mm-yyyy'), 3073);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1906, 'Clive', to_date('24-12-1980', 'dd-mm-yyyy'), 3838);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7722, 'Curtis', to_date('02-10-1972', 'dd-mm-yyyy'), 2631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4325, 'Christian', to_date('09-12-2011', 'dd-mm-yyyy'), 3857);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1094, 'Ronnie', to_date('05-12-1973', 'dd-mm-yyyy'), 648);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3083, 'Randy', to_date('28-04-1999', 'dd-mm-yyyy'), 1929);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2715, 'Judy', to_date('12-08-2005', 'dd-mm-yyyy'), 3326);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3549, 'Lance', to_date('27-01-1999', 'dd-mm-yyyy'), 1509);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8708, 'Isaiah', to_date('01-08-2003', 'dd-mm-yyyy'), 3073);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3323, 'Cevin', to_date('13-02-2009', 'dd-mm-yyyy'), 3303);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2252, 'Dar', to_date('08-08-1990', 'dd-mm-yyyy'), 1315);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2908, 'Jean', to_date('18-11-1976', 'dd-mm-yyyy'), 2828);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9514, 'Nile', to_date('09-01-2019', 'dd-mm-yyyy'), 2545);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8587, 'Charlize', to_date('11-10-1971', 'dd-mm-yyyy'), 680);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7639, 'Hookah', to_date('20-07-2020', 'dd-mm-yyyy'), 457);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7197, 'Sean', to_date('20-07-1984', 'dd-mm-yyyy'), 1954);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6600, 'Carol', to_date('03-10-2004', 'dd-mm-yyyy'), 3693);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1480, 'Raymond', to_date('01-03-2013', 'dd-mm-yyyy'), 660);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5009, 'Gina', to_date('16-07-1971', 'dd-mm-yyyy'), 1058);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7878, 'Burton', to_date('21-01-2008', 'dd-mm-yyyy'), 3194);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4175, 'Nicole', to_date('05-10-2015', 'dd-mm-yyyy'), 1288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3429, 'Maura', to_date('08-04-1998', 'dd-mm-yyyy'), 150);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6645, 'Eileen', to_date('18-07-2001', 'dd-mm-yyyy'), 1167);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1515, 'Ozzy', to_date('02-11-1995', 'dd-mm-yyyy'), 1525);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6278, 'Donna', to_date('09-11-2008', 'dd-mm-yyyy'), 2566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5134, 'Rachel', to_date('16-06-1990', 'dd-mm-yyyy'), 1754);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8370, 'Denny', to_date('24-08-1980', 'dd-mm-yyyy'), 3410);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4517, 'Nigel', to_date('18-11-1997', 'dd-mm-yyyy'), 1817);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6103, 'Micky', to_date('26-10-2001', 'dd-mm-yyyy'), 1167);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5609, 'Etta', to_date('02-02-2013', 'dd-mm-yyyy'), 857);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7312, 'Norm', to_date('17-11-2018', 'dd-mm-yyyy'), 457);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8645, 'Colleen', to_date('05-05-2010', 'dd-mm-yyyy'), 3688);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9627, 'Tea', to_date('19-03-1988', 'dd-mm-yyyy'), 1779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2426, 'Mika', to_date('26-03-2011', 'dd-mm-yyyy'), 2906);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7770, 'Cheryl', to_date('28-02-1990', 'dd-mm-yyyy'), 1831);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6032, 'Trick', to_date('16-08-1976', 'dd-mm-yyyy'), 1470);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9117, 'Gabriel', to_date('13-05-2005', 'dd-mm-yyyy'), 1055);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4032, 'Joanna', to_date('19-05-2017', 'dd-mm-yyyy'), 3091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2807, 'Connie', to_date('25-10-1991', 'dd-mm-yyyy'), 1503);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3476, 'Gin', to_date('21-06-2005', 'dd-mm-yyyy'), 2683);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7788, 'Ozzy', to_date('10-12-2009', 'dd-mm-yyyy'), 8);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4268, 'Christian', to_date('07-11-1983', 'dd-mm-yyyy'), 931);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4426, 'Maria', to_date('14-09-2015', 'dd-mm-yyyy'), 2937);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5163, 'Melanie', to_date('26-10-1972', 'dd-mm-yyyy'), 3688);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4124, 'Taryn', to_date('13-10-1983', 'dd-mm-yyyy'), 1425);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9685, 'Donal', to_date('18-11-2015', 'dd-mm-yyyy'), 1779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2668, 'Christine', to_date('19-01-1990', 'dd-mm-yyyy'), 3807);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9844, 'Regina', to_date('07-03-2003', 'dd-mm-yyyy'), 1706);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8007, 'Frederic', to_date('02-01-2000', 'dd-mm-yyyy'), 1470);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3094, 'Joan', to_date('11-09-1989', 'dd-mm-yyyy'), 3018);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8514, 'Milla', to_date('04-11-2003', 'dd-mm-yyyy'), 1930);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1598, 'Bradley', to_date('02-05-2015', 'dd-mm-yyyy'), 1042);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6857, 'Veruca', to_date('24-02-1992', 'dd-mm-yyyy'), 608);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6326, 'Davy', to_date('17-10-2019', 'dd-mm-yyyy'), 3994);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9580, 'Christopher', to_date('27-05-1984', 'dd-mm-yyyy'), 3259);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8960, 'Judge', to_date('09-05-2004', 'dd-mm-yyyy'), 3410);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3500, 'Andrae', to_date('14-10-1988', 'dd-mm-yyyy'), 2683);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2790, 'Lionel', to_date('26-02-1979', 'dd-mm-yyyy'), 1368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6573, 'Bridget', to_date('19-08-1974', 'dd-mm-yyyy'), 4);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7415, 'Barry', to_date('01-12-1974', 'dd-mm-yyyy'), 2728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8744, 'Kim', to_date('06-03-1977', 'dd-mm-yyyy'), 3326);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7328, 'Wes', to_date('04-01-2015', 'dd-mm-yyyy'), 3303);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8083, 'Lucy', to_date('17-06-2003', 'dd-mm-yyyy'), 3468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4128, 'Gilbert', to_date('03-07-2014', 'dd-mm-yyyy'), 3091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7780, 'Ben', to_date('04-03-1982', 'dd-mm-yyyy'), 3984);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9549, 'Stewart', to_date('03-12-1986', 'dd-mm-yyyy'), 3091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8405, 'Janeane', to_date('06-03-2016', 'dd-mm-yyyy'), 1155);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3240, 'Freddie', to_date('10-08-2000', 'dd-mm-yyyy'), 3693);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4623, 'Mena', to_date('12-05-2002', 'dd-mm-yyyy'), 3468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9639, 'Ahmad', to_date('07-06-1996', 'dd-mm-yyyy'), 2906);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2498, 'Gene', to_date('14-04-1991', 'dd-mm-yyyy'), 2681);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6577, 'Davey', to_date('15-08-2009', 'dd-mm-yyyy'), 3357);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4923, 'Sophie', to_date('24-12-2011', 'dd-mm-yyyy'), 2757);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9453, 'Mae', to_date('14-07-2010', 'dd-mm-yyyy'), 1503);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5687, 'Martha', to_date('04-04-1980', 'dd-mm-yyyy'), 9);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6059, 'Morgan', to_date('25-11-1989', 'dd-mm-yyyy'), 2477);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1162, 'Cledus', to_date('07-11-1997', 'dd-mm-yyyy'), 90);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4559, 'Giovanni', to_date('18-01-2018', 'dd-mm-yyyy'), 2091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1254, 'Denny', to_date('19-05-1970', 'dd-mm-yyyy'), 1954);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1697, 'Lesley', to_date('29-04-1993', 'dd-mm-yyyy'), 1478);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1609, 'Sammy', to_date('30-04-2013', 'dd-mm-yyyy'), 140);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3230, 'Gino', to_date('03-05-2005', 'dd-mm-yyyy'), 2980);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9107, 'Rip', to_date('03-10-1986', 'dd-mm-yyyy'), 1952);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6055, 'Pete', to_date('28-03-2006', 'dd-mm-yyyy'), 2374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1620, 'Tanya', to_date('19-11-1991', 'dd-mm-yyyy'), 1338);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8103, 'Lindsay', to_date('05-12-2006', 'dd-mm-yyyy'), 3374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7178, 'Gin', to_date('18-05-2006', 'dd-mm-yyyy'), 658);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4896, 'Mary', to_date('18-03-1994', 'dd-mm-yyyy'), 3958);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6115, 'Rita', to_date('11-12-1995', 'dd-mm-yyyy'), 1706);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5495, 'Liquid', to_date('28-06-1974', 'dd-mm-yyyy'), 616);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6018, 'Beverley', to_date('09-02-1982', 'dd-mm-yyyy'), 2114);
commit;
prompt 1000 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8443, 'Vince', to_date('11-01-2018', 'dd-mm-yyyy'), 3772);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9709, 'Meredith', to_date('02-11-1995', 'dd-mm-yyyy'), 407);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9924, 'Adrien', to_date('15-06-1974', 'dd-mm-yyyy'), 1990);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4315, 'Connie', to_date('21-05-2003', 'dd-mm-yyyy'), 1030);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3273, 'Barry', to_date('26-08-2009', 'dd-mm-yyyy'), 1073);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8391, 'Jared', to_date('18-12-2001', 'dd-mm-yyyy'), 179);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7726, 'Fred', to_date('16-07-2010', 'dd-mm-yyyy'), 749);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5626, 'Wayman', to_date('10-12-2016', 'dd-mm-yyyy'), 2114);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5187, 'Mandy', to_date('06-06-2000', 'dd-mm-yyyy'), 2825);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8318, 'Terri', to_date('31-01-2019', 'dd-mm-yyyy'), 618);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4349, 'Nicole', to_date('11-07-1983', 'dd-mm-yyyy'), 2777);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4156, 'Susan', to_date('17-04-2003', 'dd-mm-yyyy'), 3184);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6554, 'Millie', to_date('16-05-1993', 'dd-mm-yyyy'), 1091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1604, 'Darren', to_date('27-06-1979', 'dd-mm-yyyy'), 251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5460, 'Christian', to_date('02-06-1998', 'dd-mm-yyyy'), 2657);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5118, 'Saul', to_date('11-12-2010', 'dd-mm-yyyy'), 2777);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7799, 'Denny', to_date('30-10-2019', 'dd-mm-yyyy'), 2342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1944, 'Cuba', to_date('28-09-1973', 'dd-mm-yyyy'), 2188);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6049, 'Ron', to_date('17-11-1997', 'dd-mm-yyyy'), 2091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5208, 'Brendan', to_date('03-02-1987', 'dd-mm-yyyy'), 608);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6914, 'Owen', to_date('28-10-1979', 'dd-mm-yyyy'), 2114);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1485, 'Keanu', to_date('20-09-1979', 'dd-mm-yyyy'), 3066);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9252, 'Terry', to_date('14-09-1993', 'dd-mm-yyyy'), 2797);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9140, 'Brothers', to_date('24-06-1994', 'dd-mm-yyyy'), 3247);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7359, 'Randy', to_date('29-08-2003', 'dd-mm-yyyy'), 3373);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5912, 'Rupert', to_date('05-03-2000', 'dd-mm-yyyy'), 1310);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3036, 'Ben', to_date('20-11-2015', 'dd-mm-yyyy'), 1361);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5511, 'Giancarlo', to_date('11-12-2018', 'dd-mm-yyyy'), 2652);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8703, 'Tracy', to_date('18-11-1970', 'dd-mm-yyyy'), 1706);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2242, 'Nancy', to_date('23-03-2019', 'dd-mm-yyyy'), 1371);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5357, 'Martha', to_date('22-10-1994', 'dd-mm-yyyy'), 1091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6041, 'Greg', to_date('23-05-1998', 'dd-mm-yyyy'), 859);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9536, 'Tcheky', to_date('18-11-1971', 'dd-mm-yyyy'), 1163);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5429, 'Swoosie', to_date('28-01-2000', 'dd-mm-yyyy'), 3639);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8135, 'Daniel', to_date('24-10-1977', 'dd-mm-yyyy'), 1030);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9775, 'Gates', to_date('13-12-1977', 'dd-mm-yyyy'), 1647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8078, 'Gina', to_date('10-02-1984', 'dd-mm-yyyy'), 1464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1324, 'Ricardo', to_date('31-01-1994', 'dd-mm-yyyy'), 2937);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7397, 'Grace', to_date('27-12-2016', 'dd-mm-yyyy'), 2342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2932, 'Jonatha', to_date('15-03-2008', 'dd-mm-yyyy'), 162);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8988, 'Leo', to_date('07-10-2011', 'dd-mm-yyyy'), 3649);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3100, 'Kay', to_date('21-11-1975', 'dd-mm-yyyy'), 251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7281, 'Juan', to_date('25-08-1982', 'dd-mm-yyyy'), 3037);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1062, 'Ozzy', to_date('22-05-1986', 'dd-mm-yyyy'), 1464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8351, 'Shelby', to_date('10-11-2008', 'dd-mm-yyyy'), 2657);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1764, 'Buffy', to_date('22-08-1978', 'dd-mm-yyyy'), 301);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1234, 'eliav', to_date('17-05-1997', 'dd-mm-yyyy'), 1);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2586, 'michal', to_date('21-10-1990', 'dd-mm-yyyy'), 2);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4265, 'yael', to_date('06-01-1992', 'dd-mm-yyyy'), 4);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1637, 'Roddy', to_date('11-08-2005', 'dd-mm-yyyy'), 597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4758, 'Fiona', to_date('18-01-1994', 'dd-mm-yyyy'), 1062);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5876, 'Clive', to_date('31-03-2015', 'dd-mm-yyyy'), 251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1833, 'Carolyn', to_date('10-04-1995', 'dd-mm-yyyy'), 1116);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9546, 'Christian', to_date('18-05-2011', 'dd-mm-yyyy'), 1316);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8001, 'Shelby', to_date('22-04-1980', 'dd-mm-yyyy'), 1378);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3353, 'Beth', to_date('26-12-2011', 'dd-mm-yyyy'), 3357);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5638, 'Celia', to_date('16-05-1974', 'dd-mm-yyyy'), 140);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9524, 'Joely', to_date('10-01-2019', 'dd-mm-yyyy'), 3836);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4084, 'Cole', to_date('26-07-1981', 'dd-mm-yyyy'), 1576);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9991, 'Hector', to_date('24-05-2013', 'dd-mm-yyyy'), 3958);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4449, 'Raymond', to_date('11-04-1999', 'dd-mm-yyyy'), 330);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3935, 'Tommy', to_date('03-04-1996', 'dd-mm-yyyy'), 2035);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7169, 'Robby', to_date('05-09-2000', 'dd-mm-yyyy'), 1219);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6144, 'Max', to_date('24-09-2019', 'dd-mm-yyyy'), 1058);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8556, 'Orlando', to_date('31-08-1997', 'dd-mm-yyyy'), 528);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1747, 'Juan', to_date('30-06-1997', 'dd-mm-yyyy'), 1960);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8227, 'Marie', to_date('27-03-1972', 'dd-mm-yyyy'), 1265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2026, 'Stephen', to_date('29-07-1972', 'dd-mm-yyyy'), 377);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2431, 'Fionnula', to_date('30-04-1995', 'dd-mm-yyyy'), 3018);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6210, 'Phoebe', to_date('14-03-1986', 'dd-mm-yyyy'), 2329);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9378, 'Collective', to_date('27-10-1999', 'dd-mm-yyyy'), 3331);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4795, 'Thelma', to_date('03-06-1991', 'dd-mm-yyyy'), 3310);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6043, 'Wendy', to_date('19-02-2018', 'dd-mm-yyyy'), 1030);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3305, 'Lucy', to_date('02-04-1997', 'dd-mm-yyyy'), 6);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6546, 'Noah', to_date('28-10-1974', 'dd-mm-yyyy'), 2652);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (9421, 'Debbie', to_date('14-09-1987', 'dd-mm-yyyy'), 616);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2793, 'Viggo', to_date('21-04-1991', 'dd-mm-yyyy'), 846);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5139, 'Daryl', to_date('21-11-1988', 'dd-mm-yyyy'), 1116);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7947, 'Neve', to_date('02-09-1987', 'dd-mm-yyyy'), 2477);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2163, 'Ray', to_date('10-01-2001', 'dd-mm-yyyy'), 1396);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7913, 'Adina', to_date('06-05-1970', 'dd-mm-yyyy'), 166);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (1202, 'Trini', to_date('01-09-1979', 'dd-mm-yyyy'), 155);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7372, 'Rhett', to_date('26-09-1983', 'dd-mm-yyyy'), 3114);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8635, 'Claude', to_date('03-04-1996', 'dd-mm-yyyy'), 3);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2859, 'Christian', to_date('27-03-1993', 'dd-mm-yyyy'), 3310);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (7075, 'Kiefer', to_date('13-11-1970', 'dd-mm-yyyy'), 2683);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8949, 'Lisa', to_date('14-03-1999', 'dd-mm-yyyy'), 3091);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2896, 'Lonnie', to_date('05-10-1987', 'dd-mm-yyyy'), 9);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4443, 'France', to_date('17-01-2014', 'dd-mm-yyyy'), 1042);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6896, 'Chant?', to_date('07-01-1973', 'dd-mm-yyyy'), 686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6525, 'Delroy', to_date('30-03-2008', 'dd-mm-yyyy'), 2683);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (2683, 'Kevin', to_date('11-02-2010', 'dd-mm-yyyy'), 2757);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8390, 'Gladys', to_date('07-02-1988', 'dd-mm-yyyy'), 2668);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8104, 'Tramaine', to_date('03-08-2014', 'dd-mm-yyyy'), 2103);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (6832, 'Chloe', to_date('18-09-1986', 'dd-mm-yyyy'), 1407);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (5183, 'Lari', to_date('05-08-1970', 'dd-mm-yyyy'), 2906);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (3728, 'Nancy', to_date('29-10-1989', 'dd-mm-yyyy'), 1294);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (4390, 'Jimmy', to_date('15-01-1973', 'dd-mm-yyyy'), 150);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (8026, 'Drew', to_date('11-02-2004', 'dd-mm-yyyy'), 3584);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52555, 'Roy  Rebhorn', to_date('23-05-2013', 'dd-mm-yyyy'), 37216);
commit;
prompt 1100 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27034, 'Trini  Chung', to_date('24-05-1995', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23352, 'Rose  Patton', to_date('21-09-2010', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24093, 'Patty  Speaks', to_date('22-08-1992', 'dd-mm-yyyy'), 52655);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98833, 'Carrie-Anne  Bo', to_date('08-05-1995', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63556, 'John  Caine', to_date('15-01-2007', 'dd-mm-yyyy'), 64833);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33175, 'Bret  Candy', to_date('23-03-1994', 'dd-mm-yyyy'), 68226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80252, 'Yolanda  Lennox', to_date('26-07-2003', 'dd-mm-yyyy'), 51336);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60090, 'Burton  Hyde', to_date('24-05-2000', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36250, 'Percy  Rickman', to_date('21-11-1998', 'dd-mm-yyyy'), 76199);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88040, 'Vanessa  Barrym', to_date('15-10-2017', 'dd-mm-yyyy'), 78146);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26185, 'Remy  Singh', to_date('29-10-2014', 'dd-mm-yyyy'), 84164);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14154, 'Kenny  Eastwood', to_date('04-07-1996', 'dd-mm-yyyy'), 39855);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66611, 'Holland  Whitmo', to_date('16-10-1992', 'dd-mm-yyyy'), 78146);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77903, 'Kevin  Dukakis', to_date('05-04-2010', 'dd-mm-yyyy'), 47762);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17620, 'Antonio  Irons', to_date('02-01-1998', 'dd-mm-yyyy'), 74527);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93190, 'Vern  Dourif', to_date('25-02-2013', 'dd-mm-yyyy'), 74946);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45803, 'Trace  Overstre', to_date('06-10-2003', 'dd-mm-yyyy'), 92974);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91458, 'Chrissie  Culki', to_date('20-03-1996', 'dd-mm-yyyy'), 35442);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68990, 'Elisabeth  Scot', to_date('25-03-2008', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40062, 'Mitchell  Hagga', to_date('08-11-2008', 'dd-mm-yyyy'), 49362);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45996, 'Busta  Conway', to_date('26-02-1994', 'dd-mm-yyyy'), 16248);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84138, 'Guy  Chilton', to_date('19-03-1991', 'dd-mm-yyyy'), 39192);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13545, 'Wayman  Payton', to_date('13-02-2009', 'dd-mm-yyyy'), 94356);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94017, 'Busta  Firth', to_date('13-01-1996', 'dd-mm-yyyy'), 41641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14769, 'Howard  Dzundza', to_date('10-10-2010', 'dd-mm-yyyy'), 68226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77681, 'Roberta  Mulron', to_date('13-04-1998', 'dd-mm-yyyy'), 15945);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42284, 'Taryn  Idle', to_date('04-03-2006', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21441, 'Debby  Gayle', to_date('06-11-2004', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77077, 'Queen  Beals', to_date('06-05-2007', 'dd-mm-yyyy'), 74438);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80150, 'Danny  Manning', to_date('18-05-2016', 'dd-mm-yyyy'), 92879);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76991, 'Matthew  Arden', to_date('31-10-1994', 'dd-mm-yyyy'), 47762);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57319, 'Lin  Holly', to_date('26-08-2001', 'dd-mm-yyyy'), 54397);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96421, 'Maggie  Singlet', to_date('13-07-2007', 'dd-mm-yyyy'), 85492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50809, 'Marlon  Phoenix', to_date('17-11-2009', 'dd-mm-yyyy'), 23677);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21502, 'Tracy  Janssen', to_date('05-01-2011', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11852, 'Michelle  Borgn', to_date('25-01-2009', 'dd-mm-yyyy'), 69152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62805, 'Darius  Lang', to_date('06-09-2002', 'dd-mm-yyyy'), 37216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58440, 'Davy  Herndon', to_date('24-10-2012', 'dd-mm-yyyy'), 74147);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67799, 'Etta  Rucker', to_date('22-06-1991', 'dd-mm-yyyy'), 27926);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39727, 'Wayman  Gilliam', to_date('06-10-2001', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81164, 'Clarence  Apple', to_date('28-04-2007', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28179, 'Ronnie  Dayne', to_date('02-03-1999', 'dd-mm-yyyy'), 97631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58114, 'Red  Stamp', to_date('08-06-2016', 'dd-mm-yyyy'), 69152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17215, 'Rhea  Adler', to_date('18-11-1990', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43174, 'Benjamin  Biel', to_date('15-11-2005', 'dd-mm-yyyy'), 26546);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45483, 'Gabrielle  DiFr', to_date('07-04-2020', 'dd-mm-yyyy'), 93343);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28206, 'Vonda  Fender', to_date('23-07-2000', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25089, 'Lucinda  Krabbe', to_date('19-10-2003', 'dd-mm-yyyy'), 45393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95852, 'Loren  Stuart', to_date('02-08-2016', 'dd-mm-yyyy'), 69226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45531, 'Emily  Strong', to_date('11-09-1995', 'dd-mm-yyyy'), 98971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80207, 'Clarence  Riple', to_date('15-04-1994', 'dd-mm-yyyy'), 31443);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99512, 'Denzel  Rooker', to_date('24-08-1995', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62032, 'Tobey  Mattea', to_date('15-08-2013', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53446, 'Lena  Witherspo', to_date('07-04-2005', 'dd-mm-yyyy'), 66952);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60716, 'Armin  Root', to_date('05-09-1996', 'dd-mm-yyyy'), 67933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15549, 'Garry  Gary', to_date('16-06-2001', 'dd-mm-yyyy'), 37472);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26736, 'Claire  Wakelin', to_date('26-05-1999', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46654, 'Geena  McDiarmi', to_date('07-10-2020', 'dd-mm-yyyy'), 95551);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93290, 'Suzy  Atlas', to_date('28-06-1999', 'dd-mm-yyyy'), 45736);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36226, 'Gil  Chilton', to_date('11-02-2012', 'dd-mm-yyyy'), 21971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53224, 'Collin  Moreno', to_date('12-12-2006', 'dd-mm-yyyy'), 35978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22426, 'Roger  Thewlis', to_date('08-01-2004', 'dd-mm-yyyy'), 12747);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39297, 'Oded  Lewis', to_date('30-09-2009', 'dd-mm-yyyy'), 59816);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18382, 'Ritchie  Rudd', to_date('13-06-2005', 'dd-mm-yyyy'), 34738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13420, 'Teena  Crouch', to_date('09-04-2014', 'dd-mm-yyyy'), 45736);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31463, 'Carla  Ledger', to_date('15-05-2011', 'dd-mm-yyyy'), 97814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49125, 'Shelby  Tambor', to_date('11-05-2015', 'dd-mm-yyyy'), 95552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32155, 'Powers  Whitley', to_date('05-05-2012', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58246, 'Miko  Rydell', to_date('21-11-1993', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62042, 'Willem  Orlando', to_date('15-03-2002', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68046, 'Hikaru  Rydell', to_date('04-12-2016', 'dd-mm-yyyy'), 31476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38362, 'Steven  Hatchet', to_date('13-03-2014', 'dd-mm-yyyy'), 12747);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39829, 'Kylie  Azaria', to_date('22-08-1992', 'dd-mm-yyyy'), 37837);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48231, 'Penelope  Raybo', to_date('18-03-2018', 'dd-mm-yyyy'), 13778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77001, 'Ryan  Frost', to_date('17-05-2009', 'dd-mm-yyyy'), 96859);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99465, 'Roberta  Duke', to_date('25-01-2002', 'dd-mm-yyyy'), 64716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22748, 'Cheech  Moore', to_date('29-09-2020', 'dd-mm-yyyy'), 74946);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59642, 'Christmas  Driv', to_date('27-05-2015', 'dd-mm-yyyy'), 56245);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78610, 'Graham  Spiner', to_date('24-02-1990', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79555, 'Famke  Robinson', to_date('11-05-2009', 'dd-mm-yyyy'), 89279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32826, 'Cheryl  Solido', to_date('09-02-2001', 'dd-mm-yyyy'), 68464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18970, 'Cliff  Bonnevil', to_date('28-02-2000', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73137, 'Cevin  Rodgers', to_date('13-10-2016', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52945, 'Leonardo  LuPon', to_date('08-08-1999', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74149, 'Elizabeth  Samp', to_date('12-08-2006', 'dd-mm-yyyy'), 41641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26227, 'Lili  Mraz', to_date('07-05-2014', 'dd-mm-yyyy'), 25353);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27239, 'Marc  Teng', to_date('20-11-2003', 'dd-mm-yyyy'), 12162);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52666, 'Robbie  Paxton', to_date('24-09-1993', 'dd-mm-yyyy'), 13752);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76183, 'Steve  Bruce', to_date('11-08-1999', 'dd-mm-yyyy'), 27848);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36031, 'Buffy  Donelly', to_date('05-05-2017', 'dd-mm-yyyy'), 24153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81948, 'Ahmad  Portman', to_date('22-06-2009', 'dd-mm-yyyy'), 98451);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74718, 'Mili  Cage', to_date('22-06-1993', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23246, 'Geraldine  Lofg', to_date('12-09-1997', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50912, 'Robert  Arquett', to_date('31-01-1999', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55099, 'Carla  Paquin', to_date('12-06-2004', 'dd-mm-yyyy'), 18843);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37593, 'Eliza  Candy', to_date('11-11-2007', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68564, 'Katie  Nelson', to_date('17-04-2019', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94255, 'Carolyn  Ratzen', to_date('03-03-2016', 'dd-mm-yyyy'), 84164);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71952, 'Nils  Robards', to_date('21-01-1992', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17687, 'Avenged  Boorem', to_date('30-10-1994', 'dd-mm-yyyy'), 78146);
commit;
prompt 1200 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20197, 'Ron  Skerritt', to_date('07-03-1995', 'dd-mm-yyyy'), 39232);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29064, 'Quentin  Fariq', to_date('07-07-1991', 'dd-mm-yyyy'), 25856);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (51377, 'Yolanda  Pony', to_date('26-12-1998', 'dd-mm-yyyy'), 68667);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79892, 'Kathleen  Steig', to_date('26-12-2010', 'dd-mm-yyyy'), 93965);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45267, 'Miriam  Redgrav', to_date('10-07-2009', 'dd-mm-yyyy'), 65476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70009, 'Bret  Foxx', to_date('03-11-2004', 'dd-mm-yyyy'), 23388);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79718, 'Miguel  Lynch', to_date('26-10-2001', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60559, 'Louise  Arquett', to_date('20-01-2018', 'dd-mm-yyyy'), 31443);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58951, 'Tony  Fiorentin', to_date('05-06-2001', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52861, 'Lin  Glenn', to_date('12-12-2009', 'dd-mm-yyyy'), 13752);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91415, 'Ike  Wheel', to_date('26-05-2005', 'dd-mm-yyyy'), 25119);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35956, 'Charlie  Connic', to_date('13-03-1994', 'dd-mm-yyyy'), 74438);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32202, 'Cyndi  Winstone', to_date('07-01-2018', 'dd-mm-yyyy'), 24153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80876, 'Thora  Parm', to_date('07-06-2003', 'dd-mm-yyyy'), 23895);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21305, 'Marisa  Rush', to_date('01-12-2020', 'dd-mm-yyyy'), 67826);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90888, 'Wally  Weir', to_date('03-12-2001', 'dd-mm-yyyy'), 74527);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29934, 'Darius  Marley', to_date('05-07-2000', 'dd-mm-yyyy'), 71348);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27925, 'Trace  Broadben', to_date('01-06-2019', 'dd-mm-yyyy'), 83261);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63689, 'Julio  Molina', to_date('29-08-2012', 'dd-mm-yyyy'), 15814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82846, 'Selma  Pressly', to_date('11-11-2005', 'dd-mm-yyyy'), 56648);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19803, 'Jonatha  Ramis', to_date('20-08-2002', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20155, 'Mekhi  Cherry', to_date('14-02-1990', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68618, 'Liam  Franks', to_date('22-08-2018', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97471, 'Matthew  Neill', to_date('28-03-1990', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81278, 'Val  Tsettos', to_date('14-12-2018', 'dd-mm-yyyy'), 53251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19414, 'Holland  Strong', to_date('13-08-2002', 'dd-mm-yyyy'), 37552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48382, 'Karen  Borden', to_date('02-10-1999', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57984, 'Phoebe  Curfman', to_date('01-09-1990', 'dd-mm-yyyy'), 68464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54602, 'Jarvis  Jessee', to_date('05-03-2018', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94628, 'Jann  Lonsdale', to_date('08-03-2013', 'dd-mm-yyyy'), 49189);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18763, 'Kirk  Gatlin', to_date('23-01-2001', 'dd-mm-yyyy'), 47943);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80587, 'Anjelica  Mars', to_date('16-01-2003', 'dd-mm-yyyy'), 76793);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97694, 'Gena  Hidalgo', to_date('05-11-2010', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24681, 'Leslie  Jeter', to_date('12-03-2007', 'dd-mm-yyyy'), 99869);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34014, 'Selma  Ticotin', to_date('29-09-2009', 'dd-mm-yyyy'), 78576);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64440, 'Johnnie  DiFran', to_date('21-07-2018', 'dd-mm-yyyy'), 54532);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37247, 'Fats  MacPherso', to_date('31-05-2019', 'dd-mm-yyyy'), 15758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (51418, 'Daryle  Cromwel', to_date('29-10-1990', 'dd-mm-yyyy'), 54532);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71841, 'Thomas  Baez', to_date('03-11-2015', 'dd-mm-yyyy'), 68475);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77428, 'Demi  Conlee', to_date('11-04-2008', 'dd-mm-yyyy'), 13778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98759, 'Mary Beth  Durn', to_date('10-01-2012', 'dd-mm-yyyy'), 24374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18106, 'Thora  Lineback', to_date('11-06-2013', 'dd-mm-yyyy'), 79913);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44162, 'Gina  Furtado', to_date('12-04-2016', 'dd-mm-yyyy'), 31443);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87324, 'Juliette  Bragg', to_date('02-03-1998', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10964, 'Keanu  Brolin', to_date('27-11-2001', 'dd-mm-yyyy'), 91393);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98908, 'Carla  Johansen', to_date('19-10-1994', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71395, 'Vern  Scott', to_date('23-10-1999', 'dd-mm-yyyy'), 44266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97046, 'Natalie  Pfeiff', to_date('19-09-2018', 'dd-mm-yyyy'), 98616);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25900, 'Suzanne  McCabe', to_date('24-01-1991', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95923, 'Dermot  Frost', to_date('09-08-2014', 'dd-mm-yyyy'), 15758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26021, 'Brian  Tanon', to_date('02-10-2020', 'dd-mm-yyyy'), 58319);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64089, 'Jean-Luc  Holme', to_date('14-08-2000', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38857, 'Emerson  Sweene', to_date('20-04-2001', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79225, 'Natacha  Tillis', to_date('27-04-1996', 'dd-mm-yyyy'), 27647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46602, 'Milla  Haggard', to_date('29-09-1992', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68142, 'Rosanne  O''Sull', to_date('01-05-2017', 'dd-mm-yyyy'), 85767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17838, 'Selma  Stowe', to_date('10-01-1990', 'dd-mm-yyyy'), 35978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55014, 'Javon  Jovovich', to_date('18-07-1990', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67547, 'Graham  Keeslar', to_date('15-06-2008', 'dd-mm-yyyy'), 19985);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14518, 'Kirk  Cagle', to_date('07-04-1995', 'dd-mm-yyyy'), 75745);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91791, 'Clarence  Botti', to_date('21-02-2005', 'dd-mm-yyyy'), 24544);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55044, 'Kenneth  Jenkin', to_date('23-01-1993', 'dd-mm-yyyy'), 78576);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88133, 'Beth  Gaynor', to_date('11-01-2015', 'dd-mm-yyyy'), 45647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19161, 'Kimberly  Shand', to_date('21-10-1994', 'dd-mm-yyyy'), 49189);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67927, 'Daryl  Koteas', to_date('22-03-2006', 'dd-mm-yyyy'), 49362);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91482, 'Mekhi  Sevigny', to_date('11-10-2000', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16119, 'Rhea  Cassel', to_date('06-08-2008', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13651, 'Kieran  Lucas', to_date('13-05-2005', 'dd-mm-yyyy'), 46554);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35367, 'Meredith  Margo', to_date('25-03-1990', 'dd-mm-yyyy'), 89279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93030, 'Lisa  Whitaker', to_date('03-02-1992', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27234, 'Tal  Cole', to_date('23-12-2004', 'dd-mm-yyyy'), 31966);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60669, 'Candice  Ramis', to_date('19-12-2008', 'dd-mm-yyyy'), 92879);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46170, 'Percy  Trevino', to_date('30-01-2012', 'dd-mm-yyyy'), 18138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58250, 'Ali  Mahoney', to_date('03-06-2003', 'dd-mm-yyyy'), 27848);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90462, 'Micky  Dupree', to_date('19-05-2010', 'dd-mm-yyyy'), 93325);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74492, 'Elijah  Braughe', to_date('15-09-1992', 'dd-mm-yyyy'), 59927);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11081, 'Elvis  Lloyd', to_date('16-11-2002', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25230, 'Jean-Claude  Le', to_date('28-01-2017', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63953, 'Hope  Numan', to_date('20-02-2007', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59089, 'Sam  Humphrey', to_date('19-07-2000', 'dd-mm-yyyy'), 69226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83549, 'Queen  Crewson', to_date('08-02-2008', 'dd-mm-yyyy'), 57129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62585, 'Sharon  Santana', to_date('18-04-2002', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65703, 'Sheryl  Swayze', to_date('22-02-2008', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71827, 'First  Hackman', to_date('16-02-2013', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26800, 'Tramaine  Patri', to_date('29-06-1990', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17285, 'Tara  Shatner', to_date('14-11-1994', 'dd-mm-yyyy'), 45647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63899, 'Swoosie  Mannin', to_date('19-10-1993', 'dd-mm-yyyy'), 88824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62323, 'Rosie  Caviezel', to_date('10-01-2009', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98086, 'Herbie  Oakenfo', to_date('10-11-2020', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40462, 'Colleen  O''Conn', to_date('13-09-2015', 'dd-mm-yyyy'), 25742);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41804, 'Alan  Aiken', to_date('09-04-2017', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46799, 'Jeff  Duchovny', to_date('12-09-2011', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27769, 'Jean  Houston', to_date('13-03-2017', 'dd-mm-yyyy'), 64833);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44994, 'Brendan  Foster', to_date('01-08-2007', 'dd-mm-yyyy'), 86863);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87804, 'Thomas  Blige', to_date('27-11-1997', 'dd-mm-yyyy'), 68226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41024, 'Samuel  Coverda', to_date('29-10-1995', 'dd-mm-yyyy'), 96494);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32917, 'Andre  Balk', to_date('09-08-1994', 'dd-mm-yyyy'), 57129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17828, 'Mike  Sainte-Ma', to_date('28-05-2008', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52678, 'Vince  Presley', to_date('02-03-1999', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20576, 'Daryl  Bachman', to_date('16-11-1998', 'dd-mm-yyyy'), 44338);
commit;
prompt 1300 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36072, 'Chubby  Getty', to_date('02-09-2001', 'dd-mm-yyyy'), 54552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95375, 'Nicolas  Patton', to_date('23-10-2012', 'dd-mm-yyyy'), 46256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92182, 'Roger  Bragg', to_date('02-05-2000', 'dd-mm-yyyy'), 32125);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63345, 'Thin  Tilly', to_date('06-08-2017', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89707, 'Seann  Thurman', to_date('15-10-2009', 'dd-mm-yyyy'), 68667);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63380, 'Rolando  Leoni', to_date('14-07-2003', 'dd-mm-yyyy'), 66952);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22091, 'Carla  Cheadle', to_date('22-10-2004', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57718, 'Carrie-Anne  Mc', to_date('12-10-2019', 'dd-mm-yyyy'), 48844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49812, 'Viggo  Ball', to_date('06-07-1998', 'dd-mm-yyyy'), 24153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34607, 'Merle  Bogguss', to_date('20-04-1991', 'dd-mm-yyyy'), 45736);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82596, 'Val  Eckhart', to_date('13-10-2004', 'dd-mm-yyyy'), 94356);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44414, 'Nick  McIntosh', to_date('25-11-2006', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22141, 'Gabriel  Gaynor', to_date('17-11-1992', 'dd-mm-yyyy'), 39232);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27026, 'Madeleine  Lang', to_date('15-12-2002', 'dd-mm-yyyy'), 24374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75655, 'Bobbi  Chilton', to_date('13-10-2010', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21679, 'Nickel  Pigott-', to_date('12-04-2009', 'dd-mm-yyyy'), 61686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85211, 'Sarah  England', to_date('12-11-2001', 'dd-mm-yyyy'), 69152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43216, 'Alannah  Roundt', to_date('13-12-1995', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64762, 'Lee  Woods', to_date('19-10-1990', 'dd-mm-yyyy'), 27647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80085, 'Murray  Michael', to_date('01-10-1995', 'dd-mm-yyyy'), 53283);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59473, 'Rascal  Atkins', to_date('11-08-2000', 'dd-mm-yyyy'), 94794);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63098, 'Deborah  Akins', to_date('21-09-1994', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75413, 'Andrew  Trejo', to_date('15-10-2004', 'dd-mm-yyyy'), 87465);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86367, 'Gaby  Gertner', to_date('22-03-1997', 'dd-mm-yyyy'), 26546);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31246, 'Vienna  Herrman', to_date('07-01-2014', 'dd-mm-yyyy'), 37197);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56628, 'Freda  Lewis', to_date('13-05-2009', 'dd-mm-yyyy'), 37216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75773, 'Wes  Wolf', to_date('16-07-1992', 'dd-mm-yyyy'), 41737);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80290, 'Deborah  Horizo', to_date('18-06-2008', 'dd-mm-yyyy'), 51373);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98200, 'Charles  McAnal', to_date('25-07-1995', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65476, 'Faye  Popper', to_date('06-08-2016', 'dd-mm-yyyy'), 29411);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53514, 'Lee  Evans', to_date('22-03-2011', 'dd-mm-yyyy'), 83728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21236, 'Tilda  Bergen', to_date('22-10-2013', 'dd-mm-yyyy'), 92879);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55974, 'Julianna  Brosn', to_date('22-08-2007', 'dd-mm-yyyy'), 88824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81995, 'Art  Feuerstein', to_date('17-03-2012', 'dd-mm-yyyy'), 26678);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23672, 'Neil  Tyson', to_date('19-10-1993', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17814, 'Hex  Sevigny', to_date('14-02-1995', 'dd-mm-yyyy'), 49362);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66440, 'Mykelti  Coughl', to_date('05-07-2010', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24902, 'Gilberto  Brand', to_date('25-02-1997', 'dd-mm-yyyy'), 61686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72226, 'Bobby  Willard', to_date('18-11-1994', 'dd-mm-yyyy'), 39663);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49378, 'Kenny  King', to_date('15-09-2004', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33964, 'Nelly  Kinnear', to_date('23-03-1998', 'dd-mm-yyyy'), 82637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60503, 'Mark  Sample', to_date('26-10-2014', 'dd-mm-yyyy'), 62184);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12018, 'Mindy  Phifer', to_date('08-08-2010', 'dd-mm-yyyy'), 79847);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10381, 'Lindsey  Carrad', to_date('21-04-1991', 'dd-mm-yyyy'), 75745);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26735, 'Nora  Mollard', to_date('10-09-2020', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16639, 'Lennie  Fehr', to_date('09-05-1993', 'dd-mm-yyyy'), 74459);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67875, 'Trini  Lipnicki', to_date('11-03-2014', 'dd-mm-yyyy'), 59927);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53732, 'Willem  Hutch', to_date('17-03-2010', 'dd-mm-yyyy'), 48492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85882, 'Jessica  Garofa', to_date('03-03-1990', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61205, 'Jessica  Moorer', to_date('11-02-1990', 'dd-mm-yyyy'), 21342);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27307, 'Yaphet  Levin', to_date('30-12-2008', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82787, 'Latin  Kutcher', to_date('21-03-2019', 'dd-mm-yyyy'), 87465);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64709, 'Taylor  Pressly', to_date('26-01-2020', 'dd-mm-yyyy'), 69226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85021, 'Samuel  Cassidy', to_date('02-01-2005', 'dd-mm-yyyy'), 97956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61547, 'Joaquin  Campbe', to_date('20-06-2003', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71453, 'Avril  Grant', to_date('25-07-1998', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28430, 'Lenny  Holiday', to_date('02-09-2017', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82439, 'Patrick  Gaynor', to_date('24-11-2020', 'dd-mm-yyyy'), 96494);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81735, 'Toshiro  Garr', to_date('25-01-1999', 'dd-mm-yyyy'), 99869);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16623, 'Geraldine  Stil', to_date('16-12-2016', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78471, 'Lionel  Bandy', to_date('16-07-1997', 'dd-mm-yyyy'), 13596);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47462, 'April  Duchovny', to_date('01-08-1999', 'dd-mm-yyyy'), 59867);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27895, 'Robin  Pigott-S', to_date('09-01-1996', 'dd-mm-yyyy'), 61686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86097, 'Brendan  Cazale', to_date('10-06-2004', 'dd-mm-yyyy'), 35978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59767, 'Gordon  Schwimm', to_date('07-11-2018', 'dd-mm-yyyy'), 74168);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54411, 'Leonardo  Milsa', to_date('21-01-2019', 'dd-mm-yyyy'), 12162);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77154, 'Sammy  Lyonne', to_date('21-01-2009', 'dd-mm-yyyy'), 42858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36651, 'Catherine  Cree', to_date('15-01-1998', 'dd-mm-yyyy'), 62424);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63144, 'Melba  Sewell', to_date('07-07-2002', 'dd-mm-yyyy'), 43592);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17878, 'Anjelica  Baile', to_date('03-02-2007', 'dd-mm-yyyy'), 82637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66815, 'Robert  Aglukar', to_date('22-10-2015', 'dd-mm-yyyy'), 31443);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93447, 'Alicia  Keeslar', to_date('01-10-2018', 'dd-mm-yyyy'), 39232);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65614, 'Remy  Curtis', to_date('02-05-2013', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94276, 'Veruca  Vicious', to_date('02-04-2004', 'dd-mm-yyyy'), 59867);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52524, 'Debi  David', to_date('12-04-2010', 'dd-mm-yyyy'), 54397);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49492, 'Shirley  Klugh', to_date('23-06-2016', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54859, 'Charlie  Phoeni', to_date('11-06-2018', 'dd-mm-yyyy'), 31443);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40971, 'Red  Lucas', to_date('05-11-2019', 'dd-mm-yyyy'), 45553);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63455, 'Jody  Russo', to_date('12-01-2012', 'dd-mm-yyyy'), 33257);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45220, 'Sammy  Kotto', to_date('16-11-2017', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35900, 'Omar  Iglesias', to_date('22-08-1997', 'dd-mm-yyyy'), 29411);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57970, 'Ernest  Superna', to_date('05-05-2006', 'dd-mm-yyyy'), 79913);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18694, 'Gene  Bean', to_date('24-01-2013', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18308, 'Junior  Swank', to_date('03-10-2000', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61696, 'Jena  Colon', to_date('11-04-2020', 'dd-mm-yyyy'), 42858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96187, 'Kathy  Sewell', to_date('04-07-1990', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21036, 'Rowan  Street', to_date('13-02-2007', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54720, 'Ani  Popper', to_date('28-10-2016', 'dd-mm-yyyy'), 67826);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22715, 'Rita  Dickinson', to_date('23-11-2003', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74691, 'Armin  Glenn', to_date('09-11-2004', 'dd-mm-yyyy'), 69226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23271, 'Pam  Yankovic', to_date('11-01-2006', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68942, 'Cheech  Liotta', to_date('05-02-2009', 'dd-mm-yyyy'), 47762);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96812, 'Rowan  Spector', to_date('01-08-1991', 'dd-mm-yyyy'), 88824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64957, 'Campbell  Rosse', to_date('28-11-1996', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44444, 'Dabney  Baransk', to_date('29-07-2017', 'dd-mm-yyyy'), 49189);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30168, 'Willem  Gayle', to_date('13-12-2015', 'dd-mm-yyyy'), 47762);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78560, 'James  Moriarty', to_date('19-12-1997', 'dd-mm-yyyy'), 85767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83538, 'Franz  Marie', to_date('29-03-1994', 'dd-mm-yyyy'), 71955);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25249, 'Lupe  Tomei', to_date('31-10-1997', 'dd-mm-yyyy'), 29413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54085, 'Herbie  Osbourn', to_date('14-12-2006', 'dd-mm-yyyy'), 65857);
commit;
prompt 1400 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83820, 'Lili  Haynes', to_date('19-09-1997', 'dd-mm-yyyy'), 84983);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44101, 'Bruce  Sinatra', to_date('14-07-2006', 'dd-mm-yyyy'), 74438);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75745, 'Bo  Westerberg', to_date('28-06-2015', 'dd-mm-yyyy'), 83261);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72719, 'Kelli  Pressly', to_date('28-01-1996', 'dd-mm-yyyy'), 32125);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29462, 'Chazz  Richards', to_date('27-05-2019', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42247, 'Meredith  Union', to_date('12-01-2020', 'dd-mm-yyyy'), 69778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40193, 'Shawn  Foxx', to_date('22-09-2006', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35460, 'Joan  Cozier', to_date('06-05-2002', 'dd-mm-yyyy'), 87589);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91783, 'CeCe  Summer', to_date('02-09-2005', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13020, 'Ashley  Hunter', to_date('26-03-2014', 'dd-mm-yyyy'), 68132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31127, 'Adina  Davison', to_date('17-07-1992', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75960, 'Jean-Luc  Goldb', to_date('22-11-1992', 'dd-mm-yyyy'), 74168);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67204, 'Jeremy  Irons', to_date('26-01-2006', 'dd-mm-yyyy'), 61686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26143, 'Morgan  Neeson', to_date('25-05-2000', 'dd-mm-yyyy'), 93325);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80061, 'Darren  Colon', to_date('13-11-1997', 'dd-mm-yyyy'), 36437);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60002, 'Nastassja  Gues', to_date('03-12-2012', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26361, 'Sally  Squier', to_date('17-07-2007', 'dd-mm-yyyy'), 97956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53294, 'Nicholas  Framp', to_date('01-04-1996', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74421, 'Cameron  Haysbe', to_date('29-09-2002', 'dd-mm-yyyy'), 24153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15102, 'Davy  Wilson', to_date('04-02-2003', 'dd-mm-yyyy'), 87589);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32910, 'Lydia  Carnes', to_date('05-05-2015', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53137, 'Colm  Creek', to_date('07-10-2013', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54873, 'Rickie  Ratzenb', to_date('01-01-2016', 'dd-mm-yyyy'), 88824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46094, 'Sylvester  Wied', to_date('27-06-2019', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32532, 'Ozzy  Summer', to_date('04-06-2014', 'dd-mm-yyyy'), 75745);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40362, 'Larnelle  Parm', to_date('18-11-2020', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91621, 'Meryl  Craig', to_date('17-03-1998', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78744, 'Murray  Child', to_date('03-10-2000', 'dd-mm-yyyy'), 57129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13400, 'Cameron  Lonsda', to_date('02-03-2006', 'dd-mm-yyyy'), 18138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58931, 'Pelvic  Mitchel', to_date('04-06-2000', 'dd-mm-yyyy'), 84164);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89055, 'Sissy  Lattimor', to_date('01-05-2018', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38073, 'Solomon  Payne', to_date('19-10-1998', 'dd-mm-yyyy'), 54799);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58950, 'Roger  Myers', to_date('28-07-2013', 'dd-mm-yyyy'), 37837);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38770, 'Anthony  Blanch', to_date('03-09-2020', 'dd-mm-yyyy'), 45647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61383, 'Cate  Nielsen', to_date('04-01-2015', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36604, 'Percy  Bailey', to_date('24-01-2002', 'dd-mm-yyyy'), 12747);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21966, 'Freda  Robinson', to_date('16-09-2017', 'dd-mm-yyyy'), 59816);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91229, 'Tia  Marin', to_date('23-02-1992', 'dd-mm-yyyy'), 41987);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35838, 'Chuck  Chapman', to_date('31-07-1995', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91986, 'Temuera  Smith', to_date('07-10-2004', 'dd-mm-yyyy'), 64716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71452, 'Mae  Moriarty', to_date('25-07-2012', 'dd-mm-yyyy'), 51336);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82386, 'Horace  Cervine', to_date('20-10-1999', 'dd-mm-yyyy'), 59927);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86985, 'Jet  Head', to_date('11-05-1997', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73335, 'Elisabeth  Lloy', to_date('25-09-1992', 'dd-mm-yyyy'), 21971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88910, 'Edwin  Boone', to_date('21-09-2001', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36886, 'Bruce  Davies', to_date('28-04-2003', 'dd-mm-yyyy'), 37197);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15811, 'Brenda  Metcalf', to_date('23-11-2009', 'dd-mm-yyyy'), 41737);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78348, 'Jeffery  Hurley', to_date('12-06-2019', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80980, 'Vincent  Howard', to_date('22-10-2015', 'dd-mm-yyyy'), 38784);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76567, 'Rascal  Conway', to_date('18-10-1995', 'dd-mm-yyyy'), 67288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59291, 'Nicky  Withers', to_date('23-10-2002', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97745, 'Trace  Ponty', to_date('07-08-1996', 'dd-mm-yyyy'), 46824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98836, 'Bernard  Brooks', to_date('02-07-2020', 'dd-mm-yyyy'), 43678);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47280, 'Ricky  Aaron', to_date('21-11-2016', 'dd-mm-yyyy'), 72361);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89480, 'Rebeka  Conway', to_date('06-11-1994', 'dd-mm-yyyy'), 39855);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73013, 'Miguel  Kelly', to_date('21-02-2007', 'dd-mm-yyyy'), 78146);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68203, 'Elvis  Kramer', to_date('17-03-1995', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54359, 'Earl  Lerner', to_date('16-04-2012', 'dd-mm-yyyy'), 78666);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27590, 'Darius  Mollard', to_date('28-11-2006', 'dd-mm-yyyy'), 32125);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91317, 'Jackson  Ponce', to_date('13-10-2005', 'dd-mm-yyyy'), 67138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87353, 'Latin  Blossoms', to_date('16-02-2003', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45693, 'Spike  Parsons', to_date('03-05-1998', 'dd-mm-yyyy'), 24574);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83757, 'Fred  O''Connor', to_date('08-11-2016', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21955, 'Sylvester  Lawr', to_date('19-10-2009', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53189, 'Breckin  Cusack', to_date('13-07-2004', 'dd-mm-yyyy'), 67288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91352, 'Toshiro  Hagert', to_date('08-03-2013', 'dd-mm-yyyy'), 74438);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17094, 'Charlton  Bale', to_date('18-04-1996', 'dd-mm-yyyy'), 45612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72340, 'Diamond  Studi', to_date('23-06-2003', 'dd-mm-yyyy'), 46554);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83622, 'Herbie  Hawkins', to_date('14-10-2002', 'dd-mm-yyyy'), 97956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89123, 'Boyd  Iglesias', to_date('11-12-2018', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90270, 'Ty  Wilson', to_date('14-11-2002', 'dd-mm-yyyy'), 93571);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69173, 'Frank  Aiken', to_date('25-06-2020', 'dd-mm-yyyy'), 68226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81230, 'Keanu  Chan', to_date('05-12-2004', 'dd-mm-yyyy'), 35988);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30655, 'Suzanne  Davies', to_date('02-07-2020', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62143, 'Rupert  Fishbur', to_date('16-11-2007', 'dd-mm-yyyy'), 51454);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99209, 'Ani  Carrere', to_date('15-08-2013', 'dd-mm-yyyy'), 38784);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38179, 'Sal  Pressly', to_date('18-07-2000', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25990, 'Pelvic  Tucci', to_date('21-02-2010', 'dd-mm-yyyy'), 45612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60978, 'Aida  Rowlands', to_date('13-06-1993', 'dd-mm-yyyy'), 25119);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30193, 'Bette  Tankard', to_date('05-02-2015', 'dd-mm-yyyy'), 76719);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16474, 'Lenny  McGinley', to_date('23-11-2016', 'dd-mm-yyyy'), 13752);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55418, 'Mindy  Janney', to_date('02-05-2001', 'dd-mm-yyyy'), 59927);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89168, 'Embeth  Damon', to_date('09-06-2002', 'dd-mm-yyyy'), 35599);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71974, 'Franz  Diffie', to_date('31-12-1996', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22085, 'Lila  Clayton', to_date('16-07-1993', 'dd-mm-yyyy'), 61256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44889, 'Belinda  Klugh', to_date('29-11-1999', 'dd-mm-yyyy'), 57739);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26282, 'Jeffery  Buckin', to_date('22-04-2011', 'dd-mm-yyyy'), 56648);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30494, 'Remy  Pantolian', to_date('30-06-2007', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26049, 'Jerry  Spector', to_date('20-08-2017', 'dd-mm-yyyy'), 67288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10087, 'Nicky  Hauer', to_date('08-04-1994', 'dd-mm-yyyy'), 23738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67738, 'Jimmy  Rea', to_date('28-09-1997', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14409, 'Stevie  Tinsley', to_date('01-06-2014', 'dd-mm-yyyy'), 82637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24606, 'Betty  Strathai', to_date('14-01-2008', 'dd-mm-yyyy'), 98216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64833, 'Gladys  Slater', to_date('24-04-2016', 'dd-mm-yyyy'), 49362);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21469, 'Seann  Waite', to_date('11-11-2012', 'dd-mm-yyyy'), 17534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28127, 'Leelee  Horizon', to_date('18-12-2006', 'dd-mm-yyyy'), 48844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64335, 'Thora  Seagal', to_date('12-03-2008', 'dd-mm-yyyy'), 46824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56939, 'Alicia  Blackwe', to_date('24-03-1992', 'dd-mm-yyyy'), 81149);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36684, 'Nickel  Sewell', to_date('10-11-2013', 'dd-mm-yyyy'), 39132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61731, 'Fisher  Maxwell', to_date('26-07-2016', 'dd-mm-yyyy'), 41737);
commit;
prompt 1500 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19745, 'Tony  Scorsese', to_date('06-07-1996', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18851, 'Radney  Winger', to_date('12-04-2007', 'dd-mm-yyyy'), 83261);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66683, 'Sinead  Fehr', to_date('20-04-1994', 'dd-mm-yyyy'), 67288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70279, 'Irene  Vaughan', to_date('09-03-2004', 'dd-mm-yyyy'), 47638);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18496, 'Liam  Wiest', to_date('20-04-2018', 'dd-mm-yyyy'), 38784);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26616, 'Forest  Murray', to_date('19-06-2007', 'dd-mm-yyyy'), 25353);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71371, 'Pam  DeVito', to_date('05-09-1997', 'dd-mm-yyyy'), 87465);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21180, 'Kasey  Caldwell', to_date('11-05-2002', 'dd-mm-yyyy'), 42858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65820, 'Jamie  Broadben', to_date('01-09-1996', 'dd-mm-yyyy'), 51454);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38229, 'Carrie  Slater', to_date('23-12-2010', 'dd-mm-yyyy'), 29411);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34958, 'Geggy  Jordan', to_date('14-11-2009', 'dd-mm-yyyy'), 28285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80057, 'Helen  Jay', to_date('23-07-2010', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87653, 'Joan  Baranski', to_date('19-01-2011', 'dd-mm-yyyy'), 58319);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32583, 'Rene  Schwimmer', to_date('19-06-1991', 'dd-mm-yyyy'), 23677);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14031, 'Mickey  Suchet', to_date('25-05-2012', 'dd-mm-yyyy'), 24153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52172, 'Spike  Winstone', to_date('24-08-2016', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87908, 'Remy  Emmett', to_date('14-11-2013', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69643, 'Jean-Claude  Ca', to_date('28-06-1995', 'dd-mm-yyyy'), 28566);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87785, 'Miles  Patton', to_date('30-12-1990', 'dd-mm-yyyy'), 37552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91270, 'Wesley  Sledge', to_date('30-11-1998', 'dd-mm-yyyy'), 98216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56301, 'Juliette  Glenn', to_date('20-02-2006', 'dd-mm-yyyy'), 59816);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57278, 'Vienna  Kimball', to_date('05-02-2012', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37065, 'Brad  Douglas', to_date('04-03-2011', 'dd-mm-yyyy'), 31567);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70002, 'Meryl  Wagner', to_date('06-06-2018', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72270, 'Barry  Herrmann', to_date('13-05-1998', 'dd-mm-yyyy'), 32125);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15595, 'Debi  Barkin', to_date('23-07-2017', 'dd-mm-yyyy'), 12747);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46967, 'Earl  Cage', to_date('07-01-2016', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94062, 'Treat  Hirsch', to_date('26-02-1993', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97536, 'Devon  Amos', to_date('16-05-2019', 'dd-mm-yyyy'), 34649);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63886, 'Casey  Diggs', to_date('19-03-2007', 'dd-mm-yyyy'), 62716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60637, 'Gloria  Gibson', to_date('05-07-1999', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47711, 'Josh  Horizon', to_date('14-10-1990', 'dd-mm-yyyy'), 98216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68485, 'Johnny  Soda', to_date('03-02-2010', 'dd-mm-yyyy'), 59816);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36431, 'Randy  Gaines', to_date('19-09-2019', 'dd-mm-yyyy'), 68413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11341, 'Tommy  Astin', to_date('18-05-2009', 'dd-mm-yyyy'), 58375);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75832, 'Eileen  Crowe', to_date('08-05-1997', 'dd-mm-yyyy'), 76719);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18178, 'Ewan  Addy', to_date('31-01-2004', 'dd-mm-yyyy'), 47638);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17568, 'Neneh  Close', to_date('22-01-2012', 'dd-mm-yyyy'), 98971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36966, 'Mika  Rodriguez', to_date('19-06-1998', 'dd-mm-yyyy'), 76793);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74424, 'Jonny Lee  Gree', to_date('23-01-2014', 'dd-mm-yyyy'), 46554);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61027, 'Elisabeth  Arno', to_date('11-02-2014', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80590, 'Barry  Bates', to_date('17-05-2008', 'dd-mm-yyyy'), 89279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69872, 'Janeane  Hiatt', to_date('01-04-2015', 'dd-mm-yyyy'), 82864);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97162, 'Meryl  Vanian', to_date('17-11-2011', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87569, 'Emily  Waite', to_date('19-02-2011', 'dd-mm-yyyy'), 83152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43918, 'Geraldine  Hirs', to_date('12-02-1994', 'dd-mm-yyyy'), 75745);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40117, 'Jena  Ellis', to_date('24-04-1994', 'dd-mm-yyyy'), 67288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60972, 'Juan  Nivola', to_date('15-11-1992', 'dd-mm-yyyy'), 41987);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19526, 'Grace  Soda', to_date('06-05-2018', 'dd-mm-yyyy'), 15814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30887, 'Martha  Pullman', to_date('31-01-1994', 'dd-mm-yyyy'), 41737);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25570, 'Ving  Slater', to_date('25-05-1993', 'dd-mm-yyyy'), 21497);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39314, 'Catherine  Jama', to_date('24-10-2012', 'dd-mm-yyyy'), 26546);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10775, 'Henry  Ruffalo', to_date('07-06-2010', 'dd-mm-yyyy'), 15136);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39042, 'Vertical  Capsh', to_date('14-01-2007', 'dd-mm-yyyy'), 97956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47243, 'Ned  Krieger', to_date('30-05-1998', 'dd-mm-yyyy'), 76719);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19156, 'Milla  Carnes', to_date('14-03-1996', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18405, 'Dwight  Bergen', to_date('08-08-1996', 'dd-mm-yyyy'), 74481);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41157, 'Bill  Greenwood', to_date('15-04-2003', 'dd-mm-yyyy'), 67138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35109, 'Vin  Peterson', to_date('13-11-2003', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28976, 'Cevin  Reid', to_date('08-05-2018', 'dd-mm-yyyy'), 94968);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25582, 'Jaime  Diehl', to_date('18-11-1992', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30375, 'Joaquin  Dern', to_date('04-11-2013', 'dd-mm-yyyy'), 39192);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22159, 'Jack  Banderas', to_date('29-09-2000', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34311, 'Jay  Chappelle', to_date('17-09-2003', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87443, 'Rawlins  Gertne', to_date('20-04-1999', 'dd-mm-yyyy'), 64833);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65201, 'Michael  Mazzel', to_date('13-12-2006', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34100, 'Merrill  Myles', to_date('14-09-2006', 'dd-mm-yyyy'), 88487);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16378, 'Rebeka  McLachl', to_date('13-09-1994', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37164, 'Juliette  Borde', to_date('27-05-2012', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34296, 'Gabriel  Heald', to_date('30-04-1998', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75449, 'Anthony  Womack', to_date('27-09-2002', 'dd-mm-yyyy'), 86863);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21333, 'Meryl  Patton', to_date('23-08-2017', 'dd-mm-yyyy'), 87287);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83557, 'Christmas  Cusa', to_date('15-06-2018', 'dd-mm-yyyy'), 78633);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66998, 'Giovanni  Silve', to_date('04-08-2013', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20582, 'Selma  Horizon', to_date('20-07-2019', 'dd-mm-yyyy'), 53251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43326, 'Jon  Olin', to_date('01-10-2003', 'dd-mm-yyyy'), 34767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69282, 'Don  Cozier', to_date('01-04-2013', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44240, 'Adina  Wiedlin', to_date('16-04-1993', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70753, 'Bernie  LaPagli', to_date('06-08-2005', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49314, 'Courtney  Beatt', to_date('24-02-2014', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82196, 'Taylor  Scheide', to_date('26-05-2009', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22235, 'Angie  Pastore', to_date('24-03-2017', 'dd-mm-yyyy'), 88487);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42822, 'Spike  Birch', to_date('04-02-2014', 'dd-mm-yyyy'), 13596);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34141, 'Tal  Davies', to_date('03-07-2004', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33180, 'Lynn  Krumholtz', to_date('28-08-1999', 'dd-mm-yyyy'), 88824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45908, 'Chi  Berkeley', to_date('18-08-1994', 'dd-mm-yyyy'), 54799);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25753, 'Loreena  Vincen', to_date('12-01-2016', 'dd-mm-yyyy'), 76793);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52620, 'Rhea  Burton', to_date('16-08-2012', 'dd-mm-yyyy'), 68667);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35219, 'Willem  Hobson', to_date('05-04-2007', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10078, 'Fred  Brosnan', to_date('25-11-2016', 'dd-mm-yyyy'), 76793);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52209, 'Freddy  Dysart', to_date('19-08-2015', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42270, 'Embeth  Kahn', to_date('04-02-2020', 'dd-mm-yyyy'), 74459);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74394, 'Bridget  Morse', to_date('30-10-1990', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32149, 'Merillee  Nelli', to_date('05-12-2008', 'dd-mm-yyyy'), 86623);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93906, 'Vickie  Connell', to_date('15-07-2007', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94316, 'Christian  Bush', to_date('10-06-2015', 'dd-mm-yyyy'), 92879);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24081, 'Rhea  Sherman', to_date('09-10-1997', 'dd-mm-yyyy'), 71315);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89023, 'Chloe  Stanley', to_date('06-12-2014', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91333, 'Annette  Christ', to_date('17-05-2003', 'dd-mm-yyyy'), 31476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21407, 'Suzy  Forster', to_date('15-06-2020', 'dd-mm-yyyy'), 92879);
commit;
prompt 1600 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26116, 'Sarah  Lemmon', to_date('12-10-2008', 'dd-mm-yyyy'), 24219);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70802, 'Graham  Perez', to_date('05-11-2017', 'dd-mm-yyyy'), 66332);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54845, 'Marianne  Engli', to_date('18-11-1991', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47036, 'Laura  Bedelia', to_date('11-10-2003', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75490, 'Kay  Marie', to_date('10-09-2006', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12420, 'Jodie  Allison', to_date('16-11-1993', 'dd-mm-yyyy'), 54552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38061, 'Diane  Guilfoyl', to_date('21-11-2013', 'dd-mm-yyyy'), 68413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92610, 'Al  Stampley', to_date('31-10-2015', 'dd-mm-yyyy'), 71549);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72498, 'Trini  Neeson', to_date('26-03-2006', 'dd-mm-yyyy'), 35385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93750, 'Suzy  Kingsley', to_date('28-01-2014', 'dd-mm-yyyy'), 29413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90248, 'Rawlins  Kier', to_date('06-03-2015', 'dd-mm-yyyy'), 15945);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (51361, 'Jeanne  Mohr', to_date('30-06-2020', 'dd-mm-yyyy'), 39232);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64949, 'Colin  Sandoval', to_date('11-06-2005', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94056, 'Emerson  Greenw', to_date('10-01-1996', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45758, 'Jeff  Irons', to_date('06-05-2014', 'dd-mm-yyyy'), 71348);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46447, 'Angela  Feore', to_date('09-09-2020', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83437, 'Kim  Dickinson', to_date('22-01-2013', 'dd-mm-yyyy'), 42858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (38072, 'Will  Ruffalo', to_date('19-01-2016', 'dd-mm-yyyy'), 51373);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87530, 'Giovanni  Holm', to_date('22-08-2016', 'dd-mm-yyyy'), 49362);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (51819, 'Neve  Owen', to_date('16-08-1999', 'dd-mm-yyyy'), 35969);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23250, 'Denzel  Cruz', to_date('14-05-2004', 'dd-mm-yyyy'), 93571);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80409, 'Ahmad  Boone', to_date('03-12-1995', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55787, 'Mindy  Koteas', to_date('13-10-2009', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75942, 'Azucar  Joli', to_date('06-11-2011', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10364, 'Giancarlo  Dill', to_date('01-03-2006', 'dd-mm-yyyy'), 76886);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70297, 'Richie  Gellar', to_date('08-06-1999', 'dd-mm-yyyy'), 69778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36282, 'Rutger  Shue', to_date('12-03-2014', 'dd-mm-yyyy'), 28285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43352, 'Adam  Garner', to_date('05-05-1992', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42859, 'Lloyd  Marin', to_date('15-03-1993', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97988, 'Dianne  Forster', to_date('08-03-1999', 'dd-mm-yyyy'), 58928);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29311, 'Morris  Cross', to_date('07-02-2013', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90797, 'Miko  Torres', to_date('16-07-2004', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75433, 'Tracy  Beals', to_date('22-11-1997', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80289, 'Wally  Copeland', to_date('27-01-1993', 'dd-mm-yyyy'), 99869);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16520, 'Kazem  Mathis', to_date('04-11-2015', 'dd-mm-yyyy'), 84983);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79390, 'Gilbert  Cozier', to_date('07-04-2007', 'dd-mm-yyyy'), 83728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92856, 'Lorraine  Tomei', to_date('06-04-1996', 'dd-mm-yyyy'), 54799);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82878, 'Colin  Craddock', to_date('19-06-2001', 'dd-mm-yyyy'), 72361);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72094, 'Albertina  Murd', to_date('17-12-1998', 'dd-mm-yyyy'), 47762);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22567, 'Grant  Broadben', to_date('18-08-2002', 'dd-mm-yyyy'), 46824);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12094, 'Lupe  Connery', to_date('21-11-1998', 'dd-mm-yyyy'), 56648);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45939, 'Keith  Ward', to_date('03-05-1996', 'dd-mm-yyyy'), 38447);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92749, 'Tracy  Hurt', to_date('11-02-2020', 'dd-mm-yyyy'), 54532);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79988, 'Billy  Cohn', to_date('18-11-2009', 'dd-mm-yyyy'), 39612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21527, 'Cheech  Clayton', to_date('25-09-2018', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31276, 'Corey  Michael', to_date('25-11-2013', 'dd-mm-yyyy'), 31476);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50088, 'Hal  Coverdale', to_date('14-10-2013', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19989, 'Jared  Edmunds', to_date('13-04-2005', 'dd-mm-yyyy'), 15758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92683, 'Rosanne  Lynch', to_date('23-04-2014', 'dd-mm-yyyy'), 14297);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81332, 'Sal  Boone', to_date('16-08-2003', 'dd-mm-yyyy'), 34649);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68797, 'Ted  Rawls', to_date('19-09-2003', 'dd-mm-yyyy'), 76793);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23680, 'Marc  Henriksen', to_date('23-05-1993', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88081, 'Tzi  Napolitano', to_date('14-07-2019', 'dd-mm-yyyy'), 56812);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83481, 'Hilton  Bonham', to_date('12-10-2018', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34946, 'Red  Lopez', to_date('22-02-1990', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34002, 'Lesley  Carter', to_date('23-08-1993', 'dd-mm-yyyy'), 76719);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83669, 'Joaquin  Kadiso', to_date('22-06-2002', 'dd-mm-yyyy'), 95551);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93303, 'Mia  Vance', to_date('22-05-2019', 'dd-mm-yyyy'), 32125);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54980, 'Lynn  Jenkins', to_date('04-12-1999', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99054, 'Hank  Kudrow', to_date('11-03-2020', 'dd-mm-yyyy'), 24374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43093, 'Avenged  Brando', to_date('26-06-2010', 'dd-mm-yyyy'), 37216);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59151, 'Maggie  Weber', to_date('15-04-2015', 'dd-mm-yyyy'), 82864);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47406, 'Cornell  Gracie', to_date('22-03-1999', 'dd-mm-yyyy'), 46256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97168, 'Demi  Tierney', to_date('22-08-1992', 'dd-mm-yyyy'), 19365);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61193, 'Ivan  Hannah', to_date('17-04-2011', 'dd-mm-yyyy'), 89844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94000, 'Nikki  Krieger', to_date('10-03-1995', 'dd-mm-yyyy'), 68464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50204, 'Gordon  Hershey', to_date('21-02-2018', 'dd-mm-yyyy'), 23388);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31634, 'Matthew  Hackma', to_date('03-11-1992', 'dd-mm-yyyy'), 54799);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16730, 'Frederic  Tsett', to_date('25-07-1997', 'dd-mm-yyyy'), 12162);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95979, 'Rodney  Wills', to_date('05-11-2010', 'dd-mm-yyyy'), 27926);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50680, 'Solomon  Foxx', to_date('20-09-2007', 'dd-mm-yyyy'), 34649);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70469, 'Carrie-Anne  Mc', to_date('15-02-1993', 'dd-mm-yyyy'), 97814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49391, 'Amanda  Leachma', to_date('19-07-2019', 'dd-mm-yyyy'), 23738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56427, 'Remy  Curfman', to_date('18-07-1996', 'dd-mm-yyyy'), 21971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71380, 'Maxine  Whitfor', to_date('19-02-2011', 'dd-mm-yyyy'), 19985);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21540, 'Mili  Koteas', to_date('08-05-1990', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23008, 'Davy  Schiff', to_date('13-03-1998', 'dd-mm-yyyy'), 23388);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53179, 'Rob  Schiavelli', to_date('24-08-1996', 'dd-mm-yyyy'), 87589);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92824, 'Jon  Dzundza', to_date('25-01-2001', 'dd-mm-yyyy'), 74459);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22183, 'William  Green', to_date('11-12-2019', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72373, 'Coley  Haynes', to_date('06-03-2000', 'dd-mm-yyyy'), 76719);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28345, 'Rachid  Harper', to_date('07-05-2000', 'dd-mm-yyyy'), 58319);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15895, 'Heath  Cockburn', to_date('25-03-2011', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70629, 'Merle  Morrison', to_date('22-02-1999', 'dd-mm-yyyy'), 44887);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80644, 'Sinead  Starr', to_date('28-04-1994', 'dd-mm-yyyy'), 96859);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73318, 'Etta  Haynes', to_date('28-06-1996', 'dd-mm-yyyy'), 74147);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55223, 'Loretta  Eldard', to_date('11-08-1993', 'dd-mm-yyyy'), 49514);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97373, 'Mel  Hewett', to_date('16-05-2014', 'dd-mm-yyyy'), 45736);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68351, 'Raymond  Cusack', to_date('09-03-1995', 'dd-mm-yyyy'), 26738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34540, 'Tracy  Rhodes', to_date('15-02-2017', 'dd-mm-yyyy'), 74147);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85092, 'Keith  Dukakis', to_date('07-07-2005', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96030, 'Vondie  Goldwyn', to_date('15-03-2009', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82857, 'Isaiah  Crowell', to_date('10-11-2016', 'dd-mm-yyyy'), 62424);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19332, 'Nancy  Aiken', to_date('02-06-1993', 'dd-mm-yyyy'), 64716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74812, 'Benicio  Quinn', to_date('23-02-2014', 'dd-mm-yyyy'), 74527);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56127, 'Ernie  Basinger', to_date('04-01-2000', 'dd-mm-yyyy'), 74147);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (34959, 'Hex  Mould', to_date('12-08-2010', 'dd-mm-yyyy'), 44541);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78187, 'Chloe  Costello', to_date('08-10-1997', 'dd-mm-yyyy'), 46196);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88690, 'Stellan  Portma', to_date('01-11-2006', 'dd-mm-yyyy'), 69778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62197, 'Colin  Richards', to_date('14-07-2004', 'dd-mm-yyyy'), 34767);
commit;
prompt 1700 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47727, 'Emm  Nelson', to_date('15-08-1998', 'dd-mm-yyyy'), 79913);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54634, 'Forest  Roundtr', to_date('04-06-1999', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36837, 'Don  Andrews', to_date('15-07-2019', 'dd-mm-yyyy'), 35988);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14740, 'Warren  Li', to_date('16-06-1990', 'dd-mm-yyyy'), 87465);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68033, 'Rowan  Malkovic', to_date('24-11-2004', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31925, 'Gordie  Flatts', to_date('05-07-2001', 'dd-mm-yyyy'), 82864);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92104, 'Alfred  Warren', to_date('03-08-2013', 'dd-mm-yyyy'), 64716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36782, 'Ali  Rio', to_date('18-12-2003', 'dd-mm-yyyy'), 37472);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94906, 'Bridget  Slater', to_date('04-03-2011', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68448, 'Gates  Jenkins', to_date('15-08-2011', 'dd-mm-yyyy'), 42929);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64929, 'Nicole  Guest', to_date('10-06-2002', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46800, 'Raymond  Atkins', to_date('11-04-1996', 'dd-mm-yyyy'), 27926);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70270, 'Rachel  Coleman', to_date('26-05-2018', 'dd-mm-yyyy'), 85492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85230, 'Jamie  Sarsgaar', to_date('01-09-2017', 'dd-mm-yyyy'), 58319);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46905, 'Jeanne  Statham', to_date('03-06-2002', 'dd-mm-yyyy'), 56648);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33645, 'Ernie  Holiday', to_date('10-10-2018', 'dd-mm-yyyy'), 29413);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11750, 'Kid  Quinones', to_date('15-01-1993', 'dd-mm-yyyy'), 96859);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58232, 'Anita  Mitra', to_date('29-07-1993', 'dd-mm-yyyy'), 27926);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55831, 'Matthew  Menike', to_date('15-03-2008', 'dd-mm-yyyy'), 21971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44287, 'Ricky  Snider', to_date('29-08-2010', 'dd-mm-yyyy'), 56695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43731, 'Gloria  Dolenz', to_date('08-11-2010', 'dd-mm-yyyy'), 21497);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69679, 'Geoffrey  Cook', to_date('29-03-1998', 'dd-mm-yyyy'), 24153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66047, 'Kasey  Deejay', to_date('04-09-2015', 'dd-mm-yyyy'), 89943);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18799, 'Lance  Farris', to_date('03-01-2020', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76132, 'Cole  England', to_date('12-06-1990', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (46875, 'Jack  McIntyre', to_date('19-07-2005', 'dd-mm-yyyy'), 96494);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53030, 'Oded  Northam', to_date('29-11-1998', 'dd-mm-yyyy'), 34767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32636, 'Armin  LaSalle', to_date('12-10-2004', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84350, 'Alannah  Statha', to_date('13-10-1994', 'dd-mm-yyyy'), 48492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25933, 'Morris  Craven', to_date('14-06-2008', 'dd-mm-yyyy'), 17975);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42593, 'Steve  Spacek', to_date('23-03-2003', 'dd-mm-yyyy'), 35442);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80457, 'Laurie  Warren', to_date('06-04-2008', 'dd-mm-yyyy'), 44266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14393, 'Pelvic  Madsen', to_date('23-02-2013', 'dd-mm-yyyy'), 44338);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89742, 'Vonda  Shannon', to_date('02-07-2019', 'dd-mm-yyyy'), 82637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64200, 'Merillee  Squie', to_date('29-11-1997', 'dd-mm-yyyy'), 93571);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66071, 'Aaron  Gugino', to_date('26-01-1990', 'dd-mm-yyyy'), 98684);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58747, 'Kristin  Anders', to_date('09-04-2005', 'dd-mm-yyyy'), 68783);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40322, 'Freda  Davidtz', to_date('03-11-1999', 'dd-mm-yyyy'), 76379);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (67433, 'Allan  Bugnon', to_date('01-10-2015', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (43541, 'Stephanie  Cron', to_date('20-05-1993', 'dd-mm-yyyy'), 23388);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15500, 'Lin  Francis', to_date('07-02-2013', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24824, 'Julie  Crudup', to_date('22-05-1991', 'dd-mm-yyyy'), 39663);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73410, 'Edgar  Redgrave', to_date('31-01-1995', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (24012, 'Lynette  Nichol', to_date('14-07-2006', 'dd-mm-yyyy'), 88487);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37645, 'Lizzy  Burstyn', to_date('06-05-1990', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87559, 'Brendan  Freema', to_date('27-07-2019', 'dd-mm-yyyy'), 67288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77818, 'Franco  Hoffman', to_date('01-11-2002', 'dd-mm-yyyy'), 34649);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10182, 'Horace  Navarro', to_date('23-06-2008', 'dd-mm-yyyy'), 26678);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84160, 'Jonny  Liotta', to_date('09-06-2007', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (86234, 'Earl  Kadison', to_date('13-09-1998', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14470, 'Brittany  Holla', to_date('11-09-2012', 'dd-mm-yyyy'), 41737);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33169, 'Penelope  Nakai', to_date('13-05-2020', 'dd-mm-yyyy'), 91524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75378, 'Brad  Mazzello', to_date('11-03-1996', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76457, 'Seann  Patton', to_date('31-12-2008', 'dd-mm-yyyy'), 28285);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37420, 'Kevn  Weisberg', to_date('29-12-1998', 'dd-mm-yyyy'), 69791);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31931, 'Devon  Overstre', to_date('17-03-2020', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90910, 'Ritchie  Logue', to_date('25-05-1998', 'dd-mm-yyyy'), 44266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50106, 'Blair  Goodall', to_date('12-06-2000', 'dd-mm-yyyy'), 31443);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76626, 'Jason  Masur', to_date('08-02-1995', 'dd-mm-yyyy'), 56921);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19316, 'Ossie  Ponty', to_date('07-05-2014', 'dd-mm-yyyy'), 83225);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92214, 'Red  Sinatra', to_date('25-11-2005', 'dd-mm-yyyy'), 52655);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65403, 'Collin  Weber', to_date('17-07-2017', 'dd-mm-yyyy'), 39855);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89972, 'Lesley  De Niro', to_date('18-01-2009', 'dd-mm-yyyy'), 93343);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (75115, 'Wallace  Nivola', to_date('25-06-2016', 'dd-mm-yyyy'), 65637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82958, 'Celia  Chaplin', to_date('26-10-2002', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81480, 'Jamie  Alston', to_date('31-12-1990', 'dd-mm-yyyy'), 24374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78016, 'Robby  Schock', to_date('31-12-1992', 'dd-mm-yyyy'), 12747);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (60819, 'Alessandro  Pos', to_date('06-05-2005', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (39476, 'Dennis  Elizond', to_date('19-10-1992', 'dd-mm-yyyy'), 62184);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93297, 'Jerry  Haysbert', to_date('24-10-2006', 'dd-mm-yyyy'), 25856);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76142, 'Victor  Sobiesk', to_date('22-05-2009', 'dd-mm-yyyy'), 48844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73500, 'Marie  Lindo', to_date('17-09-2001', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14230, 'Pamela  Borden', to_date('26-07-2018', 'dd-mm-yyyy'), 41987);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85927, 'Russell  Uggams', to_date('02-06-1990', 'dd-mm-yyyy'), 74438);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72910, 'Crispin  Pfeiff', to_date('10-04-2001', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (66886, 'Kevn  Willard', to_date('21-11-2010', 'dd-mm-yyyy'), 67138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73967, 'Hilary  McIntos', to_date('30-01-2003', 'dd-mm-yyyy'), 13547);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48426, 'Herbie  Caan', to_date('26-05-2010', 'dd-mm-yyyy'), 64833);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80330, 'Micky  McDiarmi', to_date('24-11-2005', 'dd-mm-yyyy'), 26546);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13401, 'Jackson  Rippy', to_date('28-10-2017', 'dd-mm-yyyy'), 67933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15519, 'Kathleen  White', to_date('24-01-1992', 'dd-mm-yyyy'), 51454);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48723, 'Franz  Hunter', to_date('02-03-2000', 'dd-mm-yyyy'), 74527);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (84197, 'Al  Condition', to_date('11-12-2017', 'dd-mm-yyyy'), 98451);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63156, 'Rascal  Dunn', to_date('29-01-2013', 'dd-mm-yyyy'), 67826);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78346, 'Lily  Weir', to_date('16-10-1992', 'dd-mm-yyyy'), 65857);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87116, 'Mena  Harary', to_date('23-10-1993', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29598, 'Sara  Mitra', to_date('07-07-2016', 'dd-mm-yyyy'), 45553);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99217, 'Wallace  Suvari', to_date('04-09-2004', 'dd-mm-yyyy'), 54532);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61307, 'Lynn  Carrere', to_date('29-05-2004', 'dd-mm-yyyy'), 96266);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22084, 'Gladys  Garofal', to_date('01-06-1999', 'dd-mm-yyyy'), 59867);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12324, 'Dylan  Damon', to_date('19-09-1996', 'dd-mm-yyyy'), 24544);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49800, 'Jesus  Gray', to_date('20-07-2009', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35114, 'Azucar  Vai', to_date('01-03-2007', 'dd-mm-yyyy'), 86198);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32819, 'Wes  Watley', to_date('16-08-2002', 'dd-mm-yyyy'), 96859);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58874, 'Trini  Cartlidg', to_date('10-04-2009', 'dd-mm-yyyy'), 18138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81047, 'Michael  Khan', to_date('10-02-1995', 'dd-mm-yyyy'), 41118);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91590, 'Kid  Depp', to_date('14-03-1995', 'dd-mm-yyyy'), 86623);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89936, 'Tea  Lavigne', to_date('25-11-2012', 'dd-mm-yyyy'), 39612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30354, 'Quentin  Specto', to_date('14-08-2002', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92420, 'Clarence  Cage', to_date('19-09-1996', 'dd-mm-yyyy'), 74868);
commit;
prompt 1800 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (76675, 'Emmylou  Downey', to_date('08-07-1990', 'dd-mm-yyyy'), 83152);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30513, 'Hugo  Lizzy', to_date('27-10-2010', 'dd-mm-yyyy'), 71549);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (77887, 'Kelli  Downie', to_date('22-06-2012', 'dd-mm-yyyy'), 34788);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47567, 'Embeth  Shue', to_date('27-09-1994', 'dd-mm-yyyy'), 39663);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17050, 'Rita  Palmieri', to_date('28-05-2014', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (21656, 'Hector  Leoni', to_date('05-09-2013', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87865, 'Micky  Calle', to_date('16-02-2009', 'dd-mm-yyyy'), 89844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23453, 'Julianna  Kersh', to_date('01-06-2000', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45291, 'Zooey  Cruz', to_date('18-06-1995', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62129, 'Giancarlo  Dour', to_date('23-09-1994', 'dd-mm-yyyy'), 23895);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (94690, 'Darius  Coltran', to_date('22-08-2010', 'dd-mm-yyyy'), 74168);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78079, 'Elijah  Stamp', to_date('20-12-2011', 'dd-mm-yyyy'), 89279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15858, 'Vendetta  Skagg', to_date('21-12-2017', 'dd-mm-yyyy'), 25956);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48389, 'Hikaru  Merchan', to_date('24-07-2018', 'dd-mm-yyyy'), 35978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79726, 'Catherine  Tobo', to_date('14-04-1998', 'dd-mm-yyyy'), 54323);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (91178, 'Armin  Duncan', to_date('01-07-1990', 'dd-mm-yyyy'), 34738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74546, 'Nora  Azaria', to_date('08-01-1990', 'dd-mm-yyyy'), 54577);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (44505, 'Larenz  Brando', to_date('09-12-2009', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27599, 'Mike  Gere', to_date('22-05-2012', 'dd-mm-yyyy'), 49695);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (36235, 'Samantha  Dayne', to_date('09-09-2000', 'dd-mm-yyyy'), 13778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70026, 'Glen  Ryder', to_date('06-01-2012', 'dd-mm-yyyy'), 43293);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78053, 'Ronnie  Lattimo', to_date('13-10-2007', 'dd-mm-yyyy'), 68226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42717, 'Carrie-Anne  Re', to_date('05-02-2015', 'dd-mm-yyyy'), 41737);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62456, 'Freda  Peniston', to_date('16-07-1997', 'dd-mm-yyyy'), 76464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35257, 'Sam  Morales', to_date('23-09-1992', 'dd-mm-yyyy'), 35978);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33841, 'Omar  Downey', to_date('27-04-2019', 'dd-mm-yyyy'), 18138);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (69502, 'Harvey  Carring', to_date('19-01-2011', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81513, 'Terence  Caldwe', to_date('08-06-2004', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57838, 'Maureen  Feore', to_date('16-01-2012', 'dd-mm-yyyy'), 72361);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87314, 'Tracy  Rooker', to_date('24-04-2013', 'dd-mm-yyyy'), 26597);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96744, 'Kenneth  Whitmo', to_date('25-03-2015', 'dd-mm-yyyy'), 68464);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19324, 'Wade  de Lancie', to_date('17-01-1990', 'dd-mm-yyyy'), 86863);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (59587, 'Gino  Serbedzij', to_date('25-04-2008', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (58431, 'Demi  Weaver', to_date('16-04-2009', 'dd-mm-yyyy'), 79847);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54339, 'Maria  Costner', to_date('01-08-2008', 'dd-mm-yyyy'), 42858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (93153, 'Elle  Klein', to_date('07-04-2008', 'dd-mm-yyyy'), 34565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80346, 'Hector  Hingle', to_date('16-02-2018', 'dd-mm-yyyy'), 83296);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26826, 'Ralph  Ronstadt', to_date('03-11-2010', 'dd-mm-yyyy'), 34788);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37266, 'Suzy  Thomson', to_date('30-12-1998', 'dd-mm-yyyy'), 67826);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47038, 'Beth  MacNeil', to_date('21-04-1997', 'dd-mm-yyyy'), 74438);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57539, 'Amy  Holly', to_date('13-08-2006', 'dd-mm-yyyy'), 48492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42332, 'Jackie  Mann', to_date('18-01-2003', 'dd-mm-yyyy'), 46256);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70431, 'Isaac  Head', to_date('05-05-2003', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85044, 'Marlon  Frost', to_date('09-05-2003', 'dd-mm-yyyy'), 93571);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (17610, 'Edgar  Holeman', to_date('17-06-2005', 'dd-mm-yyyy'), 71549);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52649, 'Mary  Lauper', to_date('03-03-1994', 'dd-mm-yyyy'), 87589);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (87987, 'Fisher  Fariq', to_date('06-10-1990', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14008, 'Kid  Detmer', to_date('12-10-1992', 'dd-mm-yyyy'), 61686);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12227, 'Jose  Winter', to_date('16-08-2014', 'dd-mm-yyyy'), 78576);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50156, 'Alex  Hiatt', to_date('31-08-1996', 'dd-mm-yyyy'), 35534);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85062, 'Corey  Twilley', to_date('22-09-2020', 'dd-mm-yyyy'), 55157);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55236, 'Maria  Baker', to_date('11-11-2002', 'dd-mm-yyyy'), 98971);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62016, 'Mena  Tarantino', to_date('01-01-1998', 'dd-mm-yyyy'), 53251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19315, 'Rita  Schwarzen', to_date('20-02-2005', 'dd-mm-yyyy'), 34767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40859, 'Cyndi  Hagerty', to_date('14-07-2012', 'dd-mm-yyyy'), 76933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (80889, 'Chrissie  Costn', to_date('04-02-1996', 'dd-mm-yyyy'), 27926);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70984, 'Russell  Patill', to_date('04-08-2001', 'dd-mm-yyyy'), 94728);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11639, 'Lloyd  Tennison', to_date('15-06-2005', 'dd-mm-yyyy'), 39612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54824, 'Neil  Rankin', to_date('28-03-2014', 'dd-mm-yyyy'), 19631);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (82337, 'Junior  Leto', to_date('30-11-1997', 'dd-mm-yyyy'), 41987);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12897, 'Adrien  Stevens', to_date('16-02-1997', 'dd-mm-yyyy'), 13778);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13580, 'Diamond  Thornt', to_date('14-04-1995', 'dd-mm-yyyy'), 68132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (33352, 'Rob  Isaacs', to_date('16-10-2020', 'dd-mm-yyyy'), 87589);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99250, 'Johnnie  Torn', to_date('27-03-1991', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11649, 'Illeana  Dench', to_date('01-06-1990', 'dd-mm-yyyy'), 61621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63085, 'Thomas  Teng', to_date('09-12-2003', 'dd-mm-yyyy'), 62716);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97402, 'Cole  Rourke', to_date('17-04-2008', 'dd-mm-yyyy'), 79847);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31044, 'Ewan  Berry', to_date('09-04-2008', 'dd-mm-yyyy'), 68783);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (53169, 'Dabney  Allan', to_date('28-09-2012', 'dd-mm-yyyy'), 78146);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57201, 'Frank  Checker', to_date('01-05-2014', 'dd-mm-yyyy'), 71955);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23399, 'Nicolas  Allen', to_date('04-04-1992', 'dd-mm-yyyy'), 27129);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62028, 'Orlando  Miller', to_date('12-06-2001', 'dd-mm-yyyy'), 31622);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72363, 'Alex  Spacek', to_date('16-01-1993', 'dd-mm-yyyy'), 13752);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (99977, 'Nelly  Kingsley', to_date('15-01-2007', 'dd-mm-yyyy'), 24374);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97320, 'Vonda  McNarlan', to_date('21-08-2018', 'dd-mm-yyyy'), 83674);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57427, 'Larnelle  Cochr', to_date('16-03-2011', 'dd-mm-yyyy'), 73568);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47205, 'Keith  Tankard', to_date('29-03-2011', 'dd-mm-yyyy'), 62184);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (42009, 'Marlon  Devine', to_date('07-11-2013', 'dd-mm-yyyy'), 76933);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52449, 'Roscoe  Linebac', to_date('10-11-2003', 'dd-mm-yyyy'), 42858);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (55818, 'Rupert  Borgnin', to_date('02-05-2011', 'dd-mm-yyyy'), 44887);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92955, 'Dustin  Gambon', to_date('28-05-2017', 'dd-mm-yyyy'), 22758);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (71749, 'Wayman  Waite', to_date('04-12-2013', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74878, 'Fionnula  Ness', to_date('15-11-1997', 'dd-mm-yyyy'), 93325);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22454, 'Manu  Zevon', to_date('31-01-1996', 'dd-mm-yyyy'), 39232);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64805, 'Juice  Frampton', to_date('02-12-1996', 'dd-mm-yyyy'), 69226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (85485, 'Tilda  McFadden', to_date('03-09-2008', 'dd-mm-yyyy'), 15669);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90153, 'Millie  Neville', to_date('06-06-1997', 'dd-mm-yyyy'), 22292);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20432, 'Max  Heslov', to_date('23-08-2014', 'dd-mm-yyyy'), 93325);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19244, 'Joy  Byrd', to_date('15-03-1991', 'dd-mm-yyyy'), 24544);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96121, 'Vince  Coyote', to_date('12-03-2000', 'dd-mm-yyyy'), 16153);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65173, 'Jude  Avital', to_date('01-11-1991', 'dd-mm-yyyy'), 68132);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35263, 'Lindsay  Sizemo', to_date('16-11-2020', 'dd-mm-yyyy'), 53251);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90260, 'Meryl  Porter', to_date('30-03-2010', 'dd-mm-yyyy'), 46554);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (78374, 'Barbara  Caviez', to_date('06-03-2008', 'dd-mm-yyyy'), 34788);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10377, 'Sinead  Bridges', to_date('22-10-2002', 'dd-mm-yyyy'), 16248);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40053, 'Rosanne  Kravit', to_date('23-02-2002', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37294, 'Merillee  Laws', to_date('29-10-2004', 'dd-mm-yyyy'), 96859);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (49790, 'Morgan  Gordon', to_date('09-05-2020', 'dd-mm-yyyy'), 45647);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90878, 'Hazel  Weaver', to_date('14-08-2011', 'dd-mm-yyyy'), 87287);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20762, 'Melanie  Darren', to_date('01-02-1992', 'dd-mm-yyyy'), 74868);
commit;
prompt 1900 records committed...
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72298, 'Ving  McFerrin', to_date('13-12-2011', 'dd-mm-yyyy'), 68226);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26804, 'Wayman  Hanks', to_date('03-12-1995', 'dd-mm-yyyy'), 72641);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (31311, 'Caroline  Barne', to_date('14-09-2014', 'dd-mm-yyyy'), 15945);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (50531, 'Isaac  Hart', to_date('18-04-2013', 'dd-mm-yyyy'), 51336);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23366, 'Viggo  Stigers', to_date('02-12-2006', 'dd-mm-yyyy'), 85767);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (10160, 'Raul  Santa Ros', to_date('09-03-2018', 'dd-mm-yyyy'), 95552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (45641, 'Colleen  Mercha', to_date('05-09-1992', 'dd-mm-yyyy'), 97814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95369, 'Christina  Tolk', to_date('24-08-2003', 'dd-mm-yyyy'), 14681);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23257, 'Claire  Arquett', to_date('30-06-1993', 'dd-mm-yyyy'), 48844);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (19608, 'Rhona  Rhys-Dav', to_date('09-07-2019', 'dd-mm-yyyy'), 54183);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (64571, 'Gary  Burns', to_date('06-07-2018', 'dd-mm-yyyy'), 29195);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88235, 'Petula  Johanss', to_date('03-03-2004', 'dd-mm-yyyy'), 76886);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (32168, 'Guy  Vicious', to_date('20-09-2004', 'dd-mm-yyyy'), 86265);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73267, 'Horace  Hatfiel', to_date('25-12-1994', 'dd-mm-yyyy'), 36437);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (73926, 'Laura  Osmond', to_date('03-09-1995', 'dd-mm-yyyy'), 43592);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (15277, 'Corey  Raybon', to_date('10-12-1996', 'dd-mm-yyyy'), 65857);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72839, 'Sandra  Dunst', to_date('22-04-2004', 'dd-mm-yyyy'), 64313);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (96700, 'Thora  Hanks', to_date('29-05-2019', 'dd-mm-yyyy'), 12279);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (72969, 'Brooke  Snipes', to_date('28-04-2010', 'dd-mm-yyyy'), 31567);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (12566, 'Charlize  Flack', to_date('07-11-1995', 'dd-mm-yyyy'), 56798);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27562, 'Bridgette  Bruc', to_date('17-06-2009', 'dd-mm-yyyy'), 99869);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57568, 'Toshiro  Hawkin', to_date('10-03-1999', 'dd-mm-yyyy'), 24544);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (79678, 'Louise  Damon', to_date('23-09-2010', 'dd-mm-yyyy'), 71124);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47321, 'Hugh  Graham', to_date('17-01-2003', 'dd-mm-yyyy'), 54799);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (61805, 'Gil  Wine', to_date('06-06-2015', 'dd-mm-yyyy'), 98451);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35741, 'Mekhi  Stevenso', to_date('15-02-2011', 'dd-mm-yyyy'), 62424);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (47751, 'Woody  McCready', to_date('14-02-2008', 'dd-mm-yyyy'), 22312);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22721, 'Boyd  Caviezel', to_date('02-02-2001', 'dd-mm-yyyy'), 54799);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (89725, 'Sal  Waits', to_date('13-06-2009', 'dd-mm-yyyy'), 27848);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (65550, 'Jann  Craddock', to_date('05-03-1996', 'dd-mm-yyyy'), 39232);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27780, 'Parker  Tucker', to_date('30-09-1999', 'dd-mm-yyyy'), 83225);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (70897, 'Peter  Stallone', to_date('10-01-1997', 'dd-mm-yyyy'), 79847);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (18832, 'Raul  Emmett', to_date('13-05-2001', 'dd-mm-yyyy'), 57122);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (56754, 'Reese  Kretschm', to_date('22-04-2013', 'dd-mm-yyyy'), 15136);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (92385, 'Judy  MacDonald', to_date('07-02-1995', 'dd-mm-yyyy'), 34565);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (23458, 'Gailard  Brooks', to_date('23-09-2017', 'dd-mm-yyyy'), 45612);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (16286, 'Woody  Christie', to_date('04-06-1990', 'dd-mm-yyyy'), 37552);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (98506, 'Mira  Stamp', to_date('12-09-1991', 'dd-mm-yyyy'), 92879);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35831, 'Powers  Romijn-', to_date('09-09-1995', 'dd-mm-yyyy'), 23738);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (29455, 'Thin  McCracken', to_date('01-09-2005', 'dd-mm-yyyy'), 37197);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (35209, 'Austin  McGinle', to_date('06-08-2011', 'dd-mm-yyyy'), 97814);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (27243, 'Keanu  Viterell', to_date('19-03-2014', 'dd-mm-yyyy'), 82637);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (13561, 'Terrence  Jones', to_date('06-06-1999', 'dd-mm-yyyy'), 24621);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (57558, 'Antonio  Iglesi', to_date('22-07-2008', 'dd-mm-yyyy'), 62424);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (41099, 'Juliana  Rickle', to_date('19-09-2016', 'dd-mm-yyyy'), 51228);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (54463, 'Frankie  Finney', to_date('18-11-1994', 'dd-mm-yyyy'), 28733);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (25597, 'Gino  Brown', to_date('24-07-1991', 'dd-mm-yyyy'), 52655);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (63321, 'Howard  Irons', to_date('24-08-2002', 'dd-mm-yyyy'), 81149);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (26869, 'Lari  Rosas', to_date('05-07-2019', 'dd-mm-yyyy'), 26252);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90555, 'Mos  Choice', to_date('06-12-2012', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30391, 'Keanu  Sanders', to_date('30-11-1998', 'dd-mm-yyyy'), 54532);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (83201, 'Bernard  Gambon', to_date('03-02-1997', 'dd-mm-yyyy'), 37779);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (28605, 'Ving  Houston', to_date('29-07-2012', 'dd-mm-yyyy'), 73455);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22943, 'Luis  Sledge', to_date('03-02-2005', 'dd-mm-yyyy'), 85492);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (74620, 'Cesar  Kapanka', to_date('02-09-2013', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (37870, 'Emilio  Frampto', to_date('02-07-1991', 'dd-mm-yyyy'), 34524);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (48019, 'Kate  Kudrow', to_date('10-01-2008', 'dd-mm-yyyy'), 28468);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (52126, 'Boz  Buckingham', to_date('17-04-2001', 'dd-mm-yyyy'), 74481);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (95446, 'Rosanne  Farina', to_date('19-09-2002', 'dd-mm-yyyy'), 31567);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (11520, 'Olga  Hawn', to_date('07-04-2016', 'dd-mm-yyyy'), 67288);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (62223, 'Alice  McIntyre', to_date('12-11-2003', 'dd-mm-yyyy'), 18843);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (97114, 'Hal  Burstyn', to_date('17-04-1992', 'dd-mm-yyyy'), 52655);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (68992, 'Melanie  Goldwy', to_date('20-11-2009', 'dd-mm-yyyy'), 37368);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (81708, 'Franz  Badalucc', to_date('30-01-1998', 'dd-mm-yyyy'), 47943);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (20940, 'Nastassja  Rhod', to_date('27-08-1995', 'dd-mm-yyyy'), 47415);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (30333, 'Sheryl  Pleasur', to_date('16-12-2010', 'dd-mm-yyyy'), 29411);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (22007, 'Nikki  Rains', to_date('12-09-1994', 'dd-mm-yyyy'), 25119);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (90340, 'William  Hutch', to_date('12-02-2005', 'dd-mm-yyyy'), 78666);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (14652, 'Joseph  Adkins', to_date('31-10-2005', 'dd-mm-yyyy'), 42385);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (40356, 'Gwyneth  Kadiso', to_date('12-05-1995', 'dd-mm-yyyy'), 75745);
insert into EMPLOYEE (e_id, e_name, hire_date, c_id)
values (88821, 'Ossie  Payton', to_date('22-04-2018', 'dd-mm-yyyy'), 88824);
commit;
prompt 1971 records loaded
prompt Loading GUIDE...
insert into GUIDE (g_id, experience, e_id)
values (1312, 30, 2586);
insert into GUIDE (g_id, experience, e_id)
values (3781, 22.7, 2790);
insert into GUIDE (g_id, experience, e_id)
values (3392, 5.5, 1965);
insert into GUIDE (g_id, experience, e_id)
values (1714, 13.5, 5139);
insert into GUIDE (g_id, experience, e_id)
values (3738, 15.5, 1826);
insert into GUIDE (g_id, experience, e_id)
values (4529, 25.9, 6802);
insert into GUIDE (g_id, experience, e_id)
values (3496, 23.2, 4579);
insert into GUIDE (g_id, experience, e_id)
values (2746, 23.6, 4163);
insert into GUIDE (g_id, experience, e_id)
values (3577, 15.2, 9117);
insert into GUIDE (g_id, experience, e_id)
values (2309, 28.5, 4228);
insert into GUIDE (g_id, experience, e_id)
values (2368, 22.4, 1202);
insert into GUIDE (g_id, experience, e_id)
values (1649, 16.9, 3094);
insert into GUIDE (g_id, experience, e_id)
values (4860, 30.5, 2372);
insert into GUIDE (g_id, experience, e_id)
values (1621, 31.1, 3559);
insert into GUIDE (g_id, experience, e_id)
values (3784, 0, 3959);
insert into GUIDE (g_id, experience, e_id)
values (1009, 33.5, 3083);
insert into GUIDE (g_id, experience, e_id)
values (4950, 33.1, 3083);
insert into GUIDE (g_id, experience, e_id)
values (2917, 39.3, 3931);
insert into GUIDE (g_id, experience, e_id)
values (2726, .2, 3933);
insert into GUIDE (g_id, experience, e_id)
values (2723, 23.7, 2877);
insert into GUIDE (g_id, experience, e_id)
values (3205, 21.6, 5355);
insert into GUIDE (g_id, experience, e_id)
values (1607, 37, 4623);
insert into GUIDE (g_id, experience, e_id)
values (2252, 21.4, 7788);
insert into GUIDE (g_id, experience, e_id)
values (1701, 17.6, 7860);
insert into GUIDE (g_id, experience, e_id)
values (4783, 16.4, 9907);
insert into GUIDE (g_id, experience, e_id)
values (4136, 10.1, 1394);
insert into GUIDE (g_id, experience, e_id)
values (4561, 8.7, 4197);
insert into GUIDE (g_id, experience, e_id)
values (2971, 2.8, 5687);
insert into GUIDE (g_id, experience, e_id)
values (1111, 17.3, 5609);
insert into GUIDE (g_id, experience, e_id)
values (2491, 4.6, 9627);
insert into GUIDE (g_id, experience, e_id)
values (3348, 33.9, 8370);
insert into GUIDE (g_id, experience, e_id)
values (4894, 37, 5495);
insert into GUIDE (g_id, experience, e_id)
values (3411, 21.7, 6144);
insert into GUIDE (g_id, experience, e_id)
values (4205, 38.4, 8708);
insert into GUIDE (g_id, experience, e_id)
values (2245, 20.2, 4579);
insert into GUIDE (g_id, experience, e_id)
values (3937, 29.9, 8835);
insert into GUIDE (g_id, experience, e_id)
values (1617, 17.8, 4813);
insert into GUIDE (g_id, experience, e_id)
values (3898, 38.7, 7174);
insert into GUIDE (g_id, experience, e_id)
values (2169, .6, 3959);
insert into GUIDE (g_id, experience, e_id)
values (2041, 10.1, 7587);
insert into GUIDE (g_id, experience, e_id)
values (1254, 18.5, 1598);
insert into GUIDE (g_id, experience, e_id)
values (3259, 15.2, 8587);
insert into GUIDE (g_id, experience, e_id)
values (4261, 18.6, 7770);
insert into GUIDE (g_id, experience, e_id)
values (1081, 6.5, 5511);
insert into GUIDE (g_id, experience, e_id)
values (3113, 22.2, 5175);
insert into GUIDE (g_id, experience, e_id)
values (3649, 15.8, 9580);
insert into GUIDE (g_id, experience, e_id)
values (2495, 28.8, 3996);
insert into GUIDE (g_id, experience, e_id)
values (3269, 24.4, 9580);
insert into GUIDE (g_id, experience, e_id)
values (4659, 9.5, 8645);
insert into GUIDE (g_id, experience, e_id)
values (3139, 9.1, 4533);
insert into GUIDE (g_id, experience, e_id)
values (4930, 1.1, 5117);
insert into GUIDE (g_id, experience, e_id)
values (2494, 13.8, 9905);
insert into GUIDE (g_id, experience, e_id)
values (1371, 39.1, 4517);
insert into GUIDE (g_id, experience, e_id)
values (3846, 12.6, 7002);
insert into GUIDE (g_id, experience, e_id)
values (1504, 38.3, 9498);
insert into GUIDE (g_id, experience, e_id)
values (4210, 6.2, 6896);
insert into GUIDE (g_id, experience, e_id)
values (4633, 35.1, 3353);
insert into GUIDE (g_id, experience, e_id)
values (1667, 22.6, 6700);
insert into GUIDE (g_id, experience, e_id)
values (4603, 36.7, 7561);
insert into GUIDE (g_id, experience, e_id)
values (2773, 11.6, 2570);
insert into GUIDE (g_id, experience, e_id)
values (3049, 14.7, 2793);
insert into GUIDE (g_id, experience, e_id)
values (3042, 18.4, 5117);
insert into GUIDE (g_id, experience, e_id)
values (4883, 14.6, 5429);
insert into GUIDE (g_id, experience, e_id)
values (4091, 36.3, 4449);
insert into GUIDE (g_id, experience, e_id)
values (4324, 33.4, 7174);
insert into GUIDE (g_id, experience, e_id)
values (2824, 1, 3588);
insert into GUIDE (g_id, experience, e_id)
values (1661, 3.5, 1532);
insert into GUIDE (g_id, experience, e_id)
values (2204, 39.4, 1034);
insert into GUIDE (g_id, experience, e_id)
values (4951, 1.1, 4204);
insert into GUIDE (g_id, experience, e_id)
values (3843, 8.2, 2163);
insert into GUIDE (g_id, experience, e_id)
values (4977, 31.3, 3946);
insert into GUIDE (g_id, experience, e_id)
values (3620, 16.4, 6554);
insert into GUIDE (g_id, experience, e_id)
values (1698, 10.8, 5339);
insert into GUIDE (g_id, experience, e_id)
values (2574, 30.9, 7701);
insert into GUIDE (g_id, experience, e_id)
values (2964, 11.9, 1515);
insert into GUIDE (g_id, experience, e_id)
values (1109, 2.6, 9832);
insert into GUIDE (g_id, experience, e_id)
values (1065, 28.8, 2793);
insert into GUIDE (g_id, experience, e_id)
values (3441, 19, 7174);
insert into GUIDE (g_id, experience, e_id)
values (1829, 15.2, 6059);
insert into GUIDE (g_id, experience, e_id)
values (2394, 36.5, 3476);
insert into GUIDE (g_id, experience, e_id)
values (4717, 5.7, 2052);
insert into GUIDE (g_id, experience, e_id)
values (3258, 23.7, 2583);
insert into GUIDE (g_id, experience, e_id)
values (3726, 18, 8001);
insert into GUIDE (g_id, experience, e_id)
values (4076, 28.5, 7125);
insert into GUIDE (g_id, experience, e_id)
values (2801, 17.1, 3899);
insert into GUIDE (g_id, experience, e_id)
values (2716, 6, 7788);
insert into GUIDE (g_id, experience, e_id)
values (2592, 9.5, 8476);
insert into GUIDE (g_id, experience, e_id)
values (2111, 13.8, 2378);
insert into GUIDE (g_id, experience, e_id)
values (1870, 28.1, 3226);
insert into GUIDE (g_id, experience, e_id)
values (1337, 18.5, 5357);
insert into GUIDE (g_id, experience, e_id)
values (4030, 36.6, 2877);
insert into GUIDE (g_id, experience, e_id)
values (3047, 4.7, 4579);
insert into GUIDE (g_id, experience, e_id)
values (3233, 5.6, 1434);
insert into GUIDE (g_id, experience, e_id)
values (4192, 29.2, 1937);
insert into GUIDE (g_id, experience, e_id)
values (1460, 14.8, 6573);
insert into GUIDE (g_id, experience, e_id)
values (1716, 31.8, 7715);
insert into GUIDE (g_id, experience, e_id)
values (3426, 22.9, 8543);
insert into GUIDE (g_id, experience, e_id)
values (4670, 13.6, 4128);
insert into GUIDE (g_id, experience, e_id)
values (2037, 21.8, 4426);
insert into GUIDE (g_id, experience, e_id)
values (4909, 16.5, 9874);
commit;
prompt 100 records committed...
insert into GUIDE (g_id, experience, e_id)
values (2063, 37.7, 1451);
insert into GUIDE (g_id, experience, e_id)
values (2336, 5.2, 5413);
insert into GUIDE (g_id, experience, e_id)
values (1549, 8.9, 8950);
insert into GUIDE (g_id, experience, e_id)
values (1679, .2, 3027);
insert into GUIDE (g_id, experience, e_id)
values (3308, 1.3, 4457);
insert into GUIDE (g_id, experience, e_id)
values (4368, 4.7, 1764);
insert into GUIDE (g_id, experience, e_id)
values (3201, 32, 7359);
insert into GUIDE (g_id, experience, e_id)
values (4313, 5.2, 1324);
insert into GUIDE (g_id, experience, e_id)
values (3340, 23.9, 4692);
insert into GUIDE (g_id, experience, e_id)
values (3882, 18, 8923);
insert into GUIDE (g_id, experience, e_id)
values (2057, 11.1, 9500);
insert into GUIDE (g_id, experience, e_id)
values (4418, 23.3, 1604);
insert into GUIDE (g_id, experience, e_id)
values (2679, 3.2, 5561);
insert into GUIDE (g_id, experience, e_id)
values (2000, 7.3, 7106);
insert into GUIDE (g_id, experience, e_id)
values (2616, 8.3, 3293);
insert into GUIDE (g_id, experience, e_id)
values (3243, 16.2, 2769);
insert into GUIDE (g_id, experience, e_id)
values (4374, .2, 2283);
insert into GUIDE (g_id, experience, e_id)
values (2133, 38.5, 8645);
insert into GUIDE (g_id, experience, e_id)
values (4107, 35.8, 8318);
insert into GUIDE (g_id, experience, e_id)
values (3301, 28.9, 2778);
insert into GUIDE (g_id, experience, e_id)
values (4547, 9.3, 4393);
insert into GUIDE (g_id, experience, e_id)
values (2140, 1.1, 4813);
insert into GUIDE (g_id, experience, e_id)
values (4660, 6.4, 7281);
insert into GUIDE (g_id, experience, e_id)
values (1899, 38.8, 5448);
insert into GUIDE (g_id, experience, e_id)
values (1700, 25.9, 7328);
insert into GUIDE (g_id, experience, e_id)
values (4689, 38.9, 9775);
insert into GUIDE (g_id, experience, e_id)
values (3395, 21, 8949);
insert into GUIDE (g_id, experience, e_id)
values (1396, .8, 4325);
insert into GUIDE (g_id, experience, e_id)
values (4360, 30.9, 3616);
insert into GUIDE (g_id, experience, e_id)
values (3108, 35.5, 3104);
insert into GUIDE (g_id, experience, e_id)
values (4507, 34.6, 2583);
insert into GUIDE (g_id, experience, e_id)
values (3993, 40, 6032);
insert into GUIDE (g_id, experience, e_id)
values (1604, .3, 6879);
insert into GUIDE (g_id, experience, e_id)
values (1066, 30, 4541);
insert into GUIDE (g_id, experience, e_id)
values (4389, 35.8, 5460);
insert into GUIDE (g_id, experience, e_id)
values (3867, 30, 2026);
insert into GUIDE (g_id, experience, e_id)
values (2065, 16.8, 7878);
insert into GUIDE (g_id, experience, e_id)
values (1377, 10.4, 1906);
insert into GUIDE (g_id, experience, e_id)
values (3886, 1.3, 1034);
insert into GUIDE (g_id, experience, e_id)
values (2474, 11.5, 3940);
insert into GUIDE (g_id, experience, e_id)
values (3935, 13.5, 4579);
insert into GUIDE (g_id, experience, e_id)
values (4243, 17.8, 6513);
insert into GUIDE (g_id, experience, e_id)
values (2949, 14, 7209);
insert into GUIDE (g_id, experience, e_id)
values (3642, 25.6, 2283);
insert into GUIDE (g_id, experience, e_id)
values (3131, 32.5, 7722);
insert into GUIDE (g_id, experience, e_id)
values (1955, 10.9, 6923);
insert into GUIDE (g_id, experience, e_id)
values (2626, 25.1, 2859);
insert into GUIDE (g_id, experience, e_id)
values (1099, 21.8, 9978);
insert into GUIDE (g_id, experience, e_id)
values (1330, 34.4, 3975);
insert into GUIDE (g_id, experience, e_id)
values (2556, 17.6, 1697);
insert into GUIDE (g_id, experience, e_id)
values (1635, 14.1, 7428);
insert into GUIDE (g_id, experience, e_id)
values (1885, 23.7, 5461);
insert into GUIDE (g_id, experience, e_id)
values (3224, 17.6, 2163);
insert into GUIDE (g_id, experience, e_id)
values (4585, 12.4, 8001);
insert into GUIDE (g_id, experience, e_id)
values (3330, 37, 5495);
insert into GUIDE (g_id, experience, e_id)
values (4903, 17.7, 4124);
insert into GUIDE (g_id, experience, e_id)
values (4157, 21.8, 4204);
insert into GUIDE (g_id, experience, e_id)
values (4174, 36.2, 4032);
insert into GUIDE (g_id, experience, e_id)
values (3795, 1.9, 3500);
insert into GUIDE (g_id, experience, e_id)
values (1392, 36.2, 6577);
insert into GUIDE (g_id, experience, e_id)
values (3048, 38.5, 9549);
insert into GUIDE (g_id, experience, e_id)
values (3211, 37.8, 4927);
insert into GUIDE (g_id, experience, e_id)
values (1708, 25.9, 8833);
insert into GUIDE (g_id, experience, e_id)
values (3480, 16.9, 2995);
insert into GUIDE (g_id, experience, e_id)
values (1423, 25.5, 1094);
insert into GUIDE (g_id, experience, e_id)
values (2249, 11.7, 5592);
insert into GUIDE (g_id, experience, e_id)
values (1531, 37.1, 7057);
insert into GUIDE (g_id, experience, e_id)
values (4897, 32, 6932);
insert into GUIDE (g_id, experience, e_id)
values (2389, 37.6, 2431);
insert into GUIDE (g_id, experience, e_id)
values (4133, 32.4, 6750);
insert into GUIDE (g_id, experience, e_id)
values (1017, 33.2, 4124);
insert into GUIDE (g_id, experience, e_id)
values (3223, 32.4, 9819);
insert into GUIDE (g_id, experience, e_id)
values (1583, 37.4, 5231);
insert into GUIDE (g_id, experience, e_id)
values (4164, 14.7, 2242);
insert into GUIDE (g_id, experience, e_id)
values (3627, 23.9, 9920);
insert into GUIDE (g_id, experience, e_id)
values (1928, 22.4, 8696);
insert into GUIDE (g_id, experience, e_id)
values (3181, 37.3, 3247);
insert into GUIDE (g_id, experience, e_id)
values (3617, 2.4, 3036);
insert into GUIDE (g_id, experience, e_id)
values (1389, 17.1, 6635);
insert into GUIDE (g_id, experience, e_id)
values (3558, 31.6, 9958);
insert into GUIDE (g_id, experience, e_id)
values (3019, 38.7, 2120);
insert into GUIDE (g_id, experience, e_id)
values (4411, 34, 8443);
insert into GUIDE (g_id, experience, e_id)
values (2799, 15.7, 2570);
insert into GUIDE (g_id, experience, e_id)
values (2350, 17.9, 2683);
insert into GUIDE (g_id, experience, e_id)
values (1883, 38.9, 7281);
insert into GUIDE (g_id, experience, e_id)
values (3753, 7.7, 2330);
insert into GUIDE (g_id, experience, e_id)
values (1275, 3.8, 9775);
insert into GUIDE (g_id, experience, e_id)
values (1609, 9.2, 9639);
insert into GUIDE (g_id, experience, e_id)
values (1051, 30, 3959);
insert into GUIDE (g_id, experience, e_id)
values (4573, 15.4, 2165);
insert into GUIDE (g_id, experience, e_id)
values (4782, 29.3, 5733);
insert into GUIDE (g_id, experience, e_id)
values (2150, 37.5, 5524);
insert into GUIDE (g_id, experience, e_id)
values (1117, 4, 5495);
insert into GUIDE (g_id, experience, e_id)
values (2549, 26.7, 4517);
insert into GUIDE (g_id, experience, e_id)
values (4142, 23, 2116);
insert into GUIDE (g_id, experience, e_id)
values (1112, 32.9, 4927);
insert into GUIDE (g_id, experience, e_id)
values (2198, 24.1, 6278);
insert into GUIDE (g_id, experience, e_id)
values (3550, 13.1, 5183);
insert into GUIDE (g_id, experience, e_id)
values (2636, .3, 4195);
insert into GUIDE (g_id, experience, e_id)
values (1476, 11, 3931);
commit;
prompt 200 records committed...
insert into GUIDE (g_id, experience, e_id)
values (4551, 39.2, 4541);
insert into GUIDE (g_id, experience, e_id)
values (2291, 14, 4397);
insert into GUIDE (g_id, experience, e_id)
values (2415, 24.8, 9709);
insert into GUIDE (g_id, experience, e_id)
values (1576, 21.8, 3500);
insert into GUIDE (g_id, experience, e_id)
values (1683, 1.5, 8949);
insert into GUIDE (g_id, experience, e_id)
values (2036, 13.4, 1747);
insert into GUIDE (g_id, experience, e_id)
values (4326, 2, 2855);
insert into GUIDE (g_id, experience, e_id)
values (2931, 13.3, 1663);
insert into GUIDE (g_id, experience, e_id)
values (3024, 22.3, 2116);
insert into GUIDE (g_id, experience, e_id)
values (4139, 30.3, 1551);
insert into GUIDE (g_id, experience, e_id)
values (2677, 19.7, 9610);
insert into GUIDE (g_id, experience, e_id)
values (3704, 17, 4175);
insert into GUIDE (g_id, experience, e_id)
values (4191, 28.4, 5175);
insert into GUIDE (g_id, experience, e_id)
values (1244, 31, 1785);
insert into GUIDE (g_id, experience, e_id)
values (1537, 6.2, 1034);
insert into GUIDE (g_id, experience, e_id)
values (2105, 31, 1358);
insert into GUIDE (g_id, experience, e_id)
values (3943, 31.8, 9514);
insert into GUIDE (g_id, experience, e_id)
values (4976, 5.5, 3692);
insert into GUIDE (g_id, experience, e_id)
values (4110, .7, 4923);
insert into GUIDE (g_id, experience, e_id)
values (3874, 17, 9610);
insert into GUIDE (g_id, experience, e_id)
values (3884, 38.2, 6292);
insert into GUIDE (g_id, experience, e_id)
values (3750, 27.1, 1083);
insert into GUIDE (g_id, experience, e_id)
values (2369, 22.6, 7359);
insert into GUIDE (g_id, experience, e_id)
values (3901, 18, 7996);
insert into GUIDE (g_id, experience, e_id)
values (4518, 13.1, 3729);
insert into GUIDE (g_id, experience, e_id)
values (2193, 8, 7932);
insert into GUIDE (g_id, experience, e_id)
values (3931, 32, 1083);
insert into GUIDE (g_id, experience, e_id)
values (3616, 8.4, 6115);
insert into GUIDE (g_id, experience, e_id)
values (1387, 5.5, 8344);
insert into GUIDE (g_id, experience, e_id)
values (1552, 6.7, 6065);
insert into GUIDE (g_id, experience, e_id)
values (1912, 29.8, 8514);
insert into GUIDE (g_id, experience, e_id)
values (4569, 37.8, 4128);
insert into GUIDE (g_id, experience, e_id)
values (2659, 18.3, 1083);
insert into GUIDE (g_id, experience, e_id)
values (1647, 16.4, 2052);
insert into GUIDE (g_id, experience, e_id)
values (1606, 35.1, 1625);
insert into GUIDE (g_id, experience, e_id)
values (1534, 17.9, 9472);
insert into GUIDE (g_id, experience, e_id)
values (3386, 16.3, 4124);
insert into GUIDE (g_id, experience, e_id)
values (3221, 3.8, 6879);
insert into GUIDE (g_id, experience, e_id)
values (1031, 22.1, 9709);
insert into GUIDE (g_id, experience, e_id)
values (3828, 10.8, 8833);
insert into GUIDE (g_id, experience, e_id)
values (3076, 17.6, 6554);
insert into GUIDE (g_id, experience, e_id)
values (2628, 5.2, 3843);
insert into GUIDE (g_id, experience, e_id)
values (4675, 0, 9639);
insert into GUIDE (g_id, experience, e_id)
values (4741, 3.1, 9754);
insert into GUIDE (g_id, experience, e_id)
values (1437, 12.6, 5461);
insert into GUIDE (g_id, experience, e_id)
values (4531, 4.7, 3094);
insert into GUIDE (g_id, experience, e_id)
values (1672, 34.2, 6096);
insert into GUIDE (g_id, experience, e_id)
values (2147, 38.7, 8104);
insert into GUIDE (g_id, experience, e_id)
values (3077, 12, 2242);
insert into GUIDE (g_id, experience, e_id)
values (4177, 10.1, 3933);
insert into GUIDE (g_id, experience, e_id)
values (1746, 35.8, 1761);
insert into GUIDE (g_id, experience, e_id)
values (2347, 34, 3036);
insert into GUIDE (g_id, experience, e_id)
values (3002, 14, 5923);
insert into GUIDE (g_id, experience, e_id)
values (3832, 37.2, 6210);
insert into GUIDE (g_id, experience, e_id)
values (3212, 34.6, 7428);
insert into GUIDE (g_id, experience, e_id)
values (4221, 7, 2271);
insert into GUIDE (g_id, experience, e_id)
values (1705, 11.5, 1620);
insert into GUIDE (g_id, experience, e_id)
values (4355, 20.2, 8425);
insert into GUIDE (g_id, experience, e_id)
values (1726, 26.1, 6049);
insert into GUIDE (g_id, experience, e_id)
values (3670, 9.2, 2753);
insert into GUIDE (g_id, experience, e_id)
values (2507, 8.4, 3672);
insert into GUIDE (g_id, experience, e_id)
values (3849, 28.8, 9874);
insert into GUIDE (g_id, experience, e_id)
values (2091, 32.9, 1761);
insert into GUIDE (g_id, experience, e_id)
values (4964, 5.6, 2165);
insert into GUIDE (g_id, experience, e_id)
values (2122, 37.7, 2583);
insert into GUIDE (g_id, experience, e_id)
values (4016, 35.8, 9209);
insert into GUIDE (g_id, experience, e_id)
values (1851, 31.3, 2426);
insert into GUIDE (g_id, experience, e_id)
values (2174, 11.3, 9117);
insert into GUIDE (g_id, experience, e_id)
values (4074, 11.9, 3055);
insert into GUIDE (g_id, experience, e_id)
values (4051, 10.1, 7932);
insert into GUIDE (g_id, experience, e_id)
values (1197, 16.2, 7289);
insert into GUIDE (g_id, experience, e_id)
values (2173, 30.7, 2570);
insert into GUIDE (g_id, experience, e_id)
values (2878, 38.3, 7028);
insert into GUIDE (g_id, experience, e_id)
values (2427, 35.6, 3588);
insert into GUIDE (g_id, experience, e_id)
values (3271, 30.8, 9580);
insert into GUIDE (g_id, experience, e_id)
values (3136, 36.6, 1518);
insert into GUIDE (g_id, experience, e_id)
values (4556, 27.7, 8654);
insert into GUIDE (g_id, experience, e_id)
values (2942, 16.3, 4559);
insert into GUIDE (g_id, experience, e_id)
values (3633, 24.9, 4124);
insert into GUIDE (g_id, experience, e_id)
values (4799, 22.1, 7878);
insert into GUIDE (g_id, experience, e_id)
values (2509, 27.7, 2431);
insert into GUIDE (g_id, experience, e_id)
values (1881, 5.8, 9771);
insert into GUIDE (g_id, experience, e_id)
values (2974, 1.6, 6645);
insert into GUIDE (g_id, experience, e_id)
values (1405, 14.7, 3933);
insert into GUIDE (g_id, experience, e_id)
values (4215, 2.7, 3027);
insert into GUIDE (g_id, experience, e_id)
values (2762, 39.2, 1094);
insert into GUIDE (g_id, experience, e_id)
values (1148, 2, 2610);
insert into GUIDE (g_id, experience, e_id)
values (3369, 31.6, 3230);
insert into GUIDE (g_id, experience, e_id)
values (2895, .3, 6043);
insert into GUIDE (g_id, experience, e_id)
values (1985, 27.6, 7715);
insert into GUIDE (g_id, experience, e_id)
values (1126, 25.2, 7075);
insert into GUIDE (g_id, experience, e_id)
values (3105, 12.9, 1254);
insert into GUIDE (g_id, experience, e_id)
values (3502, 28.8, 1785);
insert into GUIDE (g_id, experience, e_id)
values (4428, .5, 6896);
insert into GUIDE (g_id, experience, e_id)
values (4499, 3.4, 4449);
insert into GUIDE (g_id, experience, e_id)
values (4319, 19.7, 9849);
insert into GUIDE (g_id, experience, e_id)
values (1273, 12.6, 6138);
insert into GUIDE (g_id, experience, e_id)
values (4571, 27.2, 2813);
insert into GUIDE (g_id, experience, e_id)
values (3865, 1, 5992);
insert into GUIDE (g_id, experience, e_id)
values (3554, 20.3, 2859);
commit;
prompt 300 records committed...
insert into GUIDE (g_id, experience, e_id)
values (2744, 17.1, 8001);
insert into GUIDE (g_id, experience, e_id)
values (2151, 5.9, 8835);
insert into GUIDE (g_id, experience, e_id)
values (4464, 27.2, 9126);
insert into GUIDE (g_id, experience, e_id)
values (3121, 4.9, 1485);
insert into GUIDE (g_id, experience, e_id)
values (2718, 10.3, 4204);
insert into GUIDE (g_id, experience, e_id)
values (2064, 24.6, 3429);
insert into GUIDE (g_id, experience, e_id)
values (2143, 5.6, 6043);
insert into GUIDE (g_id, experience, e_id)
values (2541, 12.2, 5042);
insert into GUIDE (g_id, experience, e_id)
values (3519, 31, 8514);
insert into GUIDE (g_id, experience, e_id)
values (2449, 8.4, 6115);
insert into GUIDE (g_id, experience, e_id)
values (1858, 11.4, 6457);
insert into GUIDE (g_id, experience, e_id)
values (2705, .5, 6923);
insert into GUIDE (g_id, experience, e_id)
values (3540, 29.4, 9844);
insert into GUIDE (g_id, experience, e_id)
values (1935, 3.5, 2378);
insert into GUIDE (g_id, experience, e_id)
values (1235, 2.3, 6321);
insert into GUIDE (g_id, experience, e_id)
values (3333, 22.6, 8654);
insert into GUIDE (g_id, experience, e_id)
values (4403, 37.2, 8635);
insert into GUIDE (g_id, experience, e_id)
values (3586, 17.5, 1234);
insert into GUIDE (g_id, experience, e_id)
values (2517, 8.5, 3027);
insert into GUIDE (g_id, experience, e_id)
values (3796, 9.7, 1480);
insert into GUIDE (g_id, experience, e_id)
values (2110, 22.6, 5561);
insert into GUIDE (g_id, experience, e_id)
values (1199, 36.5, 6292);
insert into GUIDE (g_id, experience, e_id)
values (2365, 36.4, 9383);
insert into GUIDE (g_id, experience, e_id)
values (3871, 39.8, 4397);
insert into GUIDE (g_id, experience, e_id)
values (1914, 19.9, 6832);
insert into GUIDE (g_id, experience, e_id)
values (4672, 33.9, 6577);
insert into GUIDE (g_id, experience, e_id)
values (1948, 29.8, 3843);
insert into GUIDE (g_id, experience, e_id)
values (1848, 17.8, 3230);
insert into GUIDE (g_id, experience, e_id)
values (3172, 29.7, 8570);
insert into GUIDE (g_id, experience, e_id)
values (3376, 16.3, 9580);
insert into GUIDE (g_id, experience, e_id)
values (2900, 10.7, 3549);
insert into GUIDE (g_id, experience, e_id)
values (1067, 38.4, 4896);
insert into GUIDE (g_id, experience, e_id)
values (4372, 15.9, 6065);
insert into GUIDE (g_id, experience, e_id)
values (4304, 9.6, 1786);
insert into GUIDE (g_id, experience, e_id)
values (1874, 19.8, 3100);
insert into GUIDE (g_id, experience, e_id)
values (2027, 7.2, 5208);
insert into GUIDE (g_id, experience, e_id)
values (3905, 26.7, 8708);
insert into GUIDE (g_id, experience, e_id)
values (2787, 11.5, 6700);
insert into GUIDE (g_id, experience, e_id)
values (1816, 11.4, 9453);
insert into GUIDE (g_id, experience, e_id)
values (2404, 14.7, 4315);
insert into GUIDE (g_id, experience, e_id)
values (1143, 39.4, 3104);
insert into GUIDE (g_id, experience, e_id)
values (1597, 10.5, 6292);
insert into GUIDE (g_id, experience, e_id)
values (2058, 13.8, 8514);
insert into GUIDE (g_id, experience, e_id)
values (4285, 26.2, 7587);
insert into GUIDE (g_id, experience, e_id)
values (2553, 15, 8391);
insert into GUIDE (g_id, experience, e_id)
values (2338, 29.8, 1051);
insert into GUIDE (g_id, experience, e_id)
values (3401, 29, 7057);
insert into GUIDE (g_id, experience, e_id)
values (4705, 34.3, 4517);
insert into GUIDE (g_id, experience, e_id)
values (3908, 1.4, 2583);
insert into GUIDE (g_id, experience, e_id)
values (3421, 9, 9736);
insert into GUIDE (g_id, experience, e_id)
values (4212, 9.7, 1919);
insert into GUIDE (g_id, experience, e_id)
values (1269, 21.9, 4578);
insert into GUIDE (g_id, experience, e_id)
values (3716, 37, 5561);
insert into GUIDE (g_id, experience, e_id)
values (4971, 31.4, 8041);
insert into GUIDE (g_id, experience, e_id)
values (2240, 3.1, 3148);
insert into GUIDE (g_id, experience, e_id)
values (1139, 39.2, 7197);
insert into GUIDE (g_id, experience, e_id)
values (4722, 21.9, 1234);
insert into GUIDE (g_id, experience, e_id)
values (1971, 10.8, 7428);
insert into GUIDE (g_id, experience, e_id)
values (1741, 37.5, 6450);
insert into GUIDE (g_id, experience, e_id)
values (4728, 34, 9832);
insert into GUIDE (g_id, experience, e_id)
values (1957, 5.7, 8390);
insert into GUIDE (g_id, experience, e_id)
values (1338, 8.1, 8923);
insert into GUIDE (g_id, experience, e_id)
values (3288, 11.3, 1858);
insert into GUIDE (g_id, experience, e_id)
values (3570, 34.6, 2790);
insert into GUIDE (g_id, experience, e_id)
values (4523, .5, 1937);
insert into GUIDE (g_id, experience, e_id)
values (1090, 0, 8645);
insert into GUIDE (g_id, experience, e_id)
values (3191, 23.4, 6029);
insert into GUIDE (g_id, experience, e_id)
values (3289, 10.4, 1786);
insert into GUIDE (g_id, experience, e_id)
values (3095, 28.6, 5333);
insert into GUIDE (g_id, experience, e_id)
values (1434, 30.2, 3728);
insert into GUIDE (g_id, experience, e_id)
values (2159, 11.4, 8231);
insert into GUIDE (g_id, experience, e_id)
values (2580, 1.3, 9252);
insert into GUIDE (g_id, experience, e_id)
values (4408, 34, 5333);
insert into GUIDE (g_id, experience, e_id)
values (4770, 8.3, 6115);
insert into GUIDE (g_id, experience, e_id)
values (3304, 13.1, 9472);
insert into GUIDE (g_id, experience, e_id)
values (4598, 1.7, 9661);
insert into GUIDE (g_id, experience, e_id)
values (4802, 32, 4758);
insert into GUIDE (g_id, experience, e_id)
values (2211, 8.7, 1051);
insert into GUIDE (g_id, experience, e_id)
values (3068, 28, 7175);
insert into GUIDE (g_id, experience, e_id)
values (4612, 5.7, 3935);
insert into GUIDE (g_id, experience, e_id)
values (2798, 37.5, 6103);
insert into GUIDE (g_id, experience, e_id)
values (3230, 19.2, 6896);
insert into GUIDE (g_id, experience, e_id)
values (1573, 15.6, 4781);
insert into GUIDE (g_id, experience, e_id)
values (3714, 38.8, 8410);
insert into GUIDE (g_id, experience, e_id)
values (3523, 20.3, 6138);
insert into GUIDE (g_id, experience, e_id)
values (2963, 17.4, 5429);
insert into GUIDE (g_id, experience, e_id)
values (4768, 7.5, 2498);
insert into GUIDE (g_id, experience, e_id)
values (3318, 20.3, 6923);
insert into GUIDE (g_id, experience, e_id)
values (2960, .2, 7726);
insert into GUIDE (g_id, experience, e_id)
values (4726, 8.5, 4559);
insert into GUIDE (g_id, experience, e_id)
values (3030, 20.2, 4195);
insert into GUIDE (g_id, experience, e_id)
values (2892, 22.3, 4923);
insert into GUIDE (g_id, experience, e_id)
values (2166, .2, 4758);
insert into GUIDE (g_id, experience, e_id)
values (3162, 15.9, 9627);
insert into GUIDE (g_id, experience, e_id)
values (4378, 17.9, 2877);
insert into GUIDE (g_id, experience, e_id)
values (4354, 22, 7913);
insert into GUIDE (g_id, experience, e_id)
values (1998, 25.2, 8135);
insert into GUIDE (g_id, experience, e_id)
values (4337, 37.6, 9754);
insert into GUIDE (g_id, experience, e_id)
values (1357, 39.4, 3549);
insert into GUIDE (g_id, experience, e_id)
values (1930, 7.4, 9329);
commit;
prompt 400 records committed...
insert into GUIDE (g_id, experience, e_id)
values (1927, 5.4, 9441);
insert into GUIDE (g_id, experience, e_id)
values (4072, 36, 4623);
insert into GUIDE (g_id, experience, e_id)
values (3675, 12.3, 1609);
insert into GUIDE (g_id, experience, e_id)
values (1310, 27, 7908);
insert into GUIDE (g_id, experience, e_id)
values (3498, 11.7, 2378);
insert into GUIDE (g_id, experience, e_id)
values (2862, 36.1, 7533);
insert into GUIDE (g_id, experience, e_id)
values (1618, 26.9, 1254);
insert into GUIDE (g_id, experience, e_id)
values (4892, 25.2, 6513);
insert into GUIDE (g_id, experience, e_id)
values (3989, 21.2, 1122);
insert into GUIDE (g_id, experience, e_id)
values (4661, 17.1, 2813);
insert into GUIDE (g_id, experience, e_id)
values (2353, 12.6, 1483);
insert into GUIDE (g_id, experience, e_id)
values (4938, 32.1, 6573);
insert into GUIDE (g_id, experience, e_id)
values (2847, 1.7, 2252);
insert into GUIDE (g_id, experience, e_id)
values (3857, 14, 9754);
insert into GUIDE (g_id, experience, e_id)
values (2138, 12.1, 4541);
insert into GUIDE (g_id, experience, e_id)
values (3458, 10.2, 2165);
insert into GUIDE (g_id, experience, e_id)
values (4458, 12, 1906);
insert into GUIDE (g_id, experience, e_id)
values (1766, 14.5, 9421);
insert into GUIDE (g_id, experience, e_id)
values (2528, 13.8, 7708);
insert into GUIDE (g_id, experience, e_id)
values (2624, 28.1, 9421);
insert into GUIDE (g_id, experience, e_id)
values (1799, 27.9, 9911);
insert into GUIDE (g_id, experience, e_id)
values (2921, 6.2, 9100);
insert into GUIDE (g_id, experience, e_id)
values (3637, 36.9, 4325);
insert into GUIDE (g_id, experience, e_id)
values (2530, .4, 3946);
insert into GUIDE (g_id, experience, e_id)
values (2567, 10.6, 2859);
insert into GUIDE (g_id, experience, e_id)
values (2510, 20.5, 1701);
insert into GUIDE (g_id, experience, e_id)
values (4497, 12.8, 5163);
insert into GUIDE (g_id, experience, e_id)
values (4120, 6.8, 7002);
insert into GUIDE (g_id, experience, e_id)
values (1238, 29, 2859);
insert into GUIDE (g_id, experience, e_id)
values (1613, 14.5, 4057);
insert into GUIDE (g_id, experience, e_id)
values (4079, 9.6, 4315);
insert into GUIDE (g_id, experience, e_id)
values (2121, 31.1, 1637);
insert into GUIDE (g_id, experience, e_id)
values (4962, 36.9, 3104);
insert into GUIDE (g_id, experience, e_id)
values (1744, 38.3, 2330);
insert into GUIDE (g_id, experience, e_id)
values (1517, 39.5, 1480);
insert into GUIDE (g_id, experience, e_id)
values (1565, 4.7, 1431);
insert into GUIDE (g_id, experience, e_id)
values (3367, 10.1, 4175);
insert into GUIDE (g_id, experience, e_id)
values (1981, 31, 9467);
insert into GUIDE (g_id, experience, e_id)
values (1247, 12.8, 9072);
insert into GUIDE (g_id, experience, e_id)
values (2186, 3.1, 9610);
insert into GUIDE (g_id, experience, e_id)
values (3051, 1.3, 7722);
insert into GUIDE (g_id, experience, e_id)
values (3203, 24, 4032);
insert into GUIDE (g_id, experience, e_id)
values (3473, 28, 5413);
insert into GUIDE (g_id, experience, e_id)
values (2376, 7.6, 4389);
insert into GUIDE (g_id, experience, e_id)
values (3275, 10.3, 2807);
insert into GUIDE (g_id, experience, e_id)
values (3944, 9.9, 9775);
insert into GUIDE (g_id, experience, e_id)
values (2702, 3.9, 2116);
insert into GUIDE (g_id, experience, e_id)
values (1041, 9.5, 3323);
insert into GUIDE (g_id, experience, e_id)
values (3734, 5, 9209);
insert into GUIDE (g_id, experience, e_id)
values (2758, 3.4, 7372);
insert into GUIDE (g_id, experience, e_id)
values (3690, 9.3, 5733);
insert into GUIDE (g_id, experience, e_id)
values (2635, 17.8, 4390);
insert into GUIDE (g_id, experience, e_id)
values (3235, 5.3, 3230);
insert into GUIDE (g_id, experience, e_id)
values (1370, 25.7, 2415);
insert into GUIDE (g_id, experience, e_id)
values (4010, 28.6, 7397);
insert into GUIDE (g_id, experience, e_id)
values (4375, 24.2, 3946);
insert into GUIDE (g_id, experience, e_id)
values (3992, 17.4, 1858);
insert into GUIDE (g_id, experience, e_id)
values (4616, 30.8, 7312);
insert into GUIDE (g_id, experience, e_id)
values (4707, 2.2, 6832);
insert into GUIDE (g_id, experience, e_id)
values (2570, 21.3, 5018);
insert into GUIDE (g_id, experience, e_id)
values (4277, 9.9, 7518);
insert into GUIDE (g_id, experience, e_id)
values (1430, 38.9, 1162);
insert into GUIDE (g_id, experience, e_id)
values (4384, 20.4, 8923);
insert into GUIDE (g_id, experience, e_id)
values (2690, .8, 5042);
insert into GUIDE (g_id, experience, e_id)
values (1740, 4.2, 1663);
insert into GUIDE (g_id, experience, e_id)
values (1854, 39.1, 3729);
insert into GUIDE (g_id, experience, e_id)
values (3565, 25.9, 2026);
insert into GUIDE (g_id, experience, e_id)
values (3160, 29, 6896);
insert into GUIDE (g_id, experience, e_id)
values (4725, 35, 8950);
insert into GUIDE (g_id, experience, e_id)
values (3580, 3.6, 1254);
insert into GUIDE (g_id, experience, e_id)
values (4737, 9.3, 6573);
insert into GUIDE (g_id, experience, e_id)
values (1616, 11.2, 4128);
insert into GUIDE (g_id, experience, e_id)
values (2524, 34.7, 9958);
insert into GUIDE (g_id, experience, e_id)
values (1376, 11.8, 6451);
insert into GUIDE (g_id, experience, e_id)
values (4813, 1.9, 8104);
insert into GUIDE (g_id, experience, e_id)
values (2747, 12.6, 2570);
insert into GUIDE (g_id, experience, e_id)
values (2188, 33.8, 9367);
insert into GUIDE (g_id, experience, e_id)
values (1063, 24.9, 8514);
insert into GUIDE (g_id, experience, e_id)
values (1217, 22.5, 1051);
insert into GUIDE (g_id, experience, e_id)
values (4494, 12.9, 6573);
commit;
prompt 480 records loaded
prompt Loading INVITATION...
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8040, to_date('10-06-2015', 'dd-mm-yyyy'), 258, 214, 1617);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (820, to_date('24-04-2014', 'dd-mm-yyyy'), 259, 218, 3540);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7235, to_date('05-09-2024', 'dd-mm-yyyy'), 260, 260, 2249);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2639, to_date('08-08-2016', 'dd-mm-yyyy'), 261, 61, 2624);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8243, to_date('17-11-2016', 'dd-mm-yyyy'), 262, 235, 2353);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (898, to_date('31-05-2024', 'dd-mm-yyyy'), 263, 178, 1635);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6184, to_date('28-04-2015', 'dd-mm-yyyy'), 264, 212, 3230);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2880, to_date('25-07-2016', 'dd-mm-yyyy'), 265, 108, 2027);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (689, to_date('10-08-2024', 'dd-mm-yyyy'), 266, 52, 4633);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2163, to_date('20-12-2002', 'dd-mm-yyyy'), 267, 56, 1565);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1066, to_date('20-01-2020', 'dd-mm-yyyy'), 268, 264, 1197);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6029, to_date('20-03-1996', 'dd-mm-yyyy'), 269, 163, 3160);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2817, to_date('12-06-2006', 'dd-mm-yyyy'), 270, 82, 2105);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4973, to_date('15-07-2022', 'dd-mm-yyyy'), 271, 190, 3908);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3766, to_date('18-03-1996', 'dd-mm-yyyy'), 272, 232, 2690);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1327, to_date('07-02-2022', 'dd-mm-yyyy'), 273, 160, 2705);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1300, to_date('30-11-1996', 'dd-mm-yyyy'), 274, 238, 2556);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9241, to_date('14-10-1998', 'dd-mm-yyyy'), 275, 77, 2824);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9721, to_date('01-03-2008', 'dd-mm-yyyy'), 276, 155, 3235);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6517, to_date('10-03-1999', 'dd-mm-yyyy'), 277, 57, 2799);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9942, to_date('16-11-1997', 'dd-mm-yyyy'), 278, 47, 1244);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4069, to_date('18-02-2011', 'dd-mm-yyyy'), 279, 92, 1700);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7066, to_date('02-12-2007', 'dd-mm-yyyy'), 280, 147, 3753);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8727, to_date('27-06-2021', 'dd-mm-yyyy'), 281, 211, 3690);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (807, to_date('21-02-1999', 'dd-mm-yyyy'), 282, 104, 4897);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6150, to_date('13-05-2023', 'dd-mm-yyyy'), 283, 6, 2624);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5277, to_date('03-10-2005', 'dd-mm-yyyy'), 284, 244, 3367);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2864, to_date('13-09-2002', 'dd-mm-yyyy'), 285, 165, 4598);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1126, to_date('11-02-1999', 'dd-mm-yyyy'), 286, 49, 1247);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (643, to_date('28-03-2024', 'dd-mm-yyyy'), 287, 164, 3136);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5305, to_date('07-11-2000', 'dd-mm-yyyy'), 288, 254, 4221);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (757, to_date('28-10-1996', 'dd-mm-yyyy'), 289, 99, 4375);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4922, to_date('28-05-1995', 'dd-mm-yyyy'), 290, 22, 3051);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8830, to_date('23-02-2018', 'dd-mm-yyyy'), 291, 8, 4660);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8721, to_date('27-11-2001', 'dd-mm-yyyy'), 292, 144, 4191);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1296, to_date('15-10-2008', 'dd-mm-yyyy'), 293, 143, 2347);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1660, to_date('16-06-2005', 'dd-mm-yyyy'), 294, 246, 1504);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9491, to_date('18-09-2015', 'dd-mm-yyyy'), 295, 55, 1609);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7356, to_date('07-10-2017', 'dd-mm-yyyy'), 296, 153, 1647);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9319, to_date('27-01-2015', 'dd-mm-yyyy'), 297, 232, 2960);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4884, to_date('04-03-1997', 'dd-mm-yyyy'), 298, 71, 2193);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6557, to_date('05-06-2024', 'dd-mm-yyyy'), 299, 151, 1649);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2189, to_date('17-01-2018', 'dd-mm-yyyy'), 300, 110, 4051);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5754, to_date('01-05-2014', 'dd-mm-yyyy'), 301, 219, 4547);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2857, to_date('17-07-1999', 'dd-mm-yyyy'), 302, 232, 3019);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8995, to_date('10-04-2009', 'dd-mm-yyyy'), 303, 119, 3030);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2743, to_date('05-10-2013', 'dd-mm-yyyy'), 304, 82, 1217);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5518, to_date('10-01-2018', 'dd-mm-yyyy'), 305, 258, 4304);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6708, to_date('04-04-2003', 'dd-mm-yyyy'), 306, 29, 1597);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (949, to_date('05-05-2003', 'dd-mm-yyyy'), 307, 143, 2931);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6970, to_date('11-12-2017', 'dd-mm-yyyy'), 308, 230, 1275);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8144, to_date('16-01-2011', 'dd-mm-yyyy'), 309, 124, 2636);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1061, to_date('08-05-2011', 'dd-mm-yyyy'), 310, 108, 4782);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9382, to_date('21-06-2008', 'dd-mm-yyyy'), 311, 81, 2336);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (644, to_date('11-04-2006', 'dd-mm-yyyy'), 312, 117, 4076);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6932, to_date('29-04-2002', 'dd-mm-yyyy'), 313, 127, 4319);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1938, to_date('23-10-1999', 'dd-mm-yyyy'), 314, 181, 1716);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5964, to_date('13-11-2015', 'dd-mm-yyyy'), 315, 124, 2787);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5505, to_date('18-09-1997', 'dd-mm-yyyy'), 316, 165, 1799);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7835, to_date('30-06-2015', 'dd-mm-yyyy'), 317, 162, 2895);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7392, to_date('17-03-1998', 'dd-mm-yyyy'), 318, 209, 3633);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3966, to_date('17-09-1996', 'dd-mm-yyyy'), 319, 104, 3191);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (640, to_date('08-02-2015', 'dd-mm-yyyy'), 320, 169, 3288);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9351, to_date('19-06-2019', 'dd-mm-yyyy'), 321, 94, 1647);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6647, to_date('30-04-2020', 'dd-mm-yyyy'), 322, 250, 1576);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8900, to_date('26-10-2012', 'dd-mm-yyyy'), 323, 145, 4355);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9637, to_date('26-10-2015', 'dd-mm-yyyy'), 324, 213, 3480);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1912, to_date('31-01-2009', 'dd-mm-yyyy'), 325, 140, 2174);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8746, to_date('14-10-2024', 'dd-mm-yyyy'), 326, 44, 2133);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8153, to_date('27-03-1997', 'dd-mm-yyyy'), 327, 252, 2063);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2462, to_date('15-05-2002', 'dd-mm-yyyy'), 328, 256, 3580);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6280, to_date('06-10-1995', 'dd-mm-yyyy'), 329, 185, 1621);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2932, to_date('27-08-1995', 'dd-mm-yyyy'), 330, 195, 1387);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9391, to_date('15-11-2014', 'dd-mm-yyyy'), 331, 156, 3426);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2112, to_date('19-01-2013', 'dd-mm-yyyy'), 332, 244, 4139);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4677, to_date('26-01-1998', 'dd-mm-yyyy'), 333, 168, 4523);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6798, to_date('04-02-2023', 'dd-mm-yyyy'), 334, 157, 4523);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (936, to_date('16-02-2013', 'dd-mm-yyyy'), 335, 231, 4205);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5996, to_date('20-07-2022', 'dd-mm-yyyy'), 336, 231, 1621);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8439, to_date('25-05-2002', 'dd-mm-yyyy'), 337, 196, 4507);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7169, to_date('21-12-2023', 'dd-mm-yyyy'), 338, 213, 3458);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9666, to_date('12-07-2022', 'dd-mm-yyyy'), 339, 13, 4883);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4829, to_date('27-07-2022', 'dd-mm-yyyy'), 340, 229, 1199);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8645, to_date('20-07-2013', 'dd-mm-yyyy'), 341, 129, 4428);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8250, to_date('28-06-2002', 'dd-mm-yyyy'), 342, 264, 1112);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2899, to_date('28-04-1997', 'dd-mm-yyyy'), 343, 181, 3784);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1526, to_date('17-06-2012', 'dd-mm-yyyy'), 344, 55, 1635);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4763, to_date('22-05-2015', 'dd-mm-yyyy'), 345, 229, 1534);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1760, to_date('22-10-2010', 'dd-mm-yyyy'), 346, 206, 4079);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4791, to_date('22-02-2016', 'dd-mm-yyyy'), 347, 9, 2036);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (838, to_date('08-11-2019', 'dd-mm-yyyy'), 348, 248, 3846);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4043, to_date('15-06-2021', 'dd-mm-yyyy'), 349, 209, 3421);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5331, to_date('03-09-2019', 'dd-mm-yyyy'), 350, 52, 3828);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7968, to_date('06-08-2002', 'dd-mm-yyyy'), 351, 149, 3675);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8745, to_date('06-04-2001', 'dd-mm-yyyy'), 352, 55, 3849);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1402, to_date('04-08-2005', 'dd-mm-yyyy'), 353, 154, 2193);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3387, to_date('14-01-1999', 'dd-mm-yyyy'), 354, 45, 1063);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2173, to_date('30-11-2015', 'dd-mm-yyyy'), 355, 77, 1273);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2592, to_date('26-09-2012', 'dd-mm-yyyy'), 356, 214, 1377);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8068, to_date('27-07-2012', 'dd-mm-yyyy'), 357, 99, 1881);
commit;
prompt 100 records committed...
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5048, to_date('09-09-1998', 'dd-mm-yyyy'), 358, 244, 2530);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2905, to_date('24-07-2001', 'dd-mm-yyyy'), 359, 83, 3633);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8491, to_date('18-06-2020', 'dd-mm-yyyy'), 360, 133, 4375);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2220, to_date('17-09-1998', 'dd-mm-yyyy'), 361, 148, 3554);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4508, to_date('17-11-2018', 'dd-mm-yyyy'), 362, 107, 2041);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2058, to_date('17-11-2021', 'dd-mm-yyyy'), 363, 50, 1705);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3197, to_date('27-05-2011', 'dd-mm-yyyy'), 364, 147, 2517);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6379, to_date('10-07-2002', 'dd-mm-yyyy'), 365, 58, 2636);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9686, to_date('05-12-2000', 'dd-mm-yyyy'), 366, 204, 4799);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6315, to_date('07-09-2006', 'dd-mm-yyyy'), 367, 105, 4205);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1260, to_date('28-11-2013', 'dd-mm-yyyy'), 368, 26, 3049);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8797, to_date('21-04-2015', 'dd-mm-yyyy'), 369, 157, 4971);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2607, to_date('19-11-1997', 'dd-mm-yyyy'), 370, 205, 4573);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7283, to_date('02-12-2013', 'dd-mm-yyyy'), 371, 202, 3271);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5659, to_date('14-05-1998', 'dd-mm-yyyy'), 372, 169, 4120);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2454, to_date('09-07-2008', 'dd-mm-yyyy'), 373, 187, 1930);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7988, to_date('07-06-1995', 'dd-mm-yyyy'), 374, 136, 4551);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4487, to_date('18-05-2016', 'dd-mm-yyyy'), 375, 203, 2624);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6163, to_date('30-01-1997', 'dd-mm-yyyy'), 376, 141, 3395);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9293, to_date('02-11-2024', 'dd-mm-yyyy'), 377, 54, 2862);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7912, to_date('03-11-2005', 'dd-mm-yyyy'), 378, 150, 3570);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4787, to_date('29-08-2004', 'dd-mm-yyyy'), 379, 210, 4571);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4541, to_date('22-01-2009', 'dd-mm-yyyy'), 380, 184, 2252);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2784, to_date('10-06-2023', 'dd-mm-yyyy'), 381, 199, 3828);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7063, to_date('31-08-2021', 'dd-mm-yyyy'), 382, 174, 3203);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1094, to_date('17-08-2017', 'dd-mm-yyyy'), 383, 140, 1930);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9997, to_date('17-03-2009', 'dd-mm-yyyy'), 384, 3, 3865);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7340, to_date('20-01-2009', 'dd-mm-yyyy'), 385, 226, 3259);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2092, to_date('30-10-2022', 'dd-mm-yyyy'), 386, 179, 1746);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2452, to_date('23-04-2023', 'dd-mm-yyyy'), 387, 36, 3367);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4469, to_date('21-01-2006', 'dd-mm-yyyy'), 388, 172, 2027);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9593, to_date('22-12-2009', 'dd-mm-yyyy'), 389, 54, 2921);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9433, to_date('04-07-2023', 'dd-mm-yyyy'), 390, 56, 3884);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5231, to_date('10-10-2004', 'dd-mm-yyyy'), 391, 75, 3944);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5211, to_date('12-06-2011', 'dd-mm-yyyy'), 392, 81, 1583);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3918, to_date('29-07-2023', 'dd-mm-yyyy'), 393, 95, 1337);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8616, to_date('29-03-2010', 'dd-mm-yyyy'), 394, 72, 2186);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4707, to_date('01-04-2018', 'dd-mm-yyyy'), 395, 218, 2507);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8120, to_date('28-08-2008', 'dd-mm-yyyy'), 396, 248, 4016);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4012, to_date('12-06-2014', 'dd-mm-yyyy'), 397, 106, 3753);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2609, to_date('27-01-2000', 'dd-mm-yyyy'), 398, 245, 2824);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6637, to_date('23-03-2011', 'dd-mm-yyyy'), 399, 127, 3211);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9062, to_date('12-07-2010', 'dd-mm-yyyy'), 400, 106, 1829);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5717, to_date('13-07-2002', 'dd-mm-yyyy'), 401, 168, 4243);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9890, to_date('02-09-2008', 'dd-mm-yyyy'), 402, 1, 3304);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9593, to_date('09-08-2000', 'dd-mm-yyyy'), 403, 149, 1930);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5707, to_date('01-08-1997', 'dd-mm-yyyy'), 404, 52, 3201);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8349, to_date('24-03-2001', 'dd-mm-yyyy'), 405, 72, 2744);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7772, to_date('15-06-2018', 'dd-mm-yyyy'), 406, 222, 2528);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6782, to_date('31-10-2010', 'dd-mm-yyyy'), 407, 166, 3367);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9099, to_date('27-02-2006', 'dd-mm-yyyy'), 408, 32, 2718);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6779, to_date('13-07-2015', 'dd-mm-yyyy'), 409, 37, 3235);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2489, to_date('13-09-2006', 'dd-mm-yyyy'), 410, 226, 2057);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7382, to_date('26-12-2011', 'dd-mm-yyyy'), 411, 45, 3318);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6489, to_date('10-07-2006', 'dd-mm-yyyy'), 412, 251, 2679);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3009, to_date('25-02-2010', 'dd-mm-yyyy'), 413, 90, 3550);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1768, to_date('13-09-2003', 'dd-mm-yyyy'), 414, 89, 4174);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9115, to_date('07-12-2007', 'dd-mm-yyyy'), 415, 86, 2058);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2164, to_date('03-01-2021', 'dd-mm-yyyy'), 416, 33, 2900);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8003, to_date('25-08-1997', 'dd-mm-yyyy'), 417, 251, 4892);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6909, to_date('10-11-2000', 'dd-mm-yyyy'), 418, 24, 1741);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9828, to_date('12-06-2004', 'dd-mm-yyyy'), 419, 142, 2063);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9520, to_date('17-02-2002', 'dd-mm-yyyy'), 420, 129, 2404);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4508, to_date('16-07-2006', 'dd-mm-yyyy'), 421, 183, 1661);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4863, to_date('02-11-2008', 'dd-mm-yyyy'), 422, 35, 3550);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9318, to_date('30-04-2007', 'dd-mm-yyyy'), 423, 67, 2121);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4143, to_date('20-09-2010', 'dd-mm-yyyy'), 424, 238, 1476);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7392, to_date('07-06-2019', 'dd-mm-yyyy'), 425, 177, 3221);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9061, to_date('30-08-1995', 'dd-mm-yyyy'), 426, 97, 4499);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1413, to_date('13-07-2020', 'dd-mm-yyyy'), 427, 165, 2747);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3640, to_date('13-01-2004', 'dd-mm-yyyy'), 428, 257, 2787);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6964, to_date('26-02-2001', 'dd-mm-yyyy'), 429, 265, 3796);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1852, to_date('08-06-2012', 'dd-mm-yyyy'), 1, 79, 3421);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9601, to_date('27-09-2015', 'dd-mm-yyyy'), 2, 21, 2252);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9715, to_date('22-02-2000', 'dd-mm-yyyy'), 3, 177, 3139);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2908, to_date('04-06-1998', 'dd-mm-yyyy'), 4, 85, 2574);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9495, to_date('02-10-2004', 'dd-mm-yyyy'), 5, 205, 4120);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2829, to_date('21-07-2010', 'dd-mm-yyyy'), 6, 60, 3649);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6075, to_date('11-10-2013', 'dd-mm-yyyy'), 7, 97, 2159);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9935, to_date('20-11-2003', 'dd-mm-yyyy'), 8, 69, 4728);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3084, to_date('17-09-2000', 'dd-mm-yyyy'), 9, 82, 4091);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9749, to_date('04-02-2023', 'dd-mm-yyyy'), 10, 113, 1117);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2007, to_date('12-06-2020', 'dd-mm-yyyy'), 11, 24, 2530);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5409, to_date('08-03-2018', 'dd-mm-yyyy'), 12, 4, 3047);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7115, to_date('17-02-2015', 'dd-mm-yyyy'), 13, 127, 4741);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9499, to_date('30-10-2018', 'dd-mm-yyyy'), 14, 175, 4741);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9073, to_date('08-12-2011', 'dd-mm-yyyy'), 15, 123, 4139);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4793, to_date('19-07-2010', 'dd-mm-yyyy'), 16, 183, 4107);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5713, to_date('09-09-2022', 'dd-mm-yyyy'), 17, 145, 1238);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (689, to_date('13-10-2022', 'dd-mm-yyyy'), 18, 220, 3502);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1481, to_date('13-05-2005', 'dd-mm-yyyy'), 19, 83, 3473);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9803, to_date('30-10-2008', 'dd-mm-yyyy'), 20, 41, 2291);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5063, to_date('24-06-2007', 'dd-mm-yyyy'), 21, 90, 3617);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3231, to_date('31-08-1997', 'dd-mm-yyyy'), 22, 119, 2415);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5667, to_date('30-04-2011', 'dd-mm-yyyy'), 23, 104, 3243);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (497, to_date('20-08-2007', 'dd-mm-yyyy'), 24, 201, 4964);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5994, to_date('14-02-2021', 'dd-mm-yyyy'), 25, 253, 3570);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1660, to_date('03-01-2022', 'dd-mm-yyyy'), 26, 93, 4561);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4618, to_date('01-01-2002', 'dd-mm-yyyy'), 27, 12, 2110);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5351, to_date('07-06-1996', 'dd-mm-yyyy'), 28, 257, 2368);
commit;
prompt 200 records committed...
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5798, to_date('23-11-2000', 'dd-mm-yyyy'), 29, 108, 3308);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5472, to_date('04-04-2018', 'dd-mm-yyyy'), 30, 90, 4897);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7954, to_date('16-04-1999', 'dd-mm-yyyy'), 31, 244, 4337);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5582, to_date('13-09-2017', 'dd-mm-yyyy'), 32, 25, 1573);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9816, to_date('08-11-2007', 'dd-mm-yyyy'), 33, 99, 1816);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2192, to_date('09-12-2020', 'dd-mm-yyyy'), 34, 241, 3795);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5003, to_date('06-12-2012', 'dd-mm-yyyy'), 35, 160, 1885);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5235, to_date('13-01-2015', 'dd-mm-yyyy'), 36, 262, 3633);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4010, to_date('13-12-2014', 'dd-mm-yyyy'), 37, 220, 4120);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7961, to_date('03-10-2024', 'dd-mm-yyyy'), 38, 239, 1066);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5633, to_date('20-08-2008', 'dd-mm-yyyy'), 39, 101, 3690);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3751, to_date('11-04-2011', 'dd-mm-yyyy'), 40, 179, 2449);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5547, to_date('06-03-1995', 'dd-mm-yyyy'), 41, 198, 3714);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1106, to_date('20-09-2012', 'dd-mm-yyyy'), 42, 59, 1423);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3077, to_date('14-03-1996', 'dd-mm-yyyy'), 43, 229, 1981);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7554, to_date('21-08-2016', 'dd-mm-yyyy'), 44, 25, 1273);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6122, to_date('03-09-2009', 'dd-mm-yyyy'), 45, 213, 3750);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1978, to_date('15-04-2014', 'dd-mm-yyyy'), 46, 138, 4319);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5012, to_date('22-08-1997', 'dd-mm-yyyy'), 47, 187, 1392);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2624, to_date('03-11-1996', 'dd-mm-yyyy'), 48, 206, 3139);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3037, to_date('12-11-1995', 'dd-mm-yyyy'), 49, 15, 3049);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6520, to_date('18-06-2013', 'dd-mm-yyyy'), 50, 230, 1981);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6138, to_date('27-04-2015', 'dd-mm-yyyy'), 51, 75, 1111);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5076, to_date('23-03-2021', 'dd-mm-yyyy'), 52, 133, 4616);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1032, to_date('29-07-2005', 'dd-mm-yyyy'), 53, 168, 1667);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7601, to_date('12-12-2006', 'dd-mm-yyyy'), 54, 115, 4660);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9504, to_date('21-01-2000', 'dd-mm-yyyy'), 55, 103, 4670);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4490, to_date('14-11-2020', 'dd-mm-yyyy'), 56, 6, 1531);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4363, to_date('27-02-2023', 'dd-mm-yyyy'), 57, 107, 2773);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6591, to_date('29-03-2002', 'dd-mm-yyyy'), 58, 56, 2847);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8838, to_date('08-04-1999', 'dd-mm-yyyy'), 59, 242, 1609);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4736, to_date('26-09-1996', 'dd-mm-yyyy'), 60, 196, 2065);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8876, to_date('17-08-2023', 'dd-mm-yyyy'), 61, 183, 2580);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5445, to_date('17-10-2015', 'dd-mm-yyyy'), 62, 181, 4633);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9876, to_date('01-02-2005', 'dd-mm-yyyy'), 63, 136, 4782);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6306, to_date('14-10-2017', 'dd-mm-yyyy'), 64, 96, 1816);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3837, to_date('05-10-2000', 'dd-mm-yyyy'), 65, 249, 3675);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8523, to_date('08-02-2011', 'dd-mm-yyyy'), 66, 130, 1870);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2935, to_date('29-06-2012', 'dd-mm-yyyy'), 67, 93, 1126);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8137, to_date('03-02-2009', 'dd-mm-yyyy'), 68, 175, 4191);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3013, to_date('06-04-1995', 'dd-mm-yyyy'), 69, 110, 1197);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4922, to_date('11-11-2016', 'dd-mm-yyyy'), 70, 40, 3330);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3750, to_date('05-06-2017', 'dd-mm-yyyy'), 71, 194, 4324);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9446, to_date('28-12-2019', 'dd-mm-yyyy'), 72, 18, 3172);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7498, to_date('07-11-2002', 'dd-mm-yyyy'), 73, 238, 4010);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9308, to_date('25-01-2005', 'dd-mm-yyyy'), 74, 196, 1376);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6543, to_date('02-12-2014', 'dd-mm-yyyy'), 75, 215, 1275);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1800, to_date('04-03-2012', 'dd-mm-yyyy'), 76, 121, 4337);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7539, to_date('27-05-2002', 'dd-mm-yyyy'), 77, 90, 1387);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5236, to_date('25-02-2009', 'dd-mm-yyyy'), 78, 146, 4494);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5357, to_date('22-03-1997', 'dd-mm-yyyy'), 79, 72, 1460);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9953, to_date('05-11-2007', 'dd-mm-yyyy'), 80, 198, 3139);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3867, to_date('27-01-2014', 'dd-mm-yyyy'), 81, 158, 3565);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5485, to_date('12-02-2002', 'dd-mm-yyyy'), 82, 220, 4215);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5631, to_date('06-12-2011', 'dd-mm-yyyy'), 83, 12, 2847);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5915, to_date('29-10-1997', 'dd-mm-yyyy'), 84, 172, 2291);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9525, to_date('04-06-2007', 'dd-mm-yyyy'), 85, 17, 4717);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5133, to_date('20-08-2014', 'dd-mm-yyyy'), 86, 110, 4212);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6530, to_date('05-02-2010', 'dd-mm-yyyy'), 87, 255, 1816);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8287, to_date('10-09-1999', 'dd-mm-yyyy'), 88, 85, 1854);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2944, to_date('17-07-2019', 'dd-mm-yyyy'), 89, 114, 3734);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2885, to_date('15-03-2013', 'dd-mm-yyyy'), 90, 123, 2143);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2772, to_date('18-05-2024', 'dd-mm-yyyy'), 91, 113, 2474);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6087, to_date('17-11-1995', 'dd-mm-yyyy'), 92, 20, 4507);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7776, to_date('03-03-2003', 'dd-mm-yyyy'), 93, 75, 2528);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2903, to_date('31-03-2018', 'dd-mm-yyyy'), 94, 28, 3376);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5958, to_date('21-02-2017', 'dd-mm-yyyy'), 95, 45, 2747);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9328, to_date('31-10-2021', 'dd-mm-yyyy'), 96, 15, 1928);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6963, to_date('31-10-2004', 'dd-mm-yyyy'), 97, 232, 3421);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6883, to_date('01-04-2012', 'dd-mm-yyyy'), 98, 44, 3095);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7397, to_date('05-08-1998', 'dd-mm-yyyy'), 99, 232, 4133);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2093, to_date('12-02-2014', 'dd-mm-yyyy'), 100, 245, 3882);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3075, to_date('16-12-2012', 'dd-mm-yyyy'), 101, 199, 3367);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6130, to_date('21-11-1997', 'dd-mm-yyyy'), 102, 219, 3333);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9187, to_date('29-11-2024', 'dd-mm-yyyy'), 103, 234, 1254);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2871, to_date('18-07-2018', 'dd-mm-yyyy'), 104, 143, 4603);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (633, to_date('03-01-2016', 'dd-mm-yyyy'), 105, 125, 3223);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2893, to_date('24-02-1996', 'dd-mm-yyyy'), 106, 81, 3627);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6541, to_date('14-05-2016', 'dd-mm-yyyy'), 107, 237, 3550);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7876, to_date('19-04-2008', 'dd-mm-yyyy'), 108, 180, 4016);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7939, to_date('31-07-2000', 'dd-mm-yyyy'), 109, 79, 1701);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2437, to_date('11-06-2014', 'dd-mm-yyyy'), 110, 155, 2057);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9118, to_date('10-06-1995', 'dd-mm-yyyy'), 111, 168, 1609);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2631, to_date('24-01-2002', 'dd-mm-yyyy'), 112, 182, 1854);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9650, to_date('29-07-2009', 'dd-mm-yyyy'), 113, 229, 1112);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5126, to_date('04-10-2014', 'dd-mm-yyyy'), 114, 14, 1126);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3845, to_date('17-12-2024', 'dd-mm-yyyy'), 115, 150, 3898);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2796, to_date('25-02-2002', 'dd-mm-yyyy'), 116, 47, 3030);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7612, to_date('14-04-2020', 'dd-mm-yyyy'), 117, 227, 1238);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8245, to_date('02-10-2001', 'dd-mm-yyyy'), 118, 62, 1885);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5505, to_date('21-03-1996', 'dd-mm-yyyy'), 119, 147, 3734);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7242, to_date('12-08-2022', 'dd-mm-yyyy'), 120, 195, 3796);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3184, to_date('14-07-2002', 'dd-mm-yyyy'), 121, 196, 4707);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7835, to_date('27-11-2020', 'dd-mm-yyyy'), 122, 115, 1254);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9805, to_date('07-02-2017', 'dd-mm-yyyy'), 123, 150, 3989);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9633, to_date('16-05-1997', 'dd-mm-yyyy'), 124, 154, 1476);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8820, to_date('18-10-2006', 'dd-mm-yyyy'), 125, 109, 3304);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (514, to_date('17-08-2006', 'dd-mm-yyyy'), 126, 121, 1930);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4961, to_date('20-03-2020', 'dd-mm-yyyy'), 127, 91, 3367);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (252, to_date('11-05-2018', 'dd-mm-yyyy'), 128, 69, 3554);
commit;
prompt 300 records committed...
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1140, to_date('02-05-2012', 'dd-mm-yyyy'), 129, 238, 3258);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4814, to_date('22-05-2020', 'dd-mm-yyyy'), 130, 74, 2204);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2772, to_date('30-12-2000', 'dd-mm-yyyy'), 131, 33, 2138);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6833, to_date('15-08-2003', 'dd-mm-yyyy'), 132, 97, 2528);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (768, to_date('22-04-2015', 'dd-mm-yyyy'), 133, 10, 3131);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4500, to_date('06-11-2008', 'dd-mm-yyyy'), 134, 200, 1829);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1452, to_date('11-11-2015', 'dd-mm-yyyy'), 135, 76, 3565);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8632, to_date('16-06-1995', 'dd-mm-yyyy'), 136, 44, 4571);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5902, to_date('26-11-1996', 'dd-mm-yyyy'), 137, 50, 3498);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8904, to_date('23-12-2011', 'dd-mm-yyyy'), 138, 70, 3139);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6955, to_date('23-04-2000', 'dd-mm-yyyy'), 139, 18, 4164);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6511, to_date('14-07-2008', 'dd-mm-yyyy'), 140, 93, 4074);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3895, to_date('23-06-2011', 'dd-mm-yyyy'), 141, 238, 1065);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1896, to_date('26-04-2011', 'dd-mm-yyyy'), 142, 63, 3051);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1232, to_date('18-03-2015', 'dd-mm-yyyy'), 143, 263, 1874);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3383, to_date('20-11-2011', 'dd-mm-yyyy'), 144, 53, 2173);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7530, to_date('18-05-2021', 'dd-mm-yyyy'), 145, 155, 2787);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9733, to_date('19-09-2018', 'dd-mm-yyyy'), 146, 176, 3221);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4382, to_date('13-04-2015', 'dd-mm-yyyy'), 147, 98, 1609);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8840, to_date('13-12-2000', 'dd-mm-yyyy'), 148, 149, 4938);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4901, to_date('10-09-2016', 'dd-mm-yyyy'), 149, 85, 3131);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2910, to_date('18-01-2014', 'dd-mm-yyyy'), 150, 192, 3498);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7773, to_date('09-05-2005', 'dd-mm-yyyy'), 151, 13, 3540);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9806, to_date('02-03-1996', 'dd-mm-yyyy'), 152, 196, 4728);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8819, to_date('13-10-2008', 'dd-mm-yyyy'), 153, 119, 2746);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4217, to_date('14-03-2003', 'dd-mm-yyyy'), 154, 33, 3258);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3412, to_date('08-07-2019', 'dd-mm-yyyy'), 155, 236, 4378);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5701, to_date('20-02-2003', 'dd-mm-yyyy'), 156, 21, 1337);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9011, to_date('28-08-2011', 'dd-mm-yyyy'), 157, 259, 3269);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1574, to_date('17-11-2009', 'dd-mm-yyyy'), 158, 199, 2389);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (535, to_date('07-11-1996', 'dd-mm-yyyy'), 159, 237, 3865);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6921, to_date('06-05-2016', 'dd-mm-yyyy'), 160, 26, 4938);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2375, to_date('17-08-1999', 'dd-mm-yyyy'), 161, 75, 2000);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8203, to_date('05-01-1997', 'dd-mm-yyyy'), 162, 89, 2143);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5490, to_date('24-01-2012', 'dd-mm-yyyy'), 163, 184, 1899);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4984, to_date('21-10-2009', 'dd-mm-yyyy'), 164, 235, 2000);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2122, to_date('05-12-2017', 'dd-mm-yyyy'), 165, 157, 4497);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3512, to_date('11-05-2007', 'dd-mm-yyyy'), 166, 248, 1955);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1629, to_date('31-01-1996', 'dd-mm-yyyy'), 167, 252, 3051);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1164, to_date('02-09-2017', 'dd-mm-yyyy'), 168, 145, 3203);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7910, to_date('10-05-2023', 'dd-mm-yyyy'), 169, 98, 1700);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (742, to_date('16-02-2004', 'dd-mm-yyyy'), 170, 87, 3993);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7204, to_date('18-09-1996', 'dd-mm-yyyy'), 171, 212, 1621);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5888, to_date('16-11-2004', 'dd-mm-yyyy'), 172, 177, 4499);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5240, to_date('17-11-2024', 'dd-mm-yyyy'), 173, 208, 2249);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7352, to_date('15-08-2011', 'dd-mm-yyyy'), 174, 133, 2252);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6501, to_date('03-04-2019', 'dd-mm-yyyy'), 175, 78, 2064);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8873, to_date('30-09-2007', 'dd-mm-yyyy'), 176, 190, 3871);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3845, to_date('10-04-2014', 'dd-mm-yyyy'), 177, 34, 1848);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4913, to_date('06-11-2015', 'dd-mm-yyyy'), 178, 8, 3002);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7736, to_date('07-02-2017', 'dd-mm-yyyy'), 179, 226, 3944);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7765, to_date('16-08-2004', 'dd-mm-yyyy'), 180, 136, 2065);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7832, to_date('25-09-2016', 'dd-mm-yyyy'), 181, 76, 3095);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6998, to_date('24-02-2015', 'dd-mm-yyyy'), 182, 153, 1476);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3439, to_date('02-06-2002', 'dd-mm-yyyy'), 183, 174, 2798);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7536, to_date('05-07-1996', 'dd-mm-yyyy'), 184, 170, 3201);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5318, to_date('08-07-2021', 'dd-mm-yyyy'), 185, 36, 1217);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9823, to_date('30-10-2010', 'dd-mm-yyyy'), 186, 70, 2801);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8854, to_date('16-09-2006', 'dd-mm-yyyy'), 187, 35, 2368);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (367, to_date('31-08-1997', 'dd-mm-yyyy'), 188, 240, 3649);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6830, to_date('22-07-2002', 'dd-mm-yyyy'), 189, 266, 4072);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1383, to_date('09-10-1997', 'dd-mm-yyyy'), 190, 45, 3048);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2820, to_date('24-06-2011', 'dd-mm-yyyy'), 191, 100, 3886);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4046, to_date('02-04-1996', 'dd-mm-yyyy'), 192, 198, 1031);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5683, to_date('29-01-1999', 'dd-mm-yyyy'), 193, 23, 1476);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9604, to_date('27-01-2015', 'dd-mm-yyyy'), 194, 195, 1269);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5169, to_date('06-11-1998', 'dd-mm-yyyy'), 195, 154, 2747);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2852, to_date('14-12-2004', 'dd-mm-yyyy'), 196, 187, 2240);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6632, to_date('01-04-2016', 'dd-mm-yyyy'), 197, 249, 1370);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4218, to_date('28-08-2016', 'dd-mm-yyyy'), 198, 51, 4675);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7861, to_date('06-03-2002', 'dd-mm-yyyy'), 199, 124, 4950);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5449, to_date('08-08-2021', 'dd-mm-yyyy'), 200, 223, 1139);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5757, to_date('14-10-2015', 'dd-mm-yyyy'), 201, 222, 2974);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3417, to_date('30-11-2011', 'dd-mm-yyyy'), 202, 9, 1679);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3629, to_date('09-09-2006', 'dd-mm-yyyy'), 203, 201, 4051);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5277, to_date('18-10-2019', 'dd-mm-yyyy'), 204, 45, 2495);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9352, to_date('27-07-1996', 'dd-mm-yyyy'), 205, 72, 1635);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4988, to_date('24-04-1996', 'dd-mm-yyyy'), 206, 114, 1870);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4869, to_date('07-02-2000', 'dd-mm-yyyy'), 207, 150, 2110);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9192, to_date('14-07-1999', 'dd-mm-yyyy'), 208, 33, 3162);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4071, to_date('22-04-2015', 'dd-mm-yyyy'), 209, 97, 1067);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5202, to_date('15-01-2002', 'dd-mm-yyyy'), 210, 175, 1434);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4026, to_date('31-03-2023', 'dd-mm-yyyy'), 211, 233, 1985);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7604, to_date('01-11-2007', 'dd-mm-yyyy'), 212, 256, 4726);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5066, to_date('09-02-1997', 'dd-mm-yyyy'), 213, 81, 2616);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7959, to_date('09-08-1998', 'dd-mm-yyyy'), 214, 151, 3558);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2240, to_date('07-09-2010', 'dd-mm-yyyy'), 215, 253, 4499);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3122, to_date('13-05-2009', 'dd-mm-yyyy'), 216, 55, 2427);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6625, to_date('28-02-1996', 'dd-mm-yyyy'), 217, 214, 1741);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4673, to_date('24-06-2003', 'dd-mm-yyyy'), 218, 263, 3502);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8737, to_date('12-05-2021', 'dd-mm-yyyy'), 219, 209, 1017);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9945, to_date('21-01-1997', 'dd-mm-yyyy'), 220, 29, 1549);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1066, to_date('23-04-2006', 'dd-mm-yyyy'), 221, 132, 4782);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2921, to_date('21-09-2012', 'dd-mm-yyyy'), 222, 48, 4976);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1212, to_date('14-03-2019', 'dd-mm-yyyy'), 223, 144, 2111);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4494, to_date('02-10-2012', 'dd-mm-yyyy'), 224, 16, 2166);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7379, to_date('17-09-2011', 'dd-mm-yyyy'), 225, 111, 1927);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6324, to_date('09-08-2021', 'dd-mm-yyyy'), 226, 76, 1017);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3231, to_date('27-09-2013', 'dd-mm-yyyy'), 227, 260, 2494);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2815, to_date('21-10-2017', 'dd-mm-yyyy'), 228, 12, 4660);
commit;
prompt 400 records committed...
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2361, to_date('14-06-2007', 'dd-mm-yyyy'), 229, 112, 3421);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4195, to_date('22-03-2015', 'dd-mm-yyyy'), 230, 197, 2799);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5612, to_date('05-10-2020', 'dd-mm-yyyy'), 231, 239, 1621);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1460, to_date('17-09-2003', 'dd-mm-yyyy'), 232, 18, 1537);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7762, to_date('29-02-2020', 'dd-mm-yyyy'), 233, 165, 1247);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9926, to_date('18-02-2019', 'dd-mm-yyyy'), 234, 192, 4494);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4818, to_date('01-12-2022', 'dd-mm-yyyy'), 235, 155, 4497);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6133, to_date('29-09-2012', 'dd-mm-yyyy'), 236, 159, 2336);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1921, to_date('28-08-2008', 'dd-mm-yyyy'), 237, 218, 4661);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1876, to_date('24-12-1999', 'dd-mm-yyyy'), 238, 159, 3690);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (2353, to_date('03-05-2020', 'dd-mm-yyyy'), 239, 60, 2530);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1827, to_date('31-07-2008', 'dd-mm-yyyy'), 240, 265, 3051);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6914, to_date('22-07-2004', 'dd-mm-yyyy'), 241, 256, 2147);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (773, to_date('13-02-2006', 'dd-mm-yyyy'), 242, 91, 2553);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4147, to_date('12-04-2021', 'dd-mm-yyyy'), 243, 100, 2064);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (968, to_date('26-11-2016', 'dd-mm-yyyy'), 244, 258, 2140);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (9935, to_date('26-11-2012', 'dd-mm-yyyy'), 245, 148, 1387);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (839, to_date('27-03-2008', 'dd-mm-yyyy'), 246, 266, 4136);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (444, to_date('24-09-2002', 'dd-mm-yyyy'), 247, 98, 1330);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (3804, to_date('21-01-1996', 'dd-mm-yyyy'), 248, 265, 1635);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1692, to_date('16-10-2002', 'dd-mm-yyyy'), 249, 34, 2064);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (8194, to_date('22-12-2009', 'dd-mm-yyyy'), 250, 24, 1606);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (4205, to_date('19-01-2021', 'dd-mm-yyyy'), 251, 205, 2917);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (7544, to_date('25-08-2007', 'dd-mm-yyyy'), 252, 203, 3633);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5051, to_date('31-12-2017', 'dd-mm-yyyy'), 253, 171, 1143);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1235, to_date('24-07-2008', 'dd-mm-yyyy'), 254, 22, 2347);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (1731, to_date('05-08-2022', 'dd-mm-yyyy'), 255, 216, 2971);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (5752, to_date('06-03-1997', 'dd-mm-yyyy'), 256, 164, 3554);
insert into INVITATION (price, i_date, i_id, m_g_id, g_id)
values (6169, to_date('08-08-2017', 'dd-mm-yyyy'), 257, 254, 1063);
commit;
prompt 429 records loaded
prompt Loading DIFFICULTY...
insert into DIFFICULTY (d_name, d_id)
values ('easy', 1);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 2);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 3);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 26);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 24);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 54);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 55);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 76);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 49);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 27);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 47);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 72);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 63);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 86);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 21);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 13);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 68);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 95);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 61);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 98);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 97);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 83);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 88);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 44);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 46);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 14);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 84);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 43);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 39);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 25);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 18);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 64);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 31);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 23);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 34);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 77);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 78);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 28);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 12);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 29);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 69);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 48);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 65);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 38);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 59);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 81);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 52);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 53);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 19);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 87);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 58);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 45);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 71);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 16);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 75);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 92);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 57);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 62);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 35);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 73);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 82);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 42);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 36);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 51);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 15);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 11);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 67);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 89);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 22);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 32);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 93);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 96);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 17);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 37);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 99);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 74);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 79);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 33);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 94);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 962);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 942);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 847);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 409);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 377);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 187);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 567);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 298);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 352);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 307);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 678);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 767);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 603);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 992);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 195);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 565);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 447);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 431);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 484);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 261);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 675);
commit;
prompt 100 records committed...
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 167);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 860);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 936);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 128);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 486);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 384);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 780);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 114);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 336);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 312);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 646);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 762);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 749);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 577);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 437);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 835);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 730);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 485);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 788);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 280);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 850);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 436);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 372);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 338);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 983);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 879);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 611);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 881);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 444);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 789);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 782);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 258);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 745);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 841);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 816);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 341);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 152);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 882);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 478);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 185);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 451);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 317);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 493);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 857);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 668);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 507);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 60);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 744);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 315);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 364);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 906);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 587);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 982);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 635);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 759);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 247);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 180);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 791);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 533);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 137);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 889);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 459);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 553);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 690);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 267);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 925);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 940);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 125);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 329);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 348);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 630);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 809);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 696);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 798);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 362);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 812);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 751);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 183);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 758);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 695);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 411);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 385);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 707);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 422);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 840);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 727);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 604);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 715);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 342);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 184);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 425);
insert into DIFFICULTY (d_name, d_id)
values ('hard', 531);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 133);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 243);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 684);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 732);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 284);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 325);
insert into DIFFICULTY (d_name, d_id)
values ('easy', 862);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 905);
commit;
prompt 200 records committed...
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 944);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 471);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 4);
commit;
prompt 203 records loaded
prompt Loading KIND...
insert into KIND (k_name, k_id)
values ('climb', 5919);
insert into KIND (k_name, k_id)
values ('wet', 8881);
insert into KIND (k_name, k_id)
values ('wet', 6283);
insert into KIND (k_name, k_id)
values ('climb', 8289);
insert into KIND (k_name, k_id)
values ('dry', 2335);
insert into KIND (k_name, k_id)
values ('walk', 5626);
insert into KIND (k_name, k_id)
values ('climb', 9855);
insert into KIND (k_name, k_id)
values ('bicycle', 9995);
insert into KIND (k_name, k_id)
values ('walk', 8227);
insert into KIND (k_name, k_id)
values ('walk', 6798);
insert into KIND (k_name, k_id)
values ('walk', 1655);
insert into KIND (k_name, k_id)
values ('wet', 2883);
insert into KIND (k_name, k_id)
values ('jeep', 4493);
insert into KIND (k_name, k_id)
values ('jeep', 5323);
insert into KIND (k_name, k_id)
values ('jeep', 4666);
insert into KIND (k_name, k_id)
values ('walk', 3854);
insert into KIND (k_name, k_id)
values ('bicycle', 9983);
insert into KIND (k_name, k_id)
values ('climb', 2675);
insert into KIND (k_name, k_id)
values ('bicycle', 5656);
insert into KIND (k_name, k_id)
values ('bicycle', 4149);
insert into KIND (k_name, k_id)
values ('dry', 9327);
insert into KIND (k_name, k_id)
values ('wet', 2333);
insert into KIND (k_name, k_id)
values ('wet', 1223);
insert into KIND (k_name, k_id)
values ('walk', 6373);
insert into KIND (k_name, k_id)
values ('family', 2968);
insert into KIND (k_name, k_id)
values ('wet', 3943);
insert into KIND (k_name, k_id)
values ('bicycle', 7244);
insert into KIND (k_name, k_id)
values ('walk', 2172);
insert into KIND (k_name, k_id)
values ('wet', 8169);
insert into KIND (k_name, k_id)
values ('jeep', 8674);
insert into KIND (k_name, k_id)
values ('bicycle', 8999);
insert into KIND (k_name, k_id)
values ('walk', 1229);
insert into KIND (k_name, k_id)
values ('walk', 9972);
insert into KIND (k_name, k_id)
values ('dry', 7818);
insert into KIND (k_name, k_id)
values ('bicycle', 8791);
insert into KIND (k_name, k_id)
values ('family', 9162);
insert into KIND (k_name, k_id)
values ('walk', 9914);
insert into KIND (k_name, k_id)
values ('family', 6129);
insert into KIND (k_name, k_id)
values ('bicycle', 9545);
insert into KIND (k_name, k_id)
values ('climb', 9732);
insert into KIND (k_name, k_id)
values ('bicycle', 7835);
insert into KIND (k_name, k_id)
values ('dry', 4518);
insert into KIND (k_name, k_id)
values ('climb', 6832);
insert into KIND (k_name, k_id)
values ('climb', 5821);
insert into KIND (k_name, k_id)
values ('family', 5165);
insert into KIND (k_name, k_id)
values ('jeep', 6431);
insert into KIND (k_name, k_id)
values ('jeep', 4345);
insert into KIND (k_name, k_id)
values ('jeep', 7945);
insert into KIND (k_name, k_id)
values ('bicycle', 8744);
insert into KIND (k_name, k_id)
values ('jeep', 1646);
insert into KIND (k_name, k_id)
values ('wet', 1298);
insert into KIND (k_name, k_id)
values ('family', 4574);
insert into KIND (k_name, k_id)
values ('walk', 6835);
insert into KIND (k_name, k_id)
values ('jeep', 5337);
insert into KIND (k_name, k_id)
values ('wet', 1552);
insert into KIND (k_name, k_id)
values ('climb', 4758);
insert into KIND (k_name, k_id)
values ('dry', 3632);
insert into KIND (k_name, k_id)
values ('climb', 7264);
insert into KIND (k_name, k_id)
values ('jeep', 1425);
insert into KIND (k_name, k_id)
values ('dry', 9554);
insert into KIND (k_name, k_id)
values ('dry', 2213);
insert into KIND (k_name, k_id)
values ('walk', 4346);
insert into KIND (k_name, k_id)
values ('bicycle', 4613);
insert into KIND (k_name, k_id)
values ('dry', 9717);
insert into KIND (k_name, k_id)
values ('jeep', 6872);
insert into KIND (k_name, k_id)
values ('climb', 6649);
insert into KIND (k_name, k_id)
values ('bicycle', 5317);
insert into KIND (k_name, k_id)
values ('dry', 1621);
insert into KIND (k_name, k_id)
values ('jeep', 8513);
insert into KIND (k_name, k_id)
values ('wet', 8134);
insert into KIND (k_name, k_id)
values ('jeep', 6612);
insert into KIND (k_name, k_id)
values ('climb', 6573);
insert into KIND (k_name, k_id)
values ('climb', 3952);
insert into KIND (k_name, k_id)
values ('jeep', 9639);
insert into KIND (k_name, k_id)
values ('bicycle', 1798);
insert into KIND (k_name, k_id)
values ('bicycle', 6855);
insert into KIND (k_name, k_id)
values ('jeep', 2983);
insert into KIND (k_name, k_id)
values ('wet', 9115);
insert into KIND (k_name, k_id)
values ('climb', 4529);
insert into KIND (k_name, k_id)
values ('wet', 7148);
insert into KIND (k_name, k_id)
values ('walk', 1991);
insert into KIND (k_name, k_id)
values ('family', 3384);
insert into KIND (k_name, k_id)
values ('jeep', 3169);
insert into KIND (k_name, k_id)
values ('jeep', 2923);
insert into KIND (k_name, k_id)
values ('dry', 5888);
insert into KIND (k_name, k_id)
values ('climb', 8275);
insert into KIND (k_name, k_id)
values ('family', 7866);
insert into KIND (k_name, k_id)
values ('bicycle', 7354);
insert into KIND (k_name, k_id)
values ('family', 2396);
insert into KIND (k_name, k_id)
values ('climb', 7568);
insert into KIND (k_name, k_id)
values ('walk', 1856);
insert into KIND (k_name, k_id)
values ('jeep', 9844);
insert into KIND (k_name, k_id)
values ('climb', 1473);
insert into KIND (k_name, k_id)
values ('family', 7726);
insert into KIND (k_name, k_id)
values ('family', 1252);
insert into KIND (k_name, k_id)
values ('walk', 4934);
insert into KIND (k_name, k_id)
values ('bicycle', 9358);
insert into KIND (k_name, k_id)
values ('jeep', 7185);
insert into KIND (k_name, k_id)
values ('family', 5782);
insert into KIND (k_name, k_id)
values ('jeep', 1526);
commit;
prompt 100 records committed...
insert into KIND (k_name, k_id)
values ('climb', 3795);
insert into KIND (k_name, k_id)
values ('jeep', 5972);
insert into KIND (k_name, k_id)
values ('dry', 7842);
insert into KIND (k_name, k_id)
values ('dry', 9453);
insert into KIND (k_name, k_id)
values ('climb', 9517);
insert into KIND (k_name, k_id)
values ('jeep', 7174);
insert into KIND (k_name, k_id)
values ('walk', 4494);
insert into KIND (k_name, k_id)
values ('bicycle', 5561);
insert into KIND (k_name, k_id)
values ('dry', 3252);
insert into KIND (k_name, k_id)
values ('climb', 9414);
insert into KIND (k_name, k_id)
values ('wet', 2917);
insert into KIND (k_name, k_id)
values ('family', 5438);
insert into KIND (k_name, k_id)
values ('jeep', 7895);
insert into KIND (k_name, k_id)
values ('family', 9113);
insert into KIND (k_name, k_id)
values ('walk', 4587);
insert into KIND (k_name, k_id)
values ('bicycle', 1483);
insert into KIND (k_name, k_id)
values ('dry', 3398);
insert into KIND (k_name, k_id)
values ('family', 1661);
insert into KIND (k_name, k_id)
values ('dry', 8542);
insert into KIND (k_name, k_id)
values ('jeep', 7397);
insert into KIND (k_name, k_id)
values ('walk', 8344);
insert into KIND (k_name, k_id)
values ('climb', 5694);
insert into KIND (k_name, k_id)
values ('family', 5449);
insert into KIND (k_name, k_id)
values ('family', 3574);
insert into KIND (k_name, k_id)
values ('family', 7924);
insert into KIND (k_name, k_id)
values ('wet', 2326);
insert into KIND (k_name, k_id)
values ('dry', 5452);
insert into KIND (k_name, k_id)
values ('climb', 3391);
insert into KIND (k_name, k_id)
values ('dry', 8711);
insert into KIND (k_name, k_id)
values ('wet', 8529);
insert into KIND (k_name, k_id)
values ('walk', 5628);
insert into KIND (k_name, k_id)
values ('bicycle', 1734);
insert into KIND (k_name, k_id)
values ('bicycle', 2714);
insert into KIND (k_name, k_id)
values ('wet', 5342);
insert into KIND (k_name, k_id)
values ('wet', 7645);
insert into KIND (k_name, k_id)
values ('bicycle', 1454);
insert into KIND (k_name, k_id)
values ('jeep', 5714);
insert into KIND (k_name, k_id)
values ('family', 8486);
insert into KIND (k_name, k_id)
values ('jeep', 5525);
insert into KIND (k_name, k_id)
values ('bicycle', 1763);
insert into KIND (k_name, k_id)
values ('family', 3677);
insert into KIND (k_name, k_id)
values ('dry', 9184);
insert into KIND (k_name, k_id)
values ('wet', 9419);
insert into KIND (k_name, k_id)
values ('wet', 5797);
insert into KIND (k_name, k_id)
values ('family', 6545);
insert into KIND (k_name, k_id)
values ('walk', 7241);
insert into KIND (k_name, k_id)
values ('walk', 6221);
insert into KIND (k_name, k_id)
values ('bicycle', 4336);
insert into KIND (k_name, k_id)
values ('wet', 1339);
insert into KIND (k_name, k_id)
values ('family', 4696);
insert into KIND (k_name, k_id)
values ('climb', 1935);
insert into KIND (k_name, k_id)
values ('jeep', 5572);
insert into KIND (k_name, k_id)
values ('climb', 3288);
insert into KIND (k_name, k_id)
values ('climb', 1698);
insert into KIND (k_name, k_id)
values ('climb', 7318);
insert into KIND (k_name, k_id)
values ('climb', 3289);
insert into KIND (k_name, k_id)
values ('walk', 9646);
insert into KIND (k_name, k_id)
values ('bicycle', 1652);
insert into KIND (k_name, k_id)
values ('family', 3147);
insert into KIND (k_name, k_id)
values ('walk', 4486);
insert into KIND (k_name, k_id)
values ('wet', 3197);
insert into KIND (k_name, k_id)
values ('jeep', 6363);
insert into KIND (k_name, k_id)
values ('walk', 8327);
insert into KIND (k_name, k_id)
values ('family', 8859);
insert into KIND (k_name, k_id)
values ('family', 9628);
insert into KIND (k_name, k_id)
values ('climb', 2588);
insert into KIND (k_name, k_id)
values ('wet', 3973);
insert into KIND (k_name, k_id)
values ('family', 2989);
insert into KIND (k_name, k_id)
values ('climb', 8699);
insert into KIND (k_name, k_id)
values ('dry', 8895);
insert into KIND (k_name, k_id)
values ('family', 5286);
insert into KIND (k_name, k_id)
values ('family', 3195);
insert into KIND (k_name, k_id)
values ('dry', 3848);
insert into KIND (k_name, k_id)
values ('family', 3874);
insert into KIND (k_name, k_id)
values ('climb', 5914);
insert into KIND (k_name, k_id)
values ('climb', 4998);
insert into KIND (k_name, k_id)
values ('dry', 1185);
insert into KIND (k_name, k_id)
values ('dry', 9472);
insert into KIND (k_name, k_id)
values ('jeep', 7786);
insert into KIND (k_name, k_id)
values ('bicycle', 5953);
insert into KIND (k_name, k_id)
values ('bicycle', 3798);
insert into KIND (k_name, k_id)
values ('family', 2534);
insert into KIND (k_name, k_id)
values ('bicycle', 8611);
insert into KIND (k_name, k_id)
values ('dry', 7623);
insert into KIND (k_name, k_id)
values ('walk', 3432);
insert into KIND (k_name, k_id)
values ('walk', 7598);
insert into KIND (k_name, k_id)
values ('climb', 8331);
insert into KIND (k_name, k_id)
values ('walk', 2551);
insert into KIND (k_name, k_id)
values ('walk', 9765);
insert into KIND (k_name, k_id)
values ('dry', 5853);
insert into KIND (k_name, k_id)
values ('family', 2689);
insert into KIND (k_name, k_id)
values ('bicycle', 6734);
insert into KIND (k_name, k_id)
values ('bicycle', 9156);
insert into KIND (k_name, k_id)
values ('wet', 8521);
insert into KIND (k_name, k_id)
values ('climb', 5813);
insert into KIND (k_name, k_id)
values ('bicycle', 3892);
insert into KIND (k_name, k_id)
values ('walk', 1);
insert into KIND (k_name, k_id)
values ('wet', 2);
insert into KIND (k_name, k_id)
values ('dry', 3);
commit;
prompt 199 records loaded
prompt Loading MY_PATH...
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vjgvr', .44, 40.33, 6315, 466, 329, 5286);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wfkey', 3.72, 12.37, 8891, 585, 261, 8542);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fbmsn', 1.01, 34.53, 6596, 775, 76, 7264);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Lxhrr', 4.42, 42.28, 3560, 29, 341, 1425);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Iqrtw', 7.58, 23.02, 9061, 803, 13, 9472);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xaebr', 4.24, 41.88, 5646, 419, 942, 7842);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pcheb', 3.72, 15.91, 5835, 660, 336, 4486);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Uuuet', 1.2, 44.7, 7112, 270, 798, 5656);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bccse', 1.68, 41.32, 7535, 558, 384, 3195);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Jxech', 6.89, 21.83, 3275, 150, 362, 9914);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Safuu', 2.38, 37.15, 8291, 2, 732, 6573);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vmwmd', .43, 28.99, 5447, 424, 94, 2917);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pdcxd', 7.56, 34.24, 5963, 17, 99, 3574);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vyqts', 6.09, 10.03, 8579, 725, 61, 9453);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Nwcpn', 3.28, 34.88, 3091, 131, 732, 5813);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xpdpm', 2.45, 30.35, 4216, 931, 486, 8674);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Hrxrp', 3.81, 13.53, 8792, 831, 422, 8521);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Onfud', 5.35, 8.68, 6864, 457, 60, 1339);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Whbmj', 7.15, 37.69, 2948, 611, 71, 9545);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Aakik', 4.72, 6.6, 1842, 466, 183, 2588);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Freha', 3.25, 33.94, 1146, 725, 437, 4346);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ngfnc', 5.39, 34.29, 2679, 468, 809, 9972);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gsvad', 1.95, 11.07, 3851, 409, 791, 3391);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ewtfd', .13, 13.93, 2224, 688, 809, 5165);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Kymqz', 2, 23.1, 9133, 854, 847, 9414);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gheqj', .79, 25.23, 3381, 288, 34, 5797);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xkwpm', .08, 2.31, 6548, 648, 44, 3197);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Dnyqj', 7.98, 44.39, 7582, 515, 879, 5165);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Hqvac', 4.98, 43.18, 3570, 29, 862, 9472);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Kirnw', 1.14, 27.16, 6305, 118, 17, 6832);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gwkhz', .19, 13, 7649, 810, 55, 9983);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Jhhvj', 1.31, 9.14, 8519, 891, 128, 1425);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ohoyz', 7.89, 16.39, 6231, 920, 348, 1646);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fwpdy', 4.64, 40.11, 6109, 785, 4, 6855);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ocidv', 1.46, 39.36, 3973, 499, 54, 8327);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qsrjh', 2.8, 43.43, 2929, 277, 788, 6734);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cloyw', 7.78, 14.1, 6640, 296, 507, 5853);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vqmmw', 4.32, 11.36, 2430, 961, 635, 5449);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zxvhp', 6.3, 16.27, 1509, 852, 372, 3795);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Hlxag', 5.18, 33.35, 8541, 368, 55, 4666);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tsyri', 2.04, 9.79, 3102, 619, 49, 7623);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Hvosb', 2.59, 18.05, 3973, 343, 35, 8791);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vlscl', 3.69, 17.1, 2530, 393, 81, 5714);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rmqiy', 4.12, 36.31, 3059, 852, 97, 2551);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rrswi', 7.9, 19.73, 4789, 291, 60, 7174);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mmpry', 2.45, 23.57, 2838, 9, 983, 7397);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Jptpr', 4.88, 5.26, 1243, 635, 630, 1425);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zkdyn', 7.6, 11.3, 2009, 318, 325, 8289);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Syaku', 6.47, 15.42, 7308, 393, 751, 1339);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wdpbt', 7.09, 43.64, 5002, 713, 243, 5317);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Stuul', 3.72, 17.49, 3113, 895, 92, 2714);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gntbx', 5.81, 2.88, 4916, 903, 44, 8791);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Perkb', 3.25, 3.73, 5774, 17, 603, 6855);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vgjdf', 4.05, 18.19, 6749, 271, 79, 6129);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zdpaz', 5.36, 30.93, 6801, 328, 83, 4696);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bhpta', 5.54, 30.91, 3396, 552, 51, 5853);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tlxpc', 5.13, 10.89, 2932, 176, 484, 4149);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Exnzx', 5.85, 5.02, 4985, 6, 23, 1483);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Klfia', 1.79, 20.33, 9483, 763, 604, 4493);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qnges', 2.08, 32.36, 6263, 728, 377, 2675);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Seyix', .54, 11.65, 4629, 442, 982, 1552);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ketmg', 5.68, 25.4, 4021, 859, 425, 6129);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wlykl', 7.38, 32.61, 1927, 998, 436, 9162);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tjxfa', 4.24, 38.77, 9735, 658, 385, 1646);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gnebs', 2.86, 29.48, 7266, 4, 247, 1454);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Thxrg', 2.33, 38.54, 5891, 115, 15, 8791);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yupyl', 7.56, 33.65, 5072, 497, 533, 7924);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yukhn', 3.69, 33.12, 6451, 790, 889, 4696);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rsdeq', 6.42, 26.72, 6039, 673, 603, 5919);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yyvpd', 2.94, 2.14, 6211, 458, 44, 5626);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vlbxy', 4.57, 25.65, 9750, 120, 128, 6373);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gdkbm', 1.53, 6.77, 1158, 598, 82, 4587);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Euatn', 2.62, 22.45, 2990, 630, 338, 1483);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Szuky', 6.96, 17.31, 3125, 233, 16, 6431);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Lbdpv', 7.62, 23.67, 9680, 35, 14, 2968);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Txpge', .42, 17.01, 2186, 425, 879, 1483);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mjmou', 5.72, 6.3, 6009, 57, 93, 9844);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Haddb', 4.07, 28.17, 1253, 263, 862, 3874);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xogjt', .78, 13.48, 1829, 644, 603, 8486);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Jzlbd', 4.98, 25.2, 7755, 595, 751, 3147);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vmyno', .93, 8.3, 8626, 487, 4, 5694);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cfryu', 6.88, 18.92, 1220, 91, 983, 1);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Lttax', 5.32, 39.38, 9703, 142, 889, 1646);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zpsel', 2.88, 34.71, 8994, 529, 553, 1646);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wxdgs', 5.07, 6.49, 4531, 80, 86, 7866);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zrvwf', .25, 26.67, 1747, 630, 325, 7397);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ohjjr', 6.65, 41.65, 5829, 233, 782, 7786);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Auugx', 6.35, 44.62, 3595, 953, 791, 3632);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fexph', 7.72, 24.3, 2594, 417, 411, 7318);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Nqqxp', 7, 13.95, 1475, 222, 81, 3795);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tstzy', 1.66, 15.79, 4941, 370, 60, 6363);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Emxzy', 2.15, 39.13, 7838, 243, 447, 7568);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yxnlj', .83, 21.69, 1519, 877, 567, 4934);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qvqhu', 6.23, 41.02, 3613, 658, 180, 4529);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bfxqi', 6.68, 9.51, 6901, 575, 261, 3197);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qbdud', 2.13, 12.73, 8399, 584, 857, 6221);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wdagg', .92, 19.97, 5168, 452, 67, 3952);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wsjld', .05, 33.99, 2230, 497, 60, 4494);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pcike', 1.8, 1.52, 4448, 118, 60, 5165);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ilcxa', 2.23, 31.16, 5006, 546, 57, 5323);
commit;
prompt 100 records committed...
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Nmfzp', 7.64, 20.43, 7986, 392, 183, 4345);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mebis', 4.84, 28.53, 6838, 818, 696, 5317);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tpwcj', 3.78, 13.94, 4828, 222, 862, 5953);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yyqjd', 1.99, 20.07, 9561, 408, 857, 5342);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Dunvn', 2.98, 24.75, 5938, 944, 425, 3398);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Hsqvv', 7.06, 9.48, 6286, 997, 247, 9184);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cepla', 3.49, 18.61, 8252, 870, 24, 4529);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qleco', 4.57, 29.46, 8029, 767, 744, 3795);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Joshh', 6.88, 25.06, 6752, 404, 758, 2675);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Lhxxr', 3.47, 6.17, 9454, 458, 29, 2396);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mwkxv', 7.73, 33.07, 5643, 729, 247, 7174);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Uizzi', 5.28, 5.84, 6212, 20, 22, 7866);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pklxa', 5.36, 7.84, 8772, 677, 38, 9162);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wsmdp', 5.92, 3.41, 1588, 511, 35, 3952);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Lpirl', 1.66, 10.27, 8528, 39, 14, 8674);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Kugev', .57, 40.18, 1090, 194, 180, 7244);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Puhnz', 7.2, 15.53, 2304, 650, 565, 5317);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tokgp', 2.59, 20.37, 3167, 332, 71, 2989);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wlurl', 7.69, 6.1, 7112, 705, 507, 9453);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cxwhu', 1.57, 35.58, 4544, 339, 587, 7818);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gojev', 5.02, 1.87, 4872, 814, 436, 7786);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mtrpu', 3.79, 5.07, 6366, 953, 298, 1483);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fgswg', .85, 8.59, 4191, 222, 730, 3848);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rbcuf', 4.08, 26.71, 6031, 624, 478, 5626);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xusnv', 1, 9.1, 1713, 792, 696, 1526);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vmpuu', 4.21, 28.72, 7935, 283, 55, 7645);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Oaegw', .71, 44.96, 9603, 859, 567, 7623);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Meeid', 3.1, 6.97, 8183, 898, 21, 3252);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vpmsm', .93, 6.71, 4424, 50, 78, 1223);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Oyxju', 5.69, 31.8, 5806, 138, 782, 4613);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Sohij', 3.73, 38.31, 8763, 5, 730, 1698);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ihlfc', 3.87, 11.44, 6552, 851, 81, 3677);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yydbg', .94, 8.15, 3341, 615, 983, 1339);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Dlsmo', 4.46, 1.78, 7414, 671, 635, 2396);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rekde', 4.21, 30.14, 4894, 121, 411, 8999);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Brmzm', 5.34, 15.55, 7052, 719, 25, 8513);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fndye', 6.57, 25.17, 3054, 735, 95, 4346);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ahfxb', 6.95, 10.77, 8862, 243, 65, 7241);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Jgqwg', 7.61, 20.58, 6968, 382, 338, 8486);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rvdvr', 4.2, 1.51, 4418, 417, 183, 3384);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rvwsa', 4.44, 35.91, 2241, 881, 715, 9115);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yyinb', 2, 24.76, 8408, 5, 94, 7623);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xcufa', 4.51, 42.4, 3972, 674, 451, 4336);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mtdnb', 3.42, 16.49, 1511, 644, 65, 5782);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rfvri', 6.41, 10.8, 1278, 705, 32, 1798);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yacrr', 1.7, 12.71, 9911, 261, 125, 3197);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vujvb', .93, 28.72, 5085, 465, 841, 8699);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Frsur', 1.24, 2.55, 2650, 921, 889, 3574);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Nwgao', 6.19, 40.16, 4873, 677, 137, 3147);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Erute', 6.58, 3.32, 9439, 595, 46, 1185);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bzbyx', 1.29, 2.52, 6501, 903, 437, 7866);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Owuhb', .68, 14.32, 6027, 963, 152, 3795);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Edyeq', .47, 35.59, 2160, 578, 83, 1655);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mpbqk', 7.42, 1.62, 1782, 733, 133, 7264);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pzqdc', 7.76, 15.91, 6852, 773, 167, 1552);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tjklh', 7.6, 32.44, 6077, 808, 325, 3);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Uskpn', 2.6, 17.05, 3096, 142, 75, 5317);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bnokf', 7.51, 29.28, 6191, 851, 325, 5561);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fryps', 4.15, 15.07, 1728, 697, 51, 8529);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Brmeo', 1.16, 32.71, 9690, 126, 384, 8744);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tymho', .72, 17.76, 4128, 725, 425, 1483);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Povwl', 1.4, 24.62, 8515, 290, 447, 7241);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zphkb', 4.31, 27.03, 6406, 227, 553, 4486);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xytcx', 4.87, 3.05, 3592, 796, 183, 9732);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Adbzs', 4.38, 2.81, 7492, 877, 68, 1655);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Irlnw', 6.18, 42.44, 6480, 131, 906, 2675);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Eefyu', 5.04, 8.13, 5956, 277, 39, 1935);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Suffh', 2.09, 40.18, 7471, 80, 577, 7726);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tadmn', 3.7, 21.51, 3805, 318, 459, 3874);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yyobb', 1.24, 5.58, 9240, 113, 247, 2917);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qumbi', 3.42, 14.32, 4273, 153, 341, 1698);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ajsjz', .06, 42.01, 3284, 484, 84, 5797);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ggjzt', .98, 21.52, 1665, 719, 906, 6431);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Nnwow', .53, 20.23, 4814, 203, 882, 1185);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ofjrk', 6.79, 33.08, 7145, 382, 668, 6221);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Uhabi', 2.4, 7.87, 6652, 953, 348, 4696);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Eytvh', 2.9, 28.72, 1995, 468, 342, 3384);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rzkcs', 1.36, 22.96, 8721, 624, 51, 6573);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yvlgj', 3.07, 5.21, 6340, 552, 247, 8521);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bdaxu', 2.13, 22.42, 7851, 877, 15, 1473);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ggtof', 5.11, 32.82, 5921, 920, 14, 7818);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fbjzx', 1.61, 35.55, 8007, 677, 675, 7726);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Iykha', 3.65, 36.3, 5218, 339, 12, 9414);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ajlsd', 3.2, 11.32, 3072, 578, 261, 4998);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Acmdh', 1.36, 18.75, 4742, 126, 45, 9639);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Dlnqn', 5.53, 15.53, 6412, 851, 675, 5853);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zmlax', 6.84, 6, 4812, 784, 840, 7148);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Hspwg', 6.49, 16.66, 3481, 49, 97, 9717);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ayqyx', 1.22, 11.73, 8045, 283, 411, 2714);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rprvj', 2, 6.48, 6784, 767, 55, 9453);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ahueo', 1.71, 26.97, 1902, 45, 32, 4494);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Lpuwb', .32, 24.16, 9436, 29, 65, 3848);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mkhbw', .11, 4.19, 2459, 411, 99, 7148);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Xopqk', 3.3, 16.1, 4304, 282, 377, 2213);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Hvpkk', 4.49, 37.66, 6241, 18, 267, 1339);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Elrou', 3.49, 2.08, 2789, 652, 14, 7568);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yiiqg', 6.05, 28.34, 7828, 57, 133, 3147);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pafdh', .37, 18.01, 3518, 731, 377, 3391);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Brequ', 7.47, 24.79, 3062, 152, 348, 2968);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gbjso', .76, 19.91, 5584, 392, 812, 7818);
commit;
prompt 200 records committed...
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mpabr', 2.69, 22.58, 6313, 328, 247, 4758);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Jdcbq', 2.57, 33.3, 6614, 118, 133, 1483);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tmoig', .38, 39.57, 8581, 131, 243, 2917);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fmhue', 2.92, 6.79, 2579, 303, 67, 9156);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cdwos', 1.07, 19.57, 7508, 262, 72, 1763);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Buiuz', 1.95, 27.84, 7791, 492, 71, 5286);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bmfbn', .29, 7.73, 8694, 985, 385, 3197);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ifyio', 7.23, 29.7, 7767, 939, 94, 5714);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rzbnx', 3.65, 40.16, 2457, 129, 77, 7174);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qopft', 6.04, 21.33, 4675, 113, 31, 5714);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gliwd', 2.01, 37.24, 3913, 754, 889, 7726);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Qemuc', 2.53, 35.39, 2294, 499, 744, 4493);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Sjtcu', 1.03, 44.95, 4964, 328, 78, 7945);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Faqtz', 3.06, 12.1, 1052, 129, 696, 2689);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Dqgxc', .95, 35.8, 5288, 698, 280, 5286);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mdzgq', 2.64, 24.04, 3288, 41, 431, 8227);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Byeup', 1.04, 31.68, 3227, 293, 744, 7241);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Lyakm', 3.74, 25.68, 1371, 925, 184, 3952);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Upgdh', .53, 2.1, 4583, 270, 49, 1473);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Iuskj', 4.5, 38.72, 3723, 862, 447, 3288);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ixrds', 2.42, 14.33, 1988, 652, 65, 3197);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fogwt', 7.56, 23.08, 1341, 624, 95, 5452);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ggmup', 4.08, 22.78, 3492, 287, 816, 5342);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ykzep', 6.58, 14.54, 5339, 652, 37, 9115);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Dmiic', .92, 16.05, 2737, 457, 42, 2989);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tbbqj', 5.53, 20.89, 1657, 769, 882, 1552);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vcpmx', 7.2, 19.22, 1282, 27, 983, 2989);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pvaxj', 7.97, 15.62, 1162, 931, 732, 9972);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fbpcl', 3.99, 31.67, 3562, 272, 759, 5286);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Yzfip', 3.42, 27.04, 8804, 35, 3, 5286);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mdjob', 6.69, 35.98, 9084, 725, 14, 3195);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Fjrin', 3.85, 23.72, 1575, 652, 936, 6734);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gvpoe', 5.88, 4.18, 4982, 635, 39, 2333);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vpkyq', 1.57, 12.35, 5886, 963, 484, 1252);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rgqlj', 1.92, 15.08, 6812, 442, 905, 3197);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Aynnc', 1.52, 26.7, 8658, 515, 61, 4758);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pcjce', 3.27, 34.76, 7404, 118, 982, 5626);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Utsfn', 3.14, 5.89, 9504, 635, 27, 5888);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Jhsga', 4.7, 23.98, 4294, 939, 51, 5953);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cbmef', .93, 10.69, 4590, 698, 97, 2534);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Vzugl', 3.48, 34.69, 4992, 176, 307, 8791);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tbccd', 2.85, 5.96, 3520, 575, 14, 3973);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rrcyo', 1.72, 13.31, 9395, 764, 678, 8169);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cbovx', 3.67, 32.03, 6313, 423, 352, 8744);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Awnwn', 1.02, 6.97, 2340, 86, 69, 5317);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Reldu', 4.31, 14.99, 8184, 821, 73, 6573);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Foihq', 5.4, 28.4, 6310, 944, 791, 5953);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ehvyl', 2.5, 16.93, 3569, 668, 732, 2983);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wgjfr', 2.81, 33.67, 1764, 979, 45, 8999);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Nxvex', 1.69, 21.97, 1773, 784, 533, 9983);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Pijff', 1.28, 38.45, 5281, 442, 372, 6363);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Kbmex', 6.53, 30.48, 1739, 82, 79, 9983);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Zshrx', 4.75, 34.29, 1175, 565, 906, 7895);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Atlex', 3.13, 18.22, 3384, 138, 983, 6363);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Bzzpr', 6.35, 7.62, 8139, 734, 77, 1991);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Kmbnn', 4.35, 38.89, 2500, 856, 86, 7244);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Cwpns', .89, 28.8, 4646, 491, 64, 1);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Gnlqw', 1.84, 27.02, 6290, 638, 944, 9472);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Helmr', 5.93, 36.47, 1228, 650, 962, 8486);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Mojwc', 4.17, 40.3, 5666, 45, 668, 8344);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Buipn', 5.34, 36.12, 7194, 242, 788, 3384);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Wfbrm', 4.85, 30.93, 1997, 261, 24, 4345);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tzenz', 7.42, 28.59, 9055, 962, 43, 2213);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Szzgz', 5.36, 16.12, 2542, 487, 816, 2534);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Rfxca', 7.39, 37.21, 3221, 332, 79, 9184);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Kwbop', 1.16, 28.63, 6016, 287, 493, 3252);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Drasf', .34, 27.8, 4863, 773, 99, 2396);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Ainje', 2.12, 42.94, 9542, 954, 992, 5797);
insert into MY_PATH (p_name, p_time, p_length, p_id, a_id, d_id, k_id)
values ('Tawsj', .93, 11.17, 3501, 630, 57, 1991);
commit;
prompt 269 records loaded
prompt Loading BELONGS_TO...
insert into BELONGS_TO (i_id, p_id, a_id)
values (1, 9483, 763);
insert into BELONGS_TO (i_id, p_id, a_id)
values (2, 6263, 728);
insert into BELONGS_TO (i_id, p_id, a_id)
values (3, 4629, 442);
insert into BELONGS_TO (i_id, p_id, a_id)
values (4, 4021, 859);
insert into BELONGS_TO (i_id, p_id, a_id)
values (5, 1927, 998);
insert into BELONGS_TO (i_id, p_id, a_id)
values (6, 9735, 658);
insert into BELONGS_TO (i_id, p_id, a_id)
values (7, 7266, 4);
insert into BELONGS_TO (i_id, p_id, a_id)
values (8, 5891, 115);
insert into BELONGS_TO (i_id, p_id, a_id)
values (9, 5072, 497);
insert into BELONGS_TO (i_id, p_id, a_id)
values (10, 6451, 790);
insert into BELONGS_TO (i_id, p_id, a_id)
values (11, 6039, 673);
insert into BELONGS_TO (i_id, p_id, a_id)
values (12, 6211, 458);
insert into BELONGS_TO (i_id, p_id, a_id)
values (13, 9750, 120);
insert into BELONGS_TO (i_id, p_id, a_id)
values (14, 1158, 598);
insert into BELONGS_TO (i_id, p_id, a_id)
values (15, 2990, 630);
insert into BELONGS_TO (i_id, p_id, a_id)
values (16, 3125, 233);
insert into BELONGS_TO (i_id, p_id, a_id)
values (17, 9680, 35);
insert into BELONGS_TO (i_id, p_id, a_id)
values (18, 2186, 425);
insert into BELONGS_TO (i_id, p_id, a_id)
values (19, 6009, 57);
insert into BELONGS_TO (i_id, p_id, a_id)
values (20, 1253, 263);
insert into BELONGS_TO (i_id, p_id, a_id)
values (21, 1829, 644);
insert into BELONGS_TO (i_id, p_id, a_id)
values (22, 7755, 595);
insert into BELONGS_TO (i_id, p_id, a_id)
values (23, 8626, 487);
insert into BELONGS_TO (i_id, p_id, a_id)
values (24, 1220, 91);
insert into BELONGS_TO (i_id, p_id, a_id)
values (25, 9703, 142);
insert into BELONGS_TO (i_id, p_id, a_id)
values (26, 8994, 529);
insert into BELONGS_TO (i_id, p_id, a_id)
values (27, 4531, 80);
insert into BELONGS_TO (i_id, p_id, a_id)
values (28, 1747, 630);
insert into BELONGS_TO (i_id, p_id, a_id)
values (29, 5829, 233);
insert into BELONGS_TO (i_id, p_id, a_id)
values (30, 3595, 953);
insert into BELONGS_TO (i_id, p_id, a_id)
values (31, 2594, 417);
insert into BELONGS_TO (i_id, p_id, a_id)
values (32, 1475, 222);
insert into BELONGS_TO (i_id, p_id, a_id)
values (33, 4941, 370);
insert into BELONGS_TO (i_id, p_id, a_id)
values (34, 7838, 243);
insert into BELONGS_TO (i_id, p_id, a_id)
values (35, 1519, 877);
insert into BELONGS_TO (i_id, p_id, a_id)
values (36, 3613, 658);
insert into BELONGS_TO (i_id, p_id, a_id)
values (37, 6901, 575);
insert into BELONGS_TO (i_id, p_id, a_id)
values (38, 8399, 584);
insert into BELONGS_TO (i_id, p_id, a_id)
values (39, 5168, 452);
insert into BELONGS_TO (i_id, p_id, a_id)
values (40, 2230, 497);
insert into BELONGS_TO (i_id, p_id, a_id)
values (41, 4448, 118);
insert into BELONGS_TO (i_id, p_id, a_id)
values (42, 5006, 546);
insert into BELONGS_TO (i_id, p_id, a_id)
values (43, 7986, 392);
insert into BELONGS_TO (i_id, p_id, a_id)
values (44, 6838, 818);
insert into BELONGS_TO (i_id, p_id, a_id)
values (45, 4828, 222);
insert into BELONGS_TO (i_id, p_id, a_id)
values (46, 9561, 408);
insert into BELONGS_TO (i_id, p_id, a_id)
values (47, 5938, 944);
insert into BELONGS_TO (i_id, p_id, a_id)
values (48, 6286, 997);
insert into BELONGS_TO (i_id, p_id, a_id)
values (49, 8252, 870);
insert into BELONGS_TO (i_id, p_id, a_id)
values (50, 8029, 767);
insert into BELONGS_TO (i_id, p_id, a_id)
values (51, 6752, 404);
insert into BELONGS_TO (i_id, p_id, a_id)
values (52, 9454, 458);
insert into BELONGS_TO (i_id, p_id, a_id)
values (53, 5643, 729);
insert into BELONGS_TO (i_id, p_id, a_id)
values (54, 6212, 20);
insert into BELONGS_TO (i_id, p_id, a_id)
values (55, 8772, 677);
insert into BELONGS_TO (i_id, p_id, a_id)
values (56, 1588, 511);
insert into BELONGS_TO (i_id, p_id, a_id)
values (57, 8528, 39);
insert into BELONGS_TO (i_id, p_id, a_id)
values (58, 1090, 194);
insert into BELONGS_TO (i_id, p_id, a_id)
values (59, 2304, 650);
insert into BELONGS_TO (i_id, p_id, a_id)
values (60, 3167, 332);
insert into BELONGS_TO (i_id, p_id, a_id)
values (61, 7112, 705);
insert into BELONGS_TO (i_id, p_id, a_id)
values (62, 4544, 339);
insert into BELONGS_TO (i_id, p_id, a_id)
values (63, 4872, 814);
insert into BELONGS_TO (i_id, p_id, a_id)
values (64, 6366, 953);
insert into BELONGS_TO (i_id, p_id, a_id)
values (65, 4191, 222);
insert into BELONGS_TO (i_id, p_id, a_id)
values (66, 6031, 624);
insert into BELONGS_TO (i_id, p_id, a_id)
values (67, 1713, 792);
insert into BELONGS_TO (i_id, p_id, a_id)
values (68, 7935, 283);
insert into BELONGS_TO (i_id, p_id, a_id)
values (69, 9603, 859);
insert into BELONGS_TO (i_id, p_id, a_id)
values (70, 8183, 898);
insert into BELONGS_TO (i_id, p_id, a_id)
values (71, 4424, 50);
insert into BELONGS_TO (i_id, p_id, a_id)
values (72, 5806, 138);
insert into BELONGS_TO (i_id, p_id, a_id)
values (73, 8763, 5);
insert into BELONGS_TO (i_id, p_id, a_id)
values (74, 6552, 851);
insert into BELONGS_TO (i_id, p_id, a_id)
values (75, 3341, 615);
insert into BELONGS_TO (i_id, p_id, a_id)
values (76, 7414, 671);
insert into BELONGS_TO (i_id, p_id, a_id)
values (77, 4894, 121);
insert into BELONGS_TO (i_id, p_id, a_id)
values (78, 7052, 719);
insert into BELONGS_TO (i_id, p_id, a_id)
values (79, 3054, 735);
insert into BELONGS_TO (i_id, p_id, a_id)
values (80, 8862, 243);
insert into BELONGS_TO (i_id, p_id, a_id)
values (81, 6968, 382);
insert into BELONGS_TO (i_id, p_id, a_id)
values (82, 4418, 417);
insert into BELONGS_TO (i_id, p_id, a_id)
values (83, 2241, 881);
insert into BELONGS_TO (i_id, p_id, a_id)
values (84, 8408, 5);
insert into BELONGS_TO (i_id, p_id, a_id)
values (85, 3972, 674);
insert into BELONGS_TO (i_id, p_id, a_id)
values (86, 1511, 644);
insert into BELONGS_TO (i_id, p_id, a_id)
values (87, 1278, 705);
insert into BELONGS_TO (i_id, p_id, a_id)
values (88, 9911, 261);
insert into BELONGS_TO (i_id, p_id, a_id)
values (89, 5085, 465);
insert into BELONGS_TO (i_id, p_id, a_id)
values (90, 2650, 921);
insert into BELONGS_TO (i_id, p_id, a_id)
values (91, 4873, 677);
insert into BELONGS_TO (i_id, p_id, a_id)
values (92, 9439, 595);
insert into BELONGS_TO (i_id, p_id, a_id)
values (93, 6501, 903);
insert into BELONGS_TO (i_id, p_id, a_id)
values (94, 6027, 963);
insert into BELONGS_TO (i_id, p_id, a_id)
values (95, 2160, 578);
insert into BELONGS_TO (i_id, p_id, a_id)
values (96, 1782, 733);
insert into BELONGS_TO (i_id, p_id, a_id)
values (97, 6852, 773);
insert into BELONGS_TO (i_id, p_id, a_id)
values (98, 6077, 808);
insert into BELONGS_TO (i_id, p_id, a_id)
values (99, 3096, 142);
insert into BELONGS_TO (i_id, p_id, a_id)
values (100, 6191, 851);
commit;
prompt 100 records committed...
insert into BELONGS_TO (i_id, p_id, a_id)
values (101, 1728, 697);
insert into BELONGS_TO (i_id, p_id, a_id)
values (102, 9690, 126);
insert into BELONGS_TO (i_id, p_id, a_id)
values (103, 4128, 725);
insert into BELONGS_TO (i_id, p_id, a_id)
values (104, 8515, 290);
insert into BELONGS_TO (i_id, p_id, a_id)
values (105, 6406, 227);
insert into BELONGS_TO (i_id, p_id, a_id)
values (106, 3592, 796);
insert into BELONGS_TO (i_id, p_id, a_id)
values (107, 7492, 877);
insert into BELONGS_TO (i_id, p_id, a_id)
values (108, 6480, 131);
insert into BELONGS_TO (i_id, p_id, a_id)
values (109, 5956, 277);
insert into BELONGS_TO (i_id, p_id, a_id)
values (110, 7471, 80);
insert into BELONGS_TO (i_id, p_id, a_id)
values (111, 3805, 318);
insert into BELONGS_TO (i_id, p_id, a_id)
values (112, 9240, 113);
insert into BELONGS_TO (i_id, p_id, a_id)
values (113, 4273, 153);
insert into BELONGS_TO (i_id, p_id, a_id)
values (114, 3284, 484);
insert into BELONGS_TO (i_id, p_id, a_id)
values (115, 1665, 719);
insert into BELONGS_TO (i_id, p_id, a_id)
values (116, 4814, 203);
insert into BELONGS_TO (i_id, p_id, a_id)
values (117, 7145, 382);
insert into BELONGS_TO (i_id, p_id, a_id)
values (118, 6652, 953);
insert into BELONGS_TO (i_id, p_id, a_id)
values (119, 1995, 468);
insert into BELONGS_TO (i_id, p_id, a_id)
values (120, 8721, 624);
insert into BELONGS_TO (i_id, p_id, a_id)
values (121, 6340, 552);
insert into BELONGS_TO (i_id, p_id, a_id)
values (122, 7851, 877);
insert into BELONGS_TO (i_id, p_id, a_id)
values (123, 5921, 920);
insert into BELONGS_TO (i_id, p_id, a_id)
values (124, 8007, 677);
insert into BELONGS_TO (i_id, p_id, a_id)
values (125, 5218, 339);
insert into BELONGS_TO (i_id, p_id, a_id)
values (126, 3072, 578);
insert into BELONGS_TO (i_id, p_id, a_id)
values (127, 4742, 126);
insert into BELONGS_TO (i_id, p_id, a_id)
values (128, 6412, 851);
insert into BELONGS_TO (i_id, p_id, a_id)
values (129, 4812, 784);
insert into BELONGS_TO (i_id, p_id, a_id)
values (130, 3481, 49);
insert into BELONGS_TO (i_id, p_id, a_id)
values (131, 8045, 283);
insert into BELONGS_TO (i_id, p_id, a_id)
values (132, 6784, 767);
insert into BELONGS_TO (i_id, p_id, a_id)
values (133, 1902, 45);
insert into BELONGS_TO (i_id, p_id, a_id)
values (134, 9436, 29);
insert into BELONGS_TO (i_id, p_id, a_id)
values (135, 2459, 411);
insert into BELONGS_TO (i_id, p_id, a_id)
values (136, 4304, 282);
insert into BELONGS_TO (i_id, p_id, a_id)
values (137, 6241, 18);
insert into BELONGS_TO (i_id, p_id, a_id)
values (138, 2789, 652);
insert into BELONGS_TO (i_id, p_id, a_id)
values (139, 7828, 57);
insert into BELONGS_TO (i_id, p_id, a_id)
values (140, 3518, 731);
insert into BELONGS_TO (i_id, p_id, a_id)
values (141, 3062, 152);
insert into BELONGS_TO (i_id, p_id, a_id)
values (142, 5584, 392);
insert into BELONGS_TO (i_id, p_id, a_id)
values (143, 6313, 328);
insert into BELONGS_TO (i_id, p_id, a_id)
values (144, 6614, 118);
insert into BELONGS_TO (i_id, p_id, a_id)
values (145, 8581, 131);
insert into BELONGS_TO (i_id, p_id, a_id)
values (146, 2579, 303);
insert into BELONGS_TO (i_id, p_id, a_id)
values (147, 7508, 262);
insert into BELONGS_TO (i_id, p_id, a_id)
values (148, 7791, 492);
insert into BELONGS_TO (i_id, p_id, a_id)
values (149, 8694, 985);
insert into BELONGS_TO (i_id, p_id, a_id)
values (150, 7767, 939);
insert into BELONGS_TO (i_id, p_id, a_id)
values (151, 2457, 129);
insert into BELONGS_TO (i_id, p_id, a_id)
values (152, 4675, 113);
insert into BELONGS_TO (i_id, p_id, a_id)
values (153, 3913, 754);
insert into BELONGS_TO (i_id, p_id, a_id)
values (154, 2294, 499);
insert into BELONGS_TO (i_id, p_id, a_id)
values (155, 4964, 328);
insert into BELONGS_TO (i_id, p_id, a_id)
values (156, 1052, 129);
insert into BELONGS_TO (i_id, p_id, a_id)
values (157, 5288, 698);
insert into BELONGS_TO (i_id, p_id, a_id)
values (158, 3288, 41);
insert into BELONGS_TO (i_id, p_id, a_id)
values (159, 3227, 293);
insert into BELONGS_TO (i_id, p_id, a_id)
values (160, 1371, 925);
insert into BELONGS_TO (i_id, p_id, a_id)
values (161, 4583, 270);
insert into BELONGS_TO (i_id, p_id, a_id)
values (162, 3723, 862);
insert into BELONGS_TO (i_id, p_id, a_id)
values (163, 1988, 652);
insert into BELONGS_TO (i_id, p_id, a_id)
values (164, 1341, 624);
insert into BELONGS_TO (i_id, p_id, a_id)
values (165, 3492, 287);
insert into BELONGS_TO (i_id, p_id, a_id)
values (166, 5339, 652);
insert into BELONGS_TO (i_id, p_id, a_id)
values (167, 2737, 457);
insert into BELONGS_TO (i_id, p_id, a_id)
values (168, 1657, 769);
insert into BELONGS_TO (i_id, p_id, a_id)
values (169, 1282, 27);
insert into BELONGS_TO (i_id, p_id, a_id)
values (170, 1162, 931);
insert into BELONGS_TO (i_id, p_id, a_id)
values (171, 3562, 272);
insert into BELONGS_TO (i_id, p_id, a_id)
values (172, 8804, 35);
insert into BELONGS_TO (i_id, p_id, a_id)
values (173, 9084, 725);
insert into BELONGS_TO (i_id, p_id, a_id)
values (174, 1575, 652);
insert into BELONGS_TO (i_id, p_id, a_id)
values (175, 4982, 635);
insert into BELONGS_TO (i_id, p_id, a_id)
values (176, 5886, 963);
insert into BELONGS_TO (i_id, p_id, a_id)
values (177, 6812, 442);
insert into BELONGS_TO (i_id, p_id, a_id)
values (178, 8658, 515);
insert into BELONGS_TO (i_id, p_id, a_id)
values (179, 7404, 118);
insert into BELONGS_TO (i_id, p_id, a_id)
values (180, 9504, 635);
insert into BELONGS_TO (i_id, p_id, a_id)
values (181, 4294, 939);
insert into BELONGS_TO (i_id, p_id, a_id)
values (182, 4590, 698);
insert into BELONGS_TO (i_id, p_id, a_id)
values (183, 4992, 176);
insert into BELONGS_TO (i_id, p_id, a_id)
values (184, 3520, 575);
insert into BELONGS_TO (i_id, p_id, a_id)
values (185, 9395, 764);
insert into BELONGS_TO (i_id, p_id, a_id)
values (186, 6313, 423);
insert into BELONGS_TO (i_id, p_id, a_id)
values (187, 2340, 86);
insert into BELONGS_TO (i_id, p_id, a_id)
values (188, 8184, 821);
insert into BELONGS_TO (i_id, p_id, a_id)
values (189, 6310, 944);
insert into BELONGS_TO (i_id, p_id, a_id)
values (190, 3569, 668);
insert into BELONGS_TO (i_id, p_id, a_id)
values (191, 1764, 979);
insert into BELONGS_TO (i_id, p_id, a_id)
values (192, 1773, 784);
insert into BELONGS_TO (i_id, p_id, a_id)
values (193, 5281, 442);
insert into BELONGS_TO (i_id, p_id, a_id)
values (194, 1739, 82);
insert into BELONGS_TO (i_id, p_id, a_id)
values (195, 1175, 565);
insert into BELONGS_TO (i_id, p_id, a_id)
values (196, 3384, 138);
insert into BELONGS_TO (i_id, p_id, a_id)
values (197, 8139, 734);
insert into BELONGS_TO (i_id, p_id, a_id)
values (198, 2500, 856);
insert into BELONGS_TO (i_id, p_id, a_id)
values (199, 4646, 491);
insert into BELONGS_TO (i_id, p_id, a_id)
values (200, 6290, 638);
commit;
prompt 200 records committed...
insert into BELONGS_TO (i_id, p_id, a_id)
values (201, 1228, 650);
insert into BELONGS_TO (i_id, p_id, a_id)
values (202, 5666, 45);
insert into BELONGS_TO (i_id, p_id, a_id)
values (203, 7194, 242);
insert into BELONGS_TO (i_id, p_id, a_id)
values (204, 1997, 261);
insert into BELONGS_TO (i_id, p_id, a_id)
values (205, 9055, 962);
insert into BELONGS_TO (i_id, p_id, a_id)
values (206, 2542, 487);
insert into BELONGS_TO (i_id, p_id, a_id)
values (207, 3221, 332);
insert into BELONGS_TO (i_id, p_id, a_id)
values (208, 6016, 287);
insert into BELONGS_TO (i_id, p_id, a_id)
values (209, 4863, 773);
insert into BELONGS_TO (i_id, p_id, a_id)
values (210, 9542, 954);
insert into BELONGS_TO (i_id, p_id, a_id)
values (211, 3501, 630);
insert into BELONGS_TO (i_id, p_id, a_id)
values (212, 6315, 466);
insert into BELONGS_TO (i_id, p_id, a_id)
values (213, 8891, 585);
insert into BELONGS_TO (i_id, p_id, a_id)
values (214, 6596, 775);
insert into BELONGS_TO (i_id, p_id, a_id)
values (215, 3560, 29);
insert into BELONGS_TO (i_id, p_id, a_id)
values (216, 9061, 803);
insert into BELONGS_TO (i_id, p_id, a_id)
values (217, 5646, 419);
insert into BELONGS_TO (i_id, p_id, a_id)
values (218, 5835, 660);
insert into BELONGS_TO (i_id, p_id, a_id)
values (219, 7112, 270);
insert into BELONGS_TO (i_id, p_id, a_id)
values (220, 7535, 558);
insert into BELONGS_TO (i_id, p_id, a_id)
values (221, 3275, 150);
insert into BELONGS_TO (i_id, p_id, a_id)
values (222, 8291, 2);
insert into BELONGS_TO (i_id, p_id, a_id)
values (223, 5447, 424);
insert into BELONGS_TO (i_id, p_id, a_id)
values (224, 5963, 17);
insert into BELONGS_TO (i_id, p_id, a_id)
values (225, 8579, 725);
insert into BELONGS_TO (i_id, p_id, a_id)
values (226, 3091, 131);
insert into BELONGS_TO (i_id, p_id, a_id)
values (227, 4216, 931);
insert into BELONGS_TO (i_id, p_id, a_id)
values (228, 8792, 831);
insert into BELONGS_TO (i_id, p_id, a_id)
values (229, 6864, 457);
insert into BELONGS_TO (i_id, p_id, a_id)
values (230, 2948, 611);
insert into BELONGS_TO (i_id, p_id, a_id)
values (231, 1842, 466);
insert into BELONGS_TO (i_id, p_id, a_id)
values (232, 1146, 725);
insert into BELONGS_TO (i_id, p_id, a_id)
values (233, 2679, 468);
insert into BELONGS_TO (i_id, p_id, a_id)
values (234, 3851, 409);
insert into BELONGS_TO (i_id, p_id, a_id)
values (235, 2224, 688);
insert into BELONGS_TO (i_id, p_id, a_id)
values (236, 9133, 854);
insert into BELONGS_TO (i_id, p_id, a_id)
values (237, 3381, 288);
insert into BELONGS_TO (i_id, p_id, a_id)
values (238, 6548, 648);
insert into BELONGS_TO (i_id, p_id, a_id)
values (239, 7582, 515);
insert into BELONGS_TO (i_id, p_id, a_id)
values (240, 3570, 29);
insert into BELONGS_TO (i_id, p_id, a_id)
values (241, 6305, 118);
insert into BELONGS_TO (i_id, p_id, a_id)
values (242, 7649, 810);
insert into BELONGS_TO (i_id, p_id, a_id)
values (243, 8519, 891);
insert into BELONGS_TO (i_id, p_id, a_id)
values (244, 6231, 920);
insert into BELONGS_TO (i_id, p_id, a_id)
values (245, 6109, 785);
insert into BELONGS_TO (i_id, p_id, a_id)
values (246, 3973, 499);
insert into BELONGS_TO (i_id, p_id, a_id)
values (247, 2929, 277);
insert into BELONGS_TO (i_id, p_id, a_id)
values (248, 6640, 296);
insert into BELONGS_TO (i_id, p_id, a_id)
values (249, 2430, 961);
insert into BELONGS_TO (i_id, p_id, a_id)
values (250, 1509, 852);
insert into BELONGS_TO (i_id, p_id, a_id)
values (251, 8541, 368);
insert into BELONGS_TO (i_id, p_id, a_id)
values (252, 3102, 619);
insert into BELONGS_TO (i_id, p_id, a_id)
values (253, 3973, 343);
insert into BELONGS_TO (i_id, p_id, a_id)
values (254, 2530, 393);
insert into BELONGS_TO (i_id, p_id, a_id)
values (255, 3059, 852);
insert into BELONGS_TO (i_id, p_id, a_id)
values (256, 4789, 291);
insert into BELONGS_TO (i_id, p_id, a_id)
values (257, 2838, 9);
insert into BELONGS_TO (i_id, p_id, a_id)
values (258, 1243, 635);
insert into BELONGS_TO (i_id, p_id, a_id)
values (259, 2009, 318);
insert into BELONGS_TO (i_id, p_id, a_id)
values (260, 7308, 393);
insert into BELONGS_TO (i_id, p_id, a_id)
values (261, 5002, 713);
insert into BELONGS_TO (i_id, p_id, a_id)
values (262, 3113, 895);
insert into BELONGS_TO (i_id, p_id, a_id)
values (263, 4916, 903);
insert into BELONGS_TO (i_id, p_id, a_id)
values (264, 5774, 17);
insert into BELONGS_TO (i_id, p_id, a_id)
values (265, 6749, 271);
insert into BELONGS_TO (i_id, p_id, a_id)
values (266, 6801, 328);
insert into BELONGS_TO (i_id, p_id, a_id)
values (267, 3396, 552);
insert into BELONGS_TO (i_id, p_id, a_id)
values (268, 2932, 176);
insert into BELONGS_TO (i_id, p_id, a_id)
values (269, 4985, 6);
commit;
prompt 269 records loaded
prompt Loading CLIENT...
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (8727, 'Tobolowsky', to_date('06-07-2019', 'dd-mm-yyyy'), 2550, 171);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42194, 'Reeves', to_date('18-08-1955', 'dd-mm-yyyy'), 780, 260);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79039, 'Gibbons', to_date('04-11-2012', 'dd-mm-yyyy'), 3857, 109);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55631, 'Blossoms', to_date('09-10-1954', 'dd-mm-yyyy'), 1642, 182);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99386, 'Neuwirth', to_date('22-06-1977', 'dd-mm-yyyy'), 830, 177);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34606, 'Tennison', to_date('22-06-1943', 'dd-mm-yyyy'), 162, 73);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (33367, 'Gyllenhaal', to_date('19-02-2021', 'dd-mm-yyyy'), 2550, 214);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (50445, 'Gershon', to_date('07-10-2022', 'dd-mm-yyyy'), 2685, 88);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (33776, 'Dean', to_date('06-08-1964', 'dd-mm-yyyy'), 1118, 114);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14597, 'Thompson', to_date('21-02-2007', 'dd-mm-yyyy'), 1478, 187);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (21570, 'Oldman', to_date('02-11-1970', 'dd-mm-yyyy'), 3769, 235);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5439, 'Teng', to_date('05-11-1995', 'dd-mm-yyyy'), 1439, 263);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55676, 'Goldberg', to_date('19-12-1950', 'dd-mm-yyyy'), 3688, 191);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (74675, 'Lerner', to_date('12-05-1978', 'dd-mm-yyyy'), 1310, 160);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (40647, 'Kravitz', to_date('01-06-2000', 'dd-mm-yyyy'), 1288, 245);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (61639, 'Vannelli', to_date('24-08-1981', 'dd-mm-yyyy'), 2233, 12);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46967, 'Peet', to_date('16-09-2009', 'dd-mm-yyyy'), 129, 23);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (61964, 'Birch', to_date('10-03-1987', 'dd-mm-yyyy'), 3649, 158);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59597, 'Wilder', to_date('29-09-1942', 'dd-mm-yyyy'), 3018, 32);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (6033, 'Lucien', to_date('06-04-1949', 'dd-mm-yyyy'), 991, 72);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (12467, 'Oakenfold', to_date('23-07-1970', 'dd-mm-yyyy'), 1265, 128);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (61263, 'Sedaka', to_date('11-06-2012', 'dd-mm-yyyy'), 1092, 21);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (32040, 'Burns', to_date('09-07-1952', 'dd-mm-yyyy'), 1470, 208);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (3431, 'Harrelson', to_date('01-01-2002', 'dd-mm-yyyy'), 480, 247);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14033, 'Gary', to_date('07-10-1978', 'dd-mm-yyyy'), 1706, 99);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (62207, 'Wariner', to_date('20-02-1996', 'dd-mm-yyyy'), 2986, 109);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (26631, 'Zahn', to_date('06-08-1979', 'dd-mm-yyyy'), 3990, 229);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98441, 'Hall', to_date('21-05-2029', 'dd-mm-yyyy'), 3006, 133);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (56291, 'Rispoli', to_date('04-08-2028', 'dd-mm-yyyy'), 1754, 11);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (39933, 'Gates', to_date('26-12-2002', 'dd-mm-yyyy'), 2897, 145);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (21776, 'Bassett', to_date('08-09-1948', 'dd-mm-yyyy'), 1831, 210);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23397, 'McAnally', to_date('12-09-1985', 'dd-mm-yyyy'), 1118, 117);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38085, 'Trejo', to_date('02-02-1983', 'dd-mm-yyyy'), 3561, 259);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71191, 'Garner', to_date('19-03-1944', 'dd-mm-yyyy'), 3043, 85);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22862, 'Pfeiffer', to_date('22-06-2017', 'dd-mm-yyyy'), 1840, 159);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69942, 'Chesnutt', to_date('25-09-1985', 'dd-mm-yyyy'), 1767, 82);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22550, 'Bosco', to_date('16-05-2001', 'dd-mm-yyyy'), 1721, 248);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81859, 'Craig', to_date('21-05-2029', 'dd-mm-yyyy'), 991, 63);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (36418, 'Pride', to_date('07-02-1951', 'dd-mm-yyyy'), 3072, 95);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (67566, 'Buscemi', to_date('26-04-2025', 'dd-mm-yyyy'), 3398, 140);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (92592, 'McCready', to_date('13-05-2019', 'dd-mm-yyyy'), 2797, 91);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (25696, 'Witt', to_date('16-05-1996', 'dd-mm-yyyy'), 238, 115);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23994, 'Farrow', to_date('09-10-1975', 'dd-mm-yyyy'), 1377, 105);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46059, 'Culkin', to_date('28-06-1983', 'dd-mm-yyyy'), 3561, 180);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81921, 'Mills', to_date('22-10-2014', 'dd-mm-yyyy'), 3374, 59);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (40848, 'Postlethwaite', to_date('24-03-2023', 'dd-mm-yyyy'), 1396, 100);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (29953, 'Hidalgo', to_date('08-04-1967', 'dd-mm-yyyy'), 3697, 215);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (54110, 'Paltrow', to_date('07-06-2012', 'dd-mm-yyyy'), 330, 189);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45623, 'Gaines', to_date('18-04-1991', 'dd-mm-yyyy'), 749, 172);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (24561, 'Beckham', to_date('05-06-2007', 'dd-mm-yyyy'), 618, 1);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (83379, 'Ammons', to_date('08-09-2019', 'dd-mm-yyyy'), 1288, 102);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (18155, 'Russo', to_date('25-06-1989', 'dd-mm-yyyy'), 576, 45);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5645, 'Chinlund', to_date('05-06-1967', 'dd-mm-yyyy'), 2413, 89);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (67984, 'Forrest', to_date('23-01-1948', 'dd-mm-yyyy'), 3170, 163);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45248, 'Goodman', to_date('24-09-2007', 'dd-mm-yyyy'), 238, 101);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47281, 'De Almeida', to_date('01-06-1970', 'dd-mm-yyyy'), 2811, 265);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (26001, 'Weber', to_date('27-10-2011', 'dd-mm-yyyy'), 202, 203);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (87242, 'Stallone', to_date('28-01-1960', 'dd-mm-yyyy'), 3348, 181);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34080, 'Caine', to_date('02-03-2018', 'dd-mm-yyyy'), 1676, 198);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71608, 'O''Hara', to_date('28-06-1979', 'dd-mm-yyyy'), 1721, 15);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (20477, 'Capshaw', to_date('08-04-1996', 'dd-mm-yyyy'), 1378, 252);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (87780, 'Bonham', to_date('02-01-2029', 'dd-mm-yyyy'), 1576, 101);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79705, 'Thomas', to_date('24-01-1984', 'dd-mm-yyyy'), 1461, 267);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64514, 'McDormand', to_date('19-11-2021', 'dd-mm-yyyy'), 498, 55);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (84105, 'Numan', to_date('20-10-1980', 'dd-mm-yyyy'), 3772, 81);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (36723, 'Foxx', to_date('20-07-2027', 'dd-mm-yyyy'), 1155, 83);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76017, 'Harper', to_date('01-06-2024', 'dd-mm-yyyy'), 2757, 43);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (21480, 'Ticotin', to_date('14-07-1975', 'dd-mm-yyyy'), 3037, 89);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69717, 'Whitman', to_date('05-05-1992', 'dd-mm-yyyy'), 780, 179);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76966, 'Frost', to_date('03-11-1980', 'dd-mm-yyyy'), 3493, 229);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47858, 'Applegate', to_date('11-08-1951', 'dd-mm-yyyy'), 3285, 171);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23323, 'Sawa', to_date('22-06-2026', 'dd-mm-yyyy'), 1280, 242);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22279, 'Puckett', to_date('31-08-1993', 'dd-mm-yyyy'), 3194, 167);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14341, 'Leary', to_date('31-08-1994', 'dd-mm-yyyy'), 1461, 41);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64648, 'Maxwell', to_date('10-12-1958', 'dd-mm-yyyy'), 3375, 214);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (29499, 'Wakeling', to_date('23-06-2025', 'dd-mm-yyyy'), 2709, 204);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (33888, 'Crowe', to_date('12-11-2001', 'dd-mm-yyyy'), 2906, 171);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46906, 'Wainwright', to_date('24-08-2029', 'dd-mm-yyyy'), 1817, 182);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (84029, 'Cantrell', to_date('07-12-1964', 'dd-mm-yyyy'), 3041, 200);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79411, 'Pierce', to_date('23-04-2021', 'dd-mm-yyyy'), 2352, 225);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (56124, 'Niven', to_date('28-11-2011', 'dd-mm-yyyy'), 2342, 77);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81721, 'Gibson', to_date('27-07-2005', 'dd-mm-yyyy'), 162, 165);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75319, 'Downie', to_date('22-04-1978', 'dd-mm-yyyy'), 1442, 156);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79892, 'Diddley', to_date('02-12-1991', 'dd-mm-yyyy'), 1067, 237);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45055, 'Shocked', to_date('10-10-1990', 'dd-mm-yyyy'), 2347, 136);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60792, 'Mraz', to_date('08-07-1977', 'dd-mm-yyyy'), 7, 37);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99871, 'Borden', to_date('02-12-1997', 'dd-mm-yyyy'), 2709, 134);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (83607, 'Downie', to_date('28-02-1970', 'dd-mm-yyyy'), 2906, 199);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60424, 'Briscoe', to_date('18-09-1962', 'dd-mm-yyyy'), 1525, 41);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (6642, 'McDiarmid', to_date('23-11-1999', 'dd-mm-yyyy'), 2138, 3);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75317, 'Dalley', to_date('13-03-2003', 'dd-mm-yyyy'), 2783, 260);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (21931, 'Bergen', to_date('23-05-1966', 'dd-mm-yyyy'), 3836, 63);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34914, 'Walsh', to_date('21-05-1942', 'dd-mm-yyyy'), 2832, 79);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35009, 'Hopkins', to_date('07-12-1946', 'dd-mm-yyyy'), 747, 35);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71728, 'Domino', to_date('22-11-1982', 'dd-mm-yyyy'), 155, 175);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76936, 'Weisz', to_date('24-10-2012', 'dd-mm-yyyy'), 3303, 229);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47712, 'Cromwell', to_date('28-01-1945', 'dd-mm-yyyy'), 3303, 250);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79645, 'Evans', to_date('31-10-1940', 'dd-mm-yyyy'), 1884, 216);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (85075, 'Kattan', to_date('16-10-1972', 'dd-mm-yyyy'), 2233, 186);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52539, 'Bacharach', to_date('19-11-1956', 'dd-mm-yyyy'), 163, 203);
commit;
prompt 100 records committed...
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60288, 'Affleck', to_date('09-09-1965', 'dd-mm-yyyy'), 3357, 14);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69857, 'Bachman', to_date('09-01-1991', 'dd-mm-yyyy'), 3649, 250);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14020, 'Polito', to_date('24-03-2005', 'dd-mm-yyyy'), 846, 164);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (49777, 'Sellers', to_date('19-08-2003', 'dd-mm-yyyy'), 2933, 206);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (37107, 'LaSalle', to_date('18-10-2020', 'dd-mm-yyyy'), 391, 38);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34650, 'Rollins', to_date('01-10-1990', 'dd-mm-yyyy'), 2631, 115);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55824, 'Robards', to_date('28-11-1985', 'dd-mm-yyyy'), 3838, 253);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47814, 'Lavigne', to_date('29-03-1969', 'dd-mm-yyyy'), 1294, 116);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (16079, 'Rydell', to_date('23-05-2010', 'dd-mm-yyyy'), 2798, 189);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (39938, 'Arden', to_date('30-06-1979', 'dd-mm-yyyy'), 3984, 132);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (29313, 'McCormack', to_date('22-01-1986', 'dd-mm-yyyy'), 2737, 75);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60558, 'Miles', to_date('02-10-2000', 'dd-mm-yyyy'), 330, 80);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (30264, 'Jordan', to_date('08-08-1988', 'dd-mm-yyyy'), 2814, 87);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (84317, 'Keen', to_date('24-05-1972', 'dd-mm-yyyy'), 3740, 160);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10693, 'Curfman', to_date('11-04-2020', 'dd-mm-yyyy'), 1676, 109);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5137, 'Dunaway', to_date('05-03-1959', 'dd-mm-yyyy'), 1118, 251);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (18387, 'Weber', to_date('09-02-2015', 'dd-mm-yyyy'), 498, 65);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (8123, 'Polley', to_date('06-03-1940', 'dd-mm-yyyy'), 3990, 80);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59175, 'Goldberg', to_date('16-02-2023', 'dd-mm-yyyy'), 111, 195);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51900, 'Loeb', to_date('04-12-1995', 'dd-mm-yyyy'), 2035, 120);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (1830, 'Kier', to_date('24-05-1951', 'dd-mm-yyyy'), 3142, 177);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52967, 'Khan', to_date('12-10-2005', 'dd-mm-yyyy'), 3627, 59);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60720, 'Senior', to_date('08-12-1949', 'dd-mm-yyyy'), 377, 25);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77446, 'Levin', to_date('21-11-2014', 'dd-mm-yyyy'), 1566, 103);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (24534, 'Burton', to_date('03-09-1948', 'dd-mm-yyyy'), 2188, 40);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97433, 'Arkin', to_date('11-03-1956', 'dd-mm-yyyy'), 2777, 221);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (70722, 'Fiorentino', to_date('22-09-1949', 'dd-mm-yyyy'), 2188, 193);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (56722, 'Beckham', to_date('12-12-1964', 'dd-mm-yyyy'), 1042, 111);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (27282, 'Mac', to_date('12-08-1966', 'dd-mm-yyyy'), 3310, 220);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (62331, 'Aykroyd', to_date('24-08-1980', 'dd-mm-yyyy'), 1378, 231);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99300, 'Fariq', to_date('12-10-1950', 'dd-mm-yyyy'), 521, 261);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98690, 'Depp', to_date('10-05-1960', 'dd-mm-yyyy'), 177, 28);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14295, 'Keith', to_date('02-08-2014', 'dd-mm-yyyy'), 695, 63);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46473, 'Winstone', to_date('26-09-1978', 'dd-mm-yyyy'), 2352, 142);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (20453, 'Alston', to_date('23-10-2001', 'dd-mm-yyyy'), 608, 262);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (73137, 'Coverdale', to_date('01-10-1968', 'dd-mm-yyyy'), 3187, 176);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (1084, 'James', to_date('28-09-1949', 'dd-mm-yyyy'), 931, 45);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (7512, 'Reid', to_date('26-07-2024', 'dd-mm-yyyy'), 1366, 213);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45765, 'Alice  Aniston', to_date('29-07-1977', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38750, 'Talvin  Arkenst', to_date('10-12-1937', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (15374, 'Patrick  Turner', to_date('21-11-1974', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34387, 'Rebeka  Mellenc', to_date('21-02-1954', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (72050, 'Brad  Vassar', to_date('22-09-2013', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76051, 'Julie  Dushku', to_date('06-12-2003', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (25387, 'Sylvester  Schw', to_date('11-05-1999', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48042, 'Vickie  Ceasar', to_date('23-06-2001', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (70228, 'Albert  Bailey', to_date('07-10-1967', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (56972, 'Terence  Strong', to_date('21-11-1946', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55750, 'Hal  Connery', to_date('25-02-1970', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (78109, 'Jody  Moreno', to_date('01-12-1931', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (13887, 'Brad  Diffie', to_date('20-09-1944', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64826, 'Val  Cantrell', to_date('10-07-1931', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75382, 'Julie  Salt', to_date('28-11-1953', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (96751, 'Lloyd  Torino', to_date('11-03-1981', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57480, 'Jonny  Miller', to_date('26-07-2017', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (30851, 'Tanya  Nicholas', to_date('06-02-1938', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71084, 'Tom  Hyde', to_date('26-12-1956', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59858, 'Malcolm  Tennis', to_date('11-03-1941', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (41584, 'Woody  Supernaw', to_date('25-06-2016', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (86141, 'Sheryl  Suchet', to_date('14-09-2011', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (54353, 'Kim  Ticotin', to_date('04-02-1968', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (84748, 'Judge  Hannah', to_date('20-08-2005', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44563, 'Lynette  O''Keef', to_date('02-06-1966', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (83330, 'Milla  Lerner', to_date('12-01-1995', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (26751, 'Andie  Kutcher', to_date('28-10-1945', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (25507, 'Colleen  Hamilt', to_date('12-06-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (63353, 'France  Kweller', to_date('03-03-2019', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81457, 'Benicio  Peeble', to_date('01-07-1946', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (31176, 'Wayne  Shaye', to_date('20-09-1957', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (88675, 'Christopher  Pu', to_date('12-04-2016', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52069, 'Ashton  Eat Wor', to_date('06-11-2007', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (24210, 'Jake  Sizemore', to_date('04-02-1949', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71384, 'Wesley  Cage', to_date('16-05-1980', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69545, 'Jerry  Astin', to_date('04-08-1973', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64673, 'Willem  Richard', to_date('25-05-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (27642, 'Nikki  Gatlin', to_date('03-02-2017', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (56137, 'Curt  Diaz', to_date('27-11-1971', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77743, 'Deborah  Coburn', to_date('09-06-1946', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (54337, 'Suzy  Cox', to_date('30-12-2006', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (83562, 'Sander  Hatfiel', to_date('25-05-1930', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (30800, 'Suzi  Dawson', to_date('22-03-1951', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (12604, 'Christian  Beal', to_date('07-03-1978', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (40363, 'Yaphet  Cochran', to_date('03-12-1963', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77310, 'Lindsay  Sossam', to_date('13-05-2018', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (82892, 'Ellen  Alston', to_date('24-10-1930', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (96282, 'Marianne  Fiore', to_date('05-07-1989', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57818, 'Deborah  Gugino', to_date('04-07-2015', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66408, 'Debi  Squier', to_date('01-09-1979', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (36964, 'Vincent  Mitra', to_date('04-04-1932', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (33535, 'Josh  Wagner', to_date('08-01-2019', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51370, 'Mena  Schiavell', to_date('03-09-2001', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99866, 'Jon  Kier', to_date('21-12-1952', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (72527, 'Scarlett  Zevon', to_date('10-02-1976', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28035, 'Kelly  Hawthorn', to_date('31-05-1973', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23283, 'Quentin  Margul', to_date('10-01-2005', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (11898, 'Latin  Rebhorn', to_date('24-08-1980', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22281, 'Courtney  Fox', to_date('20-07-1960', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (50387, 'Denzel  Gore', to_date('19-09-1942', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57455, 'Rhea  Finney', to_date('17-07-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (73623, 'Natascha  Tate', to_date('18-07-1966', 'dd-mm-yyyy'), 94968, 268);
commit;
prompt 200 records committed...
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69660, 'Claire  Hagerty', to_date('28-01-1995', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81483, 'Nikki  Frost', to_date('10-11-1999', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57356, 'Chely  Andrews', to_date('11-08-1988', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (36188, 'Rob  Koyana', to_date('21-10-2002', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77581, 'Freda  Hidalgo', to_date('05-04-1979', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (24638, 'Trace  Ruffalo', to_date('25-04-1955', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (30450, 'Roger  Purefoy', to_date('29-02-1980', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77886, 'Kimberly  Shaw', to_date('25-08-1973', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64985, 'Jill  Loveless', to_date('02-05-1937', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79150, 'Loreena  Kapank', to_date('28-11-2009', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28186, 'Liam  Klein', to_date('10-08-1936', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (17213, 'Maria  Pastore', to_date('23-01-1982', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (13377, 'Nastassja  Woma', to_date('10-01-1976', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (32802, 'Albert  Magnuso', to_date('29-06-2007', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69379, 'Cathy  Conlee', to_date('26-04-1990', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22197, 'Donald  Barkin', to_date('21-04-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (17846, 'Louise  McCoy', to_date('04-11-1934', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (92083, 'Alannah  Price', to_date('19-08-1999', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (87910, 'Mel  Schiavelli', to_date('09-07-1999', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48393, 'George  Nosewor', to_date('17-10-1968', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (62793, 'Lauren  Balaban', to_date('05-01-1982', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (27383, 'Tia  Popper', to_date('19-01-1939', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14707, 'Taye  Weaver', to_date('24-11-1967', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23399, 'Marina  Tobolow', to_date('26-10-1974', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (39029, 'Juan  Pfeiffer', to_date('05-03-1968', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (62772, 'Breckin  Byrne', to_date('22-03-2014', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58427, 'Richard  Macy', to_date('22-08-2002', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (63878, 'Sally  Blossoms', to_date('03-10-1948', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (12281, 'Lionel  Hatfiel', to_date('30-05-1987', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35084, 'Gilberto  Austi', to_date('02-02-2008', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10555, 'Whoopi  Heron', to_date('27-04-1993', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (82943, 'Faye  Curry', to_date('21-11-1973', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22760, 'Ray  Sartain', to_date('26-11-2002', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47273, 'Gabriel  Fehr', to_date('15-06-1947', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (62115, 'Dwight  DiCapri', to_date('09-04-1960', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98656, 'Stevie  Hobson', to_date('14-01-2006', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (87437, 'Paula  McGill', to_date('12-04-1947', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55792, 'Gran  Collie', to_date('27-03-1996', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (91366, 'Debra  Summer', to_date('30-07-1983', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (13853, 'Kiefer  Lipnick', to_date('04-04-1933', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (96258, 'Patricia  Peet', to_date('15-03-2018', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (37507, 'Vonda  Ryan', to_date('18-06-1948', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (43668, 'Zooey  Leary', to_date('11-07-1950', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (49663, 'Chaka  Pleasure', to_date('30-11-2019', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (49214, 'Talvin  Landau', to_date('29-12-2012', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51110, 'Gates  Henstrid', to_date('24-09-1954', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (40687, 'Sheena  Presley', to_date('27-06-2005', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (67634, 'Emily  Gracie', to_date('16-08-1968', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (39861, 'Jim  Coughlan', to_date('03-09-1983', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (85570, 'Val  McIntosh', to_date('06-10-1937', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51786, 'Leon  Easton', to_date('12-10-1991', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52831, 'Jared  Zellwege', to_date('16-06-1934', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (85840, 'Earl  Glover', to_date('13-06-1995', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (39192, 'Mary Beth  LaBe', to_date('12-02-1966', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57288, 'Deborah  Hopkin', to_date('29-04-1982', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44674, 'Rose  Arkenston', to_date('24-06-1991', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (80477, 'Robby  Cozier', to_date('05-04-1995', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35855, 'Wally  Chaplin', to_date('20-08-1974', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99965, 'Johnnie  Newman', to_date('29-03-1944', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (21288, 'Burton  Richter', to_date('02-01-2004', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81942, 'Kim  Watson', to_date('28-04-1967', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (33786, 'Kenneth  Hudson', to_date('29-09-1977', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79635, 'Lila  Mitra', to_date('04-10-2011', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (85289, 'Rade  Smith', to_date('27-06-1971', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48994, 'Curt  Pleasure', to_date('06-06-1986', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76520, 'Scarlett  Tyson', to_date('22-06-1993', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35395, 'Guy  Rydell', to_date('25-10-1937', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47875, 'Red  Puckett', to_date('14-01-2018', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (94349, 'Giovanni  Durni', to_date('13-04-1947', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99624, 'Charles  McInto', to_date('18-11-1994', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10486, 'Michael  Rivers', to_date('09-05-1998', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (65670, 'Celia  Culkin', to_date('23-12-1978', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (41166, 'Brendan  Jackso', to_date('09-08-1935', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (94811, 'Trace  Schwarze', to_date('22-11-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58652, 'Jimmie  Connery', to_date('09-06-1961', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55473, 'Goldie  Glover', to_date('21-01-2001', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46513, 'Joey  Lang', to_date('25-02-1931', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22936, 'Yolanda  Blades', to_date('16-07-2000', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (25500, 'Gabriel  McElho', to_date('07-01-1965', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57161, 'Christina  Chap', to_date('26-03-2013', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48251, 'Rod  Esposito', to_date('26-02-1954', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47535, 'Dom  Kirshner', to_date('07-12-1944', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (65010, 'Adrien  Duke', to_date('01-12-1973', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38683, 'Meryl  Finney', to_date('16-09-1994', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71371, 'Jerry  Colman', to_date('11-07-1990', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (53672, 'Ellen  Thurman', to_date('19-10-2019', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42489, 'Bobbi  Rucker', to_date('20-10-1995', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (80445, 'Giovanni  Wiest', to_date('09-06-1931', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60496, 'Lin  Scorsese', to_date('24-12-1952', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22545, 'Azucar  Epps', to_date('28-04-1937', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35151, 'Jon  Travolta', to_date('20-06-1930', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (95269, 'Cary  Gleeson', to_date('06-09-1993', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35658, 'Catherine  Damo', to_date('09-10-1957', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69354, 'Saffron  Palin', to_date('05-02-2012', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (17800, 'Remy  Carnes', to_date('16-11-2017', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (70070, 'Terri  Hewett', to_date('07-10-1960', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (26286, 'Derek  Scheider', to_date('08-12-1959', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60542, 'Elle  Stallone', to_date('05-08-1949', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (65803, 'Carrie-Anne  Po', to_date('01-10-1994', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51903, 'Kathy  Domino', to_date('17-08-1999', 'dd-mm-yyyy'), 94968, 268);
commit;
prompt 300 records committed...
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75622, 'Casey  Guinness', to_date('28-02-1971', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10051, 'Isaiah  Northam', to_date('12-07-2016', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71171, 'Olympia  Hudson', to_date('10-12-1948', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79034, 'Avril  Rudd', to_date('19-05-1979', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44989, 'Arturo  Berenge', to_date('14-03-1948', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (67861, 'Whoopi  Everett', to_date('13-08-1987', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (39798, 'Franco  Atkinso', to_date('07-01-1947', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (87252, 'Bryan  Reubens', to_date('05-04-2013', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (40638, 'Gavin  Uggams', to_date('25-03-1991', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (29318, 'Carla  Imbrugli', to_date('05-06-2010', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (18823, 'Joey  Deschanel', to_date('02-03-1940', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58002, 'Wayman  Folds', to_date('25-09-1994', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58734, 'Karon  Linney', to_date('29-01-1985', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (56831, 'Jose  Sample', to_date('24-02-1997', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81076, 'Charlize  Thomp', to_date('28-01-1947', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97479, 'Carolyn  Ness', to_date('12-08-1964', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (12867, 'Kid  Ranger', to_date('10-05-1997', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51671, 'Gran  Detmer', to_date('18-12-1930', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (41455, 'Bruce  Hopkins', to_date('01-03-1995', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (67710, 'Petula  Haynes', to_date('15-07-1930', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69094, 'Cesar  Pressly', to_date('31-08-1981', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44703, 'Jeremy  Bancrof', to_date('21-06-1989', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (89582, 'Vince  Richards', to_date('04-09-1953', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77026, 'Maggie  Shue', to_date('29-03-1941', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64281, 'Benicio  Miles', to_date('10-02-1965', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (92672, 'Tramaine  Ojeda', to_date('21-09-1949', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (63864, 'Coley  Lindley', to_date('06-05-1954', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (84723, 'Ahmad  Bailey', to_date('27-05-1981', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51945, 'Machine  Lovele', to_date('29-10-1942', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (40735, 'Liquid  Wiest', to_date('22-03-1970', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59910, 'Chalee  Wells', to_date('14-01-1959', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75397, 'Fairuza  MacIsa', to_date('17-10-1994', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (95826, 'Miles  Vance', to_date('15-02-1984', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14011, 'Liam  Buffalo', to_date('16-11-2010', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42963, 'Beth  Venora', to_date('23-08-1934', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (26750, 'Jane  Eldard', to_date('06-04-2006', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (53201, 'Lucinda  Dukaki', to_date('07-12-1997', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58154, 'Jet  Cross', to_date('29-04-1941', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28550, 'Lynn  Broderick', to_date('02-03-1959', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (50046, 'Emma  Maguire', to_date('21-09-1975', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (15480, 'Balthazar  Nell', to_date('31-10-1976', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (36817, 'Andie  Taylor', to_date('02-05-1965', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38209, 'Amanda  Pierce', to_date('08-04-1939', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97705, 'Ty  Wincott', to_date('21-07-1942', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10460, 'Ron  Chaykin', to_date('23-09-2019', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (53498, 'Jonathan  Jenki', to_date('24-09-1935', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (74994, 'Donal  Pressly', to_date('02-05-1968', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (90821, 'Neneh  Elwes', to_date('08-04-1989', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14506, 'Freda  Bates', to_date('13-12-1958', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (78815, 'Dorry  Walken', to_date('13-02-1975', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35376, 'Burt  Law', to_date('21-07-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (65768, 'Jeroen  Neill', to_date('29-06-1982', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (86740, 'Rory  Tankard', to_date('05-01-1964', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47469, 'Mark  Flemyng', to_date('10-10-1984', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (63552, 'Jonny Lee  Lart', to_date('21-12-1952', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (26085, 'Rhea  Cube', to_date('14-02-1950', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (65796, 'Anita  McDonald', to_date('26-07-1969', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (88609, 'Geraldine  Chao', to_date('06-10-1985', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (21392, 'Clarence  Garci', to_date('15-04-1955', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99998, 'Katie  Ward', to_date('04-05-1972', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46529, 'Pelvic  Ford', to_date('30-11-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55102, 'Wesley  Drive', to_date('04-04-2017', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (94238, 'Alessandro  McL', to_date('30-05-1965', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48740, 'Tyrone  Tenniso', to_date('28-12-1991', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (16097, 'Raymond  Tinsle', to_date('12-04-1978', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (73791, 'Ricky  Fraser', to_date('03-06-1939', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (82200, 'Harry  Heston', to_date('30-01-1976', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (68925, 'Rhett  Kweller', to_date('14-11-2004', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48445, 'Oro  Alston', to_date('29-07-2010', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59600, 'Hikaru  Thomson', to_date('12-04-1981', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (16035, 'Carlene  Flanag', to_date('02-06-1989', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77902, 'Rebecca  McDowa', to_date('16-11-1994', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22562, 'Jim  Armstrong', to_date('10-11-1966', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52024, 'Daryle  Valenti', to_date('12-01-2003', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28653, 'Daniel  Tripple', to_date('18-10-2006', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23526, 'Joy  Calle', to_date('16-10-1959', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (56526, 'Vertical  Morse', to_date('02-01-1956', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59440, 'Balthazar  Midl', to_date('28-10-1998', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (86168, 'Ewan  Elliott', to_date('26-09-1931', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (17059, 'Kelli  Ricci', to_date('22-07-1974', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (84013, 'Lupe  Singletar', to_date('04-04-1984', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14108, 'Warren  Salonga', to_date('17-09-1937', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (74830, 'Whoopi  MacDona', to_date('13-10-1991', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (54352, 'William  Studi', to_date('03-01-2009', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (50945, 'Regina  Mantegn', to_date('24-09-1943', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (86879, 'Nikki  Perlman', to_date('01-02-1942', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10666, 'Petula  Burstyn', to_date('09-05-1971', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (13114, 'CeCe  Kinnear', to_date('14-06-2011', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66069, 'Trick  Michaels', to_date('28-10-1952', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (54982, 'Nina  Harris', to_date('17-06-1983', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (82466, 'Mary Beth  Sevi', to_date('24-05-1991', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (27555, 'Lucinda  Ferry', to_date('05-03-1973', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (63369, 'Dianne  Imbrugl', to_date('14-06-1934', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76140, 'France  Van Hel', to_date('30-03-1931', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (61305, 'Kim  Tucci', to_date('16-12-1983', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (16860, 'Renee  Cage', to_date('10-06-1974', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79112, 'Miriam  Polito', to_date('19-09-2019', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (31790, 'Fred  Williams', to_date('11-03-1955', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (73838, 'Belinda  Monk', to_date('29-03-1995', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59847, 'Rik  Berry', to_date('02-09-1946', 'dd-mm-yyyy'), 94968, 268);
commit;
prompt 400 records committed...
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (15061, 'Night  Bright', to_date('28-03-1988', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (63634, 'Sigourney  Vass', to_date('26-02-2014', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48976, 'Marie  Ferry', to_date('08-08-2012', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45258, 'Lily  McGowan', to_date('23-02-1955', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (68527, 'Sigourney  Neuw', to_date('07-01-2000', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (96268, 'Oliver  Lonsdal', to_date('05-08-2009', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (37377, 'Emilio  Burton', to_date('20-10-1945', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55689, 'Christina  Duka', to_date('19-10-1933', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (61613, 'Maggie  Faithfu', to_date('23-01-1998', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34220, 'Milla  Loring', to_date('07-08-2014', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (54637, 'Ossie  Perry', to_date('14-01-1984', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (70120, 'Minnie  Linebac', to_date('12-03-2017', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10091, 'Lili  Love', to_date('04-03-1956', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (50502, 'Ali  Stampley', to_date('05-04-2007', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (95818, 'Cliff  Soda', to_date('19-08-1946', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34783, 'Jimmie  Caan', to_date('02-12-1976', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45648, 'Nik  Holiday', to_date('23-03-1984', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (88176, 'Gailard  Rhodes', to_date('05-07-1937', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75856, 'Illeana  Cara', to_date('11-01-1992', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34461, 'Rene  Taha', to_date('09-04-1953', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (60640, 'Al  Boone', to_date('22-07-1967', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79860, 'Eileen  Pitney', to_date('11-02-2006', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46094, 'Anna  Supernaw', to_date('16-09-1994', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (95055, 'Sydney  Bachara', to_date('13-09-1999', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (95905, 'Katie  Santana', to_date('29-08-2004', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55903, 'Geggy  Pitney', to_date('28-03-2012', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (88798, 'Mel  Chung', to_date('18-02-2018', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (80282, 'Donald  Bachara', to_date('25-11-1939', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58567, 'Natascha  Hawn', to_date('11-01-2013', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (43799, 'Kay  Clark', to_date('28-01-1975', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (25901, 'Dar  Jane', to_date('29-05-2017', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14031, 'Coley  Morrison', to_date('17-09-1958', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42072, 'Nicholas  Kadis', to_date('01-07-1973', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77295, 'Juliette  Frake', to_date('29-02-1944', 'dd-mm-yyyy'), 94968, 268);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (88476, 'Rea', to_date('10-03-1944', 'dd-mm-yyyy'), 3513, 125);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (62568, 'Ribisi', to_date('15-03-1999', 'dd-mm-yyyy'), 830, 137);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (7737, 'Biehn', to_date('14-07-2028', 'dd-mm-yyyy'), 2066, 187);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (7163, 'Connick', to_date('05-07-2005', 'dd-mm-yyyy'), 3194, 110);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66290, 'Street', to_date('17-03-1983', 'dd-mm-yyyy'), 179, 86);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42268, 'Allison', to_date('31-01-1945', 'dd-mm-yyyy'), 1789, 17);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (85873, 'Kahn', to_date('07-12-2010', 'dd-mm-yyyy'), 3990, 70);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (87442, 'Nicholson', to_date('08-09-1986', 'dd-mm-yyyy'), 2103, 149);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (36258, 'LuPone', to_date('29-10-1968', 'dd-mm-yyyy'), 2188, 181);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (49498, 'Ricci', to_date('14-03-1969', 'dd-mm-yyyy'), 330, 7);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (37750, 'Mahoney', to_date('10-02-1949', 'dd-mm-yyyy'), 3310, 154);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58018, 'Wariner', to_date('03-10-1994', 'dd-mm-yyyy'), 1422, 35);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (39573, 'Quinlan', to_date('10-12-1988', 'dd-mm-yyyy'), 9, 153);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (371, 'Lawrence', to_date('10-11-2000', 'dd-mm-yyyy'), 1672, 31);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (18525, 'Playboys', to_date('24-09-1964', 'dd-mm-yyyy'), 1954, 181);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (89597, 'Bacon', to_date('29-01-2007', 'dd-mm-yyyy'), 3256, 36);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97093, 'Cotton', to_date('11-07-1950', 'dd-mm-yyyy'), 1371, 133);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57729, 'Kretschmann', to_date('07-06-1997', 'dd-mm-yyyy'), 2413, 15);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23545, 'Liotta', to_date('12-08-1941', 'dd-mm-yyyy'), 2709, 113);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5806, 'Heche', to_date('03-12-1964', 'dd-mm-yyyy'), 2777, 187);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5792, 'Lennox', to_date('23-09-1986', 'dd-mm-yyyy'), 3857, 88);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14241, 'Ramis', to_date('27-01-1945', 'dd-mm-yyyy'), 3836, 48);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66025, 'Anderson', to_date('22-12-1992', 'dd-mm-yyyy'), 1565, 38);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58057, 'Connelly', to_date('18-09-2011', 'dd-mm-yyyy'), 1058, 176);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (59414, 'Dutton', to_date('28-04-1950', 'dd-mm-yyyy'), 1355, 136);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (25773, 'Getty', to_date('14-01-1946', 'dd-mm-yyyy'), 1613, 9);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (35031, 'Hong', to_date('21-12-1974', 'dd-mm-yyyy'), 1706, 106);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (68188, 'Derringer', to_date('22-12-2009', 'dd-mm-yyyy'), 1565, 195);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (24908, 'Zappacosta', to_date('13-07-1966', 'dd-mm-yyyy'), 1566, 129);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (17228, 'Forster', to_date('30-05-1952', 'dd-mm-yyyy'), 498, 218);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (32869, 'Getty', to_date('05-10-1940', 'dd-mm-yyyy'), 1706, 259);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97396, 'Sandoval', to_date('26-01-2023', 'dd-mm-yyyy'), 1316, 188);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (86217, 'Kilmer', to_date('12-08-1990', 'dd-mm-yyyy'), 2986, 180);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81817, 'Reeves', to_date('07-08-1988', 'dd-mm-yyyy'), 658, 143);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77188, 'Adler', to_date('21-10-1941', 'dd-mm-yyyy'), 991, 151);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52172, 'Hornsby', to_date('13-04-1960', 'dd-mm-yyyy'), 2685, 64);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (74896, 'McDowell', to_date('19-04-2028', 'dd-mm-yyyy'), 1310, 162);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (37928, 'Cotton', to_date('04-06-2017', 'dd-mm-yyyy'), 2566, 51);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (21223, 'Russell', to_date('07-08-1945', 'dd-mm-yyyy'), 1461, 218);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98650, 'Guinness', to_date('17-05-2026', 'dd-mm-yyyy'), 1952, 30);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (36102, 'Pacino', to_date('04-06-1999', 'dd-mm-yyyy'), 3293, 234);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (93937, 'Greene', to_date('27-02-1977', 'dd-mm-yyyy'), 301, 117);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42701, 'Harrelson', to_date('14-08-1941', 'dd-mm-yyyy'), 1355, 160);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (11284, 'Myers', to_date('11-03-1949', 'dd-mm-yyyy'), 1470, 8);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (18968, 'Coughlan', to_date('20-10-1957', 'dd-mm-yyyy'), 1721, 33);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22581, 'Raybon', to_date('14-05-1999', 'dd-mm-yyyy'), 598, 130);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45086, 'Chestnut', to_date('18-08-1969', 'dd-mm-yyyy'), 301, 202);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (95188, 'Diaz', to_date('10-06-2021', 'dd-mm-yyyy'), 480, 108);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (84672, 'Bedelia', to_date('23-10-1962', 'dd-mm-yyyy'), 1693, 62);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (10020, 'Malone', to_date('08-11-2029', 'dd-mm-yyyy'), 3214, 45);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (9988, 'Mellencamp', to_date('08-02-2007', 'dd-mm-yyyy'), 747, 195);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (90184, 'Lithgow', to_date('06-03-1995', 'dd-mm-yyyy'), 1118, 166);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (70562, 'Brody', to_date('03-08-2000', 'dd-mm-yyyy'), 1789, 82);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23322, 'Damon', to_date('19-08-1987', 'dd-mm-yyyy'), 3043, 124);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (2318, 'Bean', to_date('02-01-1945', 'dd-mm-yyyy'), 2188, 177);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55067, 'MacLachlan', to_date('01-03-1990', 'dd-mm-yyyy'), 2566, 202);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42236, 'Frampton', to_date('28-05-2015', 'dd-mm-yyyy'), 3990, 71);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (72901, 'Dzundza', to_date('04-03-1999', 'dd-mm-yyyy'), 3093, 261);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38044, 'Seagal', to_date('27-07-1993', 'dd-mm-yyyy'), 747, 11);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (481, 'Sewell', to_date('20-08-1949', 'dd-mm-yyyy'), 3134, 200);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98035, 'Ammons', to_date('31-01-1954', 'dd-mm-yyyy'), 1613, 17);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (85319, 'Holbrook', to_date('03-11-1997', 'dd-mm-yyyy'), 3984, 1);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98005, 'Midler', to_date('23-05-1992', 'dd-mm-yyyy'), 202, 238);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (19255, 'Winter', to_date('13-08-1959', 'dd-mm-yyyy'), 3958, 135);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (93744, 'Walsh', to_date('15-01-2019', 'dd-mm-yyyy'), 3984, 224);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (78103, 'Brolin', to_date('06-11-1980', 'dd-mm-yyyy'), 1831, 84);
commit;
prompt 500 records committed...
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (26931, 'Weisberg', to_date('01-07-1991', 'dd-mm-yyyy'), 2394, 20);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (17997, 'Crouse', to_date('26-04-1990', 'dd-mm-yyyy'), 2066, 112);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (83587, 'Blackwell', to_date('19-10-1997', 'dd-mm-yyyy'), 3769, 151);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (89037, 'Rhames', to_date('15-07-1988', 'dd-mm-yyyy'), 2900, 201);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (67143, 'Plimpton', to_date('03-08-1992', 'dd-mm-yyyy'), 1517, 78);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98410, 'Flanery', to_date('14-10-1980', 'dd-mm-yyyy'), 2233, 72);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (20111, 'Lopez', to_date('21-07-1979', 'dd-mm-yyyy'), 1163, 253);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58731, 'Robinson', to_date('18-05-1973', 'dd-mm-yyyy'), 2374, 64);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (68722, 'Bosco', to_date('31-03-2002', 'dd-mm-yyyy'), 2106, 195);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28254, 'Armatrading', to_date('06-05-1950', 'dd-mm-yyyy'), 221, 145);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58837, 'Ward', to_date('02-09-2021', 'dd-mm-yyyy'), 3293, 181);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97807, 'Moorer', to_date('03-07-2018', 'dd-mm-yyyy'), 90, 223);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28104, 'Sampson', to_date('06-04-1951', 'dd-mm-yyyy'), 330, 142);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44845, 'Reno', to_date('05-12-2022', 'dd-mm-yyyy'), 1079, 154);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97265, 'Cohn', to_date('31-08-1951', 'dd-mm-yyyy'), 3293, 77);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (80817, 'Tarantino', to_date('18-02-1948', 'dd-mm-yyyy'), 3256, 244);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38303, 'Church', to_date('30-10-1956', 'dd-mm-yyyy'), 162, 134);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (29119, 'Silverman', to_date('28-11-2002', 'dd-mm-yyyy'), 3649, 30);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (32204, 'Baker', to_date('14-07-1972', 'dd-mm-yyyy'), 1503, 51);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66119, 'Apple', to_date('19-09-2004', 'dd-mm-yyyy'), 2631, 163);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (15309, 'Diffie', to_date('30-10-1986', 'dd-mm-yyyy'), 2986, 193);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66192, 'Cook', to_date('15-07-1963', 'dd-mm-yyyy'), 3984, 28);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (27983, 'Suchet', to_date('11-01-1972', 'dd-mm-yyyy'), 3093, 177);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81667, 'Allison', to_date('25-02-1970', 'dd-mm-yyyy'), 2709, 33);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (90005, 'Krieger', to_date('18-11-1987', 'dd-mm-yyyy'), 686, 2);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (18663, 'Ponce', to_date('14-07-2001', 'dd-mm-yyyy'), 3558, 255);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (11606, 'Pacino', to_date('15-09-1958', 'dd-mm-yyyy'), 1023, 233);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (82100, 'Lorenz', to_date('05-12-1980', 'dd-mm-yyyy'), 1310, 131);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (3587, 'Foxx', to_date('15-06-1941', 'dd-mm-yyyy'), 1464, 95);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (13034, 'Blige', to_date('21-12-1943', 'dd-mm-yyyy'), 1073, 118);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46313, 'Collette', to_date('12-05-2020', 'dd-mm-yyyy'), 1831, 48);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75232, 'Aglukark', to_date('06-07-2009', 'dd-mm-yyyy'), 3493, 245);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51715, 'Paxton', to_date('07-09-1964', 'dd-mm-yyyy'), 608, 223);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (31128, 'Holden', to_date('09-01-1996', 'dd-mm-yyyy'), 3073, 10);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (1588, 'Imbruglia', to_date('11-09-2022', 'dd-mm-yyyy'), 2347, 90);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (89547, 'O''Keefe', to_date('06-11-1956', 'dd-mm-yyyy'), 260, 226);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (41863, 'Nash', to_date('28-02-1965', 'dd-mm-yyyy'), 150, 152);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57139, 'Gilley', to_date('02-09-2010', 'dd-mm-yyyy'), 1978, 115);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66946, 'Martinez', to_date('28-09-2008', 'dd-mm-yyyy'), 3348, 78);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (61261, 'Robards', to_date('30-04-1983', 'dd-mm-yyyy'), 3513, 68);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97842, 'Crimson', to_date('19-05-2001', 'dd-mm-yyyy'), 2500, 193);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (95745, 'Forster', to_date('23-12-1943', 'dd-mm-yyyy'), 1079, 93);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (98232, 'Lee', to_date('18-01-1942', 'dd-mm-yyyy'), 1091, 196);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (8692, 'Greenwood', to_date('28-12-2007', 'dd-mm-yyyy'), 618, 252);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38315, 'Dzundza', to_date('02-02-2003', 'dd-mm-yyyy'), 319, 191);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (12784, 'Warburton', to_date('02-01-1942', 'dd-mm-yyyy'), 1058, 24);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22824, 'Everett', to_date('31-12-1978', 'dd-mm-yyyy'), 1265, 164);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (93402, 'Day-Lewis', to_date('01-06-2028', 'dd-mm-yyyy'), 3303, 199);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (22342, 'Hanley', to_date('04-04-1958', 'dd-mm-yyyy'), 3649, 4);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (67593, 'Crow', to_date('24-12-1967', 'dd-mm-yyyy'), 1361, 86);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48122, 'Bosco', to_date('28-04-1958', 'dd-mm-yyyy'), 931, 58);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (90329, 'Aaron', to_date('02-02-1966', 'dd-mm-yyyy'), 3134, 256);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (50423, 'Gaines', to_date('08-11-1985', 'dd-mm-yyyy'), 3984, 63);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (7088, 'Firth', to_date('11-10-1980', 'dd-mm-yyyy'), 3627, 15);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (65318, 'Tomei', to_date('27-03-1968', 'dd-mm-yyyy'), 1310, 153);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28112, 'Nakai', to_date('18-07-2014', 'dd-mm-yyyy'), 2413, 117);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76663, 'Connelly', to_date('13-03-2006', 'dd-mm-yyyy'), 1884, 121);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (20141, 'Sossamon', to_date('18-05-1988', 'dd-mm-yyyy'), 3066, 227);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (17347, 'Spector', to_date('28-02-2004', 'dd-mm-yyyy'), 2103, 69);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (32486, 'Makeba', to_date('20-03-1970', 'dd-mm-yyyy'), 3331, 19);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64753, 'Clinton', to_date('19-01-2003', 'dd-mm-yyyy'), 3004, 230);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (75556, 'Lyonne', to_date('22-04-1952', 'dd-mm-yyyy'), 3018, 171);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77244, 'Close', to_date('02-07-1992', 'dd-mm-yyyy'), 1978, 233);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (13787, 'Dillon', to_date('21-04-2008', 'dd-mm-yyyy'), 2347, 184);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (32639, 'Garcia', to_date('23-03-2004', 'dd-mm-yyyy'), 908, 75);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58914, 'Horizon', to_date('18-09-1991', 'dd-mm-yyyy'), 157, 219);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97435, 'Matheson', to_date('03-07-1948', 'dd-mm-yyyy'), 129, 203);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (6473, 'Condition', to_date('12-06-1988', 'dd-mm-yyyy'), 1092, 154);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (18967, 'Callow', to_date('14-11-2009', 'dd-mm-yyyy'), 3184, 27);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55949, 'Martin', to_date('03-03-2008', 'dd-mm-yyyy'), 1031, 104);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (58077, 'Ratzenberger', to_date('20-07-1968', 'dd-mm-yyyy'), 1155, 202);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (73957, 'Danes', to_date('24-08-1977', 'dd-mm-yyyy'), 1031, 21);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52747, 'Giamatti', to_date('02-07-1969', 'dd-mm-yyyy'), 1817, 121);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (233, 'Perlman', to_date('23-02-2024', 'dd-mm-yyyy'), 2933, 181);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46143, 'Biel', to_date('14-03-1990', 'dd-mm-yyyy'), 1884, 40);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55683, 'Holliday', to_date('14-11-1975', 'dd-mm-yyyy'), 1377, 232);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71812, 'Amos', to_date('26-10-1952', 'dd-mm-yyyy'), 3639, 104);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (71087, 'Farina', to_date('13-05-1949', 'dd-mm-yyyy'), 846, 114);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (23576, 'Lunch', to_date('01-04-1976', 'dd-mm-yyyy'), 1930, 3);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (42191, 'Lynne', to_date('12-01-2023', 'dd-mm-yyyy'), 2811, 221);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52230, 'Belushi', to_date('24-05-1955', 'dd-mm-yyyy'), 2783, 132);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57198, 'Roth', to_date('03-09-1995', 'dd-mm-yyyy'), 1167, 109);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (88960, 'Pollack', to_date('15-10-2021', 'dd-mm-yyyy'), 8, 107);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (78916, 'Burke', to_date('10-07-1961', 'dd-mm-yyyy'), 2313, 121);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (27387, 'Sayer', to_date('10-12-1994', 'dd-mm-yyyy'), 3158, 117);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (72760, 'Horizon', to_date('30-05-2004', 'dd-mm-yyyy'), 2897, 209);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (31338, 'Platt', to_date('24-04-1967', 'dd-mm-yyyy'), 53, 58);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44191, 'Solido', to_date('24-10-1941', 'dd-mm-yyyy'), 3170, 23);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (12870, 'Diddley', to_date('18-01-1953', 'dd-mm-yyyy'), 311, 127);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (99218, 'Conroy', to_date('15-05-2001', 'dd-mm-yyyy'), 155, 248);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (78401, 'McFadden', to_date('02-11-1941', 'dd-mm-yyyy'), 3584, 31);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (52211, 'Matarazzo', to_date('30-11-2025', 'dd-mm-yyyy'), 7, 113);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45854, 'Franklin', to_date('01-08-2013', 'dd-mm-yyyy'), 179, 42);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (31196, 'Torino', to_date('18-08-1984', 'dd-mm-yyyy'), 1378, 234);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (28336, 'Spacey', to_date('03-03-1985', 'dd-mm-yyyy'), 2566, 133);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44366, 'Eckhart', to_date('13-08-1997', 'dd-mm-yyyy'), 3990, 44);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (29365, 'Judd', to_date('15-05-1990', 'dd-mm-yyyy'), 618, 115);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (94703, 'Postlethwaite', to_date('20-12-1964', 'dd-mm-yyyy'), 3627, 244);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5567, 'Heatherly', to_date('21-02-1996', 'dd-mm-yyyy'), 166, 259);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14815, 'LaSalle', to_date('08-11-1989', 'dd-mm-yyyy'), 1818, 174);
commit;
prompt 600 records committed...
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (77242, 'Carr', to_date('13-06-2026', 'dd-mm-yyyy'), 1316, 205);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51408, 'Heslov', to_date('02-08-1953', 'dd-mm-yyyy'), 3493, 144);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (33492, 'Connick', to_date('28-01-1966', 'dd-mm-yyyy'), 598, 29);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (69420, 'Winter', to_date('12-04-1970', 'dd-mm-yyyy'), 2233, 95);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (80051, 'Craddock', to_date('13-04-2025', 'dd-mm-yyyy'), 330, 10);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (38387, 'Carnes', to_date('11-07-1974', 'dd-mm-yyyy'), 2103, 81);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (15095, 'Shatner', to_date('01-03-2029', 'dd-mm-yyyy'), 3493, 77);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (79863, 'Rydell', to_date('14-08-2018', 'dd-mm-yyyy'), 3984, 81);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (73762, 'Almond', to_date('24-12-1966', 'dd-mm-yyyy'), 3310, 59);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57624, 'Satriani', to_date('28-08-2021', 'dd-mm-yyyy'), 846, 59);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (57271, 'Stamp', to_date('22-12-1973', 'dd-mm-yyyy'), 1402, 241);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (63712, 'Myers', to_date('23-12-2021', 'dd-mm-yyyy'), 598, 210);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (85477, 'McCabe', to_date('04-12-1954', 'dd-mm-yyyy'), 129, 61);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5373, 'Rush', to_date('14-07-1992', 'dd-mm-yyyy'), 598, 209);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (37366, 'Heron', to_date('07-11-1952', 'dd-mm-yyyy'), 1402, 71);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (68894, 'Belle', to_date('03-08-1956', 'dd-mm-yyyy'), 3043, 11);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (89245, 'Burrows', to_date('31-10-1940', 'dd-mm-yyyy'), 2832, 112);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (44814, 'Tennison', to_date('23-12-2013', 'dd-mm-yyyy'), 3858, 205);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (46255, 'Holiday', to_date('13-05-2008', 'dd-mm-yyyy'), 1058, 256);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (20170, 'Madonna', to_date('12-03-1967', 'dd-mm-yyyy'), 407, 167);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (78245, 'Stanton', to_date('04-09-1998', 'dd-mm-yyyy'), 1316, 149);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (89584, 'Schiavelli', to_date('21-09-1976', 'dd-mm-yyyy'), 1092, 92);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (20800, 'Tillis', to_date('29-07-2018', 'dd-mm-yyyy'), 480, 133);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5971, 'Wilson', to_date('25-07-2017', 'dd-mm-yyyy'), 2681, 203);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (47547, 'Collie', to_date('14-06-1970', 'dd-mm-yyyy'), 3093, 76);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (94411, 'Griffiths', to_date('04-01-1999', 'dd-mm-yyyy'), 3373, 63);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (16690, 'Neil', to_date('22-04-1975', 'dd-mm-yyyy'), 1676, 138);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (55782, 'Plimpton', to_date('29-04-1988', 'dd-mm-yyyy'), 1315, 229);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (90724, 'Thornton', to_date('15-04-2029', 'dd-mm-yyyy'), 1425, 113);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (78178, 'Hewitt', to_date('28-05-1961', 'dd-mm-yyyy'), 1058, 233);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (34114, 'Fisher', to_date('04-03-1992', 'dd-mm-yyyy'), 2728, 227);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (31345, 'Hynde', to_date('29-08-1950', 'dd-mm-yyyy'), 2937, 244);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (5398, 'Sisto', to_date('16-10-1947', 'dd-mm-yyyy'), 3575, 163);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (8571, 'Bean', to_date('01-10-1967', 'dd-mm-yyyy'), 3331, 213);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (6389, 'Bush', to_date('14-07-2001', 'dd-mm-yyyy'), 2500, 67);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (13569, 'LuPone', to_date('04-12-2006', 'dd-mm-yyyy'), 846, 171);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (97808, 'Raye', to_date('09-03-2012', 'dd-mm-yyyy'), 157, 26);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66195, 'Mewes', to_date('10-07-2009', 'dd-mm-yyyy'), 2352, 222);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81562, 'Gambon', to_date('24-02-2022', 'dd-mm-yyyy'), 2066, 159);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (51677, 'Kingsley', to_date('17-11-2011', 'dd-mm-yyyy'), 1156, 99);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (81450, 'Andrews', to_date('26-02-1975', 'dd-mm-yyyy'), 3857, 200);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (37774, 'Malkovich', to_date('17-07-2013', 'dd-mm-yyyy'), 597, 180);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (4186, 'Diggs', to_date('15-09-2011', 'dd-mm-yyyy'), 155, 218);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (66771, 'Maguire', to_date('12-07-1960', 'dd-mm-yyyy'), 655, 54);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48512, 'Elizabeth', to_date('12-11-2022', 'dd-mm-yyyy'), 2652, 145);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (83001, 'Detmer', to_date('03-04-1945', 'dd-mm-yyyy'), 166, 264);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (64926, 'Levy', to_date('20-12-1960', 'dd-mm-yyyy'), 2615, 243);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (48245, 'Boorem', to_date('31-03-1961', 'dd-mm-yyyy'), 576, 231);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (12921, 'Eder', to_date('02-03-2014', 'dd-mm-yyyy'), 1366, 27);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (45274, 'Colman', to_date('16-07-2022', 'dd-mm-yyyy'), 111, 41);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (33368, 'Tripplehorn', to_date('08-10-2008', 'dd-mm-yyyy'), 648, 202);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (76297, 'Rhodes', to_date('05-03-1995', 'dd-mm-yyyy'), 859, 81);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (14002, 'Travers', to_date('28-05-2022', 'dd-mm-yyyy'), 1478, 19);
insert into CLIENT (c_tz, c_name, b_date, c_id, m_g_id)
values (27499, 'Diffie', to_date('21-04-1947', 'dd-mm-yyyy'), 2906, 56);
commit;
prompt 654 records loaded
prompt Loading PATH...
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (819739, 6376814, 'Wetzlar', 'Milwaukee');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (424417, 5785526, 'Claymont', 'Redhill');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (947292, 4353934, 'Budapest', 'Cobham');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (486958, 8438943, 'Toronto', 'Park Ridge');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (2, 35, 'NEW YORK', 'LAS VEGAS');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (3, 36, 'PARIS', 'LONDON');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (4, 37, 'LONDON', 'BERLIN');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (1, 34, 'NEW YORK', 'LONDON');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (712664, 9924849, 'Cary', 'Schlieren');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (679599, 5952534, 'Montreal', 'Sacramento');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (778652, 6875699, 'Huntington', 'Belo Horiz');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (512587, 9673254, 'Kagoshima', 'Yomgok-don');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (129997, 6722191, 'Bartlesvil', 'Ipswich');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (275228, 8664372, 'Wetzlar', 'Stony Poin');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (375421, 9978919, 'Padova', 'Agoncillo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (365266, 3998925, 'Ringwood', 'Ebersdorf');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (713583, 7389582, 'Sheffield', 'Trenton');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (674133, 2976146, 'Biella', 'Ellicott C');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (896387, 7117199, 'Bellevue', 'Pointe-cla');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (672488, 7321644, 'Belgrad', 'Olsztyn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (365185, 1323414, 'Leeds', 'Riverdale');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (434348, 1172325, 'Stuttgart', 'Ramat Gan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (832725, 9481781, 'Nagoya', 'Longueuil');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (474595, 2536569, 'Macau', 'Ulsteinvik');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (263917, 3278463, 'Kista', 'Tooele');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (234265, 1414656, 'Wilmington', 'Ulsteinvik');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (117434, 9765193, 'Sacramento', 'Sundsvall');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (181996, 1695127, 'Reno', 'Toronto');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (999428, 8691779, 'Hanover', 'Olsztyn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (383864, 9865155, 'Hanover', 'Vilnius');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (741892, 6857611, 'Ulm', 'Calgary');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (875315, 4934994, 'Milwaukee', 'Hanover');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (558738, 9124477, 'Alexandria', 'Vejle');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (829279, 2444257, 'Bartlesville', 'Tempe');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (841682, 1332226, 'Rockville', 'East Peoria');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (823267, 1918171, 'Berwyn', 'Saga');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (121887, 3798555, 'Sheffield', 'Ramat Gan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (483438, 3957289, 'Verdun', 'Chennai');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (381214, 1338133, 'Berkeley', 'El Dorado Hills');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (427497, 1581346, 'Athens', 'Glenshaw');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (378677, 9537964, 'Gainesville', 'Wetzlar');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (867935, 1391784, 'Stafford', 'Protvino');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (332632, 8251228, 'Debary', 'Erpe-Mere');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (335324, 1327873, 'Tilst', 'Palma de Mallor');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (672733, 4163798, 'Olsztyn', 'Taoyuan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (389362, 6969524, 'Ringwood', 'St Kilda');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (822344, 1524334, 'Lahr', 'Vilnius');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (174559, 2294951, 'Ulsteinvik', 'Ringwood');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (425521, 6649949, 'Koeln', 'Lexington');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (348642, 3852536, 'Springfield', 'Fountain Hills');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (875154, 9157464, 'Chaam', 'Riverdale');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (643161, 4331164, 'El Masnou', 'Toronto');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (725868, 6665358, 'Vilnius', 'Lake worth');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (883242, 7552629, 'Sundsvall', 'Hanover');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (954429, 4761427, 'Juneau', 'Ellicott City');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (358852, 2316963, 'Tualatin', 'Cary');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (443444, 1539757, 'Eschborn', 'Glen allen');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (469288, 5326448, 'Sugar Land', 'Las Vegas');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (991789, 7739522, 'Debary', 'Tbilisi');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (282834, 1167347, 'Stony Point', 'Calgary');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (348281, 6179899, 'Redhill', 'Hamburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (668246, 7516136, 'Springfield', 'Ulsteinvik');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (962127, 5456547, 'Tilburg', 'Ljubljana');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (359346, 6825188, 'Yamaguchi', 'Ramat Gan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (636846, 5757956, 'Manchester', 'Wilmington');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (628925, 8274687, 'Augsburg', 'Waite Park');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (324283, 2337364, 'Redhill', 'Ankara');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (711241, 2381862, 'Rockville', 'Cary');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (914166, 5235821, 'Oslo', 'Bolton');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (988498, 1193261, 'Trenton', 'Fukui');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (987225, 1197927, 'Pusan', 'Philadelphia');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (353964, 4626636, 'Edison', 'Stuttgart');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (776338, 7127423, 'Aomori', 'Bloomington');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (444275, 8182931, 'Lexington', 'Manchester');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (638531, 9655625, 'Hackensack', 'Douala');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (439648, 2928763, 'Cuenca', 'Brno');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (781323, 3477484, 'Laredo', 'Nagoya');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (137558, 3373363, 'Tempe', 'Mobile');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (363335, 4641468, 'Kagoshima', 'Edinburgh');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (191719, 4529126, 'Brno', 'Pointe-claire');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (491742, 9816339, 'Aomori', 'Ramat Gan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (561534, 2868396, 'Eschen', 'Mobile');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (264191, 2121441, 'Belo Horizonte', 'Lippetal');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (513641, 9831282, 'Aiken', 'Coburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (851793, 7414557, 'Vienna', 'Saga');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (234963, 8347295, 'Gainesville', 'Peachtree City');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (487515, 8741569, 'Chapeco', 'Rockland');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (938424, 1328187, 'Ulsteinvik', 'Rockville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (726556, 5499921, 'Park Ridge', 'Salzburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (116828, 6114574, 'Wilmington', 'Balmoral');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (178816, 6788839, 'St Leonards', 'Treviso');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (968575, 2731517, 'Stuttgart', 'Mobile');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (812682, 3919352, 'Philadelphia', 'Saga');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (193247, 2126896, 'Juneau', 'Oslo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (936855, 9378673, 'West Chester', 'Wetzlar');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (843674, 9361986, 'Bolton', 'Waite Park');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (941833, 8515525, 'Debary', 'Americana');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (167652, 7772479, 'Tilst', 'Aomori');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (883876, 1599114, 'Yamaguchi', 'Melbourne');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (648736, 1747535, 'Aomori', 'Tilst');
commit;
prompt 100 records committed...
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (693469, 8297685, 'Toronto', 'Chennai');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (227974, 2719987, 'Cuenca', 'Schlieren');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (366939, 9951384, 'Lake worth', 'Brno');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (742336, 6136822, 'Ben-Gurion', 'Kungki');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (551657, 8945465, 'Americana', 'Bloomington');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (443536, 6513696, 'N. ft. Myers', 'Laredo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (896545, 4319799, 'Portland', 'Ciudad del Este');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (498431, 1165514, 'Hackensack', 'Unionville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (994932, 8383827, 'Kaysville', 'Wetzlar');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (934815, 6226369, 'Wavre', 'Germantown');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (521134, 4493342, 'Kozani', 'Tilburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (188921, 9872436, 'Longueuil', 'Warren');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (261615, 8812775, 'Palma de Mallor', 'Longueuil');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (346566, 4117856, 'Essex', 'Santorso');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (881942, 5814972, 'Royersford', 'Ringwood');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (496483, 8123565, 'Oldenburg', 'Dublin');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (787391, 1283317, 'Saudarkrokur', 'Berkeley');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (949872, 4122116, 'Solikamsk', 'Saitama');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (868889, 3421713, 'Portland', 'Summerside');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (744626, 1235178, 'Mobile', 'K?¸benhavn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (639128, 4132929, 'Tampa', 'Brno');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (923437, 3823582, 'Wavre', 'East Peoria');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (376235, 8162148, 'Hackensack', 'Huntsville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (931374, 1523885, 'Santorso', 'Battle Creek');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (482679, 3887484, 'Berlin-Adlersho', 'Kagoshima');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (517269, 1611834, 'Smyrna', 'Palma de Mallor');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (197751, 4189382, 'Ulsteinvik', 'Adamstown');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (126867, 5731759, 'Dartmouth', 'Rockland');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (582781, 4927642, 'Naha', 'Banbury');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (664554, 1813662, 'Juazeiro', 'Yamaguchi');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (758335, 3688159, 'Maryville', 'Rockland');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (425535, 6873712, 'Mobile', 'Ponta grossa');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (241867, 5926844, 'Boulogne', 'Kungki');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (885376, 7643986, 'Kagoshima', 'Fambach');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (361611, 8116265, 'Manaus', 'Waite Park');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (815442, 4344412, 'Kochi', 'Ohtsu');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (864495, 2763436, 'Debary', 'Uetikon am See');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (523229, 6482871, 'Verdun', 'Gettysburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (897766, 8256564, 'Waite Park', 'Oslo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (418913, 2151739, 'Warren', 'Matsue');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (686368, 2988664, 'Dubai', 'Vilnius');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (973725, 5294667, 'Mobile', 'Cambridge');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (354518, 1196144, 'Scottsdale', 'Seoul');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (444773, 6194989, 'Salem', 'Koeln');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (982313, 4344749, 'Tooele', 'Santa rita sapu');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (499992, 1636948, 'Edinburgh', 'Thame');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (942788, 4845848, 'Saudarkrokur', 'Maryville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (835977, 4953119, 'Coburg', 'Saint Ouen');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (678259, 3719373, 'Ulsteinvik', 'Foster City');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (663646, 9471293, 'Trenton', 'Sundsvall');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (178223, 5646895, 'Lucca', 'Kochi');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (711362, 4439569, 'Holliston', 'Storrington');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (968786, 8117596, 'Redhill', 'Joinville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (874564, 4111448, 'Kozani', 'Vienna');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (673137, 4889561, 'Lexington', 'Santorso');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (825827, 7491373, 'Huntsville', 'Lahr');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (676725, 4194163, 'Thame', 'Unionville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (784164, 2792632, 'Vienna', 'Dartmouth');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (436283, 6364664, 'Zipf', 'Buffalo Grove');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (424582, 5541854, 'Altst?¤tten', 'Salem');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (683315, 4638138, 'Fountain Hills', 'Douala');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (785623, 6892212, 'St Kilda', 'Schlieren');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (486843, 5691177, 'West Chester', 'Fountain Hills');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (679494, 7629129, 'Ulsteinvik', 'Gettysburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (358154, 9344642, 'Ribeirao preto', 'Cuenca');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (367268, 5867862, 'Eschborn', 'Oslo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (628662, 1742546, 'Saitama', 'Augsburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (867238, 8346797, 'Edison', 'Melrose park');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (783173, 2557983, 'Rorschach', 'Wehrheim');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (499225, 2274767, 'Laredo', 'Yomgok-dong');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (451581, 5448116, 'Buffalo', 'Berwyn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (987626, 5221291, 'Nagoya', 'Tampa');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (234823, 1421617, 'Las Vegas', 'Bedford');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (964349, 9221178, 'Ebersdorf', 'Saga');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (924769, 2242316, 'Piacenza', 'Ohtsu');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (184886, 9571214, 'Buffalo Grove', 'Protvino');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (489222, 9586279, 'Seoul', 'Hamburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (671865, 8127918, 'Ani?¨res', 'Lake worth');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (986772, 3994793, 'Lippetal', 'Kochi');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (223317, 7615295, 'Berwyn', 'Brno');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (383215, 2887572, 'Niigata', 'West Chester');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (896531, 7394899, 'Vejle', 'Yamaguchi');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (318738, 2331582, 'Cary', 'Unionville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (758573, 3765296, 'Hanover', 'Tempe');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (527162, 3263475, 'Coventry', 'Olsztyn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (815172, 2568746, 'Kungki', 'El Segundo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (125358, 3345881, 'Lake worth', 'Smyrna');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (434446, 5176157, 'Stuttgart', 'Hounslow');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (314581, 1599151, 'Alleroed', 'Buffalo Grove');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (411865, 2768959, 'Wetzlar', 'Aomori');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (948796, 8855313, 'Springfield', 'Wetzlar');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (182967, 3843465, 'Encinitas', 'Olsztyn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (449918, 4293514, 'Zipf', 'Glenshaw');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (232189, 9377242, 'Scottsdale', 'Melrose park');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (145632, 6959195, 'Thame', 'Portland');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (814977, 3771563, 'Lexington', 'Moscow');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (367669, 1319741, 'Brno', 'Berkeley');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (458898, 8546834, 'Wellington', 'Bad Camberg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (785861, 5385426, 'Uetikon am See', 'Milan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (879823, 8279225, 'Kuopio', 'Avon');
commit;
prompt 200 records committed...
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (193641, 8522983, 'Naha', 'Philadelphia');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (573459, 4743915, 'Hanover', 'Avon');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (193368, 3524272, 'Reading', 'Solikamsk');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (868328, 7856216, 'Americana', 'Verdun');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (362465, 1979679, 'Haverhill', 'Ramat Gan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (127616, 1165621, 'Eiksmarka', 'Summerside');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (973669, 4684198, 'Waite Park', 'Douala');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (855131, 4767916, 'Solikamsk', 'Bloomington');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (375722, 4482759, 'Altst?¤tten', 'Biella');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (269919, 5486321, 'Silver Spring', 'Portland');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (868953, 8663959, 'Trenton', 'Lippetal');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (795588, 1137292, 'Cuenca', 'Albany');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (264449, 7435427, 'Maryville', 'East Peoria');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (142373, 9786658, 'El Masnou', 'Rockland');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (553853, 4552785, 'Zipf', 'Alleroed');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (844432, 4346729, 'Park Ridge', 'Smyrna');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (616946, 6554974, 'Wetzlar', 'Vienna');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (145133, 2573689, 'Vejle', 'Ft. Lauderdale');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (555691, 6434966, 'Macau', 'Pretoria');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (177269, 5784811, 'Edison', 'Hackensack');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (242399, 5583179, 'Stuttgart', 'Naha');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (259453, 2442477, 'Vallauris', 'Padova');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (899552, 6777465, 'Rorschach', 'Smyrna');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (724738, 7687656, 'Kozani', 'Summerside');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (999493, 7736153, 'Ben-Gurion', 'Edinburgh');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (813277, 9839867, 'Lippetal', 'Eschborn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (946227, 3468344, 'Debary', 'Germantown');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (664645, 4251121, 'Sugar Land', 'Bartlesville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (296753, 6264151, 'Edinburgh', 'West Chester');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (431187, 1156694, 'St Kilda', 'Lucca');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (882317, 1674151, 'Sendai', 'Kista');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (567346, 2473293, 'Buffalo Grove', 'Eschen');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (514347, 5934275, 'Albany', 'Altst?¤tten');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (943112, 4279746, 'Rothenburg', 'Sihung-si');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (711898, 6431556, 'Obfelden', 'Cobham');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (273775, 6553228, 'Balmoral', 'Juazeiro');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (444247, 5527413, 'Palo Alto', 'Salem');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (351843, 2559192, 'Riverdale', 'Cambridge');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (794996, 1166272, 'Naestved', 'Warren');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (816374, 9652954, 'Oslo', 'Solikamsk');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (819216, 8973629, 'Scottsdale', 'Rorschach');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (478792, 5149461, 'Rorschach', 'Claymont');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (273182, 5531914, 'Ramat Gan', 'Oldenburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (551367, 6673258, 'Oklahoma city', 'El Dorado Hills');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (339352, 4282691, 'Marietta', 'Waite Park');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (999111, 2949571, 'Manchester', 'Wilmington');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (434725, 6374552, 'El Masnou', 'Rockville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (636243, 5534882, 'Saint Ouen', 'Scottsdale');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (783831, 1451338, 'Dartmouth', 'Athens');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (272852, 3711943, 'Vallauris', 'Santa rita sapu');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (958941, 7935296, 'Tilst', 'Ulsteinvik');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (342134, 3226463, 'Bedford', 'Joinville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (315879, 4232957, 'Rockville', 'Cuenca');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (936525, 3484447, 'Buffalo', 'Saga');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (683991, 8223924, 'Calgary', 'Protvino');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (616683, 7642732, 'Adamstown', 'Balmoral');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (374218, 5227713, 'Naha', 'Thame');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (282419, 9746551, 'Trenton', 'Neuch?¢tel');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (397871, 5135735, 'West Chester', 'Ohtsu');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (226678, 9929452, 'Manchester', 'Silver Spring');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (356326, 7962771, 'Lippetal', 'Germantown');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (136849, 6255178, 'St Kilda', 'N. ft. Myers');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (594964, 1287738, 'Ribeirao preto', 'Sparrows Point');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (461299, 4819256, 'Hanover', 'Bartlesville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (536138, 9843819, 'East Peoria', 'Berwyn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (673598, 1416944, 'Ipswich', 'Marietta');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (759811, 4613445, 'Portland', 'Obfelden');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (859558, 9172777, 'Koeln', 'Laurel');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (275684, 4471564, 'Balmoral', 'Solikamsk');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (682225, 7656935, 'Mariano Comense', 'Chapeco');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (341227, 4574945, 'Salzburg', 'Chaam');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (234476, 5456142, 'Fort Saskatchew', 'Peachtree City');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (516993, 3787163, 'Gainesville', 'Eschen');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (168357, 4882841, 'Cuenca', 'Stony Point');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (849661, 1872887, 'Fleet', 'Pointe-claire');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (623553, 6467118, 'Vallauris', 'Claymont');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (819565, 4984953, 'Warren', 'Holliston');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (177479, 6462115, 'Bolton', 'Berwyn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (597465, 8214854, 'Stafford', 'Silver Spring');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (232163, 8166162, 'Vallauris', 'Piacenza');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (172723, 6599175, 'Milwaukee', 'Yomgok-dong');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (896832, 1595339, 'Springfield', 'Oslo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (123558, 7959281, 'Eiksmarka', 'Tempe');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (554831, 8816881, 'Taoyuan', 'Athens');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (543234, 4653145, 'Avon', 'Colombo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (658912, 5239327, 'Wellington', 'Oslo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (917961, 5548225, 'Laredo', 'Campana');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (862465, 7717272, 'Smyrna', 'Wavre');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (765957, 9374261, 'Lexington', 'Tooele');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (742519, 6452552, 'Edinburgh', 'Paraju');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (275566, 2679145, 'Erpe-Mere', 'Laredo');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (893189, 9179227, 'Sheffield', 'Uetikon am See');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (815382, 6784478, 'Tempe', 'Bedfordshire');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (947822, 8528641, 'Germantown', 'Taoyuan');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (536616, 4214794, 'Schlieren', 'East Peoria');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (136374, 6723651, 'Macau', 'Hamburg');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (584572, 5189544, 'Portland', 'El Dorado Hills');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (326424, 1477319, 'Protvino', 'Scottsdale');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (769132, 3695359, 'Alleroed', 'K?¸benhavn');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (615375, 6617181, 'Palo Alto', 'Banbury');
commit;
prompt 300 records committed...
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (617129, 2722753, 'Goslar', 'N. ft. Myers');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (176416, 1329894, 'Chennai', 'Pointe-claire');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (467215, 7288549, 'Maryville', 'Bedfordshire');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (347594, 6671863, 'Colombo', 'Boulogne');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (359584, 7212622, 'El Masnou', 'Groton');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (916354, 3364589, 'Manaus', 'Bedfordshire');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (182699, 3261517, 'Avon', 'Berkeley');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (964537, 4923377, 'Fleet', 'Ohtsu');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (313871, 4779722, 'Oldenburg', 'Ribeirao preto');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (183485, 3833156, 'Eiksmarka', 'Maryville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (887887, 9466737, 'Lucca', 'Scottsdale');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (242668, 7256421, 'Riverdale', 'Palo Alto');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (555963, 5633942, 'Huntsville', 'Cuenca');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (388919, 1339656, 'Vilnius', 'Goslar');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (791344, 2849853, 'Bracknell', 'Berlin-Adlersho');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (797221, 7695566, 'Hackensack', 'Rockville');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (848735, 7131345, 'Bedford', 'Buffalo Grove');
insert into PATH (num_of_stations, p_id, begin_city, end_city)
values (721546, 5679344, 'Bedford', 'Essex');
commit;
prompt 318 records loaded
prompt Loading SHIP...
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (1234, 'blues', 100, 1000);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (97523, 'Hart', 35, 3611);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (88742, 'Davis', 93, 3163);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (49357, 'Durning', 37, 1496);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (38886, 'Gooding', 26, 5761);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (46128, 'Vince', 18, 3913);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (75945, 'Sherman', 34, 2173);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (48297, 'Hornsby', 63, 9285);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (88893, 'Lewin', 38, 3179);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (25893, 'Ferrer', 54, 2768);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (46851, 'Biggs', 74, 2383);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (24631, 'Sandler', 63, 1131);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (27986, 'Mason', 99, 5784);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (23335, 'Ledger', 81, 9495);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (41416, 'Ripley', 74, 7476);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (47443, 'Milsap', 94, 3343);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31185, 'Senior', 38, 5731);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (87637, 'Penn', 75, 9331);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (26779, 'Numan', 51, 5457);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (48571, 'Broadbent', 16, 3643);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (47837, 'Streep', 53, 1776);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (15139, 'Steenburge', 49, 4536);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (72327, 'Crouch', 42, 2612);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (33834, 'Donelly', 93, 9819);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (11142, 'Lang', 92, 5472);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (66795, 'Rauhofer', 41, 9786);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (62754, 'Harris', 86, 1581);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (53825, 'Pigott-Smi', 16, 7224);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (33211, 'Greenwood', 19, 7934);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (77977, 'Magnuson', 26, 7127);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (35462, 'LuPone', 81, 5644);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (91794, 'Laurie', 36, 7834);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (88585, 'Tomei', 77, 2752);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (86883, 'Stewart', 43, 9595);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (14975, 'Cohn', 11, 5953);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (36351, 'Vaughan', 61, 7595);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (95671, 'Cassidy', 78, 8415);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (61928, 'Hatfield', 85, 5664);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (81625, 'Portman', 35, 2664);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (71815, 'Fraser', 22, 3584);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (37266, 'Hong', 99, 8792);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (48967, 'Rock', 75, 7274);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79329, 'Ingram', 96, 5541);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (89682, 'Spector', 74, 6976);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (62644, 'Furtado', 95, 7177);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (73775, 'Jamal', 48, 6188);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (81534, 'Colin Youn', 56, 9319);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (68683, 'Heslov', 99, 9537);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (11121, 'Hirsch', 37, 2343);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (91773, 'Hoffman', 83, 5293);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (27586, 'Chesnutt', 71, 7167);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (44886, 'Fox', 35, 3394);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (29628, 'Benson', 75, 7273);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (93687, 'Black', 26, 7992);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (91427, 'Solido', 27, 4454);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (55888, 'Dench', 51, 8388);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (77824, 'Emmerich', 22, 8381);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (12578, 'Archer', 55, 4863);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (51385, 'Richter', 54, 7893);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (28746, 'Tripplehor', 92, 5786);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (94523, 'Lawrence', 72, 9312);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (77366, 'Stone', 92, 2254);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (57826, 'DeGraw', 97, 1997);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (85295, 'Bancroft', 66, 6491);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (87255, 'Idol', 59, 1928);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79287, 'Borden', 76, 8812);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (91947, 'Dorff', 72, 8123);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (86498, 'Atkinson', 26, 4111);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (74589, 'Shearer', 37, 8498);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (39292, 'Quaid', 67, 2475);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (14696, 'Ferry', 67, 3357);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (71544, 'Singh', 91, 6518);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (84194, 'Fonda', 97, 4513);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (85935, 'Green', 29, 7532);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (66999, 'Cagle', 53, 8858);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (26126, 'Sainte-Mar', 37, 1782);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (72174, 'Dafoe', 93, 3436);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (54295, 'Rowlands', 52, 3431);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (89948, 'Mahoney', 23, 8185);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (37796, 'Hatfield', 18, 2284);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (32275, 'Glover', 32, 2112);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (85134, 'Stuermer', 33, 7667);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (74224, 'Guest', 59, 8759);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31833, 'Burke', 42, 4623);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (61132, 'Stamp', 41, 4863);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (94832, 'Hyde', 46, 3952);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (43314, 'Armstrong', 43, 7222);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (86882, 'Del Toro', 36, 1878);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31281, 'Alexander', 58, 7455);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (93971, 'Van Helden', 32, 1547);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31564, 'Liu', 17, 5492);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (22271, 'Newman', 51, 7948);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (48751, 'Wright', 48, 4154);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (16474, 'Greenwood', 25, 9939);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (91428, 'Delta', 53, 6753);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (94133, 'Orbit', 52, 7461);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (59119, 'Rio', 79, 4863);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (13766, 'Berenger', 66, 9724);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (36915, 'Negbaur', 88, 9136);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (48254, 'Sizemore', 54, 2758);
commit;
prompt 100 records committed...
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (86521, 'Sirtis', 75, 2438);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (82476, 'Latifah', 22, 6113);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (65697, 'DeLuise', 67, 6151);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (42348, 'Rickman', 95, 6339);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (14549, 'Burke', 81, 3756);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (89366, 'Bruce', 96, 9135);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (72864, 'Dunn', 45, 6589);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (54495, 'Tambor', 85, 6215);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (75465, 'Nielsen', 27, 7638);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (99399, 'Bello', 13, 5382);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79341, 'McDormand', 81, 2933);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (27828, 'Goldblum', 36, 6365);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (38981, 'Lynskey', 19, 7279);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (59849, 'Cassel', 44, 6959);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (55631, 'Keith', 68, 5158);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31473, 'Richter', 17, 6447);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79367, 'Paymer', 73, 9433);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (71779, 'LaPaglia', 76, 2352);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (51337, 'Harris', 44, 2296);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31252, 'Aykroyd', 26, 3851);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (24717, 'McKean', 69, 7138);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (35272, 'Lennix', 21, 9134);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (69556, 'Smith', 27, 1762);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (89792, 'Costa', 46, 5714);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (78994, 'Derringer', 44, 7237);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (54223, 'Mandrell', 68, 5293);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (86699, 'Curtis-Hal', 91, 2121);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (32545, 'Coe', 91, 9914);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31294, 'Schiavelli', 88, 4747);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (74981, 'Spacek', 23, 1955);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79645, 'Landau', 21, 2258);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (43121, 'Oakenfold', 98, 2154);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (12184, 'McCready', 36, 8294);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (11666, 'Diehl', 33, 2626);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (99923, 'Cornell', 51, 1995);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (68328, 'Sweet', 13, 9148);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (33956, 'Potter', 27, 8764);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (39122, 'Balaban', 44, 2395);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (76871, 'Bancroft', 36, 3421);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (23321, 'Irving', 72, 3961);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (63716, 'Beatty', 52, 1569);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79895, 'Scott', 68, 6639);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (84883, 'Vanian', 14, 9754);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (13289, 'Bradford', 51, 7178);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (67224, 'Travers', 99, 9198);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (39381, 'Davidson', 25, 9752);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (46813, 'Mohr', 89, 1368);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (12931, 'Marin', 55, 2393);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (67534, 'Weiland', 54, 1682);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (94825, 'Satriani', 99, 1153);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (47798, 'McGinley', 67, 8336);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (64644, 'Hoskins', 29, 1416);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (94298, 'Wheel', 94, 8541);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (36621, 'Schock', 31, 9935);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (36239, 'Streep', 86, 7458);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (73211, 'Shalhoub', 81, 1642);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (84352, 'Nielsen', 51, 7368);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (73321, 'Albright', 99, 1822);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (57851, 'Shocked', 48, 8841);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (61569, 'Garfunkel', 99, 8322);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (65871, 'Kinski', 54, 3983);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (99111, 'Kristoffer', 65, 1617);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (28233, 'Winter', 59, 2364);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (27879, 'Robbins', 19, 5963);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (52166, 'Klugh', 94, 4789);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (47666, 'Kurtz', 55, 4954);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (29192, 'Sevigny', 85, 7191);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (25541, 'Zane', 33, 1926);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (26278, 'Biel', 65, 1698);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (62851, 'Crystal', 65, 5538);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (66126, 'Moffat', 15, 4814);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (71166, 'Rains', 66, 2696);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (37425, 'Sherman', 39, 8857);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (67716, 'McCracken', 82, 9392);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (25376, 'Dillon', 99, 4665);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (97525, 'Hannah', 68, 4678);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (83417, 'Gryner', 89, 3711);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (12826, 'Cole', 97, 6399);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (16826, 'Winter', 12, 1344);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (73167, 'Schiff', 46, 2915);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (24919, 'Boyle', 18, 6525);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (36193, 'Summer', 71, 1913);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (35339, 'Franks', 48, 7632);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (87477, 'Crouse', 32, 1736);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (26335, 'Arkenstone', 19, 4356);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (14789, 'Spears', 74, 7645);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (27378, 'Russell', 73, 2946);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (99981, 'Sledge', 35, 4356);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (84113, 'Nicholson', 93, 1325);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (24682, 'DiBiasio', 89, 1855);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (27534, 'Ricci', 43, 6423);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (87322, 'Wariner', 26, 9576);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (29185, 'Peet', 34, 3854);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (96415, 'Allison', 12, 8416);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (31335, 'Dupree', 77, 3728);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (13914, 'Keen', 31, 4892);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (26967, 'Wagner', 82, 7615);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (73282, 'Rush', 63, 4975);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (67366, 'Savage', 74, 5476);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (96223, 'Sutherland', 49, 8344);
commit;
prompt 200 records committed...
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (38859, 'Benoit', 65, 5881);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (73733, 'Neill', 87, 7237);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (99366, 'Chung', 63, 4436);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (36624, 'Belushi', 64, 5927);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (86572, 'Herndon', 35, 9471);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (23727, 'Trejo', 68, 9458);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (37942, 'Crowe', 95, 4619);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (76265, 'Arjona', 67, 2364);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (51494, 'Sevigny', 98, 8758);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (23887, 'Armstrong', 91, 4964);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (44446, 'Pressly', 18, 9351);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (84365, 'Rosas', 93, 7939);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (51894, 'Kleinenber', 39, 2621);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (38399, 'El-Saher', 66, 7189);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (58353, 'De Almeida', 83, 7223);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (78681, 'Chaplin', 31, 9181);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (26754, 'Palminteri', 64, 7497);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (82526, 'Penders', 78, 5577);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (91151, 'Raybon', 79, 8989);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (19625, 'Luongo', 43, 7475);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (69375, 'Neville', 84, 5925);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (69129, 'Sarsgaard', 17, 8142);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (29249, 'Nunn', 17, 3476);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (84862, 'Schwimmer', 98, 9746);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (39371, 'Grier', 87, 7571);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79325, 'Jovovich', 85, 3535);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (94238, 'Law', 73, 2196);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (66197, 'Bacharach', 95, 9496);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (25787, 'Hannah', 92, 5645);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (59157, 'Osbourne', 31, 7646);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (55337, 'Sandler', 66, 5953);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (95213, 'Garza', 62, 8912);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (96744, 'Mills', 83, 3794);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (88219, 'Hauer', 31, 6814);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (56577, 'Sevenfold', 62, 1652);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (59377, 'Phoenix', 55, 4688);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (22385, 'Connick', 71, 1924);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (99775, 'Gere', 44, 9667);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (22299, 'Jovovich', 34, 9885);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (33165, 'Santana', 45, 6927);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (96857, 'Cotton', 15, 9383);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (71563, 'Shand', 33, 4389);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (97732, 'Aiken', 69, 4163);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (63328, 'Rispoli', 88, 9264);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (57216, 'Mantegna', 41, 5885);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (53358, 'Lloyd', 58, 4232);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (48198, 'Willard', 47, 9119);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (38228, 'Beals', 34, 3373);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (68387, 'Speaks', 28, 9324);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (69683, 'Grant', 64, 8856);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (45343, 'Tinsley', 78, 2883);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (42785, 'Cruz', 45, 2752);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (42438, 'Bell', 27, 9945);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (71432, 'De Almeida', 24, 9579);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (65218, 'Coverdale', 71, 2231);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (56226, 'Pigott-Smi', 82, 5325);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (59499, 'Heslov', 52, 8497);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (56239, 'Stiers', 13, 3416);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (75588, 'Stigers', 18, 3872);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (28641, 'Rickman', 53, 2594);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (39813, 'Cumming', 59, 5789);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (58259, 'Palin', 34, 8798);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (28436, 'Keen', 75, 7848);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (95627, 'Cervine', 67, 5482);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (75475, 'Neill', 89, 6452);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (16451, 'Koyana', 16, 2774);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (21636, 'Rock', 92, 5155);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (69897, 'Weaving', 52, 9217);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (44953, 'Mazar', 71, 1487);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (77552, 'Hedaya', 12, 4967);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (33573, 'Paquin', 44, 1221);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (41433, 'Lauper', 19, 4128);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (84514, 'Harrelson', 87, 8648);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (79315, 'Mellencamp', 26, 4759);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (73576, 'Yorn', 65, 8965);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (61528, 'Bening', 35, 1173);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (34434, 'Rawls', 45, 6917);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (81946, 'Conley', 94, 4317);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (19377, 'Def', 48, 4331);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (24412, 'Pigott-Smi', 27, 8861);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (99419, 'Katt', 38, 5272);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (52248, 'Tempest', 41, 8364);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (28919, 'Imbruglia', 47, 7272);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (35974, 'Cale', 75, 8714);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (81491, 'Fehr', 16, 2283);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (11332, 'Begley', 96, 6178);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (98954, 'Archer', 86, 1696);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (86423, 'Holm', 14, 2292);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (45198, 'Quinn', 17, 8864);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (34271, 'Ermey', 95, 7544);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (54572, 'Lindley', 85, 2619);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (98217, 'Waite', 57, 4628);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (78245, 'Skaggs', 47, 5644);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (23322, 'Giraldo', 28, 9339);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (78176, 'Kilmer', 48, 1275);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (83615, 'Brandt', 62, 7654);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (28726, 'Bello', 22, 9314);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (64718, 'Connelly', 44, 5391);
insert into SHIP (ship_id, ship_name, floors, capacity_of_people)
values (96698, 'Bullock', 28, 3449);
commit;
prompt 299 records loaded
prompt Loading CRUISE...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-03-1993', 'dd-mm-yyyy'), to_date('30-07-2018', 'dd-mm-yyyy'), 597923558, 'Mitra', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-02-1995', 'dd-mm-yyyy'), to_date('13-04-2011', 'dd-mm-yyyy'), 414083432, 'Cox', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-11-1991', 'dd-mm-yyyy'), to_date('12-06-2014', 'dd-mm-yyyy'), 526523473, 'Hedaya', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-06-1991', 'dd-mm-yyyy'), to_date('18-10-2011', 'dd-mm-yyyy'), 274965517, 'Arjona', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-05-1995', 'dd-mm-yyyy'), to_date('20-01-2009', 'dd-mm-yyyy'), 225827904, 'McGriff', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-11-1994', 'dd-mm-yyyy'), to_date('07-09-2014', 'dd-mm-yyyy'), 314776026, 'Orton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-01-1995', 'dd-mm-yyyy'), to_date('07-04-2018', 'dd-mm-yyyy'), 591124347, 'Leachman', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-03-1995', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'), 821800782, 'Pesci', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-08-1996', 'dd-mm-yyyy'), to_date('28-02-2011', 'dd-mm-yyyy'), 757503531, 'Suchet', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-05-1992', 'dd-mm-yyyy'), to_date('12-02-2002', 'dd-mm-yyyy'), 889974577, 'Blackwell', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-10-1994', 'dd-mm-yyyy'), to_date('28-03-2007', 'dd-mm-yyyy'), 431291596, 'Lorenz', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-06-1995', 'dd-mm-yyyy'), to_date('17-05-2008', 'dd-mm-yyyy'), 280724094, 'Goldwyn', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-04-1990', 'dd-mm-yyyy'), to_date('06-01-2015', 'dd-mm-yyyy'), 314255202, 'Creek', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-11-1996', 'dd-mm-yyyy'), to_date('04-01-2003', 'dd-mm-yyyy'), 997667235, 'Gryner', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-10-1990', 'dd-mm-yyyy'), to_date('29-01-2013', 'dd-mm-yyyy'), 774837532, 'Mandrell', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-04-1991', 'dd-mm-yyyy'), to_date('19-02-2014', 'dd-mm-yyyy'), 943732422, 'Waits', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-01-1990', 'dd-mm-yyyy'), to_date('24-03-2004', 'dd-mm-yyyy'), 11670108, 'Swayze', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-02-1992', 'dd-mm-yyyy'), to_date('02-03-2013', 'dd-mm-yyyy'), 156053116, 'Neeson', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-08-1990', 'dd-mm-yyyy'), to_date('01-10-2002', 'dd-mm-yyyy'), 901502963, 'Margolyes', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-10-1992', 'dd-mm-yyyy'), to_date('04-07-2001', 'dd-mm-yyyy'), 530563545, 'Mars', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-01-1990', 'dd-mm-yyyy'), to_date('26-06-2018', 'dd-mm-yyyy'), 538338821, 'Larter', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-09-1995', 'dd-mm-yyyy'), to_date('06-11-2006', 'dd-mm-yyyy'), 183532013, 'Remar', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-03-1991', 'dd-mm-yyyy'), to_date('22-09-2018', 'dd-mm-yyyy'), 205012801, 'Farina', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-03-1991', 'dd-mm-yyyy'), to_date('16-12-2005', 'dd-mm-yyyy'), 127398741, 'Mortensen', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-01-1991', 'dd-mm-yyyy'), to_date('19-07-2008', 'dd-mm-yyyy'), 667785296, 'Hutton', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-04-1991', 'dd-mm-yyyy'), to_date('20-03-2016', 'dd-mm-yyyy'), 575478686, 'Martinez', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-01-1996', 'dd-mm-yyyy'), to_date('12-09-2001', 'dd-mm-yyyy'), 229889669, 'Colman', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-11-1996', 'dd-mm-yyyy'), to_date('10-11-2009', 'dd-mm-yyyy'), 203308616, 'Meyer', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-04-1993', 'dd-mm-yyyy'), to_date('07-08-2011', 'dd-mm-yyyy'), 349508983, 'Moriarty', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-08-1992', 'dd-mm-yyyy'), to_date('27-02-2014', 'dd-mm-yyyy'), 925511370, 'Quinn', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-06-1994', 'dd-mm-yyyy'), to_date('02-08-1999', 'dd-mm-yyyy'), 468620424, 'Freeman', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-06-1992', 'dd-mm-yyyy'), to_date('25-06-2018', 'dd-mm-yyyy'), 133994790, 'Hackman', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-09-1991', 'dd-mm-yyyy'), to_date('18-12-2008', 'dd-mm-yyyy'), 746118735, 'Garr', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-04-1994', 'dd-mm-yyyy'), to_date('27-06-2018', 'dd-mm-yyyy'), 89283941, 'Amos', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-05-1990', 'dd-mm-yyyy'), to_date('20-12-2014', 'dd-mm-yyyy'), 845070799, 'Martin', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-11-1996', 'dd-mm-yyyy'), to_date('20-05-2005', 'dd-mm-yyyy'), 538120496, 'Bancroft', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-01-1994', 'dd-mm-yyyy'), to_date('28-03-2016', 'dd-mm-yyyy'), 99370071, 'Weiss', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-11-1990', 'dd-mm-yyyy'), to_date('07-07-1999', 'dd-mm-yyyy'), 607612973, 'Davis', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-05-1992', 'dd-mm-yyyy'), to_date('19-11-2018', 'dd-mm-yyyy'), 441720001, 'McClinton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-05-1994', 'dd-mm-yyyy'), to_date('05-03-2013', 'dd-mm-yyyy'), 237501730, 'James', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-06-1992', 'dd-mm-yyyy'), to_date('02-10-2009', 'dd-mm-yyyy'), 118028578, 'Wariner', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-10-1994', 'dd-mm-yyyy'), to_date('29-12-2008', 'dd-mm-yyyy'), 416902085, 'Orbit', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-07-1991', 'dd-mm-yyyy'), to_date('25-12-1998', 'dd-mm-yyyy'), 824813081, 'Bailey', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-07-1995', 'dd-mm-yyyy'), to_date('30-08-2013', 'dd-mm-yyyy'), 877449244, 'Burton', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-06-1993', 'dd-mm-yyyy'), to_date('05-06-2019', 'dd-mm-yyyy'), 870860357, 'Rauhofer', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-07-1990', 'dd-mm-yyyy'), to_date('20-06-2002', 'dd-mm-yyyy'), 4900038, 'Crystal', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-04-1990', 'dd-mm-yyyy'), to_date('28-01-1998', 'dd-mm-yyyy'), 748733763, 'Speaks', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-09-1992', 'dd-mm-yyyy'), to_date('07-05-2011', 'dd-mm-yyyy'), 486471884, 'Shorter', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-06-1993', 'dd-mm-yyyy'), to_date('05-01-2014', 'dd-mm-yyyy'), 371504578, 'Roundtree', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-07-1991', 'dd-mm-yyyy'), to_date('07-12-2014', 'dd-mm-yyyy'), 446497565, 'Sharp', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-09-1991', 'dd-mm-yyyy'), to_date('24-01-2011', 'dd-mm-yyyy'), 306761288, 'Lattimore', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-10-1996', 'dd-mm-yyyy'), to_date('25-04-2016', 'dd-mm-yyyy'), 688157470, 'Saucedo', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-03-1992', 'dd-mm-yyyy'), to_date('09-09-2018', 'dd-mm-yyyy'), 481500838, 'Michael', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-10-1994', 'dd-mm-yyyy'), to_date('03-08-2001', 'dd-mm-yyyy'), 528427019, 'Cozier', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-03-1990', 'dd-mm-yyyy'), to_date('09-10-2007', 'dd-mm-yyyy'), 372378685, 'Fierstein', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-08-1990', 'dd-mm-yyyy'), to_date('19-06-1999', 'dd-mm-yyyy'), 753255268, 'Gill', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-01-1990', 'dd-mm-yyyy'), to_date('24-03-2005', 'dd-mm-yyyy'), 562612871, 'Rush', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-02-1996', 'dd-mm-yyyy'), to_date('04-08-2010', 'dd-mm-yyyy'), 30770413, 'Janssen', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-05-1996', 'dd-mm-yyyy'), to_date('30-07-2010', 'dd-mm-yyyy'), 835235562, 'Lynskey', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-12-1991', 'dd-mm-yyyy'), to_date('06-08-2017', 'dd-mm-yyyy'), 475912312, 'Melvin', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-03-1993', 'dd-mm-yyyy'), to_date('15-02-1998', 'dd-mm-yyyy'), 305954001, 'Orlando', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-02-1994', 'dd-mm-yyyy'), to_date('14-07-2009', 'dd-mm-yyyy'), 481904352, 'Cobbs', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-11-1991', 'dd-mm-yyyy'), to_date('24-01-2018', 'dd-mm-yyyy'), 635944129, 'Berkoff', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-11-1991', 'dd-mm-yyyy'), to_date('19-01-2016', 'dd-mm-yyyy'), 497984176, 'Stuermer', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-01-1992', 'dd-mm-yyyy'), to_date('13-12-2018', 'dd-mm-yyyy'), 397357650, 'Strathairn', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-07-1996', 'dd-mm-yyyy'), to_date('22-05-2008', 'dd-mm-yyyy'), 90054387, 'Del Toro', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-02-1990', 'dd-mm-yyyy'), to_date('09-05-2016', 'dd-mm-yyyy'), 134711707, 'Keith', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-04-1995', 'dd-mm-yyyy'), to_date('09-04-2011', 'dd-mm-yyyy'), 799745877, 'Giamatti', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-07-1995', 'dd-mm-yyyy'), to_date('16-07-2019', 'dd-mm-yyyy'), 486511957, 'Cross', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-09-1994', 'dd-mm-yyyy'), to_date('28-04-2005', 'dd-mm-yyyy'), 316882552, 'Glenn', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-11-1990', 'dd-mm-yyyy'), to_date('03-07-2013', 'dd-mm-yyyy'), 969959237, 'Ferry', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-09-1992', 'dd-mm-yyyy'), to_date('29-01-2019', 'dd-mm-yyyy'), 676471563, 'Clark', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-10-1995', 'dd-mm-yyyy'), to_date('23-03-2013', 'dd-mm-yyyy'), 667301284, 'Lizzy', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-11-1990', 'dd-mm-yyyy'), to_date('07-03-2001', 'dd-mm-yyyy'), 754629809, 'Torn', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-03-1991', 'dd-mm-yyyy'), to_date('17-06-2014', 'dd-mm-yyyy'), 848986780, 'Leoni', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-11-1993', 'dd-mm-yyyy'), to_date('12-11-2014', 'dd-mm-yyyy'), 961760477, 'Norton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-04-1994', 'dd-mm-yyyy'), to_date('16-12-2000', 'dd-mm-yyyy'), 193362045, 'Stevenson', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-10-1992', 'dd-mm-yyyy'), to_date('02-05-2004', 'dd-mm-yyyy'), 147793763, 'Weller', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-01-1995', 'dd-mm-yyyy'), to_date('20-05-2019', 'dd-mm-yyyy'), 931120578, 'Lindley', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-01-1994', 'dd-mm-yyyy'), to_date('10-02-2016', 'dd-mm-yyyy'), 576391638, 'Margolyes', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-07-1991', 'dd-mm-yyyy'), to_date('02-11-2008', 'dd-mm-yyyy'), 169611680, 'Tate', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-11-1996', 'dd-mm-yyyy'), to_date('05-12-2003', 'dd-mm-yyyy'), 388220164, 'Cusack', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-09-1993', 'dd-mm-yyyy'), to_date('02-05-2001', 'dd-mm-yyyy'), 758714016, 'Robbins', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-03-1991', 'dd-mm-yyyy'), to_date('27-04-2001', 'dd-mm-yyyy'), 915905149, 'Frakes', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-08-1996', 'dd-mm-yyyy'), to_date('25-12-2016', 'dd-mm-yyyy'), 176190805, 'Bonham', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-03-1994', 'dd-mm-yyyy'), to_date('16-06-1999', 'dd-mm-yyyy'), 319278571, 'Calle', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-11-1993', 'dd-mm-yyyy'), to_date('12-05-2017', 'dd-mm-yyyy'), 355078172, 'Thornton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-05-1991', 'dd-mm-yyyy'), to_date('21-04-2017', 'dd-mm-yyyy'), 952120937, 'Hewitt', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-03-1993', 'dd-mm-yyyy'), to_date('18-10-1999', 'dd-mm-yyyy'), 657977108, 'Hauser', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-08-1992', 'dd-mm-yyyy'), to_date('11-10-1998', 'dd-mm-yyyy'), 400893415, 'Bale', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-07-1995', 'dd-mm-yyyy'), to_date('14-12-2012', 'dd-mm-yyyy'), 240808149, 'Klugh', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-05-1995', 'dd-mm-yyyy'), to_date('11-11-2012', 'dd-mm-yyyy'), 463953027, 'Secada', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-09-1995', 'dd-mm-yyyy'), to_date('09-08-2011', 'dd-mm-yyyy'), 382958192, 'Lorenz', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-05-1992', 'dd-mm-yyyy'), to_date('12-06-2006', 'dd-mm-yyyy'), 995058672, 'Holiday', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-02-1996', 'dd-mm-yyyy'), to_date('04-11-2001', 'dd-mm-yyyy'), 773691053, 'Evanswood', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-06-1994', 'dd-mm-yyyy'), to_date('21-10-2014', 'dd-mm-yyyy'), 642212865, 'Krabbe', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-05-1991', 'dd-mm-yyyy'), to_date('02-09-2009', 'dd-mm-yyyy'), 756593179, 'Rosas', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-09-1991', 'dd-mm-yyyy'), to_date('15-06-2002', 'dd-mm-yyyy'), 705097806, 'Belles', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-11-1993', 'dd-mm-yyyy'), to_date('26-03-2005', 'dd-mm-yyyy'), 884981398, 'Carradine', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-05-1996', 'dd-mm-yyyy'), to_date('21-05-2008', 'dd-mm-yyyy'), 51570638, 'Tate', 34, 1234);
commit;
prompt 100 records committed...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-12-1993', 'dd-mm-yyyy'), to_date('02-08-2008', 'dd-mm-yyyy'), 664216208, 'Foster', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-10-1994', 'dd-mm-yyyy'), to_date('01-05-1999', 'dd-mm-yyyy'), 190800490, 'Kelly', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-08-1996', 'dd-mm-yyyy'), to_date('06-05-2014', 'dd-mm-yyyy'), 690930233, 'Fender', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-10-1990', 'dd-mm-yyyy'), to_date('03-02-2006', 'dd-mm-yyyy'), 582196352, 'Navarro', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-05-1990', 'dd-mm-yyyy'), to_date('05-01-2016', 'dd-mm-yyyy'), 366816754, 'Damon', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-06-1993', 'dd-mm-yyyy'), to_date('15-08-2001', 'dd-mm-yyyy'), 910949451, 'DeVita', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-02-1994', 'dd-mm-yyyy'), to_date('21-05-1998', 'dd-mm-yyyy'), 471654440, 'Koteas', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-03-1993', 'dd-mm-yyyy'), to_date('25-10-2018', 'dd-mm-yyyy'), 718238210, 'Carrere', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-04-1991', 'dd-mm-yyyy'), to_date('03-11-2013', 'dd-mm-yyyy'), 246235966, 'Underwood', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-09-1993', 'dd-mm-yyyy'), to_date('03-10-1999', 'dd-mm-yyyy'), 343794019, 'Landau', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-07-1992', 'dd-mm-yyyy'), to_date('13-11-2001', 'dd-mm-yyyy'), 603651477, 'Grier', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-10-1993', 'dd-mm-yyyy'), to_date('19-05-2017', 'dd-mm-yyyy'), 147213892, 'Frost', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-08-1996', 'dd-mm-yyyy'), to_date('10-09-2006', 'dd-mm-yyyy'), 44530609, 'Fraser', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-02-1995', 'dd-mm-yyyy'), to_date('05-04-1998', 'dd-mm-yyyy'), 232672691, 'Hunter', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-01-1991', 'dd-mm-yyyy'), to_date('22-04-2001', 'dd-mm-yyyy'), 408995240, 'Oates', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-01-1992', 'dd-mm-yyyy'), to_date('27-06-2016', 'dd-mm-yyyy'), 213902884, 'LaPaglia', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-05-1994', 'dd-mm-yyyy'), to_date('20-10-2005', 'dd-mm-yyyy'), 804745150, 'Gracie', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-03-1993', 'dd-mm-yyyy'), to_date('18-05-2012', 'dd-mm-yyyy'), 628660232, 'Stigers', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-08-1992', 'dd-mm-yyyy'), to_date('16-04-2005', 'dd-mm-yyyy'), 114131502, 'Schock', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-12-1991', 'dd-mm-yyyy'), to_date('24-12-2016', 'dd-mm-yyyy'), 754086552, 'Clayton', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-01-1993', 'dd-mm-yyyy'), to_date('17-04-2014', 'dd-mm-yyyy'), 126663246, 'DeVito', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-02-1991', 'dd-mm-yyyy'), to_date('18-01-2011', 'dd-mm-yyyy'), 645411417, 'Union', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-03-1992', 'dd-mm-yyyy'), to_date('09-12-2001', 'dd-mm-yyyy'), 504536217, 'Coyote', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-08-1991', 'dd-mm-yyyy'), to_date('14-07-2004', 'dd-mm-yyyy'), 436396087, 'Turturro', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-06-1990', 'dd-mm-yyyy'), to_date('18-10-2013', 'dd-mm-yyyy'), 515068305, 'Conlee', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-02-1993', 'dd-mm-yyyy'), to_date('30-03-2004', 'dd-mm-yyyy'), 961026831, 'Patton', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-07-1991', 'dd-mm-yyyy'), to_date('19-09-2017', 'dd-mm-yyyy'), 257168195, 'Thomson', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-12-1996', 'dd-mm-yyyy'), to_date('05-09-2004', 'dd-mm-yyyy'), 806472016, 'Lemmon', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-07-1996', 'dd-mm-yyyy'), to_date('26-06-2018', 'dd-mm-yyyy'), 242929890, 'Phillippe', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-02-1992', 'dd-mm-yyyy'), to_date('23-09-2010', 'dd-mm-yyyy'), 293057051, 'Albright', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-12-1991', 'dd-mm-yyyy'), to_date('27-08-2001', 'dd-mm-yyyy'), 420950568, 'Bright', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-03-1995', 'dd-mm-yyyy'), to_date('29-03-2018', 'dd-mm-yyyy'), 294838094, 'Sherman', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-01-1992', 'dd-mm-yyyy'), to_date('06-06-1998', 'dd-mm-yyyy'), 331235411, 'MacDowell', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-07-1995', 'dd-mm-yyyy'), to_date('20-02-2016', 'dd-mm-yyyy'), 869637925, 'Franks', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-09-1992', 'dd-mm-yyyy'), to_date('19-11-2018', 'dd-mm-yyyy'), 401083769, 'Tolkan', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-02-1993', 'dd-mm-yyyy'), to_date('09-02-2013', 'dd-mm-yyyy'), 225195580, 'Balin', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-01-1991', 'dd-mm-yyyy'), to_date('23-05-2002', 'dd-mm-yyyy'), 720399128, 'Branagh', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-04-1996', 'dd-mm-yyyy'), to_date('26-06-2009', 'dd-mm-yyyy'), 530561539, 'Logue', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-10-1994', 'dd-mm-yyyy'), to_date('17-08-2005', 'dd-mm-yyyy'), 622225298, 'Twilley', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-08-1995', 'dd-mm-yyyy'), to_date('06-06-2016', 'dd-mm-yyyy'), 329334674, 'Renfro', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-11-1996', 'dd-mm-yyyy'), to_date('10-12-2017', 'dd-mm-yyyy'), 831422434, 'Gano', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-12-1995', 'dd-mm-yyyy'), to_date('28-12-2009', 'dd-mm-yyyy'), 767565505, 'Woodward', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-10-1996', 'dd-mm-yyyy'), to_date('02-07-2009', 'dd-mm-yyyy'), 622421837, 'Coolidge', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-02-1992', 'dd-mm-yyyy'), to_date('18-02-1999', 'dd-mm-yyyy'), 807599512, 'Dunst', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-01-1992', 'dd-mm-yyyy'), to_date('23-12-2008', 'dd-mm-yyyy'), 496661535, 'Kristoffer', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-06-1994', 'dd-mm-yyyy'), to_date('01-05-2018', 'dd-mm-yyyy'), 978444996, 'Klein', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-04-1996', 'dd-mm-yyyy'), to_date('19-03-2013', 'dd-mm-yyyy'), 448538705, 'Shannon', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-01-1995', 'dd-mm-yyyy'), to_date('05-11-2014', 'dd-mm-yyyy'), 337828259, 'Snow', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-11-1996', 'dd-mm-yyyy'), to_date('11-08-1998', 'dd-mm-yyyy'), 77205685, 'Byrd', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-03-1996', 'dd-mm-yyyy'), to_date('26-03-2002', 'dd-mm-yyyy'), 800308215, 'Gaines', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-10-1996', 'dd-mm-yyyy'), to_date('26-08-2001', 'dd-mm-yyyy'), 597911672, 'Crow', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-07-1996', 'dd-mm-yyyy'), to_date('16-03-1999', 'dd-mm-yyyy'), 239289558, 'Candy', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-03-1993', 'dd-mm-yyyy'), to_date('01-06-1999', 'dd-mm-yyyy'), 768011395, 'Rollins', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-04-1990', 'dd-mm-yyyy'), to_date('16-06-2004', 'dd-mm-yyyy'), 666500810, 'Leto', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-07-1992', 'dd-mm-yyyy'), to_date('26-04-2008', 'dd-mm-yyyy'), 625948083, 'Moraz', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-07-1996', 'dd-mm-yyyy'), to_date('05-07-1999', 'dd-mm-yyyy'), 966283991, 'Kinney', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-09-1994', 'dd-mm-yyyy'), to_date('02-02-2011', 'dd-mm-yyyy'), 725534894, 'Flatts', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-02-1996', 'dd-mm-yyyy'), to_date('03-03-1999', 'dd-mm-yyyy'), 754218501, 'Uggams', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-01-1994', 'dd-mm-yyyy'), to_date('28-02-2009', 'dd-mm-yyyy'), 177526932, 'Neeson', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-01-1992', 'dd-mm-yyyy'), to_date('06-10-1998', 'dd-mm-yyyy'), 851102844, 'MacDonald', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-03-1996', 'dd-mm-yyyy'), to_date('14-06-2019', 'dd-mm-yyyy'), 103603926, 'Newman', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-09-1991', 'dd-mm-yyyy'), to_date('21-08-2002', 'dd-mm-yyyy'), 405580581, 'Makeba', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-03-1996', 'dd-mm-yyyy'), to_date('11-10-2015', 'dd-mm-yyyy'), 198272426, 'Stiller', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-09-1995', 'dd-mm-yyyy'), to_date('07-02-2016', 'dd-mm-yyyy'), 702050874, 'Rollins', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-10-1991', 'dd-mm-yyyy'), to_date('28-10-2018', 'dd-mm-yyyy'), 67953844, 'Conroy', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-12-1991', 'dd-mm-yyyy'), to_date('16-05-1998', 'dd-mm-yyyy'), 100840975, 'Torino', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-11-1993', 'dd-mm-yyyy'), to_date('20-12-2015', 'dd-mm-yyyy'), 819335956, 'Hyde', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-06-1994', 'dd-mm-yyyy'), to_date('04-08-1999', 'dd-mm-yyyy'), 481804519, 'Allison', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-02-1992', 'dd-mm-yyyy'), to_date('21-10-2013', 'dd-mm-yyyy'), 144142602, 'Platt', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-06-1995', 'dd-mm-yyyy'), to_date('31-07-2006', 'dd-mm-yyyy'), 450403139, 'Gayle', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-09-1996', 'dd-mm-yyyy'), to_date('21-09-2003', 'dd-mm-yyyy'), 118486167, 'Ticotin', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-06-1993', 'dd-mm-yyyy'), to_date('11-05-2017', 'dd-mm-yyyy'), 993180444, 'Crouch', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-07-1990', 'dd-mm-yyyy'), to_date('24-05-2000', 'dd-mm-yyyy'), 917232612, 'Vanian', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-07-1996', 'dd-mm-yyyy'), to_date('14-01-2012', 'dd-mm-yyyy'), 112472138, 'Lerner', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-04-1993', 'dd-mm-yyyy'), to_date('02-07-2010', 'dd-mm-yyyy'), 603782080, 'Skaggs', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-11-1992', 'dd-mm-yyyy'), to_date('12-03-1999', 'dd-mm-yyyy'), 964248287, 'Brothers', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-09-1991', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'), 277301277, 'Lindo', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-02-1993', 'dd-mm-yyyy'), to_date('24-04-2014', 'dd-mm-yyyy'), 165205343, 'Wells', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-08-1990', 'dd-mm-yyyy'), to_date('20-12-2005', 'dd-mm-yyyy'), 721550027, 'Tippe', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-08-1994', 'dd-mm-yyyy'), to_date('30-05-2018', 'dd-mm-yyyy'), 99355808, 'Bruce', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-06-1996', 'dd-mm-yyyy'), to_date('27-11-2005', 'dd-mm-yyyy'), 393273984, 'Reynolds', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-09-1995', 'dd-mm-yyyy'), to_date('16-05-2002', 'dd-mm-yyyy'), 440233275, 'Mitchell', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-04-1990', 'dd-mm-yyyy'), to_date('19-01-1998', 'dd-mm-yyyy'), 737687427, 'Langella', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-03-1990', 'dd-mm-yyyy'), to_date('07-03-2014', 'dd-mm-yyyy'), 890947833, 'Blige', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-06-1992', 'dd-mm-yyyy'), to_date('10-05-1999', 'dd-mm-yyyy'), 515563176, 'Parsons', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-08-1990', 'dd-mm-yyyy'), to_date('24-07-2007', 'dd-mm-yyyy'), 105348336, 'Kirshner', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-06-1990', 'dd-mm-yyyy'), to_date('21-05-2002', 'dd-mm-yyyy'), 726975086, 'Wood', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-10-1992', 'dd-mm-yyyy'), to_date('06-03-2010', 'dd-mm-yyyy'), 866527231, 'Favreau', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-06-1992', 'dd-mm-yyyy'), to_date('12-05-2015', 'dd-mm-yyyy'), 378016049, 'Tillis', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-10-1995', 'dd-mm-yyyy'), to_date('16-12-2014', 'dd-mm-yyyy'), 553042592, 'Frampton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-06-1993', 'dd-mm-yyyy'), to_date('24-02-2013', 'dd-mm-yyyy'), 912290435, 'LaBelle', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-09-1994', 'dd-mm-yyyy'), to_date('20-08-2015', 'dd-mm-yyyy'), 994488474, 'Hudson', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-07-1994', 'dd-mm-yyyy'), to_date('22-02-2014', 'dd-mm-yyyy'), 517394992, 'Starr', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-12-1992', 'dd-mm-yyyy'), to_date('10-02-2019', 'dd-mm-yyyy'), 677148289, 'Hyde', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-02-1992', 'dd-mm-yyyy'), to_date('07-04-2019', 'dd-mm-yyyy'), 598813222, 'DeLuise', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-10-1996', 'dd-mm-yyyy'), to_date('30-09-2004', 'dd-mm-yyyy'), 293929936, 'McFadden', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-10-1996', 'dd-mm-yyyy'), to_date('10-01-2017', 'dd-mm-yyyy'), 976957678, 'Raye', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-10-1994', 'dd-mm-yyyy'), to_date('20-02-2004', 'dd-mm-yyyy'), 418439400, 'Lapointe', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-07-1995', 'dd-mm-yyyy'), to_date('15-12-1999', 'dd-mm-yyyy'), 493305757, 'Hopper', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-01-1991', 'dd-mm-yyyy'), to_date('27-06-2018', 'dd-mm-yyyy'), 99593832, 'Jenkins', 34, 1234);
commit;
prompt 200 records committed...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-08-1996', 'dd-mm-yyyy'), to_date('12-03-2009', 'dd-mm-yyyy'), 154070243, 'Tambor', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-09-1995', 'dd-mm-yyyy'), to_date('15-03-2002', 'dd-mm-yyyy'), 739996613, 'Imperioli', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-03-1991', 'dd-mm-yyyy'), to_date('15-09-2009', 'dd-mm-yyyy'), 887221190, 'Ricci', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-08-1994', 'dd-mm-yyyy'), to_date('30-09-2014', 'dd-mm-yyyy'), 159950938, 'Hector', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-09-1995', 'dd-mm-yyyy'), to_date('30-10-2019', 'dd-mm-yyyy'), 836388793, 'Sharp', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-06-1994', 'dd-mm-yyyy'), to_date('20-05-2010', 'dd-mm-yyyy'), 681108526, 'Hawthorne', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-12-1996', 'dd-mm-yyyy'), to_date('05-08-2000', 'dd-mm-yyyy'), 641298653, 'Jay', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-08-1994', 'dd-mm-yyyy'), to_date('23-11-2016', 'dd-mm-yyyy'), 532100879, 'Sanders', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-05-1990', 'dd-mm-yyyy'), to_date('19-08-2005', 'dd-mm-yyyy'), 384410785, 'Sarsgaard', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-01-1991', 'dd-mm-yyyy'), to_date('20-11-2007', 'dd-mm-yyyy'), 845905440, 'Purefoy', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-01-1992', 'dd-mm-yyyy'), to_date('25-12-2019', 'dd-mm-yyyy'), 555978174, 'Sandoval', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-11-1993', 'dd-mm-yyyy'), to_date('14-09-2010', 'dd-mm-yyyy'), 791237116, 'Duke', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-03-1994', 'dd-mm-yyyy'), to_date('15-09-1999', 'dd-mm-yyyy'), 260339124, 'Vince', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-09-1992', 'dd-mm-yyyy'), to_date('01-09-2007', 'dd-mm-yyyy'), 375415777, 'Carradine', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-02-1994', 'dd-mm-yyyy'), to_date('01-08-2013', 'dd-mm-yyyy'), 90850407, 'Hall', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-07-1994', 'dd-mm-yyyy'), to_date('14-08-2007', 'dd-mm-yyyy'), 163970877, 'Baldwin', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-01-1991', 'dd-mm-yyyy'), to_date('21-10-2019', 'dd-mm-yyyy'), 819996532, 'Tippe', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-03-1994', 'dd-mm-yyyy'), to_date('28-05-2010', 'dd-mm-yyyy'), 836129732, 'Quaid', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-07-1995', 'dd-mm-yyyy'), to_date('03-12-2003', 'dd-mm-yyyy'), 550689995, 'Rains', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-07-1992', 'dd-mm-yyyy'), to_date('11-06-2010', 'dd-mm-yyyy'), 164803732, 'Horizon', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-04-1990', 'dd-mm-yyyy'), to_date('28-12-1999', 'dd-mm-yyyy'), 430309048, 'Conway', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-07-1995', 'dd-mm-yyyy'), to_date('08-11-2014', 'dd-mm-yyyy'), 100140931, 'Franks', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-04-1995', 'dd-mm-yyyy'), to_date('27-02-2006', 'dd-mm-yyyy'), 216906856, 'Perlman', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-12-1993', 'dd-mm-yyyy'), to_date('19-05-2013', 'dd-mm-yyyy'), 582413374, 'Diaz', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-09-1990', 'dd-mm-yyyy'), to_date('19-08-2009', 'dd-mm-yyyy'), 285723563, 'Speaks', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-09-1991', 'dd-mm-yyyy'), to_date('06-12-2002', 'dd-mm-yyyy'), 89264706, 'Rodriguez', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-11-1993', 'dd-mm-yyyy'), to_date('31-07-2011', 'dd-mm-yyyy'), 405535087, 'Finney', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-01-1994', 'dd-mm-yyyy'), to_date('09-05-2005', 'dd-mm-yyyy'), 745820589, 'McDiarmid', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-04-1991', 'dd-mm-yyyy'), to_date('19-08-1998', 'dd-mm-yyyy'), 174053609, 'Shelton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-10-1990', 'dd-mm-yyyy'), to_date('11-07-2001', 'dd-mm-yyyy'), 477609376, 'Bloch', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-12-1992', 'dd-mm-yyyy'), to_date('10-02-2017', 'dd-mm-yyyy'), 361884852, 'Paige', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-06-1992', 'dd-mm-yyyy'), to_date('27-09-2001', 'dd-mm-yyyy'), 480140276, 'Chinlund', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-07-1993', 'dd-mm-yyyy'), to_date('04-07-2012', 'dd-mm-yyyy'), 998336937, 'Levine', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-03-1992', 'dd-mm-yyyy'), to_date('15-11-2002', 'dd-mm-yyyy'), 446727590, 'Moorer', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-08-1990', 'dd-mm-yyyy'), to_date('30-08-2011', 'dd-mm-yyyy'), 601932004, 'Evett', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-08-1995', 'dd-mm-yyyy'), to_date('01-08-2011', 'dd-mm-yyyy'), 314451698, 'Epps', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-01-1994', 'dd-mm-yyyy'), to_date('19-05-2002', 'dd-mm-yyyy'), 174400457, 'Gleeson', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-09-1990', 'dd-mm-yyyy'), to_date('06-01-1998', 'dd-mm-yyyy'), 470100127, 'Taylor', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-12-1992', 'dd-mm-yyyy'), to_date('06-08-2014', 'dd-mm-yyyy'), 61129328, 'Eckhart', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-11-1992', 'dd-mm-yyyy'), to_date('15-12-1998', 'dd-mm-yyyy'), 239209833, 'Geldof', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-07-1993', 'dd-mm-yyyy'), to_date('11-10-2008', 'dd-mm-yyyy'), 350709571, 'Polito', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-06-1994', 'dd-mm-yyyy'), to_date('08-12-2000', 'dd-mm-yyyy'), 895404257, 'MacNeil', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-12-1995', 'dd-mm-yyyy'), to_date('30-10-2018', 'dd-mm-yyyy'), 784966094, 'Bale', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-09-1993', 'dd-mm-yyyy'), to_date('30-03-2009', 'dd-mm-yyyy'), 370483691, 'Barnett', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-06-1990', 'dd-mm-yyyy'), to_date('11-03-2012', 'dd-mm-yyyy'), 665217368, 'Pony', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-08-1991', 'dd-mm-yyyy'), to_date('13-04-2010', 'dd-mm-yyyy'), 483426559, 'Cantrell', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-11-1993', 'dd-mm-yyyy'), to_date('13-05-2013', 'dd-mm-yyyy'), 269385215, 'Mellencamp', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-04-1994', 'dd-mm-yyyy'), to_date('21-04-2002', 'dd-mm-yyyy'), 387049449, 'Borgnine', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-12-1990', 'dd-mm-yyyy'), to_date('24-07-2008', 'dd-mm-yyyy'), 211900140, 'O''Hara', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-01-1991', 'dd-mm-yyyy'), to_date('07-12-2010', 'dd-mm-yyyy'), 486601604, 'Affleck', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-01-1995', 'dd-mm-yyyy'), to_date('25-09-2012', 'dd-mm-yyyy'), 238816946, 'Pony', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-05-1990', 'dd-mm-yyyy'), to_date('24-06-2011', 'dd-mm-yyyy'), 247367078, 'Wiedlin', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-11-1991', 'dd-mm-yyyy'), to_date('29-08-2003', 'dd-mm-yyyy'), 531578593, 'Furay', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-12-1996', 'dd-mm-yyyy'), to_date('28-06-2015', 'dd-mm-yyyy'), 590737302, 'Reeves', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-05-1996', 'dd-mm-yyyy'), to_date('27-04-2005', 'dd-mm-yyyy'), 742914442, 'Schock', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-04-1994', 'dd-mm-yyyy'), to_date('08-07-2012', 'dd-mm-yyyy'), 835431220, 'Finn', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-03-1992', 'dd-mm-yyyy'), to_date('27-04-2014', 'dd-mm-yyyy'), 14325715, 'Blair', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-07-1994', 'dd-mm-yyyy'), to_date('06-08-2013', 'dd-mm-yyyy'), 915194172, 'Phillippe', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-11-1992', 'dd-mm-yyyy'), to_date('05-07-2018', 'dd-mm-yyyy'), 4110710, 'Rhys-Davie', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-11-1992', 'dd-mm-yyyy'), to_date('03-05-2008', 'dd-mm-yyyy'), 927594342, 'Donovan', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-08-1990', 'dd-mm-yyyy'), to_date('29-07-2010', 'dd-mm-yyyy'), 961037358, 'Rudd', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-08-1995', 'dd-mm-yyyy'), to_date('04-03-2005', 'dd-mm-yyyy'), 725794180, 'Union', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-11-1994', 'dd-mm-yyyy'), to_date('14-10-2014', 'dd-mm-yyyy'), 961653678, 'Johnson', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-09-1992', 'dd-mm-yyyy'), to_date('07-09-1999', 'dd-mm-yyyy'), 635453967, 'Hopkins', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-10-1990', 'dd-mm-yyyy'), to_date('23-08-2018', 'dd-mm-yyyy'), 273161657, 'Mahoney', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-08-1996', 'dd-mm-yyyy'), to_date('26-06-2007', 'dd-mm-yyyy'), 98995744, 'Isaacs', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-11-1996', 'dd-mm-yyyy'), to_date('21-08-2014', 'dd-mm-yyyy'), 562280358, 'Cox', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-07-1993', 'dd-mm-yyyy'), to_date('24-08-2017', 'dd-mm-yyyy'), 967558952, 'Worrell', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-08-1992', 'dd-mm-yyyy'), to_date('22-10-2010', 'dd-mm-yyyy'), 109643994, 'Dunn', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-07-1990', 'dd-mm-yyyy'), to_date('12-02-2014', 'dd-mm-yyyy'), 208677216, 'Santana', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-04-1995', 'dd-mm-yyyy'), to_date('20-05-2006', 'dd-mm-yyyy'), 312866394, 'Spall', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-02-1992', 'dd-mm-yyyy'), to_date('02-02-1998', 'dd-mm-yyyy'), 596550973, 'Connick', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-09-1991', 'dd-mm-yyyy'), to_date('25-02-2000', 'dd-mm-yyyy'), 699360697, 'Tobolowsky', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-10-1995', 'dd-mm-yyyy'), to_date('29-10-2015', 'dd-mm-yyyy'), 34206146, 'Unger', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-03-1993', 'dd-mm-yyyy'), to_date('03-11-2016', 'dd-mm-yyyy'), 598390151, 'Wakeling', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-03-1991', 'dd-mm-yyyy'), to_date('22-11-2003', 'dd-mm-yyyy'), 355478511, 'Arjona', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-08-1992', 'dd-mm-yyyy'), to_date('08-03-2010', 'dd-mm-yyyy'), 163281967, 'Roth', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-12-1991', 'dd-mm-yyyy'), to_date('26-03-2017', 'dd-mm-yyyy'), 56613723, 'Franklin', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-02-1991', 'dd-mm-yyyy'), to_date('25-11-2012', 'dd-mm-yyyy'), 215548942, 'Hatchet', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-01-1991', 'dd-mm-yyyy'), to_date('16-02-2003', 'dd-mm-yyyy'), 228617286, 'Jane', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-10-1994', 'dd-mm-yyyy'), to_date('04-05-2007', 'dd-mm-yyyy'), 451283748, 'Irving', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-06-1991', 'dd-mm-yyyy'), to_date('05-06-2005', 'dd-mm-yyyy'), 655894028, 'MacIsaac', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-06-1992', 'dd-mm-yyyy'), to_date('12-12-2007', 'dd-mm-yyyy'), 257284465, 'Collins', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-07-1991', 'dd-mm-yyyy'), to_date('30-01-2017', 'dd-mm-yyyy'), 11987122, 'Phifer', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-10-1992', 'dd-mm-yyyy'), to_date('06-05-2016', 'dd-mm-yyyy'), 60605901, 'Lewin', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-01-1990', 'dd-mm-yyyy'), to_date('05-06-2002', 'dd-mm-yyyy'), 87387476, 'Bates', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-04-1995', 'dd-mm-yyyy'), to_date('05-03-1999', 'dd-mm-yyyy'), 281491188, 'Sarandon', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-10-1991', 'dd-mm-yyyy'), to_date('26-02-2000', 'dd-mm-yyyy'), 270995477, 'Badalucco', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-04-1991', 'dd-mm-yyyy'), to_date('21-06-2000', 'dd-mm-yyyy'), 598743992, 'Field', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-10-1990', 'dd-mm-yyyy'), to_date('08-07-2003', 'dd-mm-yyyy'), 7525975, 'Diffie', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-09-1991', 'dd-mm-yyyy'), to_date('08-10-1999', 'dd-mm-yyyy'), 595894999, 'Lynn', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-05-1993', 'dd-mm-yyyy'), to_date('20-08-2001', 'dd-mm-yyyy'), 641286633, 'Reed', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-03-1992', 'dd-mm-yyyy'), to_date('23-08-2012', 'dd-mm-yyyy'), 462354254, 'Chinlund', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-02-1990', 'dd-mm-yyyy'), to_date('22-06-1999', 'dd-mm-yyyy'), 455644155, 'Winger', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-03-1995', 'dd-mm-yyyy'), to_date('16-12-2011', 'dd-mm-yyyy'), 632273290, 'Lindley', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-06-1993', 'dd-mm-yyyy'), to_date('13-05-2015', 'dd-mm-yyyy'), 260480353, 'Lemmon', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-02-1996', 'dd-mm-yyyy'), to_date('13-06-2001', 'dd-mm-yyyy'), 847307226, 'Ribisi', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-09-1995', 'dd-mm-yyyy'), to_date('21-08-2016', 'dd-mm-yyyy'), 730161038, 'Dutton', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-05-1992', 'dd-mm-yyyy'), to_date('19-12-2006', 'dd-mm-yyyy'), 65449535, 'McCain', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-03-1996', 'dd-mm-yyyy'), to_date('31-03-2001', 'dd-mm-yyyy'), 344697720, 'Bachman', 35, 1234);
commit;
prompt 300 records committed...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-11-1990', 'dd-mm-yyyy'), to_date('01-01-1998', 'dd-mm-yyyy'), 699482965, 'Chao', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-04-1992', 'dd-mm-yyyy'), to_date('25-11-1998', 'dd-mm-yyyy'), 776604640, 'Gellar', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-09-1991', 'dd-mm-yyyy'), to_date('20-10-1999', 'dd-mm-yyyy'), 622873042, 'Wong', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-09-1992', 'dd-mm-yyyy'), to_date('01-09-2012', 'dd-mm-yyyy'), 21289015, 'Allison', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-07-1995', 'dd-mm-yyyy'), to_date('10-09-2001', 'dd-mm-yyyy'), 296090628, 'Lynne', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-10-1995', 'dd-mm-yyyy'), to_date('10-07-2015', 'dd-mm-yyyy'), 270232942, 'Arjona', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-03-1990', 'dd-mm-yyyy'), to_date('12-12-1998', 'dd-mm-yyyy'), 903455968, 'Wariner', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-12-1993', 'dd-mm-yyyy'), to_date('07-10-2011', 'dd-mm-yyyy'), 671297008, 'Hidalgo', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-11-1993', 'dd-mm-yyyy'), to_date('19-10-2004', 'dd-mm-yyyy'), 499174068, 'Bentley', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-10-1991', 'dd-mm-yyyy'), to_date('11-11-2002', 'dd-mm-yyyy'), 956467625, 'Hewett', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-08-1995', 'dd-mm-yyyy'), to_date('02-12-2006', 'dd-mm-yyyy'), 773044340, 'Vannelli', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-02-1991', 'dd-mm-yyyy'), to_date('30-07-2010', 'dd-mm-yyyy'), 573134054, 'Barrymore', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-04-1993', 'dd-mm-yyyy'), to_date('01-01-2002', 'dd-mm-yyyy'), 976088742, 'Cheadle', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-04-1990', 'dd-mm-yyyy'), to_date('16-12-2007', 'dd-mm-yyyy'), 308312878, 'Statham', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-03-1993', 'dd-mm-yyyy'), to_date('17-09-2005', 'dd-mm-yyyy'), 335637801, 'Russo', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-12-1995', 'dd-mm-yyyy'), to_date('27-01-2010', 'dd-mm-yyyy'), 534309970, 'Law', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-02-1994', 'dd-mm-yyyy'), to_date('25-09-2006', 'dd-mm-yyyy'), 229075789, 'Tennison', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-05-1993', 'dd-mm-yyyy'), to_date('01-01-2010', 'dd-mm-yyyy'), 422690148, 'Garber', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-04-1990', 'dd-mm-yyyy'), to_date('30-01-2015', 'dd-mm-yyyy'), 714464309, 'Pony', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-05-1995', 'dd-mm-yyyy'), to_date('21-01-2001', 'dd-mm-yyyy'), 733990412, 'Gambon', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-05-1993', 'dd-mm-yyyy'), to_date('11-06-2008', 'dd-mm-yyyy'), 347330014, 'Cassel', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-11-1994', 'dd-mm-yyyy'), to_date('02-09-2001', 'dd-mm-yyyy'), 961736568, 'Vassar', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-08-1990', 'dd-mm-yyyy'), to_date('03-10-2003', 'dd-mm-yyyy'), 968816859, 'Allen', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-07-1992', 'dd-mm-yyyy'), to_date('12-12-2004', 'dd-mm-yyyy'), 348538100, 'Mahoney', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-03-1990', 'dd-mm-yyyy'), to_date('17-09-2002', 'dd-mm-yyyy'), 315406042, 'Griffin', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-10-1990', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 191766005, 'Van Der Be', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-02-1991', 'dd-mm-yyyy'), to_date('21-06-2005', 'dd-mm-yyyy'), 924995405, 'Napolitano', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-02-1990', 'dd-mm-yyyy'), to_date('04-06-2000', 'dd-mm-yyyy'), 388284795, 'Margulies', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-02-1990', 'dd-mm-yyyy'), to_date('26-03-2006', 'dd-mm-yyyy'), 62363585, 'Kadison', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-10-1993', 'dd-mm-yyyy'), to_date('13-03-2011', 'dd-mm-yyyy'), 394500626, 'Visnjic', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-10-1991', 'dd-mm-yyyy'), to_date('04-12-1999', 'dd-mm-yyyy'), 692126986, 'Monk', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-08-1990', 'dd-mm-yyyy'), to_date('17-12-1999', 'dd-mm-yyyy'), 232013152, 'Cube', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-07-1990', 'dd-mm-yyyy'), to_date('16-09-2012', 'dd-mm-yyyy'), 684570259, 'DeLuise', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-06-1995', 'dd-mm-yyyy'), to_date('27-02-2008', 'dd-mm-yyyy'), 525413603, 'Lennox', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-07-1993', 'dd-mm-yyyy'), to_date('26-07-1998', 'dd-mm-yyyy'), 623850304, 'Devine', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-02-1994', 'dd-mm-yyyy'), to_date('18-03-2012', 'dd-mm-yyyy'), 750436212, 'Ermey', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-01-1993', 'dd-mm-yyyy'), to_date('02-08-1999', 'dd-mm-yyyy'), 867376652, 'Rock', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-10-1995', 'dd-mm-yyyy'), to_date('04-10-1998', 'dd-mm-yyyy'), 179509199, 'Young', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-02-1995', 'dd-mm-yyyy'), to_date('18-04-2005', 'dd-mm-yyyy'), 181825712, 'Atkinson', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-12-1992', 'dd-mm-yyyy'), to_date('26-04-2000', 'dd-mm-yyyy'), 748207789, 'Fraser', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-05-1996', 'dd-mm-yyyy'), to_date('30-08-2007', 'dd-mm-yyyy'), 83167687, 'Mohr', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-05-1994', 'dd-mm-yyyy'), to_date('31-10-2018', 'dd-mm-yyyy'), 758622329, 'Pesci', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-03-1991', 'dd-mm-yyyy'), to_date('05-01-2006', 'dd-mm-yyyy'), 332737399, 'Moffat', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-10-1990', 'dd-mm-yyyy'), to_date('14-01-2012', 'dd-mm-yyyy'), 315060494, 'Newton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-11-1995', 'dd-mm-yyyy'), to_date('11-08-2007', 'dd-mm-yyyy'), 182958077, 'Rankin', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-08-1992', 'dd-mm-yyyy'), to_date('17-02-2013', 'dd-mm-yyyy'), 337765271, 'Holiday', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-12-1991', 'dd-mm-yyyy'), to_date('21-01-2009', 'dd-mm-yyyy'), 192201714, 'Gordon', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-07-1991', 'dd-mm-yyyy'), to_date('10-10-2019', 'dd-mm-yyyy'), 243606720, 'Saxon', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-04-1991', 'dd-mm-yyyy'), to_date('28-04-2015', 'dd-mm-yyyy'), 329255951, 'Fox', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-01-1993', 'dd-mm-yyyy'), to_date('06-10-2019', 'dd-mm-yyyy'), 616434163, 'Curtis-Hal', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-08-1993', 'dd-mm-yyyy'), to_date('05-07-2004', 'dd-mm-yyyy'), 324117289, 'Reno', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-06-1991', 'dd-mm-yyyy'), to_date('29-06-1998', 'dd-mm-yyyy'), 614910250, 'Douglas', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-03-1994', 'dd-mm-yyyy'), to_date('06-03-2016', 'dd-mm-yyyy'), 559397131, 'Goodall', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-12-1994', 'dd-mm-yyyy'), to_date('18-07-1998', 'dd-mm-yyyy'), 506332835, 'Lynch', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-10-1991', 'dd-mm-yyyy'), to_date('19-05-2018', 'dd-mm-yyyy'), 455660156, 'Rhames', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-05-1996', 'dd-mm-yyyy'), to_date('24-06-1999', 'dd-mm-yyyy'), 880418661, 'Hidalgo', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-08-1992', 'dd-mm-yyyy'), to_date('08-02-2003', 'dd-mm-yyyy'), 31010090, 'Crystal', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-11-1993', 'dd-mm-yyyy'), to_date('29-06-2001', 'dd-mm-yyyy'), 420045772, 'Randal', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-07-1996', 'dd-mm-yyyy'), to_date('12-06-1998', 'dd-mm-yyyy'), 150233828, 'McDiarmid', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-02-1991', 'dd-mm-yyyy'), to_date('28-02-2007', 'dd-mm-yyyy'), 23789980, 'Aaron', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-05-1996', 'dd-mm-yyyy'), to_date('01-09-2014', 'dd-mm-yyyy'), 370940222, 'Adkins', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-07-1991', 'dd-mm-yyyy'), to_date('02-04-2011', 'dd-mm-yyyy'), 540785582, 'Broza', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-05-1994', 'dd-mm-yyyy'), to_date('15-01-2013', 'dd-mm-yyyy'), 974904754, 'Latifah', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-01-1992', 'dd-mm-yyyy'), to_date('14-12-2013', 'dd-mm-yyyy'), 705516599, 'Price', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-05-1992', 'dd-mm-yyyy'), to_date('12-10-2014', 'dd-mm-yyyy'), 289261015, 'Martin', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-01-1992', 'dd-mm-yyyy'), to_date('02-06-2018', 'dd-mm-yyyy'), 195923558, 'Janssen', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-12-1993', 'dd-mm-yyyy'), to_date('30-11-2017', 'dd-mm-yyyy'), 605327451, 'Bratt', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-02-1994', 'dd-mm-yyyy'), to_date('01-04-2012', 'dd-mm-yyyy'), 89420602, 'Perrineau', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-04-1995', 'dd-mm-yyyy'), to_date('26-05-2019', 'dd-mm-yyyy'), 187808979, 'Diesel', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-10-1990', 'dd-mm-yyyy'), to_date('09-12-2006', 'dd-mm-yyyy'), 318646231, 'Withers', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-04-1990', 'dd-mm-yyyy'), to_date('11-07-2013', 'dd-mm-yyyy'), 512220495, 'Page', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-03-1995', 'dd-mm-yyyy'), to_date('03-05-2017', 'dd-mm-yyyy'), 92626106, 'Wood', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-08-1995', 'dd-mm-yyyy'), to_date('25-06-2016', 'dd-mm-yyyy'), 692162728, 'Broza', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-04-1993', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 563912715, 'DeLuise', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-06-1992', 'dd-mm-yyyy'), to_date('28-05-2018', 'dd-mm-yyyy'), 897059008, 'Remar', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-08-1991', 'dd-mm-yyyy'), to_date('02-11-2000', 'dd-mm-yyyy'), 379145289, 'Grant', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-11-1990', 'dd-mm-yyyy'), to_date('30-09-2011', 'dd-mm-yyyy'), 332189465, 'Diehl', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-07-1993', 'dd-mm-yyyy'), to_date('09-08-1998', 'dd-mm-yyyy'), 275743960, 'Feuerstein', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-07-1991', 'dd-mm-yyyy'), to_date('09-05-2008', 'dd-mm-yyyy'), 144728998, 'Sinatra', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-09-1996', 'dd-mm-yyyy'), to_date('13-02-2013', 'dd-mm-yyyy'), 263124207, 'Schwimmer', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-09-1996', 'dd-mm-yyyy'), to_date('12-01-2007', 'dd-mm-yyyy'), 28009831, 'Coe', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-03-1995', 'dd-mm-yyyy'), to_date('02-01-2009', 'dd-mm-yyyy'), 579007574, 'Crowe', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-07-1990', 'dd-mm-yyyy'), to_date('04-01-2011', 'dd-mm-yyyy'), 5956382, 'Stevens', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-01-1992', 'dd-mm-yyyy'), to_date('09-02-2010', 'dd-mm-yyyy'), 833027186, 'Crimson', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-11-1993', 'dd-mm-yyyy'), to_date('30-01-2002', 'dd-mm-yyyy'), 221726946, 'Pollack', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-04-1994', 'dd-mm-yyyy'), to_date('11-11-2009', 'dd-mm-yyyy'), 358715189, 'Dunn', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-03-1991', 'dd-mm-yyyy'), to_date('25-10-2003', 'dd-mm-yyyy'), 661551619, 'Cooper', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-04-1993', 'dd-mm-yyyy'), to_date('07-06-2000', 'dd-mm-yyyy'), 11030281, 'Tah', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-01-1993', 'dd-mm-yyyy'), to_date('31-08-2019', 'dd-mm-yyyy'), 676635233, 'Marx', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-09-1990', 'dd-mm-yyyy'), to_date('30-03-2008', 'dd-mm-yyyy'), 518454405, 'Marley', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-08-1992', 'dd-mm-yyyy'), to_date('26-04-2011', 'dd-mm-yyyy'), 863916218, 'Beals', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-12-1990', 'dd-mm-yyyy'), to_date('24-12-2006', 'dd-mm-yyyy'), 516331312, 'Lithgow', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-08-1992', 'dd-mm-yyyy'), to_date('08-02-2000', 'dd-mm-yyyy'), 310709982, 'Gano', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-04-1996', 'dd-mm-yyyy'), to_date('25-08-2002', 'dd-mm-yyyy'), 818002461, 'Kennedy', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-09-1996', 'dd-mm-yyyy'), to_date('18-11-2005', 'dd-mm-yyyy'), 756504501, 'Rio', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-11-1992', 'dd-mm-yyyy'), to_date('24-10-2018', 'dd-mm-yyyy'), 664525314, 'Scheider', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-03-1992', 'dd-mm-yyyy'), to_date('22-02-2005', 'dd-mm-yyyy'), 918225296, 'Cage', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-12-1996', 'dd-mm-yyyy'), to_date('24-10-2004', 'dd-mm-yyyy'), 25917, 'Robbins', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-03-1994', 'dd-mm-yyyy'), to_date('21-03-1999', 'dd-mm-yyyy'), 54231, 'Hedaya', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-10-1994', 'dd-mm-yyyy'), to_date('27-02-2017', 'dd-mm-yyyy'), 32662, 'Rhys-Davie', 35, 1234);
commit;
prompt 400 records committed...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-04-1991', 'dd-mm-yyyy'), to_date('03-07-2001', 'dd-mm-yyyy'), 16317, 'Burmester', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-08-1990', 'dd-mm-yyyy'), to_date('13-12-2005', 'dd-mm-yyyy'), 31538, 'Peterson', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-10-1992', 'dd-mm-yyyy'), to_date('05-07-2015', 'dd-mm-yyyy'), 72642, 'Lloyd', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-11-1994', 'dd-mm-yyyy'), to_date('08-12-2004', 'dd-mm-yyyy'), 72547, 'Garza', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-09-1994', 'dd-mm-yyyy'), to_date('01-07-2006', 'dd-mm-yyyy'), 46221, 'Hutch', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-01-1992', 'dd-mm-yyyy'), to_date('17-04-2001', 'dd-mm-yyyy'), 38764, 'Warren', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-07-1993', 'dd-mm-yyyy'), to_date('17-07-1999', 'dd-mm-yyyy'), 81945, 'McDonald', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-11-1994', 'dd-mm-yyyy'), to_date('28-10-2002', 'dd-mm-yyyy'), 74853, 'Flanagan', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-09-1993', 'dd-mm-yyyy'), to_date('03-09-2017', 'dd-mm-yyyy'), 45327, 'Laurie', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-03-1993', 'dd-mm-yyyy'), to_date('14-11-2007', 'dd-mm-yyyy'), 16477, 'Wills', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-10-1996', 'dd-mm-yyyy'), to_date('19-12-2013', 'dd-mm-yyyy'), 65477, 'Wayans', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-06-1996', 'dd-mm-yyyy'), to_date('21-03-2012', 'dd-mm-yyyy'), 92372, 'Bush', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-08-1993', 'dd-mm-yyyy'), to_date('07-09-2000', 'dd-mm-yyyy'), 28824, 'Giannini', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-04-1991', 'dd-mm-yyyy'), to_date('12-01-2017', 'dd-mm-yyyy'), 79918, 'Spector', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-06-1995', 'dd-mm-yyyy'), to_date('01-03-2012', 'dd-mm-yyyy'), 85798, 'Gallant', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-01-1991', 'dd-mm-yyyy'), to_date('07-02-2007', 'dd-mm-yyyy'), 93814, 'Starr', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-07-1990', 'dd-mm-yyyy'), to_date('05-08-2005', 'dd-mm-yyyy'), 63546, 'Duschel', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-08-1993', 'dd-mm-yyyy'), to_date('05-06-2006', 'dd-mm-yyyy'), 64592, 'Plowright', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-01-1992', 'dd-mm-yyyy'), to_date('28-04-2007', 'dd-mm-yyyy'), 85282, 'Harnes', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-01-1993', 'dd-mm-yyyy'), to_date('11-06-2015', 'dd-mm-yyyy'), 14964, 'Chaplin', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-05-1994', 'dd-mm-yyyy'), to_date('21-11-2003', 'dd-mm-yyyy'), 64342, 'Pollack', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-10-1991', 'dd-mm-yyyy'), to_date('10-11-2013', 'dd-mm-yyyy'), 25116, 'Hingle', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-08-1996', 'dd-mm-yyyy'), to_date('22-05-2006', 'dd-mm-yyyy'), 27748, 'Dukakis', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-01-1993', 'dd-mm-yyyy'), to_date('04-07-1998', 'dd-mm-yyyy'), 54684, 'Chesnutt', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-05-1996', 'dd-mm-yyyy'), to_date('18-05-2018', 'dd-mm-yyyy'), 69161, 'Swayze', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-04-1995', 'dd-mm-yyyy'), to_date('16-01-2009', 'dd-mm-yyyy'), 57786, 'Mewes', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-01-1996', 'dd-mm-yyyy'), to_date('01-12-2016', 'dd-mm-yyyy'), 45696, 'Steiger', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-08-1991', 'dd-mm-yyyy'), to_date('14-01-2012', 'dd-mm-yyyy'), 65747, 'Burton', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-06-1993', 'dd-mm-yyyy'), to_date('20-12-2017', 'dd-mm-yyyy'), 59957, 'Creek', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-06-1992', 'dd-mm-yyyy'), to_date('16-03-2003', 'dd-mm-yyyy'), 71449, 'Borden', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-11-1993', 'dd-mm-yyyy'), to_date('05-10-2016', 'dd-mm-yyyy'), 33113, 'Whitwam', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-05-1995', 'dd-mm-yyyy'), to_date('21-04-2011', 'dd-mm-yyyy'), 99164, 'Baranski', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-07-1991', 'dd-mm-yyyy'), to_date('19-04-2017', 'dd-mm-yyyy'), 41313, 'Llewelyn', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-01-1992', 'dd-mm-yyyy'), to_date('25-07-2000', 'dd-mm-yyyy'), 44932, 'Harry', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-04-1996', 'dd-mm-yyyy'), to_date('09-01-2004', 'dd-mm-yyyy'), 48658, 'Sellers', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-12-1995', 'dd-mm-yyyy'), to_date('06-04-2007', 'dd-mm-yyyy'), 96295, 'Garfunkel', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-11-1991', 'dd-mm-yyyy'), to_date('21-09-2011', 'dd-mm-yyyy'), 19786, 'Serbedzija', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-03-1992', 'dd-mm-yyyy'), to_date('14-09-2009', 'dd-mm-yyyy'), 99669, 'Hong', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-11-1995', 'dd-mm-yyyy'), to_date('27-02-2001', 'dd-mm-yyyy'), 99422, 'Lemmon', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-02-1994', 'dd-mm-yyyy'), to_date('29-05-2002', 'dd-mm-yyyy'), 94292, 'Kline', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-06-1993', 'dd-mm-yyyy'), to_date('15-11-2018', 'dd-mm-yyyy'), 81257, 'Platt', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-06-1996', 'dd-mm-yyyy'), to_date('25-08-2007', 'dd-mm-yyyy'), 44475, 'Wolf', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-08-1992', 'dd-mm-yyyy'), to_date('12-08-2007', 'dd-mm-yyyy'), 33373, 'Candy', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-03-1996', 'dd-mm-yyyy'), to_date('12-03-2007', 'dd-mm-yyyy'), 62376, 'Adkins', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-10-1992', 'dd-mm-yyyy'), to_date('09-12-2002', 'dd-mm-yyyy'), 25925, 'Worrell', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-01-1992', 'dd-mm-yyyy'), to_date('20-02-2014', 'dd-mm-yyyy'), 67432, 'Hauser', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-06-1993', 'dd-mm-yyyy'), to_date('30-09-2008', 'dd-mm-yyyy'), 38794, 'MacDonald', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-09-1990', 'dd-mm-yyyy'), to_date('26-02-2011', 'dd-mm-yyyy'), 69794, 'Matthau', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-03-1995', 'dd-mm-yyyy'), to_date('14-07-2010', 'dd-mm-yyyy'), 69573, 'Carrere', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-10-1990', 'dd-mm-yyyy'), to_date('13-10-2018', 'dd-mm-yyyy'), 95626, 'Ryan', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-06-1994', 'dd-mm-yyyy'), to_date('05-11-2018', 'dd-mm-yyyy'), 67892, 'Tempest', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-12-1992', 'dd-mm-yyyy'), to_date('26-11-2012', 'dd-mm-yyyy'), 58468, 'Springfiel', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-04-1993', 'dd-mm-yyyy'), to_date('07-11-2018', 'dd-mm-yyyy'), 23372, 'Gallagher', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-11-1990', 'dd-mm-yyyy'), to_date('09-02-2010', 'dd-mm-yyyy'), 31794, 'Trevino', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-04-1993', 'dd-mm-yyyy'), to_date('20-05-2015', 'dd-mm-yyyy'), 79157, 'Busey', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-04-1994', 'dd-mm-yyyy'), to_date('12-01-2007', 'dd-mm-yyyy'), 88258, 'Murray', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-02-1990', 'dd-mm-yyyy'), to_date('22-05-2016', 'dd-mm-yyyy'), 14148, 'Balaban', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-05-1992', 'dd-mm-yyyy'), to_date('26-05-2015', 'dd-mm-yyyy'), 21549, 'Stevens', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-03-1992', 'dd-mm-yyyy'), to_date('20-03-2001', 'dd-mm-yyyy'), 39492, 'urban', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-09-1990', 'dd-mm-yyyy'), to_date('17-11-1999', 'dd-mm-yyyy'), 63479, 'Rhames', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-06-1991', 'dd-mm-yyyy'), to_date('27-07-2013', 'dd-mm-yyyy'), 31299, 'Skaggs', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-05-1991', 'dd-mm-yyyy'), to_date('28-05-2015', 'dd-mm-yyyy'), 53462, 'Presley', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-03-1990', 'dd-mm-yyyy'), to_date('21-08-2018', 'dd-mm-yyyy'), 38518, 'Blades', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-01-1996', 'dd-mm-yyyy'), to_date('04-03-2010', 'dd-mm-yyyy'), 26244, 'Tomlin', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-11-1994', 'dd-mm-yyyy'), to_date('21-03-2005', 'dd-mm-yyyy'), 96286, 'Martinez', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-06-1996', 'dd-mm-yyyy'), to_date('26-11-2019', 'dd-mm-yyyy'), 47572, 'Weaving', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-05-1993', 'dd-mm-yyyy'), to_date('18-04-2005', 'dd-mm-yyyy'), 18887, 'Summer', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-01-1994', 'dd-mm-yyyy'), to_date('24-07-2010', 'dd-mm-yyyy'), 73377, 'Cromwell', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-03-1990', 'dd-mm-yyyy'), to_date('08-12-2016', 'dd-mm-yyyy'), 55593, 'Russell', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-08-1995', 'dd-mm-yyyy'), to_date('10-03-2018', 'dd-mm-yyyy'), 31886, 'Osment', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-09-1994', 'dd-mm-yyyy'), to_date('26-12-2019', 'dd-mm-yyyy'), 13659, 'Carradine', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-11-1994', 'dd-mm-yyyy'), to_date('30-12-2007', 'dd-mm-yyyy'), 75776, 'Leto', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-03-1991', 'dd-mm-yyyy'), to_date('04-05-2015', 'dd-mm-yyyy'), 11467, 'Martin', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-11-1994', 'dd-mm-yyyy'), to_date('18-05-2002', 'dd-mm-yyyy'), 94979, 'Nelligan', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-11-1991', 'dd-mm-yyyy'), to_date('07-05-2002', 'dd-mm-yyyy'), 71533, 'Dickinson', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-11-1994', 'dd-mm-yyyy'), to_date('01-01-1999', 'dd-mm-yyyy'), 92161, 'Rivers', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-12-1994', 'dd-mm-yyyy'), to_date('26-02-2012', 'dd-mm-yyyy'), 63152, 'McCready', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-09-1992', 'dd-mm-yyyy'), to_date('17-08-2019', 'dd-mm-yyyy'), 57331, 'Coolidge', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-10-1995', 'dd-mm-yyyy'), to_date('26-05-2012', 'dd-mm-yyyy'), 38668, 'Rockwell', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-11-1991', 'dd-mm-yyyy'), to_date('28-10-2019', 'dd-mm-yyyy'), 52235, 'Stevens', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-10-1993', 'dd-mm-yyyy'), to_date('26-03-2010', 'dd-mm-yyyy'), 21978, 'Levin', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-08-1991', 'dd-mm-yyyy'), to_date('21-03-2011', 'dd-mm-yyyy'), 84823, 'Sarandon', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-10-1993', 'dd-mm-yyyy'), to_date('22-12-2003', 'dd-mm-yyyy'), 91924, 'Del Toro', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-11-1994', 'dd-mm-yyyy'), to_date('14-06-2005', 'dd-mm-yyyy'), 74296, 'Matheson', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-10-1990', 'dd-mm-yyyy'), to_date('26-05-2011', 'dd-mm-yyyy'), 83677, 'Richter', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-09-1994', 'dd-mm-yyyy'), to_date('04-07-2010', 'dd-mm-yyyy'), 68381, 'Paymer', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-09-1993', 'dd-mm-yyyy'), to_date('02-01-2012', 'dd-mm-yyyy'), 22147, 'Cromwell', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-04-1991', 'dd-mm-yyyy'), to_date('05-07-2007', 'dd-mm-yyyy'), 77288, 'Callow', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-03-1992', 'dd-mm-yyyy'), to_date('09-03-1998', 'dd-mm-yyyy'), 99854, 'Kennedy', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-10-1996', 'dd-mm-yyyy'), to_date('03-10-2017', 'dd-mm-yyyy'), 71538, 'Arnold', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-10-1994', 'dd-mm-yyyy'), to_date('19-09-2005', 'dd-mm-yyyy'), 23419, 'Rhodes', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-08-1992', 'dd-mm-yyyy'), to_date('07-01-2001', 'dd-mm-yyyy'), 87533, 'Palminteri', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-11-1995', 'dd-mm-yyyy'), to_date('17-06-1999', 'dd-mm-yyyy'), 49999, 'Swank', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-02-1996', 'dd-mm-yyyy'), to_date('08-11-2013', 'dd-mm-yyyy'), 58357, 'Benson', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-11-1990', 'dd-mm-yyyy'), to_date('04-09-2001', 'dd-mm-yyyy'), 72883, 'Douglas', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-03-1995', 'dd-mm-yyyy'), to_date('21-01-2006', 'dd-mm-yyyy'), 46175, 'Meyer', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-11-1990', 'dd-mm-yyyy'), to_date('24-11-2019', 'dd-mm-yyyy'), 87252, 'Zahn', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-03-1993', 'dd-mm-yyyy'), to_date('19-11-2002', 'dd-mm-yyyy'), 38883, 'Blackmore', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-03-1991', 'dd-mm-yyyy'), to_date('14-09-2018', 'dd-mm-yyyy'), 15613, 'Glover', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-12-1991', 'dd-mm-yyyy'), to_date('07-04-2018', 'dd-mm-yyyy'), 17163, 'Lynne', 36, 1234);
commit;
prompt 500 records committed...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-09-1992', 'dd-mm-yyyy'), to_date('03-09-1998', 'dd-mm-yyyy'), 778317122, 'Donelly', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-07-1991', 'dd-mm-yyyy'), to_date('18-08-2006', 'dd-mm-yyyy'), 162014476, 'Day', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-12-1992', 'dd-mm-yyyy'), to_date('21-03-2016', 'dd-mm-yyyy'), 528799046, 'Sampson', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-06-1991', 'dd-mm-yyyy'), to_date('02-05-2015', 'dd-mm-yyyy'), 914721635, 'Turturro', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-09-1990', 'dd-mm-yyyy'), to_date('25-07-2005', 'dd-mm-yyyy'), 943150086, 'Dillon', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-02-1991', 'dd-mm-yyyy'), to_date('25-11-2019', 'dd-mm-yyyy'), 67286211, 'Delta', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-07-1991', 'dd-mm-yyyy'), to_date('26-01-2005', 'dd-mm-yyyy'), 40507564, 'Jolie', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-11-1996', 'dd-mm-yyyy'), to_date('12-12-2005', 'dd-mm-yyyy'), 692699250, 'Brosnan', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-02-1994', 'dd-mm-yyyy'), to_date('04-12-2006', 'dd-mm-yyyy'), 798682901, 'Tilly', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-01-1996', 'dd-mm-yyyy'), to_date('03-08-2018', 'dd-mm-yyyy'), 3801672, 'Diddley', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-01-1994', 'dd-mm-yyyy'), to_date('06-01-2007', 'dd-mm-yyyy'), 358657714, 'Blanchett', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-09-1995', 'dd-mm-yyyy'), to_date('17-02-2003', 'dd-mm-yyyy'), 57606264, 'Pitney', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-06-1991', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'), 942123241, 'Lennox', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-05-1991', 'dd-mm-yyyy'), to_date('25-05-2016', 'dd-mm-yyyy'), 53765749, 'Day-Lewis', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-01-1992', 'dd-mm-yyyy'), to_date('09-01-2016', 'dd-mm-yyyy'), 415115049, 'Rush', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-03-1991', 'dd-mm-yyyy'), to_date('01-07-2018', 'dd-mm-yyyy'), 544325643, 'Spall', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-06-1993', 'dd-mm-yyyy'), to_date('10-05-2001', 'dd-mm-yyyy'), 646926202, 'Tambor', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-10-1993', 'dd-mm-yyyy'), to_date('22-02-2000', 'dd-mm-yyyy'), 337905759, 'Makeba', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-08-1990', 'dd-mm-yyyy'), to_date('04-04-2007', 'dd-mm-yyyy'), 865267478, 'Wainwright', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-11-1990', 'dd-mm-yyyy'), to_date('30-04-2018', 'dd-mm-yyyy'), 336206183, 'Pleasure', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-05-1994', 'dd-mm-yyyy'), to_date('03-03-2006', 'dd-mm-yyyy'), 501075673, 'Downey', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-06-1996', 'dd-mm-yyyy'), to_date('22-07-2004', 'dd-mm-yyyy'), 123870470, 'Randal', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-06-1995', 'dd-mm-yyyy'), to_date('23-06-1998', 'dd-mm-yyyy'), 890897710, 'Bloch', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-07-1994', 'dd-mm-yyyy'), to_date('19-04-2007', 'dd-mm-yyyy'), 11136579, 'Frost', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-02-1991', 'dd-mm-yyyy'), to_date('24-02-2002', 'dd-mm-yyyy'), 704964458, 'Milsap', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-11-1990', 'dd-mm-yyyy'), to_date('19-12-2017', 'dd-mm-yyyy'), 537170380, 'Suvari', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-07-1996', 'dd-mm-yyyy'), to_date('28-04-2019', 'dd-mm-yyyy'), 959195101, 'Collie', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-07-1990', 'dd-mm-yyyy'), to_date('03-02-2009', 'dd-mm-yyyy'), 624202051, 'Field', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-12-1991', 'dd-mm-yyyy'), to_date('22-03-2017', 'dd-mm-yyyy'), 964448036, 'Hudson', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-05-1996', 'dd-mm-yyyy'), to_date('15-11-2004', 'dd-mm-yyyy'), 592325383, 'Bello', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-09-1991', 'dd-mm-yyyy'), to_date('18-06-2010', 'dd-mm-yyyy'), 304498793, 'Drive', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-06-1994', 'dd-mm-yyyy'), to_date('05-12-2009', 'dd-mm-yyyy'), 844367681, 'Farina', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-12-1993', 'dd-mm-yyyy'), to_date('14-02-2007', 'dd-mm-yyyy'), 706769351, 'Midler', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-10-1991', 'dd-mm-yyyy'), to_date('10-05-2001', 'dd-mm-yyyy'), 766140262, 'Hersh', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-01-1992', 'dd-mm-yyyy'), to_date('16-08-2004', 'dd-mm-yyyy'), 976220688, 'Fonda', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-05-1996', 'dd-mm-yyyy'), to_date('25-11-2018', 'dd-mm-yyyy'), 3583985, 'Dunaway', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-02-1993', 'dd-mm-yyyy'), to_date('08-11-2006', 'dd-mm-yyyy'), 768265505, 'Smith', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-03-1995', 'dd-mm-yyyy'), to_date('26-05-2019', 'dd-mm-yyyy'), 502904492, 'Bridges', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-03-1990', 'dd-mm-yyyy'), to_date('27-06-2017', 'dd-mm-yyyy'), 868295166, 'Karyo', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-05-1993', 'dd-mm-yyyy'), to_date('30-03-2003', 'dd-mm-yyyy'), 451829843, 'Molina', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-07-1990', 'dd-mm-yyyy'), to_date('12-01-2014', 'dd-mm-yyyy'), 964775324, 'Cornell', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-03-1996', 'dd-mm-yyyy'), to_date('28-01-2002', 'dd-mm-yyyy'), 929301997, 'Boothe', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-08-1994', 'dd-mm-yyyy'), to_date('24-06-2000', 'dd-mm-yyyy'), 981544071, 'Lightfoot', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-07-1994', 'dd-mm-yyyy'), to_date('10-06-2006', 'dd-mm-yyyy'), 834968474, 'Burton', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-01-1996', 'dd-mm-yyyy'), to_date('10-02-2000', 'dd-mm-yyyy'), 239333142, 'Abraham', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-04-1994', 'dd-mm-yyyy'), to_date('06-08-2005', 'dd-mm-yyyy'), 23850357, 'Pastore', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-12-1991', 'dd-mm-yyyy'), to_date('26-05-2009', 'dd-mm-yyyy'), 826537239, 'Shalhoub', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-09-1990', 'dd-mm-yyyy'), to_date('25-03-2009', 'dd-mm-yyyy'), 988909395, 'Manning', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-10-1993', 'dd-mm-yyyy'), to_date('13-06-2005', 'dd-mm-yyyy'), 785678586, 'Davidson', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-08-1995', 'dd-mm-yyyy'), to_date('03-04-2014', 'dd-mm-yyyy'), 945598446, 'Weston', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-02-1996', 'dd-mm-yyyy'), to_date('23-12-2016', 'dd-mm-yyyy'), 353051004, 'Griffiths', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-03-1995', 'dd-mm-yyyy'), to_date('20-06-2017', 'dd-mm-yyyy'), 778053695, 'Himmelman', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-04-1995', 'dd-mm-yyyy'), to_date('19-04-2010', 'dd-mm-yyyy'), 966564223, 'Stuart', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-12-1995', 'dd-mm-yyyy'), to_date('24-03-2004', 'dd-mm-yyyy'), 90578443, 'Uggams', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-04-1990', 'dd-mm-yyyy'), to_date('04-04-2007', 'dd-mm-yyyy'), 125883285, 'Everett', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-12-1993', 'dd-mm-yyyy'), to_date('21-11-2002', 'dd-mm-yyyy'), 558065673, 'Berkoff', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-03-1992', 'dd-mm-yyyy'), to_date('16-08-1999', 'dd-mm-yyyy'), 116171794, 'Zevon', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-01-1992', 'dd-mm-yyyy'), to_date('04-04-2014', 'dd-mm-yyyy'), 532636314, 'Leguizamo', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-04-1991', 'dd-mm-yyyy'), to_date('15-11-1999', 'dd-mm-yyyy'), 266393912, 'Mueller-St', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-01-1994', 'dd-mm-yyyy'), to_date('14-09-2004', 'dd-mm-yyyy'), 508166686, 'Blanchett', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-03-1996', 'dd-mm-yyyy'), to_date('01-11-2001', 'dd-mm-yyyy'), 492164460, 'Rifkin', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-09-1993', 'dd-mm-yyyy'), to_date('22-03-2003', 'dd-mm-yyyy'), 643751524, 'Jolie', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-02-1992', 'dd-mm-yyyy'), to_date('18-03-2004', 'dd-mm-yyyy'), 818762641, 'Imperioli', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-02-1995', 'dd-mm-yyyy'), to_date('10-02-2018', 'dd-mm-yyyy'), 962468957, 'Broadbent', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-06-1992', 'dd-mm-yyyy'), to_date('14-05-2013', 'dd-mm-yyyy'), 249084635, 'Ammons', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-03-1994', 'dd-mm-yyyy'), to_date('19-07-2000', 'dd-mm-yyyy'), 736631174, 'Tambor', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-04-1992', 'dd-mm-yyyy'), to_date('08-06-2013', 'dd-mm-yyyy'), 529621811, 'Charles', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-05-1990', 'dd-mm-yyyy'), to_date('05-09-1999', 'dd-mm-yyyy'), 764579717, 'Peebles', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-07-1994', 'dd-mm-yyyy'), to_date('23-02-2007', 'dd-mm-yyyy'), 673437712, 'Beckinsale', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-12-1996', 'dd-mm-yyyy'), to_date('20-07-1999', 'dd-mm-yyyy'), 628032720, 'Sayer', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-05-1990', 'dd-mm-yyyy'), to_date('20-05-2016', 'dd-mm-yyyy'), 552278969, 'Finney', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-12-1994', 'dd-mm-yyyy'), to_date('22-07-2011', 'dd-mm-yyyy'), 252236537, 'Vincent', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-02-1993', 'dd-mm-yyyy'), to_date('01-05-2009', 'dd-mm-yyyy'), 93498, 'Mac', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-12-1995', 'dd-mm-yyyy'), to_date('02-08-2019', 'dd-mm-yyyy'), 66871, 'Kristoffer', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-01-1990', 'dd-mm-yyyy'), to_date('21-01-2007', 'dd-mm-yyyy'), 46718, 'Evett', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-09-1990', 'dd-mm-yyyy'), to_date('27-04-2008', 'dd-mm-yyyy'), 11747, 'von Sydow', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-11-1996', 'dd-mm-yyyy'), to_date('23-02-2007', 'dd-mm-yyyy'), 74682, 'Lewis', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-07-1993', 'dd-mm-yyyy'), to_date('10-09-2001', 'dd-mm-yyyy'), 56528, 'Channing', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-05-1993', 'dd-mm-yyyy'), to_date('01-02-2002', 'dd-mm-yyyy'), 64768, 'Elizondo', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-04-1995', 'dd-mm-yyyy'), to_date('29-06-2013', 'dd-mm-yyyy'), 62711, 'Hamilton', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-04-1995', 'dd-mm-yyyy'), to_date('31-05-2004', 'dd-mm-yyyy'), 37358, 'Lennox', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-04-1993', 'dd-mm-yyyy'), to_date('19-04-2000', 'dd-mm-yyyy'), 86433, 'Darren', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-08-1994', 'dd-mm-yyyy'), to_date('24-07-2004', 'dd-mm-yyyy'), 66864, 'Torres', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-07-1992', 'dd-mm-yyyy'), to_date('01-08-2001', 'dd-mm-yyyy'), 15329, 'MacDonald', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-12-1994', 'dd-mm-yyyy'), to_date('24-03-2009', 'dd-mm-yyyy'), 89849, 'Stiller', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-03-1991', 'dd-mm-yyyy'), to_date('09-07-2018', 'dd-mm-yyyy'), 28721, 'Suchet', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-02-1994', 'dd-mm-yyyy'), to_date('21-06-2011', 'dd-mm-yyyy'), 89177, 'Sevenfold', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-10-1993', 'dd-mm-yyyy'), to_date('20-05-2013', 'dd-mm-yyyy'), 54643, 'Fichtner', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-01-1995', 'dd-mm-yyyy'), to_date('18-02-2013', 'dd-mm-yyyy'), 47776, 'Costa', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-01-1992', 'dd-mm-yyyy'), to_date('13-12-1998', 'dd-mm-yyyy'), 69485, 'Iglesias', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-06-1990', 'dd-mm-yyyy'), to_date('24-10-2005', 'dd-mm-yyyy'), 88867, 'Ojeda', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-06-1994', 'dd-mm-yyyy'), to_date('12-10-2016', 'dd-mm-yyyy'), 61122, 'Evanswood', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-12-1991', 'dd-mm-yyyy'), to_date('20-12-2019', 'dd-mm-yyyy'), 62115, 'McDiarmid', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-02-1994', 'dd-mm-yyyy'), to_date('07-11-2006', 'dd-mm-yyyy'), 41348, 'Rickman', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-08-1990', 'dd-mm-yyyy'), to_date('17-05-2005', 'dd-mm-yyyy'), 67247, 'McGowan', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-11-1990', 'dd-mm-yyyy'), to_date('12-05-2016', 'dd-mm-yyyy'), 99294, 'Fraser', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-05-1991', 'dd-mm-yyyy'), to_date('22-07-2015', 'dd-mm-yyyy'), 27487, 'Spector', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-08-1992', 'dd-mm-yyyy'), to_date('13-03-2013', 'dd-mm-yyyy'), 94437, 'Bassett', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-08-1992', 'dd-mm-yyyy'), to_date('09-05-2008', 'dd-mm-yyyy'), 69984, 'Lovitz', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('31-10-1993', 'dd-mm-yyyy'), to_date('25-11-2004', 'dd-mm-yyyy'), 69491, 'Armstrong', 37, 1234);
commit;
prompt 600 records committed...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-08-1992', 'dd-mm-yyyy'), to_date('17-04-2010', 'dd-mm-yyyy'), 72152, 'Gibson', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-04-1993', 'dd-mm-yyyy'), to_date('06-08-2003', 'dd-mm-yyyy'), 98246, 'Stevens', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-04-1996', 'dd-mm-yyyy'), to_date('24-11-2011', 'dd-mm-yyyy'), 75852, 'Devine', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-04-1990', 'dd-mm-yyyy'), to_date('24-09-1998', 'dd-mm-yyyy'), 38972, 'Russo', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-11-1994', 'dd-mm-yyyy'), to_date('12-08-2000', 'dd-mm-yyyy'), 83923, 'Phillippe', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-06-1995', 'dd-mm-yyyy'), to_date('03-02-2017', 'dd-mm-yyyy'), 89262, 'Lunch', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-12-1993', 'dd-mm-yyyy'), to_date('29-06-2015', 'dd-mm-yyyy'), 43629, 'Coburn', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-02-1993', 'dd-mm-yyyy'), to_date('21-12-2002', 'dd-mm-yyyy'), 59474, 'Blades', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-04-1996', 'dd-mm-yyyy'), to_date('24-04-2003', 'dd-mm-yyyy'), 32574, 'Hornsby', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-08-1992', 'dd-mm-yyyy'), to_date('08-11-2004', 'dd-mm-yyyy'), 28977, 'Sherman', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-02-1996', 'dd-mm-yyyy'), to_date('25-03-2009', 'dd-mm-yyyy'), 58932, 'Curtis', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-07-1996', 'dd-mm-yyyy'), to_date('24-08-2016', 'dd-mm-yyyy'), 67453, 'Wiest', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-02-1994', 'dd-mm-yyyy'), to_date('29-09-2008', 'dd-mm-yyyy'), 13933, 'Cusack', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-08-1991', 'dd-mm-yyyy'), to_date('15-09-2014', 'dd-mm-yyyy'), 84851, 'Vaughan', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-10-1994', 'dd-mm-yyyy'), to_date('15-12-2012', 'dd-mm-yyyy'), 74266, 'Culkin', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-05-1991', 'dd-mm-yyyy'), to_date('08-09-2011', 'dd-mm-yyyy'), 39865, 'Caviezel', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-09-1991', 'dd-mm-yyyy'), to_date('09-12-2006', 'dd-mm-yyyy'), 54557, 'Cassidy', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-09-1992', 'dd-mm-yyyy'), to_date('26-07-2019', 'dd-mm-yyyy'), 26932, 'Ryan', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-03-1990', 'dd-mm-yyyy'), to_date('13-04-2012', 'dd-mm-yyyy'), 74382, 'Dillane', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-11-1991', 'dd-mm-yyyy'), to_date('04-10-2017', 'dd-mm-yyyy'), 59484, 'Wright', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-05-1992', 'dd-mm-yyyy'), to_date('06-07-1998', 'dd-mm-yyyy'), 28665, 'Mraz', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-10-1995', 'dd-mm-yyyy'), to_date('27-09-2005', 'dd-mm-yyyy'), 78976, 'Pleasence', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-01-1990', 'dd-mm-yyyy'), to_date('29-06-2011', 'dd-mm-yyyy'), 29121, 'Shaw', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-07-1995', 'dd-mm-yyyy'), to_date('15-01-2005', 'dd-mm-yyyy'), 29974, 'D''Onofrio', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-03-1993', 'dd-mm-yyyy'), to_date('13-07-2012', 'dd-mm-yyyy'), 32292, 'Eder', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-02-1993', 'dd-mm-yyyy'), to_date('26-12-2006', 'dd-mm-yyyy'), 41129, 'De Almeida', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-11-1992', 'dd-mm-yyyy'), to_date('15-02-2019', 'dd-mm-yyyy'), 38114, 'Kahn', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-06-1993', 'dd-mm-yyyy'), to_date('25-03-2010', 'dd-mm-yyyy'), 75753, 'Raye', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-01-1994', 'dd-mm-yyyy'), to_date('08-11-2003', 'dd-mm-yyyy'), 86991, 'Iglesias', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-07-1994', 'dd-mm-yyyy'), to_date('27-03-2005', 'dd-mm-yyyy'), 21866, 'Baranski', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-05-1990', 'dd-mm-yyyy'), to_date('13-11-2015', 'dd-mm-yyyy'), 68439, 'Lang', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-06-1995', 'dd-mm-yyyy'), to_date('12-04-2004', 'dd-mm-yyyy'), 43181, 'Kingsley', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-03-1990', 'dd-mm-yyyy'), to_date('21-06-2011', 'dd-mm-yyyy'), 91962, 'Hubbard', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-02-1995', 'dd-mm-yyyy'), to_date('21-08-2003', 'dd-mm-yyyy'), 45955, 'Michaels', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-08-1990', 'dd-mm-yyyy'), to_date('11-03-2011', 'dd-mm-yyyy'), 28215, 'McIntyre', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-11-1991', 'dd-mm-yyyy'), to_date('08-04-2016', 'dd-mm-yyyy'), 12524, 'Jonze', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-09-1996', 'dd-mm-yyyy'), to_date('20-04-2004', 'dd-mm-yyyy'), 39686, 'Blanchett', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-05-1996', 'dd-mm-yyyy'), to_date('26-05-2010', 'dd-mm-yyyy'), 36356, 'Carlyle', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-03-1995', 'dd-mm-yyyy'), to_date('09-05-2009', 'dd-mm-yyyy'), 24812, 'Sainte-Mar', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-05-1992', 'dd-mm-yyyy'), to_date('30-07-2004', 'dd-mm-yyyy'), 46473, 'Rossellini', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-01-1991', 'dd-mm-yyyy'), to_date('31-07-2001', 'dd-mm-yyyy'), 49381, 'Luongo', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-03-1996', 'dd-mm-yyyy'), to_date('06-12-2010', 'dd-mm-yyyy'), 46155, 'Paymer', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-08-1994', 'dd-mm-yyyy'), to_date('25-08-2017', 'dd-mm-yyyy'), 71965, 'Rankin', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-08-1992', 'dd-mm-yyyy'), to_date('27-09-2007', 'dd-mm-yyyy'), 36918, 'McDormand', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-01-1996', 'dd-mm-yyyy'), to_date('11-08-2005', 'dd-mm-yyyy'), 26258, 'Curry', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-07-1993', 'dd-mm-yyyy'), to_date('28-12-2017', 'dd-mm-yyyy'), 36231, 'McGinley', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-05-1992', 'dd-mm-yyyy'), to_date('19-06-2005', 'dd-mm-yyyy'), 79413, 'Klugh', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-02-1992', 'dd-mm-yyyy'), to_date('31-01-2002', 'dd-mm-yyyy'), 26691, 'Goodman', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-02-1995', 'dd-mm-yyyy'), to_date('09-04-2019', 'dd-mm-yyyy'), 96492, 'Gambon', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-11-1993', 'dd-mm-yyyy'), to_date('20-04-2004', 'dd-mm-yyyy'), 34773, 'El-Saher', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-07-1990', 'dd-mm-yyyy'), to_date('10-03-2013', 'dd-mm-yyyy'), 43179, 'Lawrence', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-10-1990', 'dd-mm-yyyy'), to_date('07-04-2008', 'dd-mm-yyyy'), 35542, 'Voight', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-02-1992', 'dd-mm-yyyy'), to_date('13-05-2015', 'dd-mm-yyyy'), 72795, 'Wood', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-12-1993', 'dd-mm-yyyy'), to_date('24-12-2017', 'dd-mm-yyyy'), 76254, 'Balaban', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-04-1994', 'dd-mm-yyyy'), to_date('14-01-2015', 'dd-mm-yyyy'), 41858, 'Burke', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('13-10-1993', 'dd-mm-yyyy'), to_date('25-08-2006', 'dd-mm-yyyy'), 73917, 'Lachey', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-12-1990', 'dd-mm-yyyy'), to_date('09-11-2011', 'dd-mm-yyyy'), 62794, 'Heatherly', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-06-1995', 'dd-mm-yyyy'), to_date('21-11-2018', 'dd-mm-yyyy'), 47713, 'McBride', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-12-1990', 'dd-mm-yyyy'), to_date('12-09-2019', 'dd-mm-yyyy'), 46452, 'Boyle', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-12-1994', 'dd-mm-yyyy'), to_date('29-07-2013', 'dd-mm-yyyy'), 54726, 'Cherry', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-12-1992', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 27521, 'Kingsley', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-07-1990', 'dd-mm-yyyy'), to_date('02-11-2007', 'dd-mm-yyyy'), 49721, 'Hagerty', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-04-1990', 'dd-mm-yyyy'), to_date('30-11-2012', 'dd-mm-yyyy'), 24281, 'Quinn', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('19-07-1996', 'dd-mm-yyyy'), to_date('09-07-2010', 'dd-mm-yyyy'), 33152, 'Lucien', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-06-1991', 'dd-mm-yyyy'), to_date('23-04-2000', 'dd-mm-yyyy'), 23537, 'Renfro', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-05-1990', 'dd-mm-yyyy'), to_date('24-08-2008', 'dd-mm-yyyy'), 15711, 'Sheen', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-11-1990', 'dd-mm-yyyy'), to_date('20-11-2005', 'dd-mm-yyyy'), 88925, 'Christie', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-08-1993', 'dd-mm-yyyy'), to_date('06-02-2012', 'dd-mm-yyyy'), 47771, 'Capshaw', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-02-1991', 'dd-mm-yyyy'), to_date('10-06-2015', 'dd-mm-yyyy'), 33282, 'McGill', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-07-1990', 'dd-mm-yyyy'), to_date('22-02-2013', 'dd-mm-yyyy'), 97875, 'Dysart', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-01-1993', 'dd-mm-yyyy'), to_date('02-08-2013', 'dd-mm-yyyy'), 38973, 'Tah', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-04-1994', 'dd-mm-yyyy'), to_date('23-12-2008', 'dd-mm-yyyy'), 59497, 'Gagnon', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-06-1996', 'dd-mm-yyyy'), to_date('28-11-2000', 'dd-mm-yyyy'), 34741, 'Porter', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-08-1993', 'dd-mm-yyyy'), to_date('16-12-1998', 'dd-mm-yyyy'), 46154, 'Rain', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-01-1994', 'dd-mm-yyyy'), to_date('03-12-2006', 'dd-mm-yyyy'), 94893, 'Shue', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-06-1991', 'dd-mm-yyyy'), to_date('17-08-2005', 'dd-mm-yyyy'), 12823, 'Kinski', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-11-1996', 'dd-mm-yyyy'), to_date('21-09-2018', 'dd-mm-yyyy'), 32376, 'Bedelia', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-03-1996', 'dd-mm-yyyy'), to_date('31-03-1998', 'dd-mm-yyyy'), 76683, 'McCormack', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-09-1994', 'dd-mm-yyyy'), to_date('19-10-2014', 'dd-mm-yyyy'), 73357, 'Lee', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-10-1990', 'dd-mm-yyyy'), to_date('19-12-1998', 'dd-mm-yyyy'), 63115, 'McNarland', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-11-1990', 'dd-mm-yyyy'), to_date('06-11-2012', 'dd-mm-yyyy'), 72852, 'Supernaw', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('09-03-1991', 'dd-mm-yyyy'), to_date('09-04-2019', 'dd-mm-yyyy'), 17379, 'Tucci', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-02-1996', 'dd-mm-yyyy'), to_date('15-01-2002', 'dd-mm-yyyy'), 38941, 'Meyer', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-12-1996', 'dd-mm-yyyy'), to_date('24-11-2007', 'dd-mm-yyyy'), 71883, 'Wiest', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-07-1993', 'dd-mm-yyyy'), to_date('09-08-2009', 'dd-mm-yyyy'), 16588, 'Fisher', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-05-1991', 'dd-mm-yyyy'), to_date('07-11-2018', 'dd-mm-yyyy'), 28394, 'Schiff', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-07-1992', 'dd-mm-yyyy'), to_date('11-03-2007', 'dd-mm-yyyy'), 33136, 'Stoltz', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-12-1993', 'dd-mm-yyyy'), to_date('10-09-1999', 'dd-mm-yyyy'), 97646, 'LaPaglia', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-04-1991', 'dd-mm-yyyy'), to_date('13-11-2005', 'dd-mm-yyyy'), 64726, 'Azaria', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-01-1990', 'dd-mm-yyyy'), to_date('18-09-2013', 'dd-mm-yyyy'), 52326, 'Gilliam', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-02-1990', 'dd-mm-yyyy'), to_date('09-03-2012', 'dd-mm-yyyy'), 85649, 'Ellis', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('05-04-1995', 'dd-mm-yyyy'), to_date('03-04-1999', 'dd-mm-yyyy'), 54291, 'Warburton', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-11-1991', 'dd-mm-yyyy'), to_date('18-03-2007', 'dd-mm-yyyy'), 52676, 'Katt', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-07-1992', 'dd-mm-yyyy'), to_date('03-09-2000', 'dd-mm-yyyy'), 73513, 'Lapointe', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-09-1993', 'dd-mm-yyyy'), to_date('30-11-2005', 'dd-mm-yyyy'), 15689, 'Loeb', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-06-1996', 'dd-mm-yyyy'), to_date('11-04-2007', 'dd-mm-yyyy'), 26632, 'Vincent', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-08-1994', 'dd-mm-yyyy'), to_date('15-11-2017', 'dd-mm-yyyy'), 57554, 'Broderick', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-10-1991', 'dd-mm-yyyy'), to_date('25-09-2015', 'dd-mm-yyyy'), 44177, 'Rossellini', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-08-1991', 'dd-mm-yyyy'), to_date('18-08-1999', 'dd-mm-yyyy'), 37337, 'Suvari', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('28-09-1991', 'dd-mm-yyyy'), to_date('01-04-2013', 'dd-mm-yyyy'), 22432, 'Rockwell', 35, 1234);
commit;
prompt 700 records committed...
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-04-1992', 'dd-mm-yyyy'), to_date('22-08-2004', 'dd-mm-yyyy'), 68948, 'Dillane', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-09-1993', 'dd-mm-yyyy'), to_date('15-01-2002', 'dd-mm-yyyy'), 53333, 'Potter', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('20-03-1992', 'dd-mm-yyyy'), to_date('04-04-2016', 'dd-mm-yyyy'), 92861, 'Dorn', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-06-1990', 'dd-mm-yyyy'), to_date('14-05-2015', 'dd-mm-yyyy'), 12416, 'Boothe', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-06-1990', 'dd-mm-yyyy'), to_date('27-07-2010', 'dd-mm-yyyy'), 75579, 'Blair', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-09-1993', 'dd-mm-yyyy'), to_date('15-09-2014', 'dd-mm-yyyy'), 52623, 'Cozier', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-03-1995', 'dd-mm-yyyy'), to_date('31-07-2009', 'dd-mm-yyyy'), 93288, 'Oakenfold', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-04-1992', 'dd-mm-yyyy'), to_date('13-04-2003', 'dd-mm-yyyy'), 68769, 'Duschel', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('04-02-1990', 'dd-mm-yyyy'), to_date('10-08-2000', 'dd-mm-yyyy'), 49362, 'Unger', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('01-11-1995', 'dd-mm-yyyy'), to_date('14-07-2014', 'dd-mm-yyyy'), 22686, 'Kirkwood', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-07-1994', 'dd-mm-yyyy'), to_date('12-04-1999', 'dd-mm-yyyy'), 85838, 'Wen', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-08-1990', 'dd-mm-yyyy'), to_date('07-10-2013', 'dd-mm-yyyy'), 94378, 'Robbins', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-06-1993', 'dd-mm-yyyy'), to_date('29-01-2011', 'dd-mm-yyyy'), 56563, 'Winger', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('02-04-1990', 'dd-mm-yyyy'), to_date('29-07-1998', 'dd-mm-yyyy'), 39678, 'De Almeida', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-08-1992', 'dd-mm-yyyy'), to_date('05-11-2003', 'dd-mm-yyyy'), 71118, 'Ward', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('08-09-1990', 'dd-mm-yyyy'), to_date('20-03-2017', 'dd-mm-yyyy'), 94964, 'Chappelle', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-03-1994', 'dd-mm-yyyy'), to_date('19-01-2009', 'dd-mm-yyyy'), 63367, 'DeVito', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-03-1994', 'dd-mm-yyyy'), to_date('10-08-2005', 'dd-mm-yyyy'), 83295, 'Christie', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-09-1996', 'dd-mm-yyyy'), to_date('30-05-2013', 'dd-mm-yyyy'), 72447, 'Pacino', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('15-11-1992', 'dd-mm-yyyy'), to_date('21-01-2009', 'dd-mm-yyyy'), 24395, 'Webb', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('26-01-1992', 'dd-mm-yyyy'), to_date('29-07-2011', 'dd-mm-yyyy'), 98189, 'Rossellini', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-04-1995', 'dd-mm-yyyy'), to_date('16-06-2018', 'dd-mm-yyyy'), 29741, 'Mohr', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-02-1992', 'dd-mm-yyyy'), to_date('31-05-2002', 'dd-mm-yyyy'), 12917, 'Colin Youn', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-09-1990', 'dd-mm-yyyy'), to_date('04-01-1998', 'dd-mm-yyyy'), 77927, 'Keaton', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('10-12-1996', 'dd-mm-yyyy'), to_date('12-10-2002', 'dd-mm-yyyy'), 57876, 'Grant', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-07-1993', 'dd-mm-yyyy'), to_date('18-03-2005', 'dd-mm-yyyy'), 17938, 'Watley', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-11-1995', 'dd-mm-yyyy'), to_date('14-02-2004', 'dd-mm-yyyy'), 26168, 'Hunt', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('12-12-1996', 'dd-mm-yyyy'), to_date('24-03-2001', 'dd-mm-yyyy'), 77892, 'Cherry', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('30-09-1995', 'dd-mm-yyyy'), to_date('20-11-2000', 'dd-mm-yyyy'), 53558, 'Frost', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-06-1994', 'dd-mm-yyyy'), to_date('18-04-2011', 'dd-mm-yyyy'), 36829, 'Nicholas', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('07-02-1995', 'dd-mm-yyyy'), to_date('08-02-2005', 'dd-mm-yyyy'), 38496, 'Pryce', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('29-07-1993', 'dd-mm-yyyy'), to_date('02-05-2002', 'dd-mm-yyyy'), 27719, 'Balin', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('25-08-1992', 'dd-mm-yyyy'), to_date('25-01-2011', 'dd-mm-yyyy'), 33531, 'Schiff', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('22-08-1995', 'dd-mm-yyyy'), to_date('03-06-2016', 'dd-mm-yyyy'), 99166, 'Garber', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-02-1995', 'dd-mm-yyyy'), to_date('02-07-2011', 'dd-mm-yyyy'), 76424, 'Deschanel', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-09-1993', 'dd-mm-yyyy'), to_date('16-04-2004', 'dd-mm-yyyy'), 51962, 'Smith', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('11-06-1990', 'dd-mm-yyyy'), to_date('27-02-2018', 'dd-mm-yyyy'), 14969, 'Everett', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-04-1995', 'dd-mm-yyyy'), to_date('14-06-2018', 'dd-mm-yyyy'), 99225, 'Malone', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-09-1993', 'dd-mm-yyyy'), to_date('14-03-2001', 'dd-mm-yyyy'), 31232, 'Weston', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('14-05-1992', 'dd-mm-yyyy'), to_date('14-03-2001', 'dd-mm-yyyy'), 91569, 'Tilly', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('24-10-1996', 'dd-mm-yyyy'), to_date('22-04-2019', 'dd-mm-yyyy'), 14634, 'Hedaya', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-05-1993', 'dd-mm-yyyy'), to_date('24-01-2014', 'dd-mm-yyyy'), 55167, 'Hyde', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-08-1994', 'dd-mm-yyyy'), to_date('27-11-2003', 'dd-mm-yyyy'), 17839, 'Aglukark', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('06-06-1994', 'dd-mm-yyyy'), to_date('01-12-2000', 'dd-mm-yyyy'), 61543, 'Weller', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('21-07-1992', 'dd-mm-yyyy'), to_date('08-06-2008', 'dd-mm-yyyy'), 25133, 'Bush', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('16-11-1993', 'dd-mm-yyyy'), to_date('13-05-2008', 'dd-mm-yyyy'), 13524, 'Amos', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('17-01-1990', 'dd-mm-yyyy'), to_date('17-01-2001', 'dd-mm-yyyy'), 59621, 'Broadbent', 36, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('23-02-1994', 'dd-mm-yyyy'), to_date('05-08-2010', 'dd-mm-yyyy'), 25158, 'Quaid', 37, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('18-09-1994', 'dd-mm-yyyy'), to_date('15-08-2000', 'dd-mm-yyyy'), 33846, 'Copeland', 34, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('03-06-1995', 'dd-mm-yyyy'), to_date('08-02-2013', 'dd-mm-yyyy'), 53284, 'Fogerty', 35, 1234);
insert into CRUISE (begin_date, end_date, cruise_number, cruise_name, p_id, ship_id)
values (to_date('27-10-1994', 'dd-mm-yyyy'), to_date('19-04-2005', 'dd-mm-yyyy'), 29249, 'Sainte-Mar', 34, 1234);
commit;
prompt 751 records loaded
prompt Loading SPA...
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (1, 10, 18, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (2, 10, 15, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (3, 10, 16, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (4, 10, 18, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (649563, 9, 16, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (164941, 8, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (659733, 7, 14, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (682737, 10, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (799517, 10, 7, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (322642, 8, 17, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (972597, 9, 16, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (779992, 9, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (386942, 7, 18, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (382664, 7, 12, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (748526, 10, 17, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (465368, 9, 6, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (732353, 10, 9, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (439131, 10, 6, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (961198, 10, 8, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (491314, 7, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (523354, 10, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (426745, 10, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (912682, 8, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (946312, 8, 9, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (771482, 9, 16, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (774662, 8, 14, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (482312, 10, 17, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (638853, 9, 11, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (163536, 9, 16, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (264313, 7, 7, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (524315, 9, 10, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (322563, 8, 13, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (794758, 10, 14, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (882627, 10, 15, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (331839, 7, 8, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (275458, 7, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (451533, 8, 11, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (844169, 9, 11, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (549496, 7, 14, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (155444, 10, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (337547, 7, 16, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (113479, 10, 15, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (959213, 10, 8, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (618126, 8, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (885391, 10, 14, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (483621, 10, 16, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (474398, 10, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (714477, 8, 14, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (986725, 8, 17, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (223141, 10, 18, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (476579, 7, 11, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (814158, 9, 6, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (539393, 9, 12, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (568537, 7, 18, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (719621, 7, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (984482, 7, 12, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (442669, 8, 9, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (462583, 8, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (457571, 9, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (316861, 7, 8, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (276361, 10, 6, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (577838, 7, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (912769, 10, 9, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (379485, 9, 11, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (733386, 8, 8, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (388673, 7, 15, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (588651, 7, 7, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (852793, 7, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (153944, 8, 17, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (947652, 10, 16, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (317835, 9, 7, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (993862, 9, 14, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (989496, 10, 11, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (533745, 9, 15, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (178972, 7, 11, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (728559, 10, 16, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (284862, 10, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (495255, 9, 12, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (886979, 9, 12, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (113179, 7, 6, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (952165, 8, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (715524, 9, 14, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (483444, 9, 18, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (376292, 10, 9, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (555494, 8, 8, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (498699, 7, 18, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (896578, 8, 7, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (593515, 9, 6, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (269233, 10, 7, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (567526, 10, 8, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (195176, 8, 14, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (662374, 9, 16, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (515534, 8, 15, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (863977, 10, 6, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (966414, 10, 6, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (631951, 10, 15, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (144355, 9, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (757628, 9, 12, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (855838, 9, 18, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (562841, 9, 8, 23);
commit;
prompt 100 records committed...
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (525143, 8, 9, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (984735, 8, 12, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (426888, 7, 6, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (584357, 7, 12, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (423922, 10, 11, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (865161, 8, 12, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (461286, 8, 16, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (715568, 10, 14, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (921487, 7, 13, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (629185, 9, 14, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (232988, 8, 15, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (341878, 9, 6, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (895616, 8, 16, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (323584, 8, 13, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (116216, 8, 13, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (211182, 10, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (127464, 7, 14, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (799422, 10, 13, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (915716, 8, 8, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (494851, 7, 11, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (174764, 7, 16, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (393316, 10, 17, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (575899, 9, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (254235, 10, 6, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (741378, 7, 16, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (663917, 8, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (722847, 9, 17, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (443456, 10, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (161789, 7, 12, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (688336, 7, 9, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (313694, 8, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (547386, 10, 12, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (784642, 7, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (235272, 8, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (444515, 9, 8, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (657132, 7, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (618383, 9, 9, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (341357, 10, 16, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (519151, 7, 9, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (239416, 8, 14, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (526874, 8, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (161383, 10, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (289461, 7, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (567187, 10, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (298867, 7, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (132979, 10, 7, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (888138, 10, 18, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (458581, 9, 14, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (499592, 8, 8, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (154658, 7, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (522657, 10, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (495466, 7, 14, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (533153, 7, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (313746, 8, 10, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (498262, 9, 7, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (772699, 9, 7, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (729613, 10, 7, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (672739, 8, 11, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (711586, 7, 11, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (357578, 10, 10, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (547687, 8, 11, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (573635, 7, 16, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (131631, 10, 12, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (556377, 8, 15, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (636824, 7, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (193563, 9, 17, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (329458, 7, 14, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (229529, 10, 14, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (966658, 9, 9, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (758155, 8, 15, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (167278, 9, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (271565, 9, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (438811, 7, 9, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (198837, 7, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (623436, 8, 14, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (319652, 9, 10, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (684632, 8, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (564213, 7, 9, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (358694, 9, 12, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (834492, 7, 18, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (236351, 8, 9, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (425234, 10, 11, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (264397, 9, 10, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (967452, 8, 6, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (253495, 9, 16, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (243519, 8, 12, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (375253, 7, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (387534, 8, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (322537, 7, 8, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (599576, 8, 18, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (774564, 9, 16, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (478763, 7, 15, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (957464, 8, 16, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (463537, 9, 6, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (458158, 8, 8, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (352575, 9, 10, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (296245, 7, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (515162, 8, 10, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (514392, 10, 12, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (273272, 8, 14, 21);
commit;
prompt 200 records committed...
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (829581, 8, 15, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (953584, 9, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (938139, 10, 10, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (591642, 7, 9, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (215859, 9, 9, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (798453, 8, 10, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (964776, 9, 11, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (755144, 10, 15, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (365712, 7, 7, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (757149, 8, 17, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (797273, 10, 13, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (762372, 7, 14, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (728896, 7, 15, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (695316, 9, 13, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (222914, 8, 18, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (153314, 8, 12, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (753162, 7, 7, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (565587, 8, 14, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (346353, 10, 15, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (861679, 7, 13, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (922636, 9, 9, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (449612, 8, 6, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (341819, 7, 6, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (314267, 9, 18, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (999591, 10, 15, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (884666, 10, 9, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (886512, 7, 13, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (984731, 8, 8, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (481768, 7, 17, 20);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (852922, 7, 14, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (953332, 7, 17, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (593955, 10, 13, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (953441, 8, 18, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (668113, 8, 17, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (735488, 7, 8, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (688135, 8, 13, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (311747, 7, 16, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (727692, 9, 15, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (893256, 9, 10, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (426629, 9, 17, 22);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (356533, 8, 12, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (848939, 10, 13, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (395497, 10, 8, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (497249, 7, 6, 21);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (728751, 8, 11, 23);
insert into SPA (spa_number, spa_open_hours, entrence_age, spa_close_hours)
values (696562, 9, 17, 21);
commit;
prompt 246 records loaded
prompt Loading GO_TO...
insert into GO_TO (client_id, spa_number)
values (10666, 127464);
insert into GO_TO (client_id, spa_number)
values (11898, 852922);
insert into GO_TO (client_id, spa_number)
values (13887, 631951);
insert into GO_TO (client_id, spa_number)
values (14031, 223141);
insert into GO_TO (client_id, spa_number)
values (14707, 144355);
insert into GO_TO (client_id, spa_number)
values (15480, 728751);
insert into GO_TO (client_id, spa_number)
values (16035, 357578);
insert into GO_TO (client_id, spa_number)
values (16097, 921487);
insert into GO_TO (client_id, spa_number)
values (17800, 474398);
insert into GO_TO (client_id, spa_number)
values (17846, 341878);
insert into GO_TO (client_id, spa_number)
values (22281, 163536);
insert into GO_TO (client_id, spa_number)
values (22545, 462583);
insert into GO_TO (client_id, spa_number)
values (23283, 865161);
insert into GO_TO (client_id, spa_number)
values (23526, 696562);
insert into GO_TO (client_id, spa_number)
values (26085, 577838);
insert into GO_TO (client_id, spa_number)
values (26286, 672739);
insert into GO_TO (client_id, spa_number)
values (26751, 322537);
insert into GO_TO (client_id, spa_number)
values (27383, 993862);
insert into GO_TO (client_id, spa_number)
values (28186, 727692);
insert into GO_TO (client_id, spa_number)
values (29318, 113179);
insert into GO_TO (client_id, spa_number)
values (30800, 757628);
insert into GO_TO (client_id, spa_number)
values (32802, 317835);
insert into GO_TO (client_id, spa_number)
values (33535, 341357);
insert into GO_TO (client_id, spa_number)
values (34220, 774564);
insert into GO_TO (client_id, spa_number)
values (35151, 772699);
insert into GO_TO (client_id, spa_number)
values (35855, 236351);
insert into GO_TO (client_id, spa_number)
values (35855, 735488);
insert into GO_TO (client_id, spa_number)
values (36188, 319652);
insert into GO_TO (client_id, spa_number)
values (36964, 289461);
insert into GO_TO (client_id, spa_number)
values (39798, 317835);
insert into GO_TO (client_id, spa_number)
values (39798, 719621);
insert into GO_TO (client_id, spa_number)
values (41455, 547386);
insert into GO_TO (client_id, spa_number)
values (41584, 478763);
insert into GO_TO (client_id, spa_number)
values (41584, 961198);
insert into GO_TO (client_id, spa_number)
values (45648, 515534);
insert into GO_TO (client_id, spa_number)
values (45648, 525143);
insert into GO_TO (client_id, spa_number)
values (46529, 193563);
insert into GO_TO (client_id, spa_number)
values (47273, 515534);
insert into GO_TO (client_id, spa_number)
values (47875, 533745);
insert into GO_TO (client_id, spa_number)
values (48251, 116216);
insert into GO_TO (client_id, spa_number)
values (48393, 423922);
insert into GO_TO (client_id, spa_number)
values (48445, 733386);
insert into GO_TO (client_id, spa_number)
values (48445, 884666);
insert into GO_TO (client_id, spa_number)
values (48740, 896578);
insert into GO_TO (client_id, spa_number)
values (50502, 393316);
insert into GO_TO (client_id, spa_number)
values (50945, 834492);
insert into GO_TO (client_id, spa_number)
values (51110, 271565);
insert into GO_TO (client_id, spa_number)
values (51370, 387534);
insert into GO_TO (client_id, spa_number)
values (51370, 663917);
insert into GO_TO (client_id, spa_number)
values (51786, 161789);
insert into GO_TO (client_id, spa_number)
values (51903, 593515);
insert into GO_TO (client_id, spa_number)
values (51903, 695316);
insert into GO_TO (client_id, spa_number)
values (51903, 888138);
insert into GO_TO (client_id, spa_number)
values (52069, 276361);
insert into GO_TO (client_id, spa_number)
values (53672, 729613);
insert into GO_TO (client_id, spa_number)
values (54352, 167278);
insert into GO_TO (client_id, spa_number)
values (54353, 961198);
insert into GO_TO (client_id, spa_number)
values (54637, 861679);
insert into GO_TO (client_id, spa_number)
values (55473, 458158);
insert into GO_TO (client_id, spa_number)
values (55750, 474398);
insert into GO_TO (client_id, spa_number)
values (55792, 161789);
insert into GO_TO (client_id, spa_number)
values (55792, 254235);
insert into GO_TO (client_id, spa_number)
values (55792, 829581);
insert into GO_TO (client_id, spa_number)
values (56526, 458581);
insert into GO_TO (client_id, spa_number)
values (56831, 524315);
insert into GO_TO (client_id, spa_number)
values (56831, 631951);
insert into GO_TO (client_id, spa_number)
values (57161, 896578);
insert into GO_TO (client_id, spa_number)
values (58154, 741378);
insert into GO_TO (client_id, spa_number)
values (58567, 863977);
insert into GO_TO (client_id, spa_number)
values (58652, 562841);
insert into GO_TO (client_id, spa_number)
values (59600, 727692);
insert into GO_TO (client_id, spa_number)
values (59858, 341878);
insert into GO_TO (client_id, spa_number)
values (60542, 714477);
insert into GO_TO (client_id, spa_number)
values (60640, 195176);
insert into GO_TO (client_id, spa_number)
values (61305, 961198);
insert into GO_TO (client_id, spa_number)
values (61613, 618126);
insert into GO_TO (client_id, spa_number)
values (62115, 986725);
insert into GO_TO (client_id, spa_number)
values (62793, 132979);
insert into GO_TO (client_id, spa_number)
values (63353, 426888);
insert into GO_TO (client_id, spa_number)
values (63634, 912769);
insert into GO_TO (client_id, spa_number)
values (67710, 232988);
insert into GO_TO (client_id, spa_number)
values (69094, 494851);
insert into GO_TO (client_id, spa_number)
values (70228, 131631);
insert into GO_TO (client_id, spa_number)
values (71384, 495255);
insert into GO_TO (client_id, spa_number)
values (71384, 638853);
insert into GO_TO (client_id, spa_number)
values (73791, 243519);
insert into GO_TO (client_id, spa_number)
values (73791, 953332);
insert into GO_TO (client_id, spa_number)
values (74830, 498699);
insert into GO_TO (client_id, spa_number)
values (74994, 442669);
insert into GO_TO (client_id, spa_number)
values (75397, 271565);
insert into GO_TO (client_id, spa_number)
values (75397, 296245);
insert into GO_TO (client_id, spa_number)
values (75622, 741378);
insert into GO_TO (client_id, spa_number)
values (76520, 779992);
insert into GO_TO (client_id, spa_number)
values (77026, 711586);
insert into GO_TO (client_id, spa_number)
values (77581, 273272);
insert into GO_TO (client_id, spa_number)
values (78109, 525143);
insert into GO_TO (client_id, spa_number)
values (82200, 311747);
insert into GO_TO (client_id, spa_number)
values (82466, 568537);
insert into GO_TO (client_id, spa_number)
values (82892, 794758);
insert into GO_TO (client_id, spa_number)
values (82943, 629185);
commit;
prompt 100 records committed...
insert into GO_TO (client_id, spa_number)
values (83330, 113179);
insert into GO_TO (client_id, spa_number)
values (83330, 365712);
insert into GO_TO (client_id, spa_number)
values (84013, 387534);
insert into GO_TO (client_id, spa_number)
values (84723, 834492);
insert into GO_TO (client_id, spa_number)
values (85570, 161383);
insert into GO_TO (client_id, spa_number)
values (85570, 229529);
insert into GO_TO (client_id, spa_number)
values (86879, 386942);
insert into GO_TO (client_id, spa_number)
values (88675, 113179);
insert into GO_TO (client_id, spa_number)
values (88675, 275458);
insert into GO_TO (client_id, spa_number)
values (88798, 727692);
insert into GO_TO (client_id, spa_number)
values (88798, 798453);
insert into GO_TO (client_id, spa_number)
values (92672, 984731);
insert into GO_TO (client_id, spa_number)
values (94238, 116216);
insert into GO_TO (client_id, spa_number)
values (94349, 462583);
insert into GO_TO (client_id, spa_number)
values (94811, 491314);
insert into GO_TO (client_id, spa_number)
values (95055, 772699);
insert into GO_TO (client_id, spa_number)
values (95269, 463537);
insert into GO_TO (client_id, spa_number)
values (95826, 912682);
insert into GO_TO (client_id, spa_number)
values (96258, 239416);
insert into GO_TO (client_id, spa_number)
values (96258, 986725);
insert into GO_TO (client_id, spa_number)
values (96268, 715524);
insert into GO_TO (client_id, spa_number)
values (96751, 577838);
insert into GO_TO (client_id, spa_number)
values (98656, 462583);
insert into GO_TO (client_id, spa_number)
values (99866, 449612);
insert into GO_TO (client_id, spa_number)
values (99866, 668113);
commit;
prompt 125 records loaded
prompt Loading INCLUDE...
insert into INCLUDE (p_id, city_id)
values (34, 34767);
insert into INCLUDE (p_id, city_id)
values (1165621, 56812);
insert into INCLUDE (p_id, city_id)
values (1166272, 23677);
insert into INCLUDE (p_id, city_id)
values (1167347, 15758);
insert into INCLUDE (p_id, city_id)
values (1235178, 51373);
insert into INCLUDE (p_id, city_id)
values (1283317, 89943);
insert into INCLUDE (p_id, city_id)
values (1287738, 25353);
insert into INCLUDE (p_id, city_id)
values (1319741, 79913);
insert into INCLUDE (p_id, city_id)
values (1323414, 78576);
insert into INCLUDE (p_id, city_id)
values (1327873, 39855);
insert into INCLUDE (p_id, city_id)
values (1329894, 52655);
insert into INCLUDE (p_id, city_id)
values (1332226, 49695);
insert into INCLUDE (p_id, city_id)
values (1339656, 69226);
insert into INCLUDE (p_id, city_id)
values (1414656, 26738);
insert into INCLUDE (p_id, city_id)
values (1416944, 83728);
insert into INCLUDE (p_id, city_id)
values (1451338, 74765);
insert into INCLUDE (p_id, city_id)
values (1477319, 27848);
insert into INCLUDE (p_id, city_id)
values (1477319, 84983);
insert into INCLUDE (p_id, city_id)
values (1524334, 42858);
insert into INCLUDE (p_id, city_id)
values (1581346, 14681);
insert into INCLUDE (p_id, city_id)
values (1581346, 57129);
insert into INCLUDE (p_id, city_id)
values (1611834, 68413);
insert into INCLUDE (p_id, city_id)
values (1636948, 83728);
insert into INCLUDE (p_id, city_id)
values (1742546, 78666);
insert into INCLUDE (p_id, city_id)
values (1813662, 54799);
insert into INCLUDE (p_id, city_id)
values (1918171, 49695);
insert into INCLUDE (p_id, city_id)
values (1979679, 35385);
insert into INCLUDE (p_id, city_id)
values (2126896, 84983);
insert into INCLUDE (p_id, city_id)
values (2242316, 25715);
insert into INCLUDE (p_id, city_id)
values (2242316, 64313);
insert into INCLUDE (p_id, city_id)
values (2242316, 97631);
insert into INCLUDE (p_id, city_id)
values (2294951, 22758);
insert into INCLUDE (p_id, city_id)
values (2294951, 44541);
insert into INCLUDE (p_id, city_id)
values (2294951, 88487);
insert into INCLUDE (p_id, city_id)
values (2331582, 59867);
insert into INCLUDE (p_id, city_id)
values (2337364, 37472);
insert into INCLUDE (p_id, city_id)
values (2337364, 37552);
insert into INCLUDE (p_id, city_id)
values (2337364, 98451);
insert into INCLUDE (p_id, city_id)
values (2381862, 74481);
insert into INCLUDE (p_id, city_id)
values (2442477, 65287);
insert into INCLUDE (p_id, city_id)
values (2536569, 23388);
insert into INCLUDE (p_id, city_id)
values (2536569, 41641);
insert into INCLUDE (p_id, city_id)
values (2559192, 54552);
insert into INCLUDE (p_id, city_id)
values (2559192, 93571);
insert into INCLUDE (p_id, city_id)
values (2731517, 21743);
insert into INCLUDE (p_id, city_id)
values (2792632, 21743);
insert into INCLUDE (p_id, city_id)
values (2792632, 71348);
insert into INCLUDE (p_id, city_id)
values (2868396, 49695);
insert into INCLUDE (p_id, city_id)
values (2868396, 76793);
insert into INCLUDE (p_id, city_id)
values (2887572, 96859);
insert into INCLUDE (p_id, city_id)
values (2976146, 25715);
insert into INCLUDE (p_id, city_id)
values (2976146, 89279);
insert into INCLUDE (p_id, city_id)
values (3421713, 31622);
insert into INCLUDE (p_id, city_id)
values (3421713, 64716);
insert into INCLUDE (p_id, city_id)
values (3695359, 94794);
insert into INCLUDE (p_id, city_id)
values (3719373, 65287);
insert into INCLUDE (p_id, city_id)
values (3787163, 33257);
insert into INCLUDE (p_id, city_id)
values (3823582, 83225);
insert into INCLUDE (p_id, city_id)
values (3852536, 21743);
insert into INCLUDE (p_id, city_id)
values (3887484, 27848);
insert into INCLUDE (p_id, city_id)
values (3887484, 31443);
insert into INCLUDE (p_id, city_id)
values (3957289, 96494);
insert into INCLUDE (p_id, city_id)
values (3994793, 47415);
insert into INCLUDE (p_id, city_id)
values (4122116, 32125);
insert into INCLUDE (p_id, city_id)
values (4132929, 49695);
insert into INCLUDE (p_id, city_id)
values (4232957, 14681);
insert into INCLUDE (p_id, city_id)
values (4279746, 79913);
insert into INCLUDE (p_id, city_id)
values (4331164, 73455);
insert into INCLUDE (p_id, city_id)
values (4344412, 46824);
insert into INCLUDE (p_id, city_id)
values (4344749, 26546);
insert into INCLUDE (p_id, city_id)
values (4344749, 39855);
insert into INCLUDE (p_id, city_id)
values (4344749, 83728);
insert into INCLUDE (p_id, city_id)
values (4353934, 93343);
insert into INCLUDE (p_id, city_id)
values (4613445, 94794);
insert into INCLUDE (p_id, city_id)
values (4626636, 41987);
insert into INCLUDE (p_id, city_id)
values (4638138, 83674);
insert into INCLUDE (p_id, city_id)
values (4641468, 25856);
insert into INCLUDE (p_id, city_id)
values (4684198, 88824);
insert into INCLUDE (p_id, city_id)
values (4767916, 58319);
insert into INCLUDE (p_id, city_id)
values (4779722, 74147);
insert into INCLUDE (p_id, city_id)
values (4845848, 15945);
insert into INCLUDE (p_id, city_id)
values (4934994, 75745);
insert into INCLUDE (p_id, city_id)
values (4953119, 71955);
insert into INCLUDE (p_id, city_id)
values (4984953, 34565);
insert into INCLUDE (p_id, city_id)
values (5135735, 82637);
insert into INCLUDE (p_id, city_id)
values (5189544, 23388);
insert into INCLUDE (p_id, city_id)
values (5221291, 54397);
insert into INCLUDE (p_id, city_id)
values (5239327, 85492);
insert into INCLUDE (p_id, city_id)
values (5456142, 43678);
insert into INCLUDE (p_id, city_id)
values (5456142, 56648);
insert into INCLUDE (p_id, city_id)
values (5527413, 29413);
insert into INCLUDE (p_id, city_id)
values (5541854, 94356);
insert into INCLUDE (p_id, city_id)
values (5583179, 43678);
insert into INCLUDE (p_id, city_id)
values (5583179, 54397);
insert into INCLUDE (p_id, city_id)
values (5679344, 31476);
insert into INCLUDE (p_id, city_id)
values (5785526, 57129);
insert into INCLUDE (p_id, city_id)
values (5952534, 13752);
insert into INCLUDE (p_id, city_id)
values (5952534, 43347);
insert into INCLUDE (p_id, city_id)
values (5952534, 56798);
insert into INCLUDE (p_id, city_id)
values (6194989, 35978);
commit;
prompt 100 records committed...
insert into INCLUDE (p_id, city_id)
values (6194989, 78633);
insert into INCLUDE (p_id, city_id)
values (6226369, 82864);
insert into INCLUDE (p_id, city_id)
values (6226369, 94356);
insert into INCLUDE (p_id, city_id)
values (6255178, 35599);
insert into INCLUDE (p_id, city_id)
values (6255178, 39855);
insert into INCLUDE (p_id, city_id)
values (6364664, 83261);
insert into INCLUDE (p_id, city_id)
values (6374552, 51454);
insert into INCLUDE (p_id, city_id)
values (6467118, 37368);
insert into INCLUDE (p_id, city_id)
values (6482871, 92879);
insert into INCLUDE (p_id, city_id)
values (6649949, 87287);
insert into INCLUDE (p_id, city_id)
values (6673258, 45553);
insert into INCLUDE (p_id, city_id)
values (6784478, 52655);
insert into INCLUDE (p_id, city_id)
values (6788839, 49695);
insert into INCLUDE (p_id, city_id)
values (6875699, 76793);
insert into INCLUDE (p_id, city_id)
values (6892212, 31567);
insert into INCLUDE (p_id, city_id)
values (6892212, 34738);
insert into INCLUDE (p_id, city_id)
values (6959195, 22758);
insert into INCLUDE (p_id, city_id)
values (7117199, 35599);
insert into INCLUDE (p_id, city_id)
values (7321644, 38784);
insert into INCLUDE (p_id, city_id)
values (7389582, 26678);
insert into INCLUDE (p_id, city_id)
values (7394899, 26546);
insert into INCLUDE (p_id, city_id)
values (7394899, 34767);
insert into INCLUDE (p_id, city_id)
values (7414557, 75745);
insert into INCLUDE (p_id, city_id)
values (7414557, 86198);
insert into INCLUDE (p_id, city_id)
values (7491373, 34565);
insert into INCLUDE (p_id, city_id)
values (7491373, 97631);
insert into INCLUDE (p_id, city_id)
values (7615295, 34565);
insert into INCLUDE (p_id, city_id)
values (7642732, 28468);
insert into INCLUDE (p_id, city_id)
values (7642732, 76464);
insert into INCLUDE (p_id, city_id)
values (7656935, 56245);
insert into INCLUDE (p_id, city_id)
values (7687656, 13547);
insert into INCLUDE (p_id, city_id)
values (7695566, 25956);
insert into INCLUDE (p_id, city_id)
values (7739522, 31476);
insert into INCLUDE (p_id, city_id)
values (7739522, 78576);
insert into INCLUDE (p_id, city_id)
values (7959281, 94728);
insert into INCLUDE (p_id, city_id)
values (8162148, 93571);
insert into INCLUDE (p_id, city_id)
values (8256564, 22758);
insert into INCLUDE (p_id, city_id)
values (8297685, 51373);
insert into INCLUDE (p_id, city_id)
values (8383827, 37779);
insert into INCLUDE (p_id, city_id)
values (8383827, 74765);
insert into INCLUDE (p_id, city_id)
values (8438943, 25856);
insert into INCLUDE (p_id, city_id)
values (8528641, 37837);
insert into INCLUDE (p_id, city_id)
values (8691779, 25742);
insert into INCLUDE (p_id, city_id)
values (9124477, 22312);
insert into INCLUDE (p_id, city_id)
values (9124477, 26546);
insert into INCLUDE (p_id, city_id)
values (9124477, 48492);
insert into INCLUDE (p_id, city_id)
values (9179227, 27129);
insert into INCLUDE (p_id, city_id)
values (9221178, 74168);
insert into INCLUDE (p_id, city_id)
values (9344642, 19185);
insert into INCLUDE (p_id, city_id)
values (9344642, 21271);
insert into INCLUDE (p_id, city_id)
values (9374261, 56921);
insert into INCLUDE (p_id, city_id)
values (9374261, 78576);
insert into INCLUDE (p_id, city_id)
values (9377242, 93325);
insert into INCLUDE (p_id, city_id)
values (9466737, 87465);
insert into INCLUDE (p_id, city_id)
values (9471293, 74527);
insert into INCLUDE (p_id, city_id)
values (9481781, 24219);
insert into INCLUDE (p_id, city_id)
values (9481781, 26738);
insert into INCLUDE (p_id, city_id)
values (9571214, 25715);
insert into INCLUDE (p_id, city_id)
values (9571214, 67826);
insert into INCLUDE (p_id, city_id)
values (9586279, 13596);
insert into INCLUDE (p_id, city_id)
values (9586279, 38784);
insert into INCLUDE (p_id, city_id)
values (9765193, 19985);
insert into INCLUDE (p_id, city_id)
values (9765193, 68464);
insert into INCLUDE (p_id, city_id)
values (9831282, 39192);
insert into INCLUDE (p_id, city_id)
values (9839867, 15136);
insert into INCLUDE (p_id, city_id)
values (9865155, 87465);
insert into INCLUDE (p_id, city_id)
values (9872436, 25353);
insert into INCLUDE (p_id, city_id)
values (9929452, 93325);
insert into INCLUDE (p_id, city_id)
values (9951384, 24544);
insert into INCLUDE (p_id, city_id)
values (9951384, 31622);
insert into INCLUDE (p_id, city_id)
values (9951384, 81149);
commit;
prompt 171 records loaded
prompt Loading PARTICIPATE...
insert into PARTICIPATE (client_id, atraction_number)
values (10051, 2124746);
insert into PARTICIPATE (client_id, atraction_number)
values (10666, 1252155);
insert into PARTICIPATE (client_id, atraction_number)
values (11898, 4324184);
insert into PARTICIPATE (client_id, atraction_number)
values (12281, 1623325);
insert into PARTICIPATE (client_id, atraction_number)
values (12604, 2727592);
insert into PARTICIPATE (client_id, atraction_number)
values (13853, 1233);
insert into PARTICIPATE (client_id, atraction_number)
values (13853, 6665866);
insert into PARTICIPATE (client_id, atraction_number)
values (14011, 5893237);
insert into PARTICIPATE (client_id, atraction_number)
values (14031, 2727592);
insert into PARTICIPATE (client_id, atraction_number)
values (15480, 2893);
insert into PARTICIPATE (client_id, atraction_number)
values (15480, 4264622);
insert into PARTICIPATE (client_id, atraction_number)
values (15480, 7711256);
insert into PARTICIPATE (client_id, atraction_number)
values (16097, 4481767);
insert into PARTICIPATE (client_id, atraction_number)
values (17846, 8321973);
insert into PARTICIPATE (client_id, atraction_number)
values (18823, 6694516);
insert into PARTICIPATE (client_id, atraction_number)
values (21392, 5964426);
insert into PARTICIPATE (client_id, atraction_number)
values (22197, 3827577);
insert into PARTICIPATE (client_id, atraction_number)
values (22281, 1734946);
insert into PARTICIPATE (client_id, atraction_number)
values (22562, 7268);
insert into PARTICIPATE (client_id, atraction_number)
values (22936, 7548353);
insert into PARTICIPATE (client_id, atraction_number)
values (23283, 7346323);
insert into PARTICIPATE (client_id, atraction_number)
values (23399, 2213241);
insert into PARTICIPATE (client_id, atraction_number)
values (23526, 9644488);
insert into PARTICIPATE (client_id, atraction_number)
values (24210, 9213891);
insert into PARTICIPATE (client_id, atraction_number)
values (24638, 7268);
insert into PARTICIPATE (client_id, atraction_number)
values (25387, 5412);
insert into PARTICIPATE (client_id, atraction_number)
values (25901, 4186644);
insert into PARTICIPATE (client_id, atraction_number)
values (25901, 9461856);
insert into PARTICIPATE (client_id, atraction_number)
values (26286, 8321973);
insert into PARTICIPATE (client_id, atraction_number)
values (26750, 3146867);
insert into PARTICIPATE (client_id, atraction_number)
values (27383, 18);
insert into PARTICIPATE (client_id, atraction_number)
values (28035, 9372);
insert into PARTICIPATE (client_id, atraction_number)
values (28550, 4754973);
insert into PARTICIPATE (client_id, atraction_number)
values (30851, 7114432);
insert into PARTICIPATE (client_id, atraction_number)
values (31176, 2259613);
insert into PARTICIPATE (client_id, atraction_number)
values (31176, 5656398);
insert into PARTICIPATE (client_id, atraction_number)
values (34387, 2349772);
insert into PARTICIPATE (client_id, atraction_number)
values (34461, 9117592);
insert into PARTICIPATE (client_id, atraction_number)
values (35395, 9965964);
insert into PARTICIPATE (client_id, atraction_number)
values (37377, 9887274);
insert into PARTICIPATE (client_id, atraction_number)
values (37507, 3521494);
insert into PARTICIPATE (client_id, atraction_number)
values (37507, 8354638);
insert into PARTICIPATE (client_id, atraction_number)
values (38209, 3724);
insert into PARTICIPATE (client_id, atraction_number)
values (38750, 6256743);
insert into PARTICIPATE (client_id, atraction_number)
values (38750, 8478283);
insert into PARTICIPATE (client_id, atraction_number)
values (39192, 3959835);
insert into PARTICIPATE (client_id, atraction_number)
values (39192, 7212299);
insert into PARTICIPATE (client_id, atraction_number)
values (39798, 7733232);
insert into PARTICIPATE (client_id, atraction_number)
values (40638, 8367);
insert into PARTICIPATE (client_id, atraction_number)
values (40638, 7771682);
insert into PARTICIPATE (client_id, atraction_number)
values (40687, 8289);
insert into PARTICIPATE (client_id, atraction_number)
values (40735, 3268932);
insert into PARTICIPATE (client_id, atraction_number)
values (41455, 9711);
insert into PARTICIPATE (client_id, atraction_number)
values (41584, 3233);
insert into PARTICIPATE (client_id, atraction_number)
values (42963, 8654419);
insert into PARTICIPATE (client_id, atraction_number)
values (43668, 4145866);
insert into PARTICIPATE (client_id, atraction_number)
values (43799, 1526764);
insert into PARTICIPATE (client_id, atraction_number)
values (43799, 9248969);
insert into PARTICIPATE (client_id, atraction_number)
values (44674, 4963);
insert into PARTICIPATE (client_id, atraction_number)
values (44989, 1141);
insert into PARTICIPATE (client_id, atraction_number)
values (44989, 3827577);
insert into PARTICIPATE (client_id, atraction_number)
values (44989, 8186878);
insert into PARTICIPATE (client_id, atraction_number)
values (45648, 1141689);
insert into PARTICIPATE (client_id, atraction_number)
values (46094, 3142);
insert into PARTICIPATE (client_id, atraction_number)
values (46513, 3995671);
insert into PARTICIPATE (client_id, atraction_number)
values (46513, 5964426);
insert into PARTICIPATE (client_id, atraction_number)
values (47273, 9248969);
insert into PARTICIPATE (client_id, atraction_number)
values (47469, 3929467);
insert into PARTICIPATE (client_id, atraction_number)
values (48251, 7375);
insert into PARTICIPATE (client_id, atraction_number)
values (48251, 2259613);
insert into PARTICIPATE (client_id, atraction_number)
values (48445, 7254646);
insert into PARTICIPATE (client_id, atraction_number)
values (48740, 5194729);
insert into PARTICIPATE (client_id, atraction_number)
values (48976, 6793556);
insert into PARTICIPATE (client_id, atraction_number)
values (49214, 4264622);
insert into PARTICIPATE (client_id, atraction_number)
values (49214, 5779523);
insert into PARTICIPATE (client_id, atraction_number)
values (50502, 1712);
insert into PARTICIPATE (client_id, atraction_number)
values (50502, 4862444);
insert into PARTICIPATE (client_id, atraction_number)
values (51110, 6665866);
insert into PARTICIPATE (client_id, atraction_number)
values (51110, 7212299);
insert into PARTICIPATE (client_id, atraction_number)
values (51945, 7858183);
insert into PARTICIPATE (client_id, atraction_number)
values (53201, 6333191);
insert into PARTICIPATE (client_id, atraction_number)
values (54337, 5381);
insert into PARTICIPATE (client_id, atraction_number)
values (54352, 7176338);
insert into PARTICIPATE (client_id, atraction_number)
values (54352, 8592354);
insert into PARTICIPATE (client_id, atraction_number)
values (54982, 3821911);
insert into PARTICIPATE (client_id, atraction_number)
values (55102, 5684);
insert into PARTICIPATE (client_id, atraction_number)
values (55792, 9223);
insert into PARTICIPATE (client_id, atraction_number)
values (55903, 3969);
insert into PARTICIPATE (client_id, atraction_number)
values (55903, 9615354);
insert into PARTICIPATE (client_id, atraction_number)
values (56137, 3888);
insert into PARTICIPATE (client_id, atraction_number)
values (56137, 7212299);
insert into PARTICIPATE (client_id, atraction_number)
values (56972, 3742587);
insert into PARTICIPATE (client_id, atraction_number)
values (57161, 3531);
insert into PARTICIPATE (client_id, atraction_number)
values (57288, 4465);
insert into PARTICIPATE (client_id, atraction_number)
values (57288, 7965);
insert into PARTICIPATE (client_id, atraction_number)
values (57480, 1233);
insert into PARTICIPATE (client_id, atraction_number)
values (57480, 1968358);
insert into PARTICIPATE (client_id, atraction_number)
values (57818, 3279);
insert into PARTICIPATE (client_id, atraction_number)
values (57818, 6366);
insert into PARTICIPATE (client_id, atraction_number)
values (57818, 2568555);
commit;
prompt 100 records committed...
insert into PARTICIPATE (client_id, atraction_number)
values (58002, 5786);
insert into PARTICIPATE (client_id, atraction_number)
values (58002, 7281);
insert into PARTICIPATE (client_id, atraction_number)
values (58002, 7333361);
insert into PARTICIPATE (client_id, atraction_number)
values (58427, 3888);
insert into PARTICIPATE (client_id, atraction_number)
values (58427, 6433621);
insert into PARTICIPATE (client_id, atraction_number)
values (58567, 5585);
insert into PARTICIPATE (client_id, atraction_number)
values (59440, 7733232);
insert into PARTICIPATE (client_id, atraction_number)
values (59847, 2847971);
insert into PARTICIPATE (client_id, atraction_number)
values (60496, 2893);
insert into PARTICIPATE (client_id, atraction_number)
values (60496, 3279);
insert into PARTICIPATE (client_id, atraction_number)
values (60542, 5337748);
insert into PARTICIPATE (client_id, atraction_number)
values (60640, 3832);
insert into PARTICIPATE (client_id, atraction_number)
values (61305, 9432255);
insert into PARTICIPATE (client_id, atraction_number)
values (61613, 7759);
insert into PARTICIPATE (client_id, atraction_number)
values (62772, 8459);
insert into PARTICIPATE (client_id, atraction_number)
values (62793, 2542);
insert into PARTICIPATE (client_id, atraction_number)
values (63353, 1767);
insert into PARTICIPATE (client_id, atraction_number)
values (63552, 5786);
insert into PARTICIPATE (client_id, atraction_number)
values (63552, 7491145);
insert into PARTICIPATE (client_id, atraction_number)
values (63634, 9117592);
insert into PARTICIPATE (client_id, atraction_number)
values (63878, 9223);
insert into PARTICIPATE (client_id, atraction_number)
values (63878, 1813381);
insert into PARTICIPATE (client_id, atraction_number)
values (63878, 3975578);
insert into PARTICIPATE (client_id, atraction_number)
values (64281, 8362483);
insert into PARTICIPATE (client_id, atraction_number)
values (65010, 4963);
insert into PARTICIPATE (client_id, atraction_number)
values (65670, 3742587);
insert into PARTICIPATE (client_id, atraction_number)
values (65796, 9248969);
insert into PARTICIPATE (client_id, atraction_number)
values (66069, 3531);
insert into PARTICIPATE (client_id, atraction_number)
values (68925, 3888);
insert into PARTICIPATE (client_id, atraction_number)
values (69379, 1964);
insert into PARTICIPATE (client_id, atraction_number)
values (69379, 7585752);
insert into PARTICIPATE (client_id, atraction_number)
values (69660, 4657);
insert into PARTICIPATE (client_id, atraction_number)
values (70070, 5265636);
insert into PARTICIPATE (client_id, atraction_number)
values (72050, 7593791);
insert into PARTICIPATE (client_id, atraction_number)
values (72527, 3963755);
insert into PARTICIPATE (client_id, atraction_number)
values (72527, 8712915);
insert into PARTICIPATE (client_id, atraction_number)
values (73838, 3821911);
insert into PARTICIPATE (client_id, atraction_number)
values (74994, 1769875);
insert into PARTICIPATE (client_id, atraction_number)
values (75397, 5127348);
insert into PARTICIPATE (client_id, atraction_number)
values (75397, 5138627);
insert into PARTICIPATE (client_id, atraction_number)
values (75397, 9114659);
insert into PARTICIPATE (client_id, atraction_number)
values (75397, 9216123);
insert into PARTICIPATE (client_id, atraction_number)
values (75856, 5138627);
insert into PARTICIPATE (client_id, atraction_number)
values (76051, 8359239);
insert into PARTICIPATE (client_id, atraction_number)
values (76520, 2639199);
insert into PARTICIPATE (client_id, atraction_number)
values (76520, 6876963);
insert into PARTICIPATE (client_id, atraction_number)
values (77581, 6333191);
insert into PARTICIPATE (client_id, atraction_number)
values (77902, 3975578);
insert into PARTICIPATE (client_id, atraction_number)
values (77902, 7114432);
insert into PARTICIPATE (client_id, atraction_number)
values (77902, 7212299);
insert into PARTICIPATE (client_id, atraction_number)
values (78815, 1767);
insert into PARTICIPATE (client_id, atraction_number)
values (79034, 7254646);
insert into PARTICIPATE (client_id, atraction_number)
values (79112, 6112);
insert into PARTICIPATE (client_id, atraction_number)
values (79150, 2331118);
insert into PARTICIPATE (client_id, atraction_number)
values (79150, 7114432);
insert into PARTICIPATE (client_id, atraction_number)
values (80282, 6333191);
insert into PARTICIPATE (client_id, atraction_number)
values (80445, 2735);
insert into PARTICIPATE (client_id, atraction_number)
values (80477, 9986);
insert into PARTICIPATE (client_id, atraction_number)
values (80477, 5127348);
insert into PARTICIPATE (client_id, atraction_number)
values (81076, 5455);
insert into PARTICIPATE (client_id, atraction_number)
values (81483, 7276);
insert into PARTICIPATE (client_id, atraction_number)
values (81942, 8359239);
insert into PARTICIPATE (client_id, atraction_number)
values (82200, 4481767);
insert into PARTICIPATE (client_id, atraction_number)
values (82466, 5354);
insert into PARTICIPATE (client_id, atraction_number)
values (82466, 2687883);
insert into PARTICIPATE (client_id, atraction_number)
values (86740, 7562944);
insert into PARTICIPATE (client_id, atraction_number)
values (86879, 2811812);
insert into PARTICIPATE (client_id, atraction_number)
values (87252, 8635);
insert into PARTICIPATE (client_id, atraction_number)
values (87437, 1236);
insert into PARTICIPATE (client_id, atraction_number)
values (87437, 8827);
insert into PARTICIPATE (client_id, atraction_number)
values (87437, 9248969);
insert into PARTICIPATE (client_id, atraction_number)
values (87910, 1352);
insert into PARTICIPATE (client_id, atraction_number)
values (88609, 8367);
insert into PARTICIPATE (client_id, atraction_number)
values (88609, 3471233);
insert into PARTICIPATE (client_id, atraction_number)
values (88798, 9223);
insert into PARTICIPATE (client_id, atraction_number)
values (91366, 8444);
insert into PARTICIPATE (client_id, atraction_number)
values (91366, 1593648);
insert into PARTICIPATE (client_id, atraction_number)
values (91366, 3854872);
insert into PARTICIPATE (client_id, atraction_number)
values (91366, 4327568);
insert into PARTICIPATE (client_id, atraction_number)
values (92672, 2568555);
insert into PARTICIPATE (client_id, atraction_number)
values (92672, 3975578);
insert into PARTICIPATE (client_id, atraction_number)
values (94238, 3291);
insert into PARTICIPATE (client_id, atraction_number)
values (94349, 6575677);
insert into PARTICIPATE (client_id, atraction_number)
values (94811, 8478283);
insert into PARTICIPATE (client_id, atraction_number)
values (95269, 5381);
insert into PARTICIPATE (client_id, atraction_number)
values (95269, 6143);
insert into PARTICIPATE (client_id, atraction_number)
values (95269, 2273438);
insert into PARTICIPATE (client_id, atraction_number)
values (95818, 2349772);
insert into PARTICIPATE (client_id, atraction_number)
values (95826, 8932);
insert into PARTICIPATE (client_id, atraction_number)
values (96282, 3424122);
insert into PARTICIPATE (client_id, atraction_number)
values (97705, 5352485);
insert into PARTICIPATE (client_id, atraction_number)
values (99624, 3189293);
insert into PARTICIPATE (client_id, atraction_number)
values (99965, 2967286);
insert into PARTICIPATE (client_id, atraction_number)
values (99965, 7454456);
insert into PARTICIPATE (client_id, atraction_number)
values (99965, 9566852);
commit;
prompt 195 records loaded
prompt Loading ROOM...
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (12, 2, 200, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (831291, 3, 713, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (344459, 6, 413, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (663841, 9, 573, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (623349, 3, 357, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (984779, 8, 951, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (129455, 2, 927, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (524339, 3, 916, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (857387, 9, 346, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (198686, 9, 658, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (839639, 6, 393, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (856133, 2, 288, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (768719, 9, 819, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (369228, 2, 331, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (916324, 8, 587, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (796111, 1, 618, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (325695, 3, 647, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (231954, 4, 891, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (967272, 5, 137, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (422181, 1, 691, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (153497, 9, 324, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (147132, 6, 712, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (552597, 7, 672, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (772182, 3, 394, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (479921, 9, 396, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (284212, 3, 537, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (571769, 6, 491, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (649837, 7, 778, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (533326, 9, 955, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (765621, 6, 749, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (518216, 6, 382, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (963768, 4, 133, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (692336, 1, 176, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (278464, 6, 917, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (236445, 6, 856, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (634516, 6, 126, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (535664, 3, 939, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (885862, 4, 483, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (996159, 8, 654, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (716238, 7, 332, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (411529, 8, 843, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (244356, 6, 734, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (519921, 8, 473, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (654725, 3, 619, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (442572, 2, 265, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (963231, 5, 916, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (591386, 9, 944, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (823179, 2, 269, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (811411, 2, 123, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (469667, 9, 276, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (913444, 8, 565, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (171857, 7, 863, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (212975, 9, 454, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (711436, 9, 565, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (774622, 1, 162, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (727153, 5, 961, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (357875, 3, 213, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (873614, 9, 763, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (535625, 6, 753, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (435195, 7, 978, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (142292, 1, 974, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (154546, 7, 349, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (828124, 7, 824, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (281589, 1, 119, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (269853, 1, 223, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (243527, 8, 171, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (382742, 8, 736, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (986685, 7, 479, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (537477, 5, 199, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (693724, 8, 736, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (239625, 9, 514, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (136522, 9, 752, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (535254, 5, 834, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (456977, 5, 558, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (227531, 5, 787, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (553979, 1, 255, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (425878, 6, 754, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (542518, 1, 922, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (732392, 3, 513, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (295945, 9, 299, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (795817, 5, 797, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (461888, 2, 618, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (772277, 9, 178, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (775881, 6, 195, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (817555, 4, 783, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (571636, 7, 329, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (346194, 5, 656, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (577664, 5, 194, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (286972, 8, 476, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (342384, 5, 179, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (612537, 1, 365, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (241423, 7, 989, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (674682, 1, 493, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (963288, 7, 936, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (523925, 2, 896, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (114837, 8, 475, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (971273, 4, 876, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (927869, 1, 281, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (922883, 4, 352, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (867872, 1, 724, 'OK        ', 1234);
commit;
prompt 100 records committed...
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (352629, 5, 182, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (687476, 3, 482, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (815925, 9, 352, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (956622, 9, 713, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (318777, 9, 914, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (841123, 8, 797, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (164917, 5, 377, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (512794, 3, 315, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (245668, 7, 828, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (376963, 4, 881, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (686423, 3, 749, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (513358, 4, 536, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (888539, 1, 486, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (129982, 7, 368, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (976231, 8, 617, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (372976, 4, 359, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (712817, 6, 565, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (787631, 7, 681, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (245996, 7, 721, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (733268, 4, 131, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (473623, 5, 663, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (186845, 3, 336, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (363314, 9, 156, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (124619, 5, 191, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (784635, 2, 563, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (653577, 7, 234, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (268973, 5, 673, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (216944, 9, 764, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (335929, 9, 815, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (227987, 7, 587, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (758697, 1, 543, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (294955, 9, 231, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (552266, 3, 246, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (398157, 4, 846, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (789448, 4, 552, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (169981, 9, 239, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (941692, 7, 963, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (123367, 9, 511, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (881186, 9, 141, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (647885, 5, 842, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (572891, 5, 719, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (516742, 7, 916, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (329658, 4, 118, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (241953, 6, 693, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (568779, 6, 759, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (261743, 8, 973, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (947129, 4, 463, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (818892, 6, 836, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (469979, 8, 951, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (612658, 8, 971, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (325417, 1, 139, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (878917, 2, 786, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (137332, 9, 682, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (331625, 5, 582, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (981412, 2, 137, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (283563, 6, 373, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (413818, 7, 536, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (574731, 5, 334, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (141376, 3, 839, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (978464, 5, 892, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (231576, 2, 945, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (856545, 2, 847, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (112628, 1, 329, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (125923, 3, 111, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (163858, 1, 736, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (887658, 1, 439, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (849167, 7, 698, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (947661, 9, 649, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (721342, 7, 795, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (198267, 4, 757, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (898583, 7, 228, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (187921, 4, 346, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (143444, 4, 762, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (613947, 6, 783, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (428362, 2, 184, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (981689, 9, 438, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (934931, 9, 624, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (699615, 9, 732, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (196588, 8, 363, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (683565, 2, 897, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (615721, 2, 564, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (593522, 2, 783, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (674819, 9, 257, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (675324, 3, 818, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (439593, 9, 338, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (579496, 7, 694, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (225755, 7, 437, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (686867, 6, 918, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (117473, 1, 846, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (995879, 8, 842, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (918197, 1, 139, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (194346, 6, 415, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (966267, 2, 154, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (731896, 8, 291, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (314584, 4, 791, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (777481, 6, 434, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (458754, 4, 965, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (544227, 4, 658, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (151273, 5, 237, 'BUSY      ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (283984, 3, 777, 'OK        ', 1234);
commit;
prompt 200 records committed...
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (766199, 7, 911, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (681116, 5, 175, 'OK        ', 1234);
insert into ROOM (room_number, num_beds, room_price, status, ship_id)
values (639855, 8, 511, 'BUSY      ', 1234);
commit;
prompt 203 records loaded
prompt Loading VISIT...
insert into VISIT (client_id, city_id)
values (10460, 22312);
insert into VISIT (client_id, city_id)
values (10486, 41118);
insert into VISIT (client_id, city_id)
values (10486, 49362);
insert into VISIT (client_id, city_id)
values (11898, 66952);
insert into VISIT (client_id, city_id)
values (11898, 79847);
insert into VISIT (client_id, city_id)
values (13377, 16153);
insert into VISIT (client_id, city_id)
values (13853, 14681);
insert into VISIT (client_id, city_id)
values (14031, 42858);
insert into VISIT (client_id, city_id)
values (14108, 45736);
insert into VISIT (client_id, city_id)
values (14506, 16248);
insert into VISIT (client_id, city_id)
values (14506, 21971);
insert into VISIT (client_id, city_id)
values (14506, 37552);
insert into VISIT (client_id, city_id)
values (16860, 26678);
insert into VISIT (client_id, city_id)
values (17059, 43592);
insert into VISIT (client_id, city_id)
values (17800, 53251);
insert into VISIT (client_id, city_id)
values (22281, 83261);
insert into VISIT (client_id, city_id)
values (22281, 97814);
insert into VISIT (client_id, city_id)
values (22562, 15814);
insert into VISIT (client_id, city_id)
values (22760, 57739);
insert into VISIT (client_id, city_id)
values (23283, 69226);
insert into VISIT (client_id, city_id)
values (23526, 69226);
insert into VISIT (client_id, city_id)
values (25387, 78666);
insert into VISIT (client_id, city_id)
values (25507, 48844);
insert into VISIT (client_id, city_id)
values (28035, 94794);
insert into VISIT (client_id, city_id)
values (28653, 28468);
insert into VISIT (client_id, city_id)
values (31176, 79847);
insert into VISIT (client_id, city_id)
values (31790, 15136);
insert into VISIT (client_id, city_id)
values (31790, 57129);
insert into VISIT (client_id, city_id)
values (33535, 54532);
insert into VISIT (client_id, city_id)
values (34220, 13596);
insert into VISIT (client_id, city_id)
values (34387, 34524);
insert into VISIT (client_id, city_id)
values (34461, 84983);
insert into VISIT (client_id, city_id)
values (35151, 76379);
insert into VISIT (client_id, city_id)
values (35395, 31567);
insert into VISIT (client_id, city_id)
values (35658, 24574);
insert into VISIT (client_id, city_id)
values (35855, 34649);
insert into VISIT (client_id, city_id)
values (37507, 93325);
insert into VISIT (client_id, city_id)
values (38209, 98451);
insert into VISIT (client_id, city_id)
values (38683, 75745);
insert into VISIT (client_id, city_id)
values (38750, 47415);
insert into VISIT (client_id, city_id)
values (39029, 43293);
insert into VISIT (client_id, city_id)
values (40687, 45612);
insert into VISIT (client_id, city_id)
values (41166, 67826);
insert into VISIT (client_id, city_id)
values (42489, 16153);
insert into VISIT (client_id, city_id)
values (42489, 94356);
insert into VISIT (client_id, city_id)
values (42963, 69152);
insert into VISIT (client_id, city_id)
values (44674, 66332);
insert into VISIT (client_id, city_id)
values (44674, 99869);
insert into VISIT (client_id, city_id)
values (45648, 34649);
insert into VISIT (client_id, city_id)
values (45765, 71315);
insert into VISIT (client_id, city_id)
values (46094, 62424);
insert into VISIT (client_id, city_id)
values (46513, 79847);
insert into VISIT (client_id, city_id)
values (46529, 47943);
insert into VISIT (client_id, city_id)
values (47469, 83261);
insert into VISIT (client_id, city_id)
values (47535, 83225);
insert into VISIT (client_id, city_id)
values (48042, 98684);
insert into VISIT (client_id, city_id)
values (48251, 64313);
insert into VISIT (client_id, city_id)
values (49663, 23388);
insert into VISIT (client_id, city_id)
values (50387, 31443);
insert into VISIT (client_id, city_id)
values (50387, 87711);
insert into VISIT (client_id, city_id)
values (51903, 51228);
insert into VISIT (client_id, city_id)
values (52069, 78666);
insert into VISIT (client_id, city_id)
values (53498, 26597);
insert into VISIT (client_id, city_id)
values (53498, 83152);
insert into VISIT (client_id, city_id)
values (53672, 34767);
insert into VISIT (client_id, city_id)
values (54637, 44338);
insert into VISIT (client_id, city_id)
values (54637, 61621);
insert into VISIT (client_id, city_id)
values (54982, 91393);
insert into VISIT (client_id, city_id)
values (55750, 83261);
insert into VISIT (client_id, city_id)
values (55903, 24574);
insert into VISIT (client_id, city_id)
values (56831, 28733);
insert into VISIT (client_id, city_id)
values (56831, 72641);
insert into VISIT (client_id, city_id)
values (57161, 21497);
insert into VISIT (client_id, city_id)
values (57356, 57122);
insert into VISIT (client_id, city_id)
values (57455, 74527);
insert into VISIT (client_id, city_id)
values (57818, 19365);
insert into VISIT (client_id, city_id)
values (57818, 24621);
insert into VISIT (client_id, city_id)
values (58154, 28733);
insert into VISIT (client_id, city_id)
values (58567, 25119);
insert into VISIT (client_id, city_id)
values (58652, 72361);
insert into VISIT (client_id, city_id)
values (59600, 37837);
insert into VISIT (client_id, city_id)
values (59910, 45736);
insert into VISIT (client_id, city_id)
values (60496, 23738);
insert into VISIT (client_id, city_id)
values (60640, 15945);
insert into VISIT (client_id, city_id)
values (60640, 26738);
insert into VISIT (client_id, city_id)
values (61305, 38784);
insert into VISIT (client_id, city_id)
values (63353, 74946);
insert into VISIT (client_id, city_id)
values (63369, 13547);
insert into VISIT (client_id, city_id)
values (64673, 21342);
insert into VISIT (client_id, city_id)
values (64826, 45612);
insert into VISIT (client_id, city_id)
values (65010, 41641);
insert into VISIT (client_id, city_id)
values (66069, 86265);
insert into VISIT (client_id, city_id)
values (66408, 43592);
insert into VISIT (client_id, city_id)
values (69094, 19365);
insert into VISIT (client_id, city_id)
values (69379, 46554);
insert into VISIT (client_id, city_id)
values (69379, 74147);
insert into VISIT (client_id, city_id)
values (69545, 45736);
insert into VISIT (client_id, city_id)
values (69660, 24153);
insert into VISIT (client_id, city_id)
values (71171, 98451);
insert into VISIT (client_id, city_id)
values (71384, 21342);
commit;
prompt 100 records committed...
insert into VISIT (client_id, city_id)
values (71384, 86623);
insert into VISIT (client_id, city_id)
values (72527, 31622);
insert into VISIT (client_id, city_id)
values (73838, 12279);
insert into VISIT (client_id, city_id)
values (75382, 52655);
insert into VISIT (client_id, city_id)
values (75397, 95551);
insert into VISIT (client_id, city_id)
values (76520, 73455);
insert into VISIT (client_id, city_id)
values (77902, 19185);
insert into VISIT (client_id, city_id)
values (78815, 16248);
insert into VISIT (client_id, city_id)
values (79112, 89844);
insert into VISIT (client_id, city_id)
values (79150, 44266);
insert into VISIT (client_id, city_id)
values (79150, 67288);
insert into VISIT (client_id, city_id)
values (79635, 93571);
insert into VISIT (client_id, city_id)
values (79860, 74946);
insert into VISIT (client_id, city_id)
values (80445, 71549);
insert into VISIT (client_id, city_id)
values (80477, 54183);
insert into VISIT (client_id, city_id)
values (80477, 86623);
insert into VISIT (client_id, city_id)
values (81076, 89279);
insert into VISIT (client_id, city_id)
values (81457, 38447);
insert into VISIT (client_id, city_id)
values (81942, 34767);
insert into VISIT (client_id, city_id)
values (82892, 83296);
insert into VISIT (client_id, city_id)
values (82943, 84983);
insert into VISIT (client_id, city_id)
values (84013, 47943);
insert into VISIT (client_id, city_id)
values (85289, 89844);
insert into VISIT (client_id, city_id)
values (87252, 49362);
insert into VISIT (client_id, city_id)
values (88609, 28733);
insert into VISIT (client_id, city_id)
values (88675, 35442);
insert into VISIT (client_id, city_id)
values (88798, 18138);
insert into VISIT (client_id, city_id)
values (88798, 65857);
insert into VISIT (client_id, city_id)
values (89582, 12279);
insert into VISIT (client_id, city_id)
values (92083, 35599);
insert into VISIT (client_id, city_id)
values (92083, 86265);
insert into VISIT (client_id, city_id)
values (94238, 26597);
insert into VISIT (client_id, city_id)
values (94238, 39192);
insert into VISIT (client_id, city_id)
values (94238, 84164);
insert into VISIT (client_id, city_id)
values (94811, 13547);
insert into VISIT (client_id, city_id)
values (95269, 49695);
insert into VISIT (client_id, city_id)
values (95818, 47638);
insert into VISIT (client_id, city_id)
values (96258, 58375);
insert into VISIT (client_id, city_id)
values (96268, 68667);
insert into VISIT (client_id, city_id)
values (99866, 21971);
insert into VISIT (client_id, city_id)
values (99965, 21497);
insert into VISIT (client_id, city_id)
values (99998, 92879);
commit;
prompt 142 records loaded
prompt Loading WORKING_AT...
insert into WORKING_AT (e_id, spa_number)
values (10182, 618383);
insert into WORKING_AT (e_id, spa_number)
values (10193, 232988);
insert into WORKING_AT (e_id, spa_number)
values (11151, 575899);
insert into WORKING_AT (e_id, spa_number)
values (11151, 953584);
insert into WORKING_AT (e_id, spa_number)
values (11622, 547386);
insert into WORKING_AT (e_id, spa_number)
values (11649, 618383);
insert into WORKING_AT (e_id, spa_number)
values (13020, 215859);
insert into WORKING_AT (e_id, spa_number)
values (13313, 375253);
insert into WORKING_AT (e_id, spa_number)
values (13401, 757149);
insert into WORKING_AT (e_id, spa_number)
values (14013, 629185);
insert into WORKING_AT (e_id, spa_number)
values (16017, 387534);
insert into WORKING_AT (e_id, spa_number)
values (17267, 952165);
insert into WORKING_AT (e_id, spa_number)
values (18226, 961198);
insert into WORKING_AT (e_id, spa_number)
values (20582, 322537);
insert into WORKING_AT (e_id, spa_number)
values (20845, 539393);
insert into WORKING_AT (e_id, spa_number)
values (20940, 211182);
insert into WORKING_AT (e_id, spa_number)
values (21204, 539393);
insert into WORKING_AT (e_id, spa_number)
values (22679, 722847);
insert into WORKING_AT (e_id, spa_number)
values (23250, 784642);
insert into WORKING_AT (e_id, spa_number)
values (23399, 915716);
insert into WORKING_AT (e_id, spa_number)
values (24012, 631951);
insert into WORKING_AT (e_id, spa_number)
values (24824, 728559);
insert into WORKING_AT (e_id, spa_number)
values (24824, 735488);
insert into WORKING_AT (e_id, spa_number)
values (25230, 575899);
insert into WORKING_AT (e_id, spa_number)
values (26800, 426629);
insert into WORKING_AT (e_id, spa_number)
values (26800, 584357);
insert into WORKING_AT (e_id, spa_number)
values (26800, 588651);
insert into WORKING_AT (e_id, spa_number)
values (26893, 794758);
insert into WORKING_AT (e_id, spa_number)
values (27243, 735488);
insert into WORKING_AT (e_id, spa_number)
values (27662, 341819);
insert into WORKING_AT (e_id, spa_number)
values (29024, 684632);
insert into WORKING_AT (e_id, spa_number)
values (29726, 893256);
insert into WORKING_AT (e_id, spa_number)
values (29781, 722847);
insert into WORKING_AT (e_id, spa_number)
values (32202, 515534);
insert into WORKING_AT (e_id, spa_number)
values (32624, 463537);
insert into WORKING_AT (e_id, spa_number)
values (32636, 568537);
insert into WORKING_AT (e_id, spa_number)
values (32826, 375253);
insert into WORKING_AT (e_id, spa_number)
values (33022, 728896);
insert into WORKING_AT (e_id, spa_number)
values (33352, 567526);
insert into WORKING_AT (e_id, spa_number)
values (33358, 144355);
insert into WORKING_AT (e_id, spa_number)
values (33514, 155444);
insert into WORKING_AT (e_id, spa_number)
values (33645, 966414);
insert into WORKING_AT (e_id, spa_number)
values (35831, 953441);
insert into WORKING_AT (e_id, spa_number)
values (35900, 684632);
insert into WORKING_AT (e_id, spa_number)
values (37065, 524315);
insert into WORKING_AT (e_id, spa_number)
values (37597, 481768);
insert into WORKING_AT (e_id, spa_number)
values (38072, 972597);
insert into WORKING_AT (e_id, spa_number)
values (38658, 757149);
insert into WORKING_AT (e_id, spa_number)
values (38848, 999591);
insert into WORKING_AT (e_id, spa_number)
values (40462, 222914);
insert into WORKING_AT (e_id, spa_number)
values (40462, 523354);
insert into WORKING_AT (e_id, spa_number)
values (40519, 556377);
insert into WORKING_AT (e_id, spa_number)
values (42399, 127464);
insert into WORKING_AT (e_id, spa_number)
values (43731, 271565);
insert into WORKING_AT (e_id, spa_number)
values (44615, 313694);
insert into WORKING_AT (e_id, spa_number)
values (45035, 239416);
insert into WORKING_AT (e_id, spa_number)
values (45035, 253495);
insert into WORKING_AT (e_id, spa_number)
values (45637, 317835);
insert into WORKING_AT (e_id, spa_number)
values (45637, 458158);
insert into WORKING_AT (e_id, spa_number)
values (45641, 966658);
insert into WORKING_AT (e_id, spa_number)
values (45719, 784642);
insert into WORKING_AT (e_id, spa_number)
values (46170, 284862);
insert into WORKING_AT (e_id, spa_number)
values (47023, 719621);
insert into WORKING_AT (e_id, spa_number)
values (47023, 852922);
insert into WORKING_AT (e_id, spa_number)
values (47751, 672739);
insert into WORKING_AT (e_id, spa_number)
values (47944, 794758);
insert into WORKING_AT (e_id, spa_number)
values (48382, 682737);
insert into WORKING_AT (e_id, spa_number)
values (48701, 523354);
insert into WORKING_AT (e_id, spa_number)
values (49812, 322642);
insert into WORKING_AT (e_id, spa_number)
values (50156, 388673);
insert into WORKING_AT (e_id, spa_number)
values (50204, 195176);
insert into WORKING_AT (e_id, spa_number)
values (50433, 794758);
insert into WORKING_AT (e_id, spa_number)
values (50607, 382664);
insert into WORKING_AT (e_id, spa_number)
values (51553, 298867);
insert into WORKING_AT (e_id, spa_number)
values (51635, 797273);
insert into WORKING_AT (e_id, spa_number)
values (51819, 243519);
insert into WORKING_AT (e_id, spa_number)
values (52555, 154658);
insert into WORKING_AT (e_id, spa_number)
values (53446, 442669);
insert into WORKING_AT (e_id, spa_number)
values (53514, 444515);
insert into WORKING_AT (e_id, spa_number)
values (54720, 753162);
insert into WORKING_AT (e_id, spa_number)
values (54873, 728559);
insert into WORKING_AT (e_id, spa_number)
values (55014, 523354);
insert into WORKING_AT (e_id, spa_number)
values (55044, 799422);
insert into WORKING_AT (e_id, spa_number)
values (55949, 912682);
insert into WORKING_AT (e_id, spa_number)
values (56301, 393316);
insert into WORKING_AT (e_id, spa_number)
values (57568, 959213);
insert into WORKING_AT (e_id, spa_number)
values (57970, 852793);
insert into WORKING_AT (e_id, spa_number)
values (58974, 223141);
insert into WORKING_AT (e_id, spa_number)
values (59291, 525143);
insert into WORKING_AT (e_id, spa_number)
values (59767, 584357);
insert into WORKING_AT (e_id, spa_number)
values (60002, 696562);
insert into WORKING_AT (e_id, spa_number)
values (61307, 314267);
insert into WORKING_AT (e_id, spa_number)
values (61616, 465368);
insert into WORKING_AT (e_id, spa_number)
values (62032, 235272);
insert into WORKING_AT (e_id, spa_number)
values (62032, 497249);
insert into WORKING_AT (e_id, spa_number)
values (62143, 797273);
insert into WORKING_AT (e_id, spa_number)
values (62190, 623436);
insert into WORKING_AT (e_id, spa_number)
values (62857, 575899);
insert into WORKING_AT (e_id, spa_number)
values (64004, 232988);
insert into WORKING_AT (e_id, spa_number)
values (64335, 636824);
commit;
prompt 100 records committed...
insert into WORKING_AT (e_id, spa_number)
values (65703, 337547);
insert into WORKING_AT (e_id, spa_number)
values (66974, 331839);
insert into WORKING_AT (e_id, spa_number)
values (68033, 174764);
insert into WORKING_AT (e_id, spa_number)
values (68942, 275458);
insert into WORKING_AT (e_id, spa_number)
values (69872, 458158);
insert into WORKING_AT (e_id, spa_number)
values (71453, 575899);
insert into WORKING_AT (e_id, spa_number)
values (72141, 236351);
insert into WORKING_AT (e_id, spa_number)
values (72780, 915716);
insert into WORKING_AT (e_id, spa_number)
values (73318, 618126);
insert into WORKING_AT (e_id, spa_number)
values (74718, 524315);
insert into WORKING_AT (e_id, spa_number)
values (75834, 555494);
insert into WORKING_AT (e_id, spa_number)
values (75922, 953584);
insert into WORKING_AT (e_id, spa_number)
values (76485, 379485);
insert into WORKING_AT (e_id, spa_number)
values (76567, 524315);
insert into WORKING_AT (e_id, spa_number)
values (76798, 555494);
insert into WORKING_AT (e_id, spa_number)
values (76991, 276361);
insert into WORKING_AT (e_id, spa_number)
values (77455, 264313);
insert into WORKING_AT (e_id, spa_number)
values (78187, 771482);
insert into WORKING_AT (e_id, spa_number)
values (78346, 131631);
insert into WORKING_AT (e_id, spa_number)
values (78388, 984482);
insert into WORKING_AT (e_id, spa_number)
values (78677, 243519);
insert into WORKING_AT (e_id, spa_number)
values (80289, 649563);
insert into WORKING_AT (e_id, spa_number)
values (80590, 426745);
insert into WORKING_AT (e_id, spa_number)
values (80644, 426745);
insert into WORKING_AT (e_id, spa_number)
values (80953, 771482);
insert into WORKING_AT (e_id, spa_number)
values (81047, 555494);
insert into WORKING_AT (e_id, spa_number)
values (81278, 636824);
insert into WORKING_AT (e_id, spa_number)
values (81513, 482312);
insert into WORKING_AT (e_id, spa_number)
values (81676, 893256);
insert into WORKING_AT (e_id, spa_number)
values (82677, 395497);
insert into WORKING_AT (e_id, spa_number)
values (86985, 755144);
insert into WORKING_AT (e_id, spa_number)
values (87314, 662374);
insert into WORKING_AT (e_id, spa_number)
values (87569, 921487);
insert into WORKING_AT (e_id, spa_number)
values (87653, 649563);
insert into WORKING_AT (e_id, spa_number)
values (88129, 715524);
insert into WORKING_AT (e_id, spa_number)
values (88821, 722847);
insert into WORKING_AT (e_id, spa_number)
values (88910, 912769);
insert into WORKING_AT (e_id, spa_number)
values (89055, 733386);
insert into WORKING_AT (e_id, spa_number)
values (90260, 762372);
insert into WORKING_AT (e_id, spa_number)
values (90763, 519151);
insert into WORKING_AT (e_id, spa_number)
values (90999, 672739);
insert into WORKING_AT (e_id, spa_number)
values (91246, 728896);
insert into WORKING_AT (e_id, spa_number)
values (91317, 264397);
insert into WORKING_AT (e_id, spa_number)
values (91655, 1);
insert into WORKING_AT (e_id, spa_number)
values (91986, 382664);
insert into WORKING_AT (e_id, spa_number)
values (92104, 322563);
insert into WORKING_AT (e_id, spa_number)
values (92420, 296245);
insert into WORKING_AT (e_id, spa_number)
values (92420, 358694);
insert into WORKING_AT (e_id, spa_number)
values (92610, 229529);
insert into WORKING_AT (e_id, spa_number)
values (93030, 861679);
insert into WORKING_AT (e_id, spa_number)
values (93153, 888138);
insert into WORKING_AT (e_id, spa_number)
values (93303, 888138);
insert into WORKING_AT (e_id, spa_number)
values (93539, 495255);
insert into WORKING_AT (e_id, spa_number)
values (93991, 961198);
insert into WORKING_AT (e_id, spa_number)
values (94264, 379485);
insert into WORKING_AT (e_id, spa_number)
values (94617, 463537);
insert into WORKING_AT (e_id, spa_number)
values (95343, 499592);
insert into WORKING_AT (e_id, spa_number)
values (95456, 688135);
insert into WORKING_AT (e_id, spa_number)
values (98200, 638853);
insert into WORKING_AT (e_id, spa_number)
values (98836, 784642);
insert into WORKING_AT (e_id, spa_number)
values (99309, 799517);
commit;
prompt 161 records loaded
prompt Enabling foreign key constraints for CITY...
alter table CITY enable constraint SYS_C0011091;
prompt Enabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE enable constraint SYS_C0011097;
prompt Enabling foreign key constraints for GUIDE...
alter table GUIDE enable constraint SYS_C0011102;
prompt Enabling foreign key constraints for INVITATION...
alter table INVITATION enable constraint SYS_C0011109;
alter table INVITATION enable constraint SYS_C0011110;
prompt Enabling foreign key constraints for MY_PATH...
alter table MY_PATH enable constraint SYS_C0011138;
alter table MY_PATH enable constraint SYS_C0011139;
alter table MY_PATH enable constraint SYS_C0011140;
prompt Enabling foreign key constraints for BELONGS_TO...
alter table BELONGS_TO enable constraint SYS_C0011145;
alter table BELONGS_TO enable constraint SYS_C0011146;
prompt Enabling foreign key constraints for CLIENT...
alter table CLIENT enable constraint SYS_C0011122;
alter table CLIENT enable constraint SYS_C0011123;
prompt Enabling foreign key constraints for CRUISE...
alter table CRUISE enable constraint SYS_C0011265;
alter table CRUISE enable constraint SYS_C0011266;
prompt Enabling foreign key constraints for GO_TO...
alter table GO_TO enable constraint SYS_C0011408;
alter table GO_TO enable constraint SYS_C0011409;
prompt Enabling foreign key constraints for INCLUDE...
alter table INCLUDE enable constraint SYS_C0011418;
alter table INCLUDE enable constraint SYS_C0011419;
prompt Enabling foreign key constraints for PARTICIPATE...
alter table PARTICIPATE enable constraint SYS_C0011413;
alter table PARTICIPATE enable constraint SYS_C0011414;
prompt Enabling foreign key constraints for ROOM...
alter table ROOM enable constraint FK_ROOM_SHIP;
prompt Enabling foreign key constraints for VISIT...
alter table VISIT enable constraint SYS_C0011403;
alter table VISIT enable constraint SYS_C0011404;
prompt Enabling foreign key constraints for WORKING_AT...
alter table WORKING_AT enable constraint SYS_C0011423;
alter table WORKING_AT enable constraint SYS_C0011424;
prompt Enabling triggers for AREA...
alter table AREA enable all triggers;
prompt Enabling triggers for ATTRACTIONS...
alter table ATTRACTIONS enable all triggers;
prompt Enabling triggers for MY_GROUP...
alter table MY_GROUP enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for GUIDE...
alter table GUIDE enable all triggers;
prompt Enabling triggers for INVITATION...
alter table INVITATION enable all triggers;
prompt Enabling triggers for DIFFICULTY...
alter table DIFFICULTY enable all triggers;
prompt Enabling triggers for KIND...
alter table KIND enable all triggers;
prompt Enabling triggers for MY_PATH...
alter table MY_PATH enable all triggers;
prompt Enabling triggers for BELONGS_TO...
alter table BELONGS_TO enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for PATH...
alter table PATH enable all triggers;
prompt Enabling triggers for SHIP...
alter table SHIP enable all triggers;
prompt Enabling triggers for CRUISE...
alter table CRUISE enable all triggers;
prompt Enabling triggers for SPA...
alter table SPA enable all triggers;
prompt Enabling triggers for GO_TO...
alter table GO_TO enable all triggers;
prompt Enabling triggers for INCLUDE...
alter table INCLUDE enable all triggers;
prompt Enabling triggers for PARTICIPATE...
alter table PARTICIPATE enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for VISIT...
alter table VISIT enable all triggers;
prompt Enabling triggers for WORKING_AT...
alter table WORKING_AT enable all triggers;

set feedback on
set define on
prompt Done