-- Добавление жанров
INSERT INTO Genres (name) VALUES
('Rock'),
('Pop'),
('Alternative'),
('Jazz'),
('Classical'),
('Hip Hop');

-- Добавление артистов
INSERT INTO Artists (name) VALUES
('Eminem'),
('Adele'),
('David Guetta'),
('Disturbed'),
('Nickelback');

-- Добавление альбомов
INSERT INTO Albums (tittle, release_date) VALUES
('The Marshall Mathers LP', 2000),
('21', 2011),
('Nothing but the Beat', 2011),
('Immortalized', 2015),
('All the Right Reasons', 2005);

-- Добавление треков
INSERT INTO Tracks (name, duration, album_id) VALUES
('Stan', '00:04:30', 1),
('Lose Yourself', '00:03:31', 1),
('Rolling in the Deep', '00:03:48', 2),
('Someone Like You', '00:04:45', 2),
('Titanium', '00:04:05', 3),
('When the Beat Drops Out', '00:03:30', 3),
('The Sound of Silence', '00:04:07', 4),
('Stronger on My Own', '00:03:45', 4),
('How You Remind Me', '00:03:41', 5),
('Photograph', '00:04:15', 5);

-- Добавление сборников
INSERT INTO Compilations (name, release_date) VALUES
('Greatest Hits', 2001),
('The Singles Collection', 2004),
('Classic Rock Anthems', 2010),
('90s Alternative Hits', 2015);

-- Добавление связей артист - жанр
INSERT INTO ArtistGenres (artist_id, genre_id) VALUES
(1, 6),
(2, 2),
(3, 4),
(4, 1),
(5, 1);

-- Добавление связей альбом - артист
INSERT INTO AlbumArtists (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Добавление связей сборник - трек
INSERT INTO CompilationTracks (compilation_id, track_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 7),
(4, 9);
