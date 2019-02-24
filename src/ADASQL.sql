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
	team 
);

create table Volunteers(
	ID
	firstname
    lastname
    schoolyear
    hometown
    school
    bio
    team
    picture
    startyear
);

create table Teams(
	ID
	name
	school
	startyear
	location
	bio
	picture
)

create table WeeklyConversations(
	volID
	teamID
	week
	year
	conversations
	conversions
	team
);
