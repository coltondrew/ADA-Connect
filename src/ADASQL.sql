create database ADA;
use ADA;

-- Admin Table
-- Admin Roles: Regional Coordinator, CEO, Team Leader
create table Admins(
    username varchar(40),
    password varchar(40),
	firstname varchar(40),
    lastname varchar(40),
	role varchar(20),
    primary key(username)
);

create table Teams(
	teamname varchar(40),
    teamID int auto_increment,
    username varchar(20),
    latitude int(10),
    longitude int(10),
    primary key (teamid),
    foreign key (username) references Admins(username)
);

create table Volunteers(
	firstname varchar(40),
    lastname varchar(40),
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

create table Applications(
	answer1 varchar(40),
	answer2 varchar(40),
	complete tinyint,
	accepted tinyint
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
    


select username from Admins where username='testuser' and password=sha1('testpass');
select * from Admins;

-- Delete table if needed
drop table Admins;
