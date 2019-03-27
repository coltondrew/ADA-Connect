create database ADA;
use ADA;
show tables;

drop table Admins;
-- Admin Table
-- Admin Roles: Regional Coordinator, CEO, Team Leader

create table Admins(
    username varchar(40) not null,
    password char(40) not null,
	firstname varchar(40) not null,
    lastname varchar(40) not null,
	role varchar(30),
    primary key(username)
);

select * from Admins;
describe Admins;

insert into Admins(username, password, firstname, lastname, role)
	values('testuser', sha1('testpass'), 'First', 'Last', 'Test');
    
select firstname, lastname from Admins where role = 'Team Leader';
    
select username from Admins where username='testuser' and password=md5('testpass');

-- Teams
drop table Teams;
create table Teams(
	teamname varchar(50) not null,
    teamID int auto_increment,
    teamleader varchar(40) not null,
    latitude decimal(11,8) not null,
    longitude decimal(11,8)not null,
    pictureurl varchar(75),
    primary key (teamid),
    foreign key (teamleader) references Admins(username)
);

insert into Teams(teamname, teamleader, latitude, longitude, pictureurl)
	values('Test Team', 'testuser2', 1.00, 1.00, 'TEST PICTURE URL');
select teamname from Teams;

-- Team Leader Application
create table Applications(
	appID int auto_increment,
    firstname varchar(40) not null,
    lastname varchar(40) not null,
    email varchar(60) not null,
    schoolyear varchar (15) not null,
    university varchar(50) not null,
    unipopulation int not null,
    curteamoncampus tinyint not null,
    credithours int not null,
    workhours int not null,
    parttime tinyint not null,
    parttimehours int not null,
    newman tinyint not null,
    newmanstudents int not null,
    prolifegroup tinyint not null,
    prolifegroupstudents int not null,
    north tinyint not null,
    religion varchar(40) not null,
    audiourl varchar(50),
    datetime datetime default now(),
    accepted tinyint default 0,
    completed tinyint default 0,
    primary key(appID)
);
select * from Applications;

select appID, firstname, lastname, datetime from Applications where completed = 0 order by datetime;

update Applications set accepted = 1, completed = 1 where appid = 1;

create table Volunteers(
	firstname varchar(40) not null,
    lastname varchar(40) not null,
	volID int auto_increment,
    schoolyear varchar(30),
    hometown varchar(50),
    highschool varchar(40),
    bio varchar(300),
    team varchar(50) not null,
    pictureurl varchar(100),
    startdate date not null,
    active tinyint default 1,
    primary key(volID)
);

select * from Volunteers;

insert into Volunteers(firstname,lastname,schoolyear,hometown,highschool,bio,team,pictureurl, startdate)
	values('volun', 'teer', 'Senior', 'Omaha', 'Millard West', 'This is my bio', 'team A', 'PICTURE URL', curdate());



create table Stats(
	volID int auto_increment,
    teamID int,
    conversations int,
    conversions int,
    numyear int,
    numweek int,
    primary key(userid, teamid, numyear, numweek),
    foreign key(userid) references Volunteers(userid),
    foreign key(teamid) references Teams(teamid)
);



create table News(
	title varchar(100),
	contents varchar(500),
	datemade datetime,
	pictureurl varchar(100)
);



delete from Admins where username = 'testuser';


select firstname, lastname, email, schoolyear, university, unipopulation, curteamoncampus, credithours, workhours, parttime, parttimehours, newman, newmanstudents, prolifegroup, prolifegroupstudents, north, religion, audiourl from Applications where appID = 3;
select sha1('test');



-- Delete table if needed
drop table Admins;
