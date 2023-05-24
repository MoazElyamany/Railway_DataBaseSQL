CREATE DATABASE RailwayTransport
USE RailwayTransport


CREATE TABLE Passenger(
				Pass_ID INT NOT NULL PRIMARY KEY,
				FIRST_NAME CHAR(25),
				LAST_NAME CHAR(25),
				Pass_Word CHAR(25),
				Email CHAR(25),
				BirthDate CHAR(25));
Insert Into Passenger
Values
            ('1','Monika','Arora','3674','mon65@gmail.com','1/10/1973'),
			('2','Amitabh','Singh','35464','ams48@gmail.com','19/12/1994'),
			('3','Vivek','Bhati','34522','vbb565@gmail.com','5/11/1982'),
			('4','Niharika', 'Verma','12345676','nive231@gmail.com','10/12/1985'),
			('5','Satish','Kumar','31210760','sak82@gmail.com','30/12/1975'),
			('6','Geetika','Chauhan','434353','gech21@gmail.com','21/12/1989'),
			('7','Vivek', 'Diwan','7878764','vidi87@gmail.com','3/10/1980'),
			('8','Vishal', 'Singhal','75375','visi12@gmail.com','17/1/1994');


CREATE TABLE Pass_Numbers(
				Pass_ID INT NOT NULL,
				Phone_Nmuber INT NOT NULL,
				PRIMARY KEY(Pass_ID,Phone_Nmuber),
				FOREIGN KEY(Pass_ID) REFERENCES Passenger(Pass_ID) ON DELETE CASCADE);
Insert Into Pass_Numbers
values 
			('1','98765456'),
			--('1','98335456'),
			('2','35683343'),
			('3','76541239'),
			('4','87653466'),
			('5','10981234'),
			('6','56712398'),
			('7','78943217'),
			('8','23456980');



CREATE TABLE Station(
				Station_No CHAR(9) NOT NULL PRIMARY KEY,
				S_Name CHAR(25));
INSERT INTO Station
values 
			('100','Gornergrat'),
			('101','Zugspitze'),
			('102','Schafberg'),
			('103','Bernina'),
			('104','Rigi'),
			('105','Bretaye'),
			('106','Tatra'),
			('107','Rittnerbahn');


CREATE TABLE Worker(
				Worker_ID INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Worker(Worker_ID),
				W_Surname CHAR(25),
				D_B CHAR(25),
				YearsOfExperience INT,
				Lead_Ssn int);
Insert Into Worker 
values		 
			('11','walter','10/1/1990','6','13'),
			('12','white','15/10/1987','8',Null),
			('13','dfpld','11/12/1967','11',Null),
			('14','sccdf','30/12/1977','15','18'),
			('15','edef','11/12/1969','20','14'),
			('16','fvfr','11/11/1989','9',Null),
			('17','efee','29/12/1984','13','13'),
			('18','wekn','11/10/1978','10',Null);

CREATE TABLE Trip(
				Trip_ID CHAR(9) NOT NULL PRIMARY KEY,
				Station_No CHAR(9) NOT NULL,
				Worker_ID INT NOT NULL,
				Trip_Date CHAR(25),
				DepartureTime CHAR(25),
				ArivalTime CHAR(25),
				Trip_Status CHAR(1) check(Trip_Status in('S','D')),
				FOREIGN KEY(Station_No)REFERENCES Station(Station_No) ON DELETE CASCADE,
				FOREIGN KEY(Worker_ID)REFERENCES Worker(Worker_ID) ON DELETE CASCADE);
INSERT INTO Trip
values 
			('5','100','11','12/1/2020','14:20:00','14:50:00','S'),
			('10','101','12','1/2/2020','14:30:00','15:00:00','D'),
			('15','102','13','5/3/2020','14:40:00','15:15:00','S'),
			('20','103','14','8/4/2020','15:10:00','16:10:00','S'),
			('25','104','15','22/5/2020','15:50:00','16:30:00','D'),
			('30','105','16','10/6/2020','15:55:00','16:35:00','D'),
			('35','106','17','30/7/2020','16:30:00','17:05:00','S'),
			('40','107','18','28/8/2020','16:40:00','18:10:00','D');


