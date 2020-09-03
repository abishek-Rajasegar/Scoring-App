create table teams(team_id int primary key not null auto_increment,
team_Name varchar(20) not null);

alter table teams auto_increment=1000;

insert into teams(team_Name) value('India'),('Englend');
 use userlogin;
create table toss(toss_id int primary key not null auto_increment,
team_name text not null,
elected_to text not null,
team_id int,
match_id int,
foreign key (team_id) references teams(team_id),
foreign key (match_id) references matches(match_id)
); 

ALTER TABLE Matches
MODIFY COLUMN Match_date datetime;


create table matches(match_id int primary key not null auto_increment,
Match_date date,
Venue text not null,
Overs int not null,
Team1_name varchar(20) not null,
Team2_name varchar(20) not null
);

alter table matches auto_increment=77777;



create table Players(player_id int not null primary key auto_increment,
Player_Name text not null,
team_id int, 
foreign key (team_id) references teams(team_id));
 
alter table Players auto_increment=999999; 



INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT 'Rohit') AS tmp WHERE NOT EXISTS (SELECT team_Name FROM teams WHERE team_Name = 'India') LIMIT 1;
INSERT INTO players(Player_Name,team_id) SELECT * FROM (SELECT 'rohit', team_id from teams where team_name='MI') AS tmp WHERE NOT EXISTS (SELECT Player_Name FROM players WHERE Player_Name = 'Rohit') LIMIT 1;


create table battingScore( score_id int primary key not null auto_increment,
batsman_name text not null,
match_id int not null,
team_id int not null,
number_of_1 int default(0),
number_of_2 int default(0),
number_of_3 int default(0),
number_of_4 int default(0),
number_of_6 int default(0),
number_of_balls int default(0),
total_runs int default(0),
foreign key (team_id) references teams(team_id),
foreign key (match_id) references matches(match_id)
);


create table bowlingScore( score_id int primary key not null auto_increment,
bowler_name text not null,
match_id int not null,
team_id int not null,
number_of_1 int default(0),
number_of_2 int default(0),
number_of_3 int default(0),
number_of_4 int default(0),
number_of_6 int default(0),
number_of_balls int default(0),
total_runs int default(0),
total_wicket int default(0),
foreign key (team_id) references teams(team_id),
foreign key (match_id) references matches(match_id)
);
 
 
ALTER TABLE matches CHANGE overs_played team1_overs float default(0);


use userlogin;
select * from battingScore;
select * from bowlingScore;
select * from matches;
select * from teams;
select * from toss;
select * from login;
select * from players;
select * from upcoming_matches;

alter table battingScore add column strike_rate float4 generated always as ((total_runs/number_of_balls)*100) ;

create table upcoming_matches(id int primary key not null auto_increment,
team1_name text not null,
team2_name text not null,
match_date datetime,
overs int not null,
venue text not null );


alter table upcoming_matches auto_increment = 00000101; 

alter table bowlingScore
add column economy_rate float4 generated always as (total_runs/(number_of_balls/6));  

alter table battingScore
modify column strike_rate float4 default((total_runs/number_of_balls)*100);

