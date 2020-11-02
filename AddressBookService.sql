--uc1 create database
create database AddressBookServiceDB

--uc2 create table
CREATE table address_book(
firstname varchar(20) not null,
lastname varchar(20) not null,
address varchar(100) not null,
city varchar(20) not null,
state varchar(15) not null,
zip varchar(6) not null,
phoneNumber int, 
emailID varchar(20)
)
select * from address_book
alter table address_book alter column phoneNumber varchar(15)

--uc3 insert contacts to address book
insert into address_book values(
'Neha','Gupta','abcdef','Kolkata','WB','234567','1234567890','nehagpt@gmail.com')
insert into address_book values(
'Sunayana','Nag','Jirania','Agartala','Tripura','799046','9876543000','sunayana@gmail.com')
insert into address_book values(
'Atul','Sharma','Newtown','Kolkata','WB','234567','123456789','sharmaatul@gmail.com')
insert into address_book values(
'Sourav','Ghosh','abfdegh','Agartala','Tripura','799282','9783450023','sourav@gmail.com')

--uc4 edit existing contact using firstname
update address_book set zip='755234' where firstname='Atul'

--uc5 delete person using firstname
delete from address_book where firstname='Sourav'

--uc6 retrieve person belonging to city or state
select * from address_book where state='WB'

--uc7 size of address book as per state/city
select state,count(state) as Contacts from address_book group by state

--uc8 retrieve entries sorted alphabetically for a given city
select * from address_book where city='Kolkata' order by firstname;

--uc9 identify address book using name and type
alter table address_book add name varchar(20),type varchar(20);
update address_book set name='neha',type='friend' where firstname='Neha'
update address_book set name='sunayana',type='family' where firstname='Sunayana'
update address_book set name='atul',type='friend' where firstname='Atul'

--uc10 get count by type
select type,count(*) as Contacts from address_book group by type

--uc11 add person to both friend and family
insert into address_book values(
'Neha','Gupta','abcdef','Kolkata','WB','234567','1234567890','nehagpt@gmail.com','neha','family')

--uc12
create table contact(
ID int not null identity(1,1) primary key,
firstname varchar(20) not null,
lastname varchar(20) not null,
phoneNumber varchar(20) not null,
emailID varchar(30) not null
)


select * from contact
insert into contact values (
'Neha','Gupta','1234567890','nehagpt@gmail.com')
insert into contact values (
'Sunayana','Nag','9876543000','sunayana@gmail.com')
insert into contact values (
'Atul','Sharma','123456789','sharmaatul@gmail.com')
insert into contact values (
'Susmita','Sen','9330295337','susmita@gmail.com')


create table address(
ID int not null foreign key references contact(ID),
name varchar(20) not null,
type varchar(20) not null,
address varchar(100),
city varchar(100),
state varchar(100),
zip varchar(6)
)
select * from address

insert into address values(
1,'neha','friend','Newtown','Kolkata','WB','786598')
insert into address values(
2,'sunayana','office','Ramnagar','Agartala','Tripura','799260')
insert into address values(
3,'atul','friend',null,null,null,null)
insert into address values(
3,'susmita','family',null,null,null,null)

update address set ID=4 where name='susmita'

--uc13
select c.firstname, c.lastname,c.phoneNumber,c.emailID,a.type,a.address,a.state from contact c
join address a on c.id=a.id where type='friend'
