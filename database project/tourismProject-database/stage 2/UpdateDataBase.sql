rename area to area_tmp;
rename client to client_tmp;
rename employee to employee_tmp;
rename city to city_tmp;






select * from area;
select * from area_tmp;
insert into area_tmp(a_name, a_id ) 
select a_name, a_id from area where a_id not in (select a_id from area_tmp);


select * from city;
select * from city_tmp;
insert into city_tmp(c_id, c_name, a_id )
select c_id, c_name, a_id from city where c_id not in (select c_id from city_tmp);

select * from employee;
select * from employee_tmp;
insert into employee_tmp(e_id, e_name, hire_date, c_id)
select tz, e_name, hire_date,c_id from employee where tz not in (select e_id from employee_tmp);

select * from client;
select * from client_tmp;
insert into client_tmp(c_tz, c_name, b_date)
select client_id, client_name, client_date from client where client_id not in (select c_tz from client_tmp);

select * from client_tmp where c_id is null

UPDATE client_tmp
SET c_id = 94968 , m_g_id = 268
WHERE c_id is null;

drop table client;
drop table employee;
drop table city;
drop table area;

rename area_tmp to area;
rename client_tmp to client;
rename employee_tmp to employee;
rename city_tmp to city;




rename visit to visit_tmp;
rename go_to to go_to_tmp;
rename participate to participate_tmp;
rename include to include_tmp;
rename working_at to working_at_tmp;








CREATE TABLE visit
(
  client_id NUMERIC(5) NOT NULL,
  city_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (client_id, city_id),
  FOREIGN KEY (client_id) REFERENCES Client(c_tz),
  FOREIGN KEY (city_id) REFERENCES City(C_ID)
);

CREATE TABLE go_to
(
  client_id NUMERIC(5) NOT NULL,
  spa_number INT NOT NULL,
  PRIMARY KEY (client_id, spa_number),
  FOREIGN KEY (client_id) REFERENCES Client(c_tz),
  FOREIGN KEY (spa_number) REFERENCES Spa(spa_number)
);

CREATE TABLE participate
(
  client_id NUMERIC(5) NOT NULL,
  atraction_number INT NOT NULL,
  PRIMARY KEY (client_id, atraction_number),
  FOREIGN KEY (client_id) REFERENCES Client(c_tz),
  FOREIGN KEY (atraction_number) REFERENCES Attractions(atraction_number)
);

CREATE TABLE include
(
  p_id INT NOT NULL,
  city_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (p_id, city_id),
  FOREIGN KEY (p_id) REFERENCES Path(p_id),
  FOREIGN KEY (city_id) REFERENCES City(c_id)
);

CREATE TABLE working_at
(
  e_id NUMERIC(5) NOT NULL,
  spa_number INT NOT NULL,
  PRIMARY KEY (e_id, spa_number),
  FOREIGN KEY (e_id) REFERENCES Employee(e_id),
  FOREIGN KEY (spa_number) REFERENCES Spa(spa_number)
);


insert into visit
select * from visit_tmp;
select * from visit;


insert into go_to
select * from go_to_tmp;
select * from go_to;


insert into participate
select * from participate_tmp;
select * from participate;

insert into include
select * from include_tmp;
select * from include;

insert into working_at
select * from working_at_tmp;
select * from working_at;






drop table visit_tmp;
drop table go_to_tmp;
drop table participate_tmp;
drop table include_tmp;
drop table working_at_tmp;
