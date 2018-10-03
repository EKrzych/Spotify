CREATE OR REPLACE FUNCTION search_by_phrase(phrase VARCHAR(255))
  RETURNS TABLE (
  id INT,
  name VARCHAR(255),
  table_name VARCHAR(255)
  )
  AS $$
DECLARE pattern VARCHAR(255) := phrase || '%';
BEGIN
  RETURN QUERY
  (SELECT id_album, albums.name, 'album'::varchar(255)
    FROM albums
    WHERE albums.name LIKE pattern
    LIMIT 2)

    UNION ALL

  (SELECT id_artist, artists.name, 'artist'::varchar(255)
    FROM artists
    WHERE artists.name LIKE pattern
    LIMIT 2)

    UNION ALL

  (SELECT id_song, songs.name, 'song'::varchar(255)
    FROM songs
    WHERE songs.name LIKE pattern
    LIMIT 10);
end;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_song_from_album(id_displayed_album INT)
  RETURNS TABLE (
  id_song INT,
  name VARCHAR(255),
  id_category INT
  ) AS $$
BEGIN
  RETURN QUERY SELECT
  songs.id_song,
  songs.name,
  songs.id_category
  FROM
       albums_songs
  JOIN
      songs
      ON albums_songs.id_song = songs.id_song
  WHERE albums_songs.id_album = id_displayed_album;

end;
$$ LANGUAGE plpgsql;



SELECT * FROM search_by_phrase('H');
SELECT * FROM get_song_from_album(1);

