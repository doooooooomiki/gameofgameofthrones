PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE user (
    user_id integer primary key,
    user_name text unique
);
CREATE TABLE category (
    category_id integer primary key,
    category text not null unique
);
INSERT INTO category VALUES(1,'Haus Stark');
INSERT INTO category VALUES(2,'Haus Arryn');
INSERT INTO category VALUES(3,'Haus Targaryen');
INSERT INTO category VALUES(4,'Haus Lennister');
INSERT INTO category VALUES(5,'Haus Graufreud');
INSERT INTO category VALUES(6,'Haus Mormont');
INSERT INTO category VALUES(7,'Bastarde');
INSERT INTO category VALUES(8,'Ritter, Soldaten und Knappen');
INSERT INTO category VALUES(9,'Maesters, Priester, Eunuchen, Berater');
INSERT INTO category VALUES(10,'Haus Tarly');
INSERT INTO category VALUES(11,'Drachen');
INSERT INTO category VALUES(12,'Haus Tully');
INSERT INTO category VALUES(13,'Haus Reed');
INSERT INTO category VALUES(14,'Schattenwölfe');
CREATE TABLE character (
    character_id integer primary key,
    category integer not null,
    character_name text not null,
    foreign key (category) references category (category_id)
);
INSERT INTO character VALUES(1,1,'Jon Snow');
INSERT INTO character VALUES(2,1,'Sansa Stark');
INSERT INTO character VALUES(3,1,'Bran Stark');
INSERT INTO character VALUES(4,1,'Arya Stark');
INSERT INTO character VALUES(5,2,'Robin Arryn');
INSERT INTO character VALUES(6,3,'Daenerys Targaryen');
INSERT INTO character VALUES(7,4,'Cersei Lennister');
INSERT INTO character VALUES(8,4,'Jaime Lennister');
INSERT INTO character VALUES(9,4,'Tyrion Lennister');
INSERT INTO character VALUES(10,5,'Theon Graufreud');
INSERT INTO character VALUES(11,5,'Asha Graufreud');
INSERT INTO character VALUES(12,5,'Euron Graufreud');
INSERT INTO character VALUES(13,6,'Lyanna Mormont');
INSERT INTO character VALUES(14,6,'Jorah Mormont');
INSERT INTO character VALUES(15,7,'Genry');
INSERT INTO character VALUES(16,7,'Ellaria Sand');
INSERT INTO character VALUES(17,7,'Heiße Pastete');
INSERT INTO character VALUES(18,8,'Sandor Clegane');
INSERT INTO character VALUES(19,8,'Gregor Clegane');
INSERT INTO character VALUES(20,8,'Grauer Wurm');
INSERT INTO character VALUES(21,8,'Daario Naharis');
INSERT INTO character VALUES(22,8,'Podrick Payn');
INSERT INTO character VALUES(23,8,'Bronn');
INSERT INTO character VALUES(24,8,'Brienne von Tarth');
INSERT INTO character VALUES(25,8,'Beric Dondarrion');
INSERT INTO character VALUES(26,8,'Tormund Riesentod');
INSERT INTO character VALUES(27,9,'Davos Seewert');
INSERT INTO character VALUES(28,9,'Milesandre');
INSERT INTO character VALUES(29,9,'Missandei');
INSERT INTO character VALUES(30,9,'Qyburn');
INSERT INTO character VALUES(31,9,'Varys');
INSERT INTO character VALUES(32,10,'Samwell Tarly');
INSERT INTO character VALUES(33,10,'Goldie');
INSERT INTO character VALUES(34,10,'Sam Jr.');
INSERT INTO character VALUES(35,11,'Drogon');
INSERT INTO character VALUES(36,11,'Rhaegal');
INSERT INTO character VALUES(37,12,'Edmure Tully');
INSERT INTO character VALUES(38,13,'Meera Reed');
INSERT INTO character VALUES(39,14,'Nymeria');
INSERT INTO character VALUES(40,14,'Geist');
CREATE TABLE die_tip (
    die_tip_id integer primary key,
    user integer not null,
    character integer not null,
    tip integer not null,
    is_correct integer default 0,
    foreign key(user) references user (user_id),
    foreign key (character) references character (character_id)
);
CREATE TABLE bonus_type (
    bonus_type_id integer primary key,
    bonus_type text not null unique
);
INSERT INTO bonus_type VALUES(1,'dropdown');
INSERT INTO bonus_type VALUES(2,'yes/no');
CREATE TABLE answer_dd (
    answer_dd_id integer primary key,
    user integer not null,
    bonus_question integer not null,
    answer integer not null,
    foreign key (user) references user (user_id),
    foreign key (bonus_question) references bonus_question (bonus_question_id),
    foreign key (answer) references character (character_id)   
);
CREATE TABLE answer_yn (
    answer_yn_id integer primary key,
    user integer not null,
    bonus_question integer not null,
    answer integer not null,
    foreign key (user) references user (user_id),
    foreign key (bonus_question) references bonus_question (bonus_question_id)
);
CREATE TABLE die_solution (
    die_solution_id integer primary key,
    character integer not null,
    solution integer default -1,
    foreign key (character) references character (character_id)


);
INSERT INTO die_solution VALUES(1,1,-1);
INSERT INTO die_solution VALUES(2,2,-1);
INSERT INTO die_solution VALUES(3,3,-1);
INSERT INTO die_solution VALUES(4,4,-1);
INSERT INTO die_solution VALUES(5,5,-1);
INSERT INTO die_solution VALUES(6,6,-1);
INSERT INTO die_solution VALUES(7,7,-1);
INSERT INTO die_solution VALUES(8,8,-1);
INSERT INTO die_solution VALUES(9,9,-1);
INSERT INTO die_solution VALUES(10,10,-1);
INSERT INTO die_solution VALUES(11,11,-1);
INSERT INTO die_solution VALUES(12,12,-1);
INSERT INTO die_solution VALUES(13,13,-1);
INSERT INTO die_solution VALUES(14,14,-1);
INSERT INTO die_solution VALUES(15,15,-1);
INSERT INTO die_solution VALUES(16,16,-1);
INSERT INTO die_solution VALUES(17,17,-1);
INSERT INTO die_solution VALUES(18,18,-1);
INSERT INTO die_solution VALUES(19,19,-1);
INSERT INTO die_solution VALUES(20,20,-1);
INSERT INTO die_solution VALUES(21,21,-1);
INSERT INTO die_solution VALUES(22,22,-1);
INSERT INTO die_solution VALUES(23,23,-1);
INSERT INTO die_solution VALUES(24,24,-1);
INSERT INTO die_solution VALUES(25,25,-1);
INSERT INTO die_solution VALUES(26,26,-1);
INSERT INTO die_solution VALUES(27,27,-1);
INSERT INTO die_solution VALUES(28,28,-1);
INSERT INTO die_solution VALUES(29,29,-1);
INSERT INTO die_solution VALUES(30,30,-1);
INSERT INTO die_solution VALUES(31,31,-1);
INSERT INTO die_solution VALUES(32,32,-1);
INSERT INTO die_solution VALUES(33,33,-1);
INSERT INTO die_solution VALUES(34,34,-1);
INSERT INTO die_solution VALUES(35,35,-1);
INSERT INTO die_solution VALUES(36,36,-1);
INSERT INTO die_solution VALUES(37,37,-1);
INSERT INTO die_solution VALUES(38,38,-1);
INSERT INTO die_solution VALUES(39,39,-1);
INSERT INTO die_solution VALUES(40,40,-1);
CREATE TABLE solution_dd (
    solution_dd_id integer primary key,
    bonus_question integer not null,
    solution integer default -1,
    foreign key (bonus_question) references bonus_question (bonus_question_id)

);
INSERT INTO solution_dd VALUES(1,3,-1);
INSERT INTO solution_dd VALUES(2,4,-1);
INSERT INTO solution_dd VALUES(3,5,-1);
INSERT INTO solution_dd VALUES(4,10,-1);
CREATE TABLE solution_yn (
    solution_yn_id integer primary key,
    bonus_question integer not null,
    solution integer default -1 not null,
    foreign key (bonus_question) references bonus_question (bonus_question_id)
);
INSERT INTO solution_yn VALUES(1,1,-1);
INSERT INTO solution_yn VALUES(2,2,-1);
INSERT INTO solution_yn VALUES(3,6,-1);
INSERT INTO solution_yn VALUES(4,7,-1);
INSERT INTO solution_yn VALUES(5,8,-1);
INSERT INTO solution_yn VALUES(6,9,-1);
CREATE TABLE points (
    points_id integer primary key,
    user integer not null,
    points integer default 0,
    bonus integer default 0,
    total integer default 0,
    foreign key (user) references user (user_id)
);
CREATE TABLE bonus_question (
    bonus_question_id integer primary key,
    bonus_type integer not null,    
    question text not null,
    value integer not null,
    foreign key (bonus_type) references bonus_type (bonus_type_id)

);
INSERT INTO bonus_question VALUES(1,2,'Ist Daenerys schwanger?',2);
INSERT INTO bonus_question VALUES(2,2,'Wird Cercei''s Kind geboren?',2);
INSERT INTO bonus_question VALUES(3,1,'Wer tötet den Nachtkönig?',2);
INSERT INTO bonus_question VALUES(4,1,'Wer tötet Viserion?',2);
INSERT INTO bonus_question VALUES(5,1,'Wer sitzt am Ende auf dem eisernen Thron?',4);
INSERT INTO bonus_question VALUES(6,2,'Wird Podrick Payn''s Geheimnis gelüftet?',2);
INSERT INTO bonus_question VALUES(7,2,'Ist Bran der Nachtkönig?',3);
INSERT INTO bonus_question VALUES(8,2,'Werden Tormund und Brienne ein Paar?',1);
INSERT INTO bonus_question VALUES(9,2,'Wird Sansa zu Tyrion zurückkehren?',1);
INSERT INTO bonus_question VALUES(10,1,'Wer ist Azor Ahai (Krieger/in der Lichts)?',5);
CREATE VIEW dd_ans_vs_sol (user, bonus, answer, solution)
as
select a.user, a.bonus_question, a.answer, s.solution 
from answer_dd as a
inner join solution_dd as s
on
a.bonus_question = s.bonus_question;
CREATE VIEW dd_multiplyer (user, multiplyer, value)
as
select dd.user, 
       case when  dd.answer = dd.solution then 1 else 0 end multiplyer, 
       bq.value 