CREATE TABLE Ticket(
				Ticket_ID INT NOT NULL PRIMARY KEY,
				Trip_ID CHAR(9) NOT NULL,
				Pass_ID INT NOT NULL,
				Ticket_status char(1) check(Ticket_status in('V','I')),  
				DateOfBooking CHAR(25),
				FOREIGN KEY(Pass_ID) REFERENCES Passenger(Pass_ID) ON DELETE CASCADE,
				FOREIGN KEY(Trip_ID)REFERENCES Trip(Trip_ID) ON DELETE CASCADE);
Insert Into Ticket 
values 
			('10','5','1','V','1/1/2020'),
			('20','10','2','I','1/4/2020'),
			('30','15','3','V','2/3/2020'),
			('40','20','4','V','4/4/2020'),
			('50','25','5','I','1/6/2020'),
			('60','30','6','I','7/4/2020'),
			('70','35','7','V','9/5/2020'),
			('80','40','8','V','11/1/2020'),


CREATE TABLE One_Way(
				Ticket_ID INT NOT NULL,
				OneWay_Sign char(1) check (OneWay_Sign in ('T','F')) Not Null,
				PRIMARY KEY(Ticket_ID),
				FOREIGN KEY(Ticket_ID) REFERENCES Ticket(Ticket_ID) ON DELETE CASCADE)
Insert Into one_way 
values		
			('10','T'),
			('20','F'),
			('30','T'),
			('40','T'),
			('50','F'),
			('60','F'),
			('70','T'),
			('80','T');


CREATE TABLE Round_Trip(
				Ticket_ID INT NOT NULL,
				RoundTrip_Sign char(1) check (RoundTrip_Sign in ('T','F')) Not Null,
				PRIMARY KEY(Ticket_ID),
				FOREIGN KEY(Ticket_ID) REFERENCES Ticket(Ticket_ID) ON DELETE CASCADE);
Insert Into Round_Trip
values		
			('10','F'),
			('20','T'),
			('30','F'),
			('40','F'),
			('50','T'),
			('60','T'),
			('70','F'),
			('80','F');


CREATE TABLE Works_On(
			 Worker_Id int Not Null,
			 Station_No CHAR(9) Not Null,
			 primary key (Worker_Id,Station_No),
			 Foreign key (Worker_Id) references Worker(Worker_Id) ON DELETE Cascade,
			 Foreign key (Station_No) references Station(Station_No) ON DELETE Cascade);
Insert Into Works_On 
Values		
			('11','100'),
			('12','101'),
			('13','102'),
			('14','103'),
			('15','104'),
			('16','105'),
			('17','106'),
			('18','107');
CREATE TABLE Dependant(
				Worker_ID INT NOT NULL,
				D_Name CHAR(25) NOT NULL,
				D_date char(25) Not Null,
				Relationship char(9),
				PRIMARY KEY(Worker_ID,D_Name),
				FOREIGN KEY(Worker_ID) REFERENCES Worker(Worker_ID) ON DELETE CASCADE);
insert into Dependant 
values 
			('11','ali','20/10/2012','brother'),
			('12','aya','30/11/1975','mother'),
			('13','omar','14/11/2010','son'),
			('14','saad','08/07/1964','father'),
			('15','fares','11/11/2015','son'),
			('16','mido','16/6/2016','son'),
			('17','toka','14/05/2014','daughter'),
			('18','amr','24/3/2017','son');
       -------------------------------------------------------------------------------------------------------------------------------------

--Queries
SELECT *
FROM Worker
WHERE 
		W_Surname LIKE '_____r';

