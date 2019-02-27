create database ADA;
use ADA;

-- Admin Table
-- Admin Roles: Regional Coordinator, CEO, Team Leader
create table Admins(
    username varchar(40),
    password varchar(40),
	firstname varchar(40),
    lastname varchar(40),
	role varchar(20)
);



-- Example Admin Insert
insert into Admins(username, password, firstname, lastname, role)
	values('testuser', sha1('testpass'), 'First', 'Last', 'Test', 'Test team');

select username from Admins where username='testuser' and password=sha1('testpass');
select * from Admins;

-- Delete table if needed
drop table Admins;

create table Teams{
	teamname varchar(40),
    teamID varchar(20),
    username varchar(20),
    latitude int(10),
    longitude int(10),
};

create table Volunteers(
	firstname varchar(40),
    lastname varchar(40),
    schoolyear varchar(40),
    hometown varchar(40),
    highschool varchar(40),
    bio varchar(40),
    team varchar(40),
    picture varchar(40),
    volID varchar(40),
    startyear varchar(40),
    active tinyint
);

create table Stats{
	userid
    teamid
    conversations
    conversions
    year
    week
};

-- Team Leaders
create table Applications{
answer1
answer2
...
};
