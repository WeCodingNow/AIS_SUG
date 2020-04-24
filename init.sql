CREATE TABLE ais_user(
    id          SERIAL,
    username    varchar(50) NOT NULL UNIQUE,
    password    varchar(50) NOT NULL,
    CONSTRAINT ais_user_pk PRIMARY KEY (id)
);

CREATE TABLE student(
    id          SERIAL,
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE mark(
    id          SERIAL,
    student_id  int NOT NULL REFERENCES student(id) ON DELETE CASCADE,
    CONSTRAINT mark_pk PRIMARY KEY (id)
);