SELECT W_Surname, YearsOfExperience
FROM Worker
WHERE YearsOfExperience = (SELECT MAX(YearsOfExperience)
						   FROM Worker);

select t.Ticket_ID , Trip_ID ,DateOfBooking,O.OneWay_Sign  
from Ticket T join One_Way O on t.Ticket_ID = O.Ticket_ID 
where 
		o.OneWay_Sign='T';

select t.Ticket_ID , Trip_ID ,DateOfBooking,RoundTrip_Sign  
from Ticket T join Round_Trip R on t.Ticket_ID = R.Ticket_ID 
where 
		R.RoundTrip_Sign='T';

select * 
from Trip T join Station S on T.Station_No = S.Station_No 	
		
select TIC.pass_id ,FIRST_NAME+' '+LAST_NAME as 'full name',Ticket_ID,
Ticket_status,DateOfBooking,T.Trip_ID ,trip_date,DepartureTime ,ArivalTime 
from Ticket Tic join Passenger P on tic.Pass_ID = p.Pass_ID 
join Trip T on T.Trip_ID = TIC.Trip_ID  
where Ticket_status ='v'

		-------------------------------------------------------------------------------------------------------------------------------------

--Functions
      --Scalar functions
create function passenger_name (@id int)
returns varchar(25)
begin     
		declare @name varchar (25) 
		select @name = FIRST_NAME 
		from Passenger 
		where Pass_Id =@id 
		return @name 
end
select dbo.passenger_name (5) 

create function Ticket_validity (@id int)
returns char(1) 
begin 
        declare @state char(1)
		select  @state = ticket_status 
		from Ticket 
		where Ticket_ID = @id 
		return @state 
end 
select dbo.Ticket_validity(10)

create function worker_exp (@id int)
returns int 
begin 
        declare @exp int
		select  @exp = YearsOfExperience 
		from Worker 
		where Worker_ID = @id 
		return @exp 
end 
select dbo.worker_exp(13)
       --Talbe_Valued functions
create function worker_name ()
returns table
 as
  return
(    
		select *
		from Worker 
		WHERE 
		W_Surname LIKE '%e'
 )
select * from  dbo.worker_name ()

CREATE FUNCTION fntripstate (@state CHAR(1))
RETURNS @t table (id int, stateof char(1))
       begin
			insert into @t
			select Trip.Trip_ID , Trip.Trip_Status
			from Trip
			where Trip.Trip_Status = @state
			return
		end
SELECT * FROM dbo.fntripstate ('S')

CREATE FUNCTION fnchechsupervision (@idofleader int)
RETURNS @t table (id int, member_of_craw CHAR(25))
       begin
			insert into @t
			select w1.worker_id , w1.W_Surname as member_of_craw
			from worker w1 join worker w2 on w1.Lead_Ssn = @idofleader
			where w2.Worker_ID= @idofleader
			return
		end
SELECT * FROM dbo.fnchechsupervision (13)
     
	    -------------------------------------------------------------------------------------------------------------------------------------

--Views
create view vpassenger as
select p.Pass_ID , FIRST_NAME+' '+LAST_NAME as 'full name' , Email ,n.Phone_Nmuber
from passenger p join Pass_Numbers n on p.Pass_ID = n.Pass_ID   
select * from vpassenger 
 
create view passenger_informations
 As 
select TIC.pass_id ,FIRST_NAME+' '+LAST_NAME as 'full name',Ticket_ID,Ticket_status,DateOfBooking,T.Trip_ID ,trip_date,DepartureTime ,ArivalTime 
from Ticket Tic join Passenger P on tic.Pass_ID = p.Pass_ID 
join Trip T on T.Trip_ID = TIC.Trip_ID  
where Ticket_status ='v' 
select * from passenger_informations  

create view worker_informations As 
select W.Worker_Id , w.w_surname , w.YearsOfExperience , s.station_no
from worker w join Works_On O  on w.worker_id=o.worker_id 
join station s on o.station_no = s.station_no 
select * from worker_informations

