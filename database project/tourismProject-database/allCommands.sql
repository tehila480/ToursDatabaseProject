------Queries with parameters------
--1.
select C.c_tz
from client C
where C.m_g_id in
      (select I.m_g_id
      from invitation I
      where I.i_id in
            (select B.i_id
            from belongs_to B
            where B.p_id in
                  (select p_id 
                   from my_path P
                   where p.p_name = &<name= "name of path" 
                                      hint="The name of the path is a string beginning with a large letter of length 5"
                                      type="string"
                                      required=true>)))

--2.
select cruise_number, ship_id, count(*) as num_of_empty_room
from cruise c natural join ship s natural join room r
where c.begin_date >= to_date(&<name= "begin date" type=string default ="22/06/2020">,'dd/mm/yyyy') and c.end_date <= to_date(&<name= "end date" type="string" default ="22/07/2020">,'dd/mm/yyyy') and r.status='OK'
group by cruise_number, ship_id

--3.
select g_id, e_name
from difficulty natural join my_path natural join belongs_to natural join invitation natural join guide natural join employee
where d_name = &<name="difficulty" 
                 type="string" 
                 hint ="Choose the difficulty level: easy, medium, hard and challenging" 
                 list="select  distinct d_name from difficulty" restricted="yes">
group by g_id, e_name
having count(*)=2

--4.
select distinct atraction_name
from client natural join participate natural join attractions
where c_tz in (&<name= "tz" 
                 list="select c_tz, c_name from client order by c_name"
                 description="yes"
                 multiselect="yes">)


------Reports------

--1
select begin_city, count(*) As amount_of_begin
from path 
group by begin_city
UNION
select c_name, 0
from city
where c_name NOT IN (SELECT begin_city FROM path)

--2
select g_id, count(*) As amount_of_invitation, experience
from invitation natural join guide 
group by g_id, experience


------Functions------
--1)
--helped function
create or replace noneditionable function numberOfGroup(clientId in integer) return integer is
  FunctionResult integer;
begin
  select m_g_id into FunctionResult from client where c_tz = clientId;
  return(FunctionResult);
end numberOfGroup;
--helped function
create or replace noneditionable function generalHighPrice(idOfGroup in integer) return integer is
  FunctionResult integer;
  cursor priceInGroup is select price from invitation where m_g_id = idOfGroup;
  tempPrice integer;
begin
  FunctionResult := 0;
  if not priceInGroup%isopen 
    then
      open priceInGroup;
  end if;
  fetch priceInGroup into tempPrice;
  while priceInGroup%found
    loop
      if FunctionResult < tempPrice 
        then
          FunctionResult := tempPrice;
          end if;
      fetch priceInGroup into tempPrice;
    end loop;

  return(FunctionResult);
end generalHighPrice;
--The function
create or replace noneditionable function costOfTrip(clientid in integer, status in string, age in float) return integer is
  FunctionResult float;
    cursor amountInGroup is select c_tz from client where m_g_id = numberOfGroup(clientid);
    amountOfPeople integer := 0;
    tempclient client.c_tz%type;

begin
  if not amountInGroup%isopen 
    then
      open amountInGroup;
  end if;
  fetch amountInGroup into tempclient;
  while amountInGroup%found
    loop
      amountOfPeople := amountOfPeople + 1;
      fetch amountInGroup into tempclient;
    end loop;
  FunctionResult := generalHighPrice(numberOfGroup(clientid)) / amountOfPeople;           
   if status = 'student' 
    then 
      FunctionResult := FunctionResult*0.80;
   elsif status = 'Soldier' 
     then 
       FunctionResult := FunctionResult*0.70;
   elsif status = 'veteran' 
     then 
       FunctionResult := FunctionResult*0.50; 
   elsif age <= 18 
      then
        FunctionResult := FunctionResult*0.50;
   end if;
  return(FunctionResult);
end costOfTrip;