from dd_ans_vs_sol as dd
inner join bonus_question as bq
on 
dd.bonus = bq.bonus_question_id;
CREATE VIEW dd_awarding_of_score (user, dd_bonus)
as
select user, (multiplyer * value) as dd_bonus 
from dd_multiplyer;
CREATE VIEW dd_compact_score(user, dd_bonus)
as
select user, sum(dd_bonus) as dd_bonus 
from dd_awarding_of_score
group by user
order by dd_bonus desc;
CREATE VIEW bonus (user, bonus)
as
select dd.user, (dd_bonus + yn_bonus) as bonus 
from dd_compact_score as dd
inner join yn_compact_score as yn
on
dd.user = yn.user;
CREATE VIEW yn_ans_vs_sol (user, bonus, answer, solution)
as
select a.user, a.bonus_question, a.answer, s.solution 
from answer_yn as a
inner join solution_yn as s
on
a.bonus_question = s.bonus_question;
CREATE VIEW yn_multiplyer (user, multiplyer, value)
as
select yn.user, 
       case when  yn.answer = yn.solution then 1 else 0 end multiplyer, 
       bq.value 
from yn_ans_vs_sol as yn
inner join bonus_question as bq
on
yn.bonus = bq.bonus_question_id;
CREATE VIEW yn_awarding_of_score (user, yn_bonus)
as
select user, (multiplyer * value) as yn_bonus
from yn_multiplyer;
CREATE VIEW yn_compact_score (user, yn_bonus)
as
select user, sum(yn_bonus) as yn_bonus 
from yn_awarding_of_score
group by user
order by yn_bonus desc;
CREATE VIEW score (name, points, bonus, total) 
as
select u.user_name, p.points, p.bonus, p.total 
from user as u 
inner join points as p 
on 
u.user_id = p.user 
order by p.total desc, 
         p.bonus desc, 
         p.points desc, 
         u.user_name;
