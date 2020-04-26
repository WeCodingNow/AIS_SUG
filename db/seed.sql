INSERT INTO Кафедра(название, короткое_название) VALUES
    ('Информационные системы и телекоммуникации', 'ИУ3'),
    ('Системы обработки информации и управления', 'ИУ5');

INSERT INTO Семестр(номер, начало) VALUES
    (3, TO_DATE('13/02/2020', 'DD/MM/YYYY'));

INSERT INTO Группа(id_кафедры, id_семестра) VALUES
    (2, 1);

INSERT INTO ТипКонтакта(обозначение) VALUES
    ('телефон'),
    ('электронная почта');

INSERT INTO МестоЖительства(адрес, город, общежитие) VALUES
    ('Госпитальный переулок, 4/6', 'Москва', true),
    ('Измайловский проспект, 73A', 'Москва', true);

INSERT INTO ais_user_class(def) VALUES
    ('администратор'),
    ('староста'),
    ('студент');

INSERT INTO ais_user(ais_user_class_id, user_class_confirmed, username, password, student_id) VALUES
    (1, true, 'admin', 'admin', null);

INSERT INTO Студент(id_группы, имя, фамилия, отчество) VALUES
    (1, 'Андреев', 'Алексей', 'Андреевич');

INSERT INTO Контакт(id_типа_контакта, id_студента, значение) VALUES
    (1, 1, '+7 909 737 63 46'),
    (2, 1, 'aleshka2012@gmail.com');

INSERT INTO МестоЖительства(адрес, город, общежитие) VALUES
    ('Малая Почтовая 5/12 стр.2', 'Москва', false);

INSERT INTO Студент__МестоЖительства(id_студента, id_места_жительства) VALUES
    (1, 3);
