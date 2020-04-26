CREATE TABLE Кафедра(
    id SERIAL,
    название varchar(100) NOT NULL UNIQUE,
    короткое_название varchar(10) NOT NULL UNIQUE,
    CONSTRAINT кафедра_pk PRIMARY KEY (id)
);

CREATE TABLE Семестр(
    id SERIAL,
    номер int NOT NULL,
    начало date NOT NULL,
    конец date,
    CONSTRAINT семестр_pk PRIMARY KEY (id)
);

CREATE TABLE Группа(
    id SERIAL,
    id_кафедры int NOT NULL references Кафедра(id) ON DELETE CASCADE,
    id_семестра int NOT NULL references Семестр(id) ON DELETE CASCADE,
    CONSTRAINT группа_pk PRIMARY KEY (id)
);

CREATE TABLE Студент(
    id SERIAL,
    id_группы int NOT NULL references Группа(id) ON DELETE CASCADE,
    имя varchar(50) NOT NULL,
    фамилия varchar(50) NOT NULL,
    отчество varchar(50),
    CONSTRAINT студент_pk PRIMARY KEY (id)
);

CREATE TABLE ТипКонтакта(
    id SERIAL,
    обозначение varchar(100) NOT NULL,
    CONSTRAINT тип_контакта_pk PRIMARY KEY (id)
);

CREATE TABLE Контакт(
    id SERIAL,
    id_студента int NOT NULL references Студент(id) ON DELETE CASCADE,
    id_типа_контакта int NOT NULL references ТипКонтакта(id) ON DELETE CASCADE,
    значение varchar(100) NOT NULL,
    CONSTRAINT контакт_pk PRIMARY KEY (id)
);

CREATE TABLE МестоЖительства(
    id SERIAL,
    адрес varchar(100) NOT NULL,
    город varchar(20) NOT NULL,
    -- московская_область boolean NOT NULL,
    общежитие boolean NOT NULL,
    CONSTRAINT место_жительства_pk PRIMARY KEY (id)
);

CREATE TABLE Студент__МестоЖительства(
    id SERIAL,
    id_студента int NOT NULL references Студент(id) ON DELETE CASCADE,
    id_места_жительства int NOT NULL references МестоЖительства(id) ON DELETE CASCADE,
    CONSTRAINT студент_место_жительства_pk PRIMARY KEY (id)
);

CREATE TABLE ais_user_class(
    id SERIAL,
    def varchar(100) NOT NULL UNIQUE,
    CONSTRAINT ais_user_class_pk PRIMARY KEY (id)
);

CREATE TABLE ais_user(
    id SERIAL,
    ais_user_class_id int NOT NULL references ais_user_class(id) ON DELETE CASCADE,
    user_class_confirmed boolean NOT NULL,
    username varchar(50) NOT NULL UNIQUE,
    password varchar(50) NOT NULL,
    student_id int references Студент(id),
    CONSTRAINT ais_user_pk PRIMARY KEY (id)
);

-- CREATE TABLE Таблица(
--     id SERIAL,
--     CONSTRAINT таблица_pk PRIMARY KEY (id)
-- );