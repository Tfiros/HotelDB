-- Baza danych ma służyć hotelowi do przechowywania danych nt. klientów i świadczonych im usług.
-- W bazie są przechowywane podstawowe informacje dot. osób znajdujących się na terenie hotelu - jego klientów i pracowników.
-- Każdy gość/klient ma ponadto przypisany adres korespondencyjny na wypadek potrzeby kontaktu ze strony hotelu.
-- Gość może dokonać rezerwacji, a do jednej rezerwacji może być przypisanych więcej gości.
-- Do każdej rezerwacji przypisany jest minimum jeden pokój.
-- Istnieje także możliwość zamówienia różnych dodatkowych usług świadczonych przez hotel.
-- Gość może zamówić wiele usług, a te posiadają swoje określone ceny.
-- Każdy pracownik wykonuje minimalnie jedną usługę.



-- Table: Adres
CREATE TABLE Adres (
    ID int  NOT NULL,
    Gosc_ID int  NOT NULL,
    Miasto nvarchar(max)  NOT NULL,
    Ulica nvarchar(max)  NOT NULL,
    Numer_domu int  NOT NULL,
    CONSTRAINT Adres_pk PRIMARY KEY  (ID)
);
go;
-- Table: Gosc
CREATE TABLE Gosc (
    ID int  NOT NULL,
    Osoba_ID int  NOT NULL,
    CONSTRAINT Gosc_pk PRIMARY KEY  (ID)
);
go;
-- Table: Gosc_rezerwacja
CREATE TABLE Gosc_rezerwacja (
    ID int  NOT NULL,
    Gosc_ID int  NOT NULL,
    Rezerwacja_ID int  NOT NULL,
    CONSTRAINT Gosc_rezerwacja_pk PRIMARY KEY  (ID)
);
go;
-- Table: Osoba
CREATE TABLE Osoba (
    ID int  NOT NULL,
    Imie nvarchar(max)  NOT NULL,
    Nazwisko nvarchar(max) NOT NULL,
    Data_urodzenia date  NOT NULL,
    Numer_telefonu int  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY  (ID)
);
go;
-- Table: Pokoj
CREATE TABLE Pokoj (
    ID int  NOT NULL,
    Rodzaj nvarchar(max)  NOT NULL,
    Cena int  NOT NULL,
    CONSTRAINT Pokoj_pk PRIMARY KEY  (ID)
);
go;
-- Table: Pracownik
CREATE TABLE Pracownik (
    ID int  NOT NULL,
    Stanowisko nvarchar(max)  NOT NULL,
    Osoba_ID int  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY  (ID)
);
go;
-- Table: Rezerwacja
CREATE TABLE Rezerwacja (
    ID int  NOT NULL,
    Status nvarchar(max)  NOT NULL,
    Data_rozpoczecia date  NOT NULL,
    Data_zakonczenia date  NULL,
    CONSTRAINT Rezerwacja_pk PRIMARY KEY  (ID)
);
go;
-- Table: Rezerwacja_pokoje
CREATE TABLE Rezerwacja_pokoje (
    ID int  NOT NULL,
    Rezerwacja_ID int  NOT NULL,
    Pokoj_ID int  NOT NULL,
    CONSTRAINT Rezerwacja_pokoje_pk PRIMARY KEY  (ID)
);
go;
-- Table: Usluga
CREATE TABLE Usluga (
    ID int  NOT NULL,
    Nazwa nvarchar(max)  NOT NULL,
    Cena int  NOT NULL,
    CONSTRAINT Usluga_pk PRIMARY KEY  (ID)
);
go;
-- Table: Usluga_rezerwacja
CREATE TABLE Usluga_rezerwacja (
    ID int  NOT NULL,
    Rezerwacja_ID int  NOT NULL,
    Pracownik_ID int  NOT NULL,
    Usluga_ID int  NOT NULL,
    CONSTRAINT Usluga_rezerwacja_pk PRIMARY KEY  (ID)
);
go;
-- foreign keys
-- Reference: Adres_Gosc (table: Adres)
ALTER TABLE Adres ADD CONSTRAINT Adres_Gosc
    FOREIGN KEY (Gosc_ID)
    REFERENCES Gosc (ID);
