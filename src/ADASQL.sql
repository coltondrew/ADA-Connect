create database ADA;
use ADA;
show tables;

-- Admins
create table Admins(
    username varchar(40) not null,
    password char(40) not null,
	firstname varchar(40) not null,
    lastname varchar(40) not null,
	role varchar(30),
    primary key(username)
);


-- Teams
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

-- Volunteers
create table Volunteers(
	firstname varchar(40) not null,
    lastname varchar(40) not null,
	volID int auto_increment,
    schoolyear varchar(30),
    hometown varchar(50),
    highschool varchar(40),
    bio varchar(300),
    teamid int not null,
    pictureurl varchar(100),
    startdate date not null,
    active tinyint default 1,
    primary key(volID),
    foreign key(teamid) references Teams(teamid) on delete cascade
);



-- Volunteer statistics
create table Stats(
	volID int auto_increment,
    conversations int,
    conversions int,
    numyear int,
    numweek int,
    primary key(volid, numyear, numweek),
    foreign key(volid) references Volunteers(volid) on delete cascade
);

-- News
create table News(
	title varchar(100),
	contents varchar(500),
	datemade datetime,
	pictureurl varchar(100)
);


