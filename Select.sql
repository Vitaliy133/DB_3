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