go;
-- Reference: Gosc_Osoba (table: Gosc)
ALTER TABLE Gosc ADD CONSTRAINT Gosc_Osoba
    FOREIGN KEY (Osoba_ID)
    REFERENCES Osoba (ID);
go;
-- Reference: Pracownik_Osoba (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Osoba
    FOREIGN KEY (Osoba_ID)
    REFERENCES Osoba (ID);
go;
-- Reference: Rezerwacja_pokoje_Pokoj (table: Rezerwacja_pokoje)
ALTER TABLE Rezerwacja_pokoje ADD CONSTRAINT Rezerwacja_pokoje_Pokoj
    FOREIGN KEY (Pokoj_ID)
    REFERENCES Pokoj (ID);
go;
-- Reference: Rezerwacja_pokoje_Rezerwacja (table: Rezerwacja_pokoje)
ALTER TABLE Rezerwacja_pokoje ADD CONSTRAINT Rezerwacja_pokoje_Rezerwacja
    FOREIGN KEY (Rezerwacja_ID)
    REFERENCES Rezerwacja (ID);
go;
-- Reference: Table_11_Gosc (table: Gosc_rezerwacja)
ALTER TABLE Gosc_rezerwacja ADD CONSTRAINT Table_11_Gosc
    FOREIGN KEY (Gosc_ID)
    REFERENCES Gosc (ID);
go;
-- Reference: Table_11_Rezerwacja (table: Gosc_rezerwacja)
ALTER TABLE Gosc_rezerwacja ADD CONSTRAINT Table_11_Rezerwacja
    FOREIGN KEY (Rezerwacja_ID)
    REFERENCES Rezerwacja (ID);
go;
-- Reference: Usluga_rezerwacja_Pracownik (table: Usluga_rezerwacja)
ALTER TABLE Usluga_rezerwacja ADD CONSTRAINT Usluga_rezerwacja_Pracownik
    FOREIGN KEY (Pracownik_ID)
    REFERENCES Pracownik (ID);
go;
-- Reference: Usluga_rezerwacja_Rezerwacja (table: Usluga_rezerwacja)
ALTER TABLE Usluga_rezerwacja ADD CONSTRAINT Usluga_rezerwacja_Rezerwacja
    FOREIGN KEY (Rezerwacja_ID)
    REFERENCES Rezerwacja (ID);
go;
-- Reference: Usluga_rezerwacja_Usluga (table: Usluga_rezerwacja)
ALTER TABLE Usluga_rezerwacja ADD CONSTRAINT Usluga_rezerwacja_Usluga
    FOREIGN KEY (Usluga_ID)
    REFERENCES Usluga (ID);
go;


INSERT INTO Osoba (ID, Imie, Nazwisko, Data_urodzenia, Numer_telefonu) VALUES (1, 'Tomasz', 'Kowalski', '1988-06-17', 789586213);
INSERT INTO Osoba (ID, Imie, Nazwisko, Data_urodzenia, Numer_telefonu) VALUES (2, 'Bartosz', 'Drozdowski', '1999-04-12', 789366213);
INSERT INTO Osoba (ID, Imie, Nazwisko, Data_urodzenia, Numer_telefonu) VALUES (3, 'Maciej', 'Nowak', '1988-07-18', 986325745);
INSERT INTO Osoba (ID, Imie, Nazwisko, Data_urodzenia, Numer_telefonu) VALUES (4, 'Wojciech', 'Kowalski', '1990-09-13', 562147895);
INSERT INTO Osoba (ID, Imie, Nazwisko, Data_urodzenia, Numer_telefonu) VALUES (5,'Krzysztof', 'Nowak', '1991-08-23',564123412)

INSERT INTO Gosc (ID, Osoba_ID) VALUES (1, 1);
INSERT INTO Gosc (ID, Osoba_ID) VALUES (2, 3);
INSERT INTO Gosc (ID, Osoba_ID) VALUES (3, 4);

INSERT INTO Pracownik (ID, Stanowisko, Osoba_ID) VALUES (1, 'Barman', 2);
INSERT INTO Pracownik (ID, Stanowisko, Osoba_ID) VALUES (2,'Recepcja',5);

INSERT INTO Rezerwacja (ID, Status, Data_rozpoczecia, Data_zakonczenia) VALUES (1, 'Trwa', '2023-04-18', '2023-04-20');
INSERT INTO Rezerwacja (ID, Status, Data_rozpoczecia, Data_zakonczenia) VALUES (2, 'Zakonczona', '2023-04-14', '2023-04-18');
INSERT INTO Rezerwacja (ID, Status, Data_rozpoczecia, Data_zakonczenia) VALUES (3, 'Trwa', '2023-04-14', '2023-04-20');

INSERT INTO Gosc_rezerwacja (ID, Gosc_ID, Rezerwacja_ID) VALUES (1, 1, 1);
INSERT INTO Gosc_rezerwacja (ID, Gosc_ID, Rezerwacja_ID) VALUES (2, 2, 2);
INSERT INTO Gosc_rezerwacja (ID, Gosc_ID, Rezerwacja_ID) VALUES (3, 3, 3);

INSERT INTO Pokoj (ID, Rodzaj, Cena) VALUES (1, 'Apartament', 1200);
INSERT INTO Pokoj (ID, Rodzaj, Cena) VALUES (2, 'Rodzinny', 900);
INSERT INTO Pokoj (ID, Rodzaj, Cena) VALUES (3, 'Zwykly', 700);

INSERT INTO Rezerwacja_pokoje (ID, Rezerwacja_ID, Pokoj_ID) VALUES (1, 1, 1);
INSERT INTO Rezerwacja_pokoje (ID, Rezerwacja_ID, Pokoj_ID) VALUES (2, 2, 3);
INSERT INTO Rezerwacja_pokoje (ID, Rezerwacja_ID, Pokoj_ID) VALUES (3, 3, 2);

INSERT INTO Adres (ID, Gosc_ID, Miasto, Ulica, Numer_domu) VALUES (1, 1, 'Warszawa', 'Koszykowa', 2);
INSERT INTO Adres (ID, Gosc_ID, Miasto, Ulica, Numer_domu) VALUES (2, 2, 'Warszawa', 'Nowogrodzka', 14);
INSERT INTO Adres (ID, Gosc_ID, Miasto, Ulica, Numer_domu) VALUES (3, 3, 'Bydgoszcz', 'Nowogrodzka', 25);

INSERT INTO Usluga (ID, Nazwa, Cena) VALUES (1, 'Masaz', 300);
INSERT INTO Usluga (ID, Nazwa, Cena) VALUES (2, 'RoomService', 200);
INSERT INTO Usluga (ID, Nazwa, Cena) VALUES (3, 'Sejf', 100);

INSERT INTO Usluga_rezerwacja (ID, Rezerwacja_ID, Pracownik_ID, Usluga_ID) VALUES (1, 1, 1, 2);
INSERT INTO Usluga_rezerwacja (ID, Rezerwacja_ID, Pracownik_ID, Usluga_ID) VALUES (2,2,2,2);

CREATE TRIGGER WyzwalaczSprawdzajacyPokoj
ON Rezerwacja_pokoje
INSTEAD OF INSERT
AS
BEGIN
    -- Deklaracja zmiennych
    DECLARE @RezerwacjaID INT, @PokojID INT, @DataRozpoczecia DATE, @DataZakonczenia DATE;

    -- Deklaracja kursora
    DECLARE SprawdzajacyKursor CURSOR FOR
    SELECT i.Rezerwacja_ID, i.Pokoj_ID, r.Data_rozpoczecia, r.Data_zakonczenia
    FROM inserted i
    INNER JOIN Rezerwacja r ON i.Rezerwacja_ID = r.ID;

    OPEN SprawdzajacyKursor;

    FETCH NEXT FROM SprawdzajacyKursor INTO @RezerwacjaID, @PokojID, @DataRozpoczecia, @DataZakonczenia;

    -- Pętla sprawdzająca kolizje
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF NOT EXISTS (
            SELECT 1
            FROM Rezerwacja_pokoje rp
            INNER JOIN Rezerwacja r ON rp.Rezerwacja_ID = r.ID
            WHERE rp.Pokoj_ID = @PokojID
            AND (
                (@DataRozpoczecia BETWEEN r.Data_rozpoczecia AND r.Data_zakonczenia)
                OR (@DataZakonczenia BETWEEN r.Data_rozpoczecia AND r.Data_zakonczenia)
                OR (@DataRozpoczecia <= r.Data_rozpoczecia AND @DataZakonczenia >= r.Data_zakonczenia)
            )
        )
        BEGIN
            -- Jeśli pokoje nie są zajęte, dodaj nową rezerwację
            INSERT INTO Rezerwacja_pokoje (Rezerwacja_ID, Pokoj_ID)
            VALUES (@RezerwacjaID, @PokojID);
        END
        ELSE
        BEGIN
            -- Jeśli pokoje są zajęte, zwróć komunikat błędu.
            raiserror ('Pokój jest już zajęty w podanym okresie czasowym.', 16, 1);
        END

        FETCH NEXT FROM SprawdzajacyKursor INTO @RezerwacjaID, @PokojID, @DataRozpoczecia, @DataZakonczenia;
    END

    CLOSE SprawdzajacyKursor;
    DEALLOCATE SprawdzajacyKursor;
END;
-- Przykładowe użycie wyzwalacza do dodawania rezerwacji pokoi
DECLARE @NowaRezerwacja TABLE (
    Rezerwacja_ID INT,
    Pokoj_ID INT,
    DataRozpoczecia DATE,
    DataZakonczenia DATE
);

-- Dodanie nowej rezerwacji pokoi do tymczasowej tabeli
INSERT INTO @NowaRezerwacja (Rezerwacja_ID, Pokoj_ID, DataRozpoczecia, DataZakonczenia)
VALUES
    (1, 1, '2023-06-01', '2023-06-05'),
    (2, 2, '2023-07-10', '2023-07-15'),
    (3, 3, '2023-08-20', '2023-08-25');

-- Użycie wyzwalacza do dodania rezerwacji pokoi
INSERT INTO Rezerwacja_pokoje (Rezerwacja_ID, Pokoj_ID)
SELECT Rezerwacja_ID, Pokoj_ID
FROM @NowaRezerwacja;

SELECT * FROM Rezerwacja_pokoje;

CREATE PROCEDURE SprawdzDostepnoscPokoju
    @PokojID INT,
    @DataRozpoczecia DATE,
    @DataZakonczenia DATE
AS
BEGIN
    DECLARE @LiczbaZajetychPokoi INT;
    begin try
    -- Sprawdzenie, czy istnieje pokój o podanym ID
    IF NOT EXISTS (SELECT 1 FROM Pokoj WHERE ID = @PokojID)
    BEGIN
        raiserror ('Nie ma pokoju o podanym ID.', 16, 1);
        RETURN;
    END


        -- Sprawdzenie ilości zajętych pokoi w danym okresie
        SELECT @LiczbaZajetychPokoi = COUNT(*)
        FROM Rezerwacja_pokoje rp
        INNER JOIN Rezerwacja r ON rp.Rezerwacja_ID = r.ID
        WHERE rp.Pokoj_ID = @PokojID
        AND (
            (@DataRozpoczecia BETWEEN r.Data_rozpoczecia AND r.Data_zakonczenia)
            OR (@DataZakonczenia BETWEEN r.Data_rozpoczecia AND r.Data_zakonczenia)
            OR (@DataRozpoczecia <= r.Data_rozpoczecia AND @DataZakonczenia >= r.Data_zakonczenia)
        );

        -- Wynik zależny od liczby zajętych pokoi
        IF @LiczbaZajetychPokoi = 0
        BEGIN
            PRINT 'Pokój jest wolny w podanym okresie.';
        END
        ELSE
        BEGIN
            PRINT 'Pokój jest zajęty w podanym okresie.';
        END
    END TRY
    BEGIN CATCH
        -- Obsługa błędu
        PRINT 'Wystąpił błąd podczas sprawdzania dostępności pokoju.';
    END CATCH
END;


DECLARE @PokojID int, @DataRozpoczecia date, @DataZakonczenia date;

SET @PokojID = 1;
SET @DataRozpoczecia = '2023-05-01';
SET @DataZakonczenia = '2023-05-05';

EXEC SprawdzDostepnoscPokoju 19, @DataRozpoczecia, @DataZakonczenia;




