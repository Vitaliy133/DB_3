-- Таблица жанров
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Таблица исполнителей
CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Таблица связей между исполнителями и жанрами (многие ко многим)
CREATE TABLE ArtistGenres (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE
);

-- Таблица альбомов
CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    tittle VARCHAR(100) NOT NULL,
    release_date INT
);

-- Таблица связей между альбомами и исполнителями (многие ко многим)
CREATE TABLE AlbumArtists (
    album_id INT,
    artist_id INT,
    PRIMARY KEY (album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE
);

-- Таблица треков
CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration TIME NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

-- Таблица сборников
CREATE TABLE Compilations (
    compilation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_date INT
);

-- Таблица связей между сборниками и треками (многие ко многим)
CREATE TABLE CompilationTracks (
    compilation_id INT,
    track_id INT,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES Compilations(compilation_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id) ON DELETE CASCADE
);