create view dependant_information As
select W.W_Surname,D_Name ,D.D_date AS DateOfBirth ,D.Relationship
from Dependant D join Worker W  on D.worker_id=W.worker_id 
join Works_On o on o.worker_id = W.worker_id 
select * from dependant_information

	    -------------------------------------------------------------------------------------------------------------------------------------

--Transaction
begin transaction
    update worker 
	set YearsOfExperience = YearsOfExperience +1
	where Worker_ID=13

	declare @Y0fE int
	select @Y0fE = YearsOfExperience
	from worker where Worker_ID = 13

	if @Y0fE > 0 
	    commit 
	else 
	    rollback
select * from worker


begin transaction
    update Ticket 
	set Ticket_status = 'I'
	where Ticket_ID=40

	declare @state char(1)
	select @state = Ticket_status
	from Ticket where Ticket_ID = 40

	if @state = 'I' 
	    commit 
	else 
	    rollback
select * from ticket


begin transaction
    update worker 
	set Lead_Ssn = 15
	where Worker_ID=18

	declare @leadssn int
	select @leadssn = Lead_Ssn
	from worker where Worker_ID = 15

	if @leadssn is not null
	    commit 
	else 
	    rollback
select * from worker


begin transaction
    update Pass_Numbers 
	set Phone_Nmuber = '1088924'
	where Pass_ID=7

	declare @number char(10)
	select @number = Phone_Nmuber
	from Pass_Numbers where Pass_ID = 7

	if @number is not null
	    commit 
	else 
	    rollback
select * from Pass_Numbers

	    -------------------------------------------------------------------------------------------------------------------------------------
--Triggers

CREATE TRIGGER supervision
ON Worker
AFTER INSERT
AS
BEGIN
      declare @id int
	  select @id = i.Worker_ID
	  from inserted as i

	  declare @leadssn int
	  select @leadssn = i.lead_ssn
	  from inserted as i
      
	  update worker
	  set lead_ssn = @id
	  where Worker_ID  = ( select top(1) Worker_ID from worker where Lead_Ssn is null)

END
insert into worker(Worker_ID) 
values ('19')
select * from worker

---

CREATE TRIGGER ticket_Status
ON Ticket
AFTER  DELETE 
AS
BEGIN
   declare @passenger_id int , @ticket_id int
   select @passenger_id = d.pass_id , @ticket_id= d.Ticket_ID
   from deleted as d
   update ticket
   set Ticket_status = 'I'
END



insert into passenger(Pass_ID) 
values ('19')
delete from passenger where pass_id = 9
select * from ticket , passenger






             --------------------------------------------------------------------------------------------------------
--Stored Procedure
create procedure spInsertEmp
@pass_id int,
@first_name varchar(25),
@last_name varchar(25),
@email varchar(25)
as 
begin
	begin try
		insert into Passenger(Pass_ID, FIRST_NAME, LAST_NAME, Email)
		values(@pass_id, @first_name, @last_name, @email)
		return 0
	end try
	begin catch
		return 1
	end catch
end

declare @status int
execute @status = spInsertEmp 9, 'ahmed', 'mohamed','mm4w45@gmail.com'
select @status as _status
select * from Passenger

---

create procedure update_ticket_status 
@ticket_id int
as 
begin
		update Ticket 
		set Ticket_status='I'
	    where Ticket_id = @ticket_id 
end 

declare @change int
execute @change = update_ticket_status 30
select @change

select * from Ticket

---

create procedure get_Worker_Name
@in_id int,
@worker_name varchar(20) output
as
begin
	select @worker_name = W_Surname
	from Worker
	where Worker_ID = @in_id
end

declare @result varchar(20)
execute get_Worker_Name @in_id = 13, @worker_name = @result output
select @result 

                      -----------------------------------------------------------------------------------------------------------
