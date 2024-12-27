-- блок задания 2

-- Самый длинный трек
SELECT name, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

-- Названия треков с продолжительностью не менее 3,5 минут
SELECT name
FROM Tracks
WHERE duration >= '00:03:30';

-- Названия сборников, вышедших с 2018 по 2020 годы
-- В таблице таких изначально не было, поэтому сначала добавлю сборник
INSERT INTO Compilations (name, release_date) VALUES
('2018 Hits', 2018);

-- Потом сам запрос на выборку
SELECT name
FROM Compilations
WHERE release_date BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT name
FROM Artists
WHERE name NOT LIKE '% %'; 

-- Названия треков, содержащих 'мой' или 'my'
-- Добавляю тестовый альбом (индекс - 9)
INSERT into Albums (tittle, release_date) 
VALUES ('Test_album', 2024);

--Добавляю тестовые треки
INSERT INTO Tracks (name, duration, album_id)
VALUES ('my own', '00:03:45', 9),
       ('own my', '00:04:20', 9),
       ('my', '00:02:50', 9),
       ('oh my god', '00:03:45', 9),
       ('myself', '00:04:20', 9),
       ('by myself', '00:02:50', 9),
       ('bemy self', '00:03:45', 9),
       ('myself by', '00:04:20', 9),
       ('by myself by', '00:02:50', 9),
       ('beemy', '00:03:45', 9),
       ('premyne', '00:02:50', 9);

--Сам запрос на выборку треков, содержащих 'мой' или 'my'
SELECT name
FROM Tracks
WHERE name ILIKE 'мой %' -- Слово 'мой' в начале строки
OR name ILIKE '% мой' -- Слово 'мой' в конце строки
OR name ILIKE '% мой %' -- Слово 'мой' в середине строки
OR name ILIKE 'мой' -- Слово 'мой' - название трека из одного слова
OR name ILIKE 'my %' -- Слово 'my' в начале строки
OR name ILIKE '% my' -- Слово 'my' в конце строки
OR name ILIKE '% my %' -- Слово 'my' в середине строки
OR name ILIKE 'my'; -- Слово 'my' - название трека из одного слова

-- Блок задания 3

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre_name, COUNT(ag.artist_id) AS artist_count
FROM Genres g
LEFT JOIN ArtistGenres ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_id, g.name;

-- Количество треков, вошедших в альбомы 2019 - 2020(добавляю данные)
INSERT INTO Albums (tittle, release_date) VALUES
('First Album', 2019),
('Second Album', 2020),
('Third Album', 2019);

-- В таблице изначально не было треков, попадающих в выборку, поэтому добавляю их
INSERT INTO Tracks (name, duration, album_id) VALUES
('Track1', '00:04:30', 6),
('Track2', '00:03:31', 7),
('Track3', '00:03:48', 8);

-- Сам запрос на подсчет треков, вошедших в альбомы 2019 - 2020
SELECT COUNT(t.track_id) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.release_date BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.tittle AS album_title, AVG(t.duration) AS average_duration_minutes
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.tittle;

-- Все исполнители, невыпустившие треки в 2020
SELECT ar.name AS artist_name
FROM Artists ar
WHERE ar.artist_id NOT IN (
    SELECT aa.artist_id
    FROM AlbumArtists aa
    JOIN Albums a ON aa.album_id = a.album_id
    WHERE a.release_date = 2020
);

-- названия сборников, где есть конкретный исполнитель(Например, Eminem)
SELECT DISTINCT c.name AS compilation_name
FROM Compilations c
JOIN CompilationTracks ct ON c.compilation_id = ct.compilation_id
JOIN Tracks t ON ct.track_id = t.track_id
JOIN AlbumArtists aa ON t.album_id = aa.album_id
WHERE aa.artist_id = 1;