--2)
create or replace noneditionable function profitOfCruise(cruiseName in string) return integer is
  FunctionResult integer;
  cursor passOnTable is select room_price from room natural join cruise where cruise_name = cruiseName and status = 'BUSY';
  tempRow passOnTable%rowtype;
begin
  FunctionResult := 0;
  for tempRow in passOnTable
    loop 
      FunctionResult := FunctionResult + tempRow.Room_Price;
    end loop;   
  return(FunctionResult);
end profitOfCruise;




------Procedures------
--1.
create or replace noneditionable procedure addNewAttraction(attractionID in attractions.atraction_number%type, attractionOpen in attractions.atraction_open_hours%type, attractionClose in attractions.ATRACTION_CLOSE_HOUES%type, attractionName in attractions.atraction_name%type, attractionPrice in attractions.atraction_price%type, numberOfParticipant in attractions.number_of_participants%type) is

cursor sumOfAttraction is select atraction_number from attractions where atraction_name = attractionName;
cursor hoursOfAttraction is select atraction_number from attractions where atraction_name = attractionName and attractionOpen = atraction_open_hours and attractionClose = atraction_close_houes;

mySum integer := 0;
tempAttraction attractions.atraction_number%type;
hourscursor attractions.atraction_number%type;
flag boolean;
begin
  flag := false;
  if not sumOfAttraction%isopen 
    then
      open sumOfAttraction;
  end if;
  fetch sumOfAttraction into tempAttraction;
  while sumOfAttraction%found
    loop
      mySum := mySum + 1;
      fetch sumOfAttraction into tempAttraction;
    end loop;
  if mySum < 60 then
    if attractionName = 'POOL' or attractionName = 'DANCE' or attractionName = 'YOGA' then
      if numberOfParticipant >= 50 and numberOfParticipant <= 100 then 
        flag := true;
      end if;
    elsif  numberOfParticipant >= 20 and numberOfParticipant <= 50 then
      flag := true;
     end if;
   end if;
  if attractionPrice > 150 then 
    flag := false;
  end if;   
  if not hoursOfAttraction%isopen 
    then
      open hoursOfAttraction;
  end if;
  fetch hoursOfAttraction into hourscursor;
  while hoursOfAttraction%found
    loop
      flag := false;
      fetch hoursOfAttraction into hourscursor;
    end loop;
  if flag = true then
    insert into attractions values(attractionName, attractionID, attractionOpen, attractionClose, attractionPrice, numberOfParticipant);  
    commit;
    dbms_output.put_line('Attraction successfully added!!!');
  else
      dbms_output.put_line('Unfortunately, Your attraction does not fit our criteria.');
  end if;

end addNewAttraction;


--2.
create or replace noneditionable procedure InterestingTrips(areaInCountry in string, maxTime in float) is
cursor tripsInArea is select p_name, p_time from area natural join my_path where  a_name = areaInCountry and p_time <= maxTime;
tempNameTrip tripsInArea%rowtype;
begin
  for tempNameTrip in tripsInArea
    loop
        dbms_output.put_line('Name of trip: ' || tempNameTrip.p_Name ||', Time: ' || tempNameTrip.p_Time);
    end loop;
end InterestingTrips;





------Triggers------
--1
create or replace noneditionable trigger experienceOfGuid
  before insert or update
  on guide 
  for each row
declare
  -- local variables here
  temp float;
  employeeHireDate employee.hire_date%type;
begin
  select employee.hire_date into employeeHireDate  from employee where employee.e_id = :new.e_id;
  temp := (to_date(sysdate, 'dd/mm/yyyy')-to_date(employeeHireDate, 'dd/mm/yyyy'))/365;
  temp := substr(temp,1,5);
 :new.experience := temp; 
end experienceOfGuid;



--2
create or replace noneditionable trigger invitationOfCruise
  before insert 
  on cruise 
  for each row
declare
  -- local variables here
begin
  if to_char(:new.begin_date) < to_char(sysdate, 'dd/mm/yyyy') then
    :new.begin_date := to_date(sysdate, 'dd/mm/yyyy');
  end if; 
end invitationOfCruise;