CREATE VIEW lives_or_dies (category, character, character_id)
as
select cat.category, char.character_name, char.character_id 
from category as cat 
inner join character as char 
on 
cat.category_id = char.category;
CREATE TRIGGER create_points_row_for_new_user
after insert on user
begin 
    insert into points (user) values
    ((select max(user_id) from user));
end;
CREATE TRIGGER create_die_sol_row
after insert on character
begin
    insert into die_solution (character) values
    ((select max(character_id) from character));
end;
CREATE TRIGGER update_correctness_of_tip
after update of solution on die_solution
begin
    update die_tip
    set is_correct = (select case when die_tip.tip = NEW.solution then 1 else 0 end)
    where die_tip.character = NEW.character;
end;
CREATE TRIGGER update_points
after update of is_correct on die_tip
begin
    update points
    set points = ifnull((select die_tip_score.points
                         from die_tip_score
                         where points.user = die_tip_score.user), 0);
end;
CREATE TRIGGER update_bonus_dd
after update on solution_dd
begin
    update points
    set bonus = ifnull((select bonus.bonus 
                        from bonus 
                        where bonus.user = points.user), 0);
end;
CREATE TRIGGER update_bonus_yn
after update on solution_yn
begin
    update points
    set bonus = ifnull((select bonus.bonus
                        from bonus
                        where bonus.user = points.user), 0);
end;
CREATE VIEW die_tip_score (user, points)
as 
select user, sum(is_correct) as points from die_tip group by user;
CREATE TRIGGER calc_total_points
after update on points
begin
    update points
    set total = points + bonus;
end;
CREATE TRIGGER create_dd_sol_row
after insert on bonus_question when NEW.bonus_type = 1
begin
    insert into solution_dd (bonus_question) values (NEW.bonus_question_id);
end;
CREATE TRIGGER create_yn_sol_row
after insert on bonus_question when NEW.bonus_type = 2
begin
    insert into solution_yn (bonus_question) values (NEW.bonus_question_id);
end;
COMMIT;
