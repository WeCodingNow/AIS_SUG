-- model realization examples
-- done done done
CREATE TABLE Кафедра(
    id SERIAL,
    название varchar(100) NOT NULL UNIQUE,
    короткое_название varchar(10) NOT NULL UNIQUE,
    CONSTRAINT кафедра_pk PRIMARY KEY (id)
);

-- done done done
CREATE TABLE Семестр(
    id SERIAL,
    номер int NOT NULL,
    начало date NOT NULL,
    конец date,
    CONSTRAINT семестр_pk PRIMARY KEY (id)
);

-- done - done
CREATE TABLE Группа(
    id SERIAL,
    id_кафедры int NOT NULL references Кафедра(id) ON DELETE CASCADE,
    номер int NOT NULL,
    -- id_семестра int NOT NULL references Семестр(id) ON DELETE CASCADE,
    CONSTRAINT группа_pk PRIMARY KEY (id)
);

-- - - done
CREATE TABLE Группа__Семестр(
    id SERIAL,
    id_группы int NOT NULL references Группа(id) ON DELETE CASCADE,
    id_семестра int NOT NULL references Семестр(id) ON DELETE CASCADE,
    CONSTRAINT группа_семестр_pk PRIMARY KEY (id)
);

-- done - done
CREATE TABLE МестоЖительства(
    id SERIAL,
    адрес varchar(100) NOT NULL,
    город varchar(20) NOT NULL,
    общежитие boolean NOT NULL,
    CONSTRAINT место_жительства_pk PRIMARY KEY (id)
);

-- done - done
CREATE TABLE Студент(
    id SERIAL,
    id_группы int NOT NULL references Группа(id) ON DELETE CASCADE,
    id_места_жительства int NOT NULL references МестоЖительства(id) ON DELETE CASCADE,
    имя varchar(50) NOT NULL,
    фамилия varchar(50) NOT NULL,
    отчество varchar(50),
    CONSTRAINT студент_pk PRIMARY KEY (id)
);

-- done done done
CREATE TABLE ТипКонтакта(
    id SERIAL,
    обозначение varchar(100) NOT NULL,
    CONSTRAINT тип_контакта_pk PRIMARY KEY (id)
);

-- done - done
CREATE TABLE Контакт(
    id SERIAL,
    id_типа_контакта int NOT NULL references ТипКонтакта(id) ON DELETE CASCADE,
    id_студента int NOT NULL references Студент(id) ON DELETE CASCADE,
    значение varchar(100) NOT NULL,
    CONSTRAINT контакт_pk PRIMARY KEY (id)
);

-- - - done

-- CREATE TABLE Студент__МестоЖительства(
--     id SERIAL,
--     id_студента int NOT NULL references Студент(id) ON DELETE CASCADE,
--     id_места_жительства int NOT NULL references МестоЖительства(id) ON DELETE CASCADE,
--     CONSTRAINT студент_место_жительства_pk PRIMARY KEY (id)
-- );

-- done done done
CREATE TABLE Дисциплина(
    id SERIAL,
    название varchar(150),
    часы int,
    CONSTRAINT дисциплина_pk PRIMARY KEY (id)
);

-- done - done
CREATE TABLE ТипКонтрольногоМероприятия(
    id SERIAL,
    обозначение varchar(50),
    CONSTRAINT тип_контрольного_мероприятие_pk PRIMARY KEY (id)
);

-- done - done
CREATE TABLE КонтрольноеМероприятие(
    id SERIAL,
    id_типа int NOT NULL references ТипКонтрольногоМероприятия(id) ON DELETE CASCADE,
    id_дисциплины int NOT NULL references Дисциплина(id) ON DELETE CASCADE,
    id_семестра int NOT NULL references Семестр(id) ON DELETE CASCADE,
    дата_проведения date NOT NULL,
    CONSTRAINT контрольное_мероприятие_pk PRIMARY KEY (id)
);

-- done - done
CREATE TABLE Оценка(
    id SERIAL,
    id_контрольного_мероприятия int NOT NULL references КонтрольноеМероприятие(id) ON DELETE CASCADE,
    id_студента int NOT NULL references Студент(id) ON DELETE CASCADE,
    дата_получения date NOT NULL,
    значение int NOT NULL,
    CONSTRAINT оценка_pk PRIMARY KEY (id)
);

-- done done -
CREATE TABLE ais_user(
    id SERIAL,
    username varchar(50) NOT NULL UNIQUE,
    password varchar(50) NOT NULL,
    CONSTRAINT ais_user_pk PRIMARY KEY (id)
);

-- - done -
CREATE TABLE ais_user_role(
    id SERIAL,
    def varchar(100) NOT NULL UNIQUE,
    CONSTRAINT ais_user_role_pk PRIMARY KEY (id)
);

-- - done -
CREATE TABLE ais_user_student_binding(
    id SERIAL,
    user_id int NOT NULL references ais_user(id),
    student_id int NOT NULL references Студент(id),
    CONSTRAINT ais_student_binding_pk PRIMARY KEY (id)
);

-- - done -
CREATE TABLE ais_role_binding(
    id SERIAL,
    ais_user_role_id int NOT NULL references ais_user_role(id) ON DELETE CASCADE,
    ais_user_id int NOT NULL references ais_user(id) ON DELETE CASCADE,
    CONSTRAINT ais_role_binding_pk PRIMARY KEY (id)
);

-- CREATE TABLE Таблица(
--     id SERIAL,
--     CONSTRAINT таблица_pk PRIMARY KEY (id)
-- );