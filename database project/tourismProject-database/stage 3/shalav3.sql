--Queries

--select

--1.
select m_g_id, (count(*)-amount) as plus
from my_group natural join client
group by m_g_id, amount
having count(*)>=amount;

--2.
select C.c_tz
from client C
where C.m_g_id not in
      (select I.m_g_id
      from invitation I
      where I.i_id in
            (select B.i_id
            from belongs_to B
            where B.p_id in
                  (select p_id 
                   from my_path P
                   where p.p_name ='Onfud')))
                   
--3.
select C.c_tz
from client C
where not exists
      (select A.atraction_number
      from ATTRACTIONS A
      where A.atraction_number not in
            (select P.atraction_number
             from participate P
             where C.c_tz= P.client_id))
            
--4.
select i.g_id
from client c ,my_group m,invitation i
where c.m_g_id=m.m_g_id and i.m_g_id=m.m_g_id and i.i_date=c.b_date


--5.
(SELECT g.g_id
FROM guide g
where g.g_id not in
(SELECT g.g_id
FROM guide g, client c, invitation i, my_group m 
WHERE g.g_id = c.c_tz and c.m_g_id=m.m_g_id and m.m_g_id=i.m_g_id and i.g_id=g.g_id ))
intersect
(select c.c_tz
from client c natural join my_group m natural join invitation i)

--6.
select cruise_number, ship_id, count(*) as num_of_empty_room
from cruise c natural join ship s natural join room r
where (c.begin_date >= to_date('07/06/2020','dd/mm/yyyy') and c.end_date <= to_date('07/07/2020','dd/mm/yyyy'))and r.status='OK'
group by cruise_number, ship_id

--7.
select (c_id) as city_id
from participate p natural join go_to g , client c
where c.c_tz=client_id
group by c_id
having count(*)>=ALL
       (select count(*)
       from participate p natural join go_to g , client c
       where c.c_tz=client_id
       group by c_id)
       
--8.
select  distinct e_id
from city c natural join employee e, path p
where c_name=p.begin_city or c_name=p.end_city


--update

--1
UPDATE kind
SET k_name = 'WOW'
WHERE k_name in (select k_name
                 from kind natural join my_path natural join difficulty
                 where d_name = 'easy')
       
--2
UPDATE path
SET num_of_stations = num_of_stations+1
where num_of_stations<10
--בדיקה עבור העידכון
/*select * 
from path
where num_of_stations<10*/

--delete

--1
DELETE FROM Attractions
WHERE ATRACTION_NUMBER not in (SELECT ATRACTION_NUMBER 
                               FROM participate)
--בדיקה לאחר המחיקה
/*select *
FROM Attractions
WHERE ATRACTION_NUMBER not in (SELECT ATRACTION_NUMBER 
                               FROM participate)*/
                               
--2
delete 
from belongs_to
where i_id in
(select i_id 
from invitation
where g_id in (select g_id
               from guide 
              where experience<1));
--ביצוע פקודת commit              
--commit;              
delete  
from invitation
where g_id in (select g_id
               from guide 
               where experience<1);
delete 
from guide 
where experience<1;

--ביצוע פקודת rollback
--rollback;

--בדיקה עבור אימות המחיקה
/*select *
from guide 
where experience<1;*/



--index
 
--1.
create index city_name
on city(c_name);

--2.
create index status_room
on room(status);

--3.
create index amount_of_people
on my_group(amount);

--מחיקת אינדקסים                              
/*drop index city_name;
drop index status_room;
drop index amount_of_people;*/


--Constraints

--check
alter table spa
 add constraint check_spa CHECK(ENTRENCE_AGE between 6 and 30);
--test
insert into spa values('123', '8', '40', '20')


--default
alter table area MODIFY a_name DEFAULT 'Mercaz';
--test
insert into area(a_id) values('12345')
select * from area where a_id='12345'                           
                               

--not null
ALTER TABLE room
MODIFY ROOM_PRICE INTEGER NOT NULL;
--test
insert into room(num_beds,room_number,ship_id,status) values('5', '12345','1234','OK')



--Create user and Access rights

--Create a new user named Tehila
alter session set "_ORACLE_SCRIPT"=true;
create user Tehila identified by 123; -- Create a user named Tehila 


--הרשאות גישה
grant create session to Tehila ;-- הרשאה להתחברות
grant create table to Tehila ; -- הרשאה ליצירת טבלאות
grant all on ATTRACTIONS to Tehila ;
grant update on invitation to Tehila ;
grant update on my_path to Tehila ;
grant select on cruise to Tehila ;
grant delete on room to Tehila ;
grant insert on guide to Tehila ;
grant select on guide to public ;-- הרשאה של שליפה לכל המשתמשים
--לקיחת הרשאה עבור בחירה לטבלת cruise
revoke select on cruise from Tehila ; 


--views

--יצירת מבט פשוט
create view view_attraction As
select *
from attractions
where atraction_name='YOGA' or atraction_name='DANCE'
--שאילתה
select * 
from view_attraction
where atraction_price<80
--עידכון במבט גורם גם לעדכון בטבלאות
update view_attraction
set number_of_participants=number_of_participants-5
where number_of_participants>50

--בדיקה בשביל לראות שהשינוי במבט גרם לשינוי בטבלאות
select * 
from view_attraction
where atraction_name='YOGA' or atraction_name='DANCE';
select * 
from attractions
where atraction_name='YOGA' or atraction_name='DANCE';



--יצירת מבט מורכב
create view view_a_c_c As
select city.c_id As city_id, city.c_name as city_name  ,area.a_id As area_id , area.a_name As area_name , c_tz, client.c_name as client_name, b_date, m_g_id
from city, client, area
where city.c_id=client.c_id and city.a_id = area.a_id

--שאילתה
select c_tz
from view_a_c_c
where area_name ='south' and b_date between to_date('01/01/1999','dd/mm/yyyy') and to_date('31/12/1999','dd/mm/yyyy')

--נסיון למחוק ממבט מורכב אך אין אפשרות לעשות זאת
delete 
from view_a_c_c
where city_id='94968'


                         
