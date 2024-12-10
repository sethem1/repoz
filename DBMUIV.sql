CREATE TABLE ТипМероприятия (
    idТипа SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE ТипыНаград (
    idТипа SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Организаторы (
    idОрганизатора SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE МестоПроведения (
    idМеста SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL,
    Телефон VARCHAR(20)
);
CREATE TABLE КатегорияМероприятия (
    idКатегории SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Курс (
    idКурса SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Группы (
    idГруппы SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Мероприятия (
    idМероприятия SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL,
    idТипа INT NOT NULL REFERENCES ТипМероприятия(idТипа),
    idКатегории INT NOT NULL REFERENCES КатегорияМероприятия(idКатегории),
    idОрганизатора INT NOT NULL REFERENCES Организаторы(idОрганизатора),
    idМеста INT NOT NULL REFERENCES МестоПроведения(idМеста)
);
CREATE TABLE ПланыМероприятия (
    idПлана SERIAL PRIMARY KEY,
    ДатаПроведения DATE NOT NULL,
    ПрограммаМероприятия TEXT NOT NULL,
    idМероприятия INT NOT NULL REFERENCES Мероприятия(idМероприятия)
);
CREATE TABLE Пол (
    idПола SERIAL PRIMARY KEY,
    Наименование VARCHAR(50) NOT NULL
);
CREATE TABLE Специальности (
    idСпециальности SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE ФормаОбучения (
    idФормы SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Кафедры (
    idКафедры SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Звание (
    idЗвания SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Должности (
    idДолжности SERIAL PRIMARY KEY,
    Наименование VARCHAR(255) NOT NULL
);
CREATE TABLE Руководители (
    idРуководителя SERIAL PRIMARY KEY,
    Фамилия VARCHAR(100) NOT NULL,
    Имя VARCHAR(100) NOT NULL,
    Отчество VARCHAR(100),
    idДолжности INT NOT NULL REFERENCES Должности(idДолжности),
    idЗвания INT NOT NULL REFERENCES Звание(idЗвания),
    idКафедры INT NOT NULL REFERENCES Кафедры(idКафедры)
);
CREATE TABLE Студенты (
    idСтудента SERIAL PRIMARY KEY,
    Фамилия VARCHAR(100) NOT NULL,
    Имя VARCHAR(100) NOT NULL,
    Отчество VARCHAR(100),
    idГруппы INT NOT NULL REFERENCES Группы(idГруппы),
    idСпециальности INT NOT NULL REFERENCES Специальности(idСпециальности),
    idФормы INT NOT NULL REFERENCES ФормаОбучения(idФормы),
    idКурса INT NOT NULL REFERENCES Курс(idКурса),
    idПола INT NOT NULL REFERENCES Пол(idПола)
);
CREATE TABLE ВедомостьНаучныхДостижений (
    idВНД SERIAL PRIMARY KEY,
    ДатаПроведения DATE NOT NULL,
    idСтудента INT NOT NULL REFERENCES Студенты(idСтудента),
    idМероприятия INT NOT NULL REFERENCES Мероприятия(idМероприятия),
    idТипа INT NOT NULL REFERENCES ТипМероприятия(idТипа),
    idРуководителя INT NOT NULL REFERENCES Руководители(idРуководителя)
);
CREATE TABLE ВедомостьСпортивныхДостижений (
    idВСД SERIAL PRIMARY KEY,
    ДатаПроведения DATE NOT NULL,
    idСтудента INT NOT NULL REFERENCES Студенты(idСтудента),
    idМероприятия INT NOT NULL REFERENCES Мероприятия(idМероприятия),
    idТипа INT NOT NULL REFERENCES ТипМероприятия(idТипа),
    idРуководителя INT NOT NULL REFERENCES Руководители(idРуководителя)
);
CREATE TABLE ВедомостьОбщественныхДостижений (
    idВОД SERIAL PRIMARY KEY,
    ДатаПроведения DATE NOT NULL,
    idСтудента INT NOT NULL REFERENCES Студенты(idСтудента),
    idМероприятия INT NOT NULL REFERENCES Мероприятия(idМероприятия),
    idТипа INT NOT NULL REFERENCES ТипМероприятия(idТипа)
);
CREATE TABLE ЗаявкиНаУчастие (
    id SERIAL PRIMARY KEY,
    ДатаЗаявки DATE NOT NULL,
    idМероприятия INT NOT NULL REFERENCES Мероприятия(idМероприятия),
    idСтудента INT NOT NULL REFERENCES Студенты(idСтудента)
);
CREATE TABLE СправкаОбОтсутствии (
    idСправки SERIAL PRIMARY KEY,
    Дата DATE NOT NULL,
    idМероприятия INT NOT NULL REFERENCES Мероприятия(idМероприятия),
    idСтудента INT NOT NULL REFERENCES Студенты(idСтудента),
    ПричинаОтсутствия TEXT NOT NULL
);
CREATE TABLE ПротоколМероприятия (
    idПротокола SERIAL PRIMARY KEY,
    ДатаПротокола DATE NOT NULL,
    idМероприятия INT NOT NULL REFERENCES Мероприятия(idМероприятия),
    ПервоеМесто INT,
    ВтороеМесто INT,
    ТретьеМесто INT
);


INSERT INTO ТипМероприятия (Наименование) VALUES
('Научная конференция'),
('Спортивное соревнование'),
('Культурное мероприятие');
INSERT INTO ТипыНаград (Наименование) VALUES
('Грамота'),
('Медаль'),
('Кубок');
INSERT INTO Организаторы (Наименование) VALUES
('Отдел науки'),
('Спортивный клуб'),
('Культурный центр');
INSERT INTO МестоПроведения (Наименование, Телефон) VALUES
('Главный корпус', '123-456-7890'),
('Стадион', '987-654-3210'),
('Актовый зал', '555-666-7777');
INSERT INTO КатегорияМероприятия (Наименование) VALUES
('Внутреннее мероприятие'),
('Региональное мероприятие'),
('Международное мероприятие');
INSERT INTO Курс (Наименование) VALUES
('Первый курс'),
('Второй курс'),
('Третий курс');
INSERT INTO Группы (Наименование) VALUES
('Группа 101'),
('Группа 102'),
('Группа 103');
INSERT INTO Пол (Наименование) VALUES
('Мужской'),
('Женский');
INSERT INTO Специальности (Наименование) VALUES
('Информатика'),
('Физика'),
('История');
INSERT INTO ФормаОбучения (Наименование) VALUES
('Очная'),
('Заочная');
INSERT INTO Кафедры (Наименование) VALUES
('Кафедра информатики'),
('Кафедра физики'),
('Кафедра истории');
INSERT INTO Звание (Наименование) VALUES
('Доктор наук'),
('Кандидат наук');
INSERT INTO Должности (Наименование) VALUES
('Профессор'),
('Доцент');
INSERT INTO Руководители (Фамилия, Имя, Отчество, idДолжности, idЗвания, idКафедры) VALUES
('Иванов', 'Сергей', 'Петрович', 1, 1, 1),
('Петров', 'Иван', 'Алексеевич', 2, 2, 2);
INSERT INTO Студенты (Фамилия, Имя, Отчество, idГруппы, idСпециальности, idФормы, idКурса, idПола) VALUES
('Сидоров', 'Алексей', 'Николаевич', 1, 1, 1, 1, 1),
('Кузнецова', 'Мария', 'Игоревна', 2, 2, 2, 2, 2),
('Васильев', 'Олег', 'Павлович', 3, 3, 1, 3, 1);
INSERT INTO Мероприятия (Наименование, idТипа, idКатегории, idОрганизатора, idМеста) VALUES
('Конференция по информатике', 1, 1, 1, 1),
('Футбольный матч', 2, 2, 2, 2),
('Концерт классической музыки', 3, 3, 3, 3);
INSERT INTO ПланыМероприятия (ДатаПроведения, ПрограммаМероприятия, idМероприятия) VALUES
('2024-12-01', 'Доклады участников', 1),
('2024-12-02', 'Футбольный матч между группами', 2),
('2024-12-03', 'Выступление оркестра', 3);
INSERT INTO ВедомостьНаучныхДостижений (ДатаПроведения, idСтудента, idМероприятия, idТипа, idРуководителя) VALUES
('2024-12-01', 1, 1, 1, 1),
('2024-12-01', 2, 1, 1, 2);
INSERT INTO ВедомостьСпортивныхДостижений (ДатаПроведения, idСтудента, idМероприятия, idТипа, idРуководителя) VALUES
('2024-12-02', 1, 2, 2, 2),
('2024-12-02', 3, 2, 2, 1);
INSERT INTO ВедомостьОбщественныхДостижений (ДатаПроведения, idСтудента, idМероприятия, idТипа) VALUES
('2024-12-03', 2, 3, 3),
('2024-12-03', 3, 3, 3);
INSERT INTO ЗаявкиНаУчастие (ДатаЗаявки, idМероприятия, idСтудента) VALUES
('2024-12-01', 1, 1),
('2024-12-02', 1, 2),
('2024-12-03', 2, 3);
INSERT INTO СправкаОбОтсутствии (Дата, idМероприятия, idСтудента, ПричинаОтсутствия) VALUES
('2024-12-01', 1, 1, 'Болезнь'),
('2024-12-02', 2, 2, 'Семейные обстоятельства');
INSERT INTO ПротоколМероприятия (ДатаПротокола, idМероприятия, ПервоеМесто, ВтороеМесто, ТретьеМесто) VALUES
('2024-12-05', 1, 1, 2, 3),
('2024-12-06', 2, 2, 3, 1);


