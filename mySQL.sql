-- Etape 1
CREATE TABLE edusign (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT NOT NULL,
    email TEXT NOT NULL,
    date_signature DATE
);

INSERT INTO edusign (firstname, email, date_signature) VALUES ('Ada', 'ada@adatechschool.fr', '2024-05-08 09:30:00');
SELECT * FROM edusign;

INSERT INTO edusign (firstname, email, date_signature) VALUES ('Grace', 'grace@adatechshool.fr', '2024-05-08 09:30:00');
SELECT * FROM edusign;

INSERT INTO edusign (firstname, email, date_signature) VALUES ('Dorothy', 'dorothy@adatechschool.fr', '2024-05-08 09:30:00');
INSERT INTO edusign (firstname, email, date_signature) VALUES ('Ella', 'ella@adatechschool.fr', '2024-05-08 09:30:00');
INSERT INTO edusign (firstname, email, date_signature) VALUES ('Grace', 'grace@adatechshool.fr', '2024-05-09 09:30:00');
INSERT INTO edusign (firstname, email, date_signature) VALUES ('Ella', 'ella@adatechschool.fr', '2024-05-09 09:30:00');
SELECT * FROM edusign;

-- Etape 2
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    email TEXT NOT NULL
);

ALTER TABLE edusign ADD COLUMN user_id INTEGER;

UPDATE edusign
ADD COLUMN lastname TEXT NOT NULL;
SET user_id = (
    SELECT id
    FROM users
    WHERE users.firstname = edusign.firstname
    AND users.lastname = edusign.firstname
    AND users.email = edusign.email
);

INSERT INTO users (firstname, lastname, email) VALUES ('Ada', 'Lovelace', 'ada@test.fr');
INSERT INTO users (firstname, lastname, email) VALUES ('Beatrice', 'Worsley', 'bea@test.fr');
INSERT INTO users (firstname, lastname, email) VALUES ('Bella', 'Guerin', 'bella@test.fr');
INSERT INTO users (firstname, lastname, email) VALUES ('Barbara', 'Chase', 'barbara@test.fr');

-- Etape 3
SELECT * FROM users;

SELECT firstname FROM users
WHERE id = 1;

SELECT COUNT(*) FROM users
WHERE firstname LIKE 'B%'; -- %: n'importe quel caractère après la lettre B

SELECT COUNT(*) FROM users;

SELECT firstname FROM users;

-- level moyen, 1: Insertion ligne dans la table edusign pour l'user Ada avec une nouvelle date de signature
INSERT INTO edusign (user_id, date_signature)
SELECT id, '2024-05-30 09:30:00'
FROM users
WHERE firstname = 'Ada';

-- level moyen, 2: Insertion ligne dans la table edusign pour l'user Bella avec une nouvelle date de signature
INSERT INTO edusign (user_id, date_signature)
SELECT id, '2024-05-30 09:30:00'
FROM users
WHERE firstname = 'Bella';

-- level moyen, 3: Insertion ligne de toutes les lignes de la table users dans la table edusign avec la nouvelle date de signature
INSERT INTO edusign (user_id, date_signature)
SELECT id, '2024-09-01 09:30:00'
FROM users;

--level moyen, 4: Selection de toutes les lignes de la table edusign ordonnéees par date de signature de la plus récente à la plus ancienne
-- et user_id par ordre ascendant
SELECT * FROM edusign
ORDER BY date_signature DESC, user_id ASC;