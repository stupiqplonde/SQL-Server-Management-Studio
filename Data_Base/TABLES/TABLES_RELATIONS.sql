use Data_Base_5
go
CREATE TABLE groups(
	id int PRIMARY KEY IDENTITY(1, 1),
	name varchar(40) NOT NULL,
)

CREATE TABLE students(
	id int PRIMARY KEY IDENTITY(1, 1),
	full_name varchar(100) NOT NULL,
	group_id int FOREIGN KEY REFERENCES groups(id),
	
)

CREATE TABLE tametable(
	id int PRIMARY KEY IDENTITY(1, 1),
	group_id int FOREIGN KEY REFERENCES groups(id),
)

CREATE TABLE teachers_disciplines(
	id int PRIMARY KEY IDENTITY(1, 1),
	name varchar(40) NOT NULL,
)

CREATE TABLE teachers(
	id int PRIMARY KEY IDENTITY(1, 1),
	teacher_disciplines_id int FOREIGN KEY REFERENCES teachers_disciplines(id),
)

CREATE TABLE disciplines(
	id int PRIMARY KEY IDENTITY(1, 1),
	teacher_id int FOREIGN KEY REFERENCES teachers(id),
)