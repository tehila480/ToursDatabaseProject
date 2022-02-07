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

prompt Creating BELONGS_TO...
create table BELONGS_TO
(
  i_id NUMBER(5) not null,
  p_id NUMBER(5) not null,
  a_id NUMBER(5) not null
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
alter table BELONGS_TO
  add primary key (I_ID, P_ID, A_ID)
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
alter table BELONGS_TO
  add foreign key (I_ID)
  references INVITATION (I_ID);

prompt Creating CLIENT...
create table CLIENT
(
  c_tz   NUMBER(5) not null,
  c_name VARCHAR2(15) not null,
  b_date DATE not null,
  c_id   NUMBER(5) not null,
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

prompt Disabling triggers for AREA...
alter table AREA disable all triggers;
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
prompt Disabling triggers for BELONGS_TO...
alter table BELONGS_TO disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for DIFFICULTY...
alter table DIFFICULTY disable all triggers;
prompt Disabling triggers for KIND...
alter table KIND disable all triggers;
prompt Disabling triggers for MY_PATH...
alter table MY_PATH disable all triggers;
prompt Disabling foreign key constraints for CITY...
alter table CITY disable constraint SYS_C00489986;
prompt Disabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE disable constraint SYS_C00490011;
prompt Disabling foreign key constraints for GUIDE...
alter table GUIDE disable constraint SYS_C00490016;
prompt Disabling foreign key constraints for INVITATION...
alter table INVITATION disable constraint SYS_C00490023;
alter table INVITATION disable constraint SYS_C00490024;
prompt Disabling foreign key constraints for BELONGS_TO...
alter table BELONGS_TO disable constraint SYS_C00498868;
prompt Disabling foreign key constraints for CLIENT...
alter table CLIENT disable constraint SYS_C00491311;
alter table CLIENT disable constraint SYS_C00491312;
prompt Disabling foreign key constraints for MY_PATH...
alter table MY_PATH disable constraint SYS_C00498888;
alter table MY_PATH disable constraint SYS_C00498889;
alter table MY_PATH disable constraint SYS_C00498890;
prompt Deleting MY_PATH...
delete from MY_PATH;
prompt Deleting KIND...
delete from KIND;
prompt Deleting DIFFICULTY...
delete from DIFFICULTY;
prompt Deleting CLIENT...
delete from CLIENT;
prompt Deleting BELONGS_TO...
delete from BELONGS_TO;
prompt Deleting INVITATION...
delete from INVITATION;
prompt Deleting GUIDE...
delete from GUIDE;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
prompt Deleting CITY...
delete from CITY;
prompt Deleting MY_GROUP...
delete from MY_GROUP;
prompt Deleting AREA...
delete from AREA;
prompt Loading AREA...
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
prompt 314 records loaded
prompt Loading MY_GROUP...
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
prompt 267 records loaded
prompt Loading CITY...
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
prompt 298 records loaded
prompt Loading EMPLOYEE...
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
prompt 479 records loaded
prompt Loading GUIDE...
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
prompt 480 records loaded
prompt Loading INVITATION...
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
prompt 429 records loaded
prompt Loading BELONGS_TO...
insert into BELONGS_TO (i_id, p_id, a_id)
values (1, 1271, 909);
insert into BELONGS_TO (i_id, p_id, a_id)
values (1, 9483, 763);
insert into BELONGS_TO (i_id, p_id, a_id)
values (2, 3946, 442);
insert into BELONGS_TO (i_id, p_id, a_id)
values (2, 6263, 728);
insert into BELONGS_TO (i_id, p_id, a_id)
values (3, 2066, 655);
insert into BELONGS_TO (i_id, p_id, a_id)
values (3, 4629, 442);
insert into BELONGS_TO (i_id, p_id, a_id)
values (4, 4021, 859);
insert into BELONGS_TO (i_id, p_id, a_id)
values (4, 4563, 227);
insert into BELONGS_TO (i_id, p_id, a_id)
values (5, 1927, 998);
insert into BELONGS_TO (i_id, p_id, a_id)
values (5, 2234, 769);
insert into BELONGS_TO (i_id, p_id, a_id)
values (6, 1130, 568);
insert into BELONGS_TO (i_id, p_id, a_id)
values (6, 9735, 658);
insert into BELONGS_TO (i_id, p_id, a_id)
values (7, 4473, 312);
insert into BELONGS_TO (i_id, p_id, a_id)
values (7, 7266, 4);
insert into BELONGS_TO (i_id, p_id, a_id)
values (8, 1321, 931);
insert into BELONGS_TO (i_id, p_id, a_id)
values (8, 5891, 115);
insert into BELONGS_TO (i_id, p_id, a_id)
values (9, 1295, 653);
insert into BELONGS_TO (i_id, p_id, a_id)
values (9, 5072, 497);
insert into BELONGS_TO (i_id, p_id, a_id)
values (10, 6451, 790);
insert into BELONGS_TO (i_id, p_id, a_id)
values (10, 7196, 367);
insert into BELONGS_TO (i_id, p_id, a_id)
values (11, 1762, 214);
insert into BELONGS_TO (i_id, p_id, a_id)
values (11, 6039, 673);
insert into BELONGS_TO (i_id, p_id, a_id)
values (12, 5945, 552);
insert into BELONGS_TO (i_id, p_id, a_id)
values (12, 6211, 458);
insert into BELONGS_TO (i_id, p_id, a_id)
values (13, 5147, 725);
insert into BELONGS_TO (i_id, p_id, a_id)
values (13, 9750, 120);
insert into BELONGS_TO (i_id, p_id, a_id)
values (14, 1158, 598);
insert into BELONGS_TO (i_id, p_id, a_id)
values (14, 1661, 86);
insert into BELONGS_TO (i_id, p_id, a_id)
values (15, 2990, 630);
insert into BELONGS_TO (i_id, p_id, a_id)
values (15, 8935, 890);
insert into BELONGS_TO (i_id, p_id, a_id)
values (16, 1763, 554);
insert into BELONGS_TO (i_id, p_id, a_id)
values (16, 3125, 233);
insert into BELONGS_TO (i_id, p_id, a_id)
values (17, 1109, 465);
insert into BELONGS_TO (i_id, p_id, a_id)
values (17, 9680, 35);
insert into BELONGS_TO (i_id, p_id, a_id)
values (18, 2186, 425);
insert into BELONGS_TO (i_id, p_id, a_id)
values (18, 4599, 921);
insert into BELONGS_TO (i_id, p_id, a_id)
values (19, 6009, 57);
insert into BELONGS_TO (i_id, p_id, a_id)
values (19, 9627, 630);
insert into BELONGS_TO (i_id, p_id, a_id)
values (20, 1253, 263);
insert into BELONGS_TO (i_id, p_id, a_id)
values (20, 6408, 393);
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
prompt 289 records loaded
prompt Loading CLIENT...
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
prompt 358 records loaded
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
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 944);
insert into DIFFICULTY (d_name, d_id)
values ('medium', 471);
insert into DIFFICULTY (d_name, d_id)
values ('challenging', 4);
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
prompt 199 records loaded
prompt Loading MY_PATH...
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
prompt 269 records loaded
prompt Enabling foreign key constraints for CITY...
alter table CITY enable constraint SYS_C00489986;
prompt Enabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE enable constraint SYS_C00490011;
prompt Enabling foreign key constraints for GUIDE...
alter table GUIDE enable constraint SYS_C00490016;
prompt Enabling foreign key constraints for INVITATION...
alter table INVITATION enable constraint SYS_C00490023;
alter table INVITATION enable constraint SYS_C00490024;
prompt Enabling foreign key constraints for BELONGS_TO...
alter table BELONGS_TO enable constraint SYS_C00498868;
prompt Enabling foreign key constraints for CLIENT...
alter table CLIENT enable constraint SYS_C00491311;
alter table CLIENT enable constraint SYS_C00491312;
prompt Enabling foreign key constraints for MY_PATH...
alter table MY_PATH enable constraint SYS_C00498888;
alter table MY_PATH enable constraint SYS_C00498889;
alter table MY_PATH enable constraint SYS_C00498890;
prompt Enabling triggers for AREA...
alter table AREA enable all triggers;
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
prompt Enabling triggers for BELONGS_TO...
alter table BELONGS_TO enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for DIFFICULTY...
alter table DIFFICULTY enable all triggers;
prompt Enabling triggers for KIND...
alter table KIND enable all triggers;
prompt Enabling triggers for MY_PATH...
alter table MY_PATH enable all triggers;
