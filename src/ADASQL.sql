create database ADA;
use ADA;
show tables;

drop table Admins;
-- Admin Table
-- Admin Roles: Regional Coordinator, CEO, Team Leader
select * from Admins;
describe Admins;
create table Admins(
    username varchar(40) not null,
    password char(40) not null,
	firstname varchar(40) not null,
    lastname varchar(40) not null,
	role varchar(30),
    primary key(username)
);

-- Teams
drop table Teams;
create table Teams(
	teamname varchar(40) not null,
    teamID int auto_increment,
    username varchar(40),
    latitude decimal(11,8) not null,
    longitude int(11)not null,
    primary key (teamid),
    foreign key (username) references Admins(username)
);

-- Team Leader Application
select now();
select * from Applications;
drop table Applications;
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
    datetime datetime,
    accepted tinyint,
    completed tinyint,
    primary key(appID)
);

create table Volunteers(
	firstname varchar(40) not null,
    lastname varchar(40) not null,
	volID int auto_increment,
    schoolyear int,
    hometown varchar(40),
    highschool varchar(40),
    bio varchar(300),
    team varchar(40),
    pictureurl varchar(100),
    startyear int,
    active tinyint,
    primary key(volID)
);

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

-- Example Inserts
insert into Admins(username, password, firstname, lastname, role)
	values('testuser', sha1('testpass'), 'First', 'Last', 'Test');

delete from Admins where username = 'testuser';
    

select sha1('test');
select username from Admins where username='testuser' and password=md5('testpass');
select * from Admins;
select * from Teams;

-- Delete table if needed
drop table Admins;
