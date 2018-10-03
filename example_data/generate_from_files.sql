COPY listeners(name, login, password, register_date)
  FROM 'listeners.csv' DELIMITER ',' CSV HEADER;

COPY categories(name)
FROM '/Users/elzbietakrzych/Documents/codecool/ADVANCED/2018_10_01_TW/Spotify/example_data/categories.csv' DELIMITER ',' CSV HEADER;

COPY artists(name)
FROM '/Users/elzbietakrzych/Documents/codecool/ADVANCED/2018_10_01_TW/Spotify/example_data/artists.csv' DELIMITER ',' CSV HEADER;

COPY albums(name)
FROM '/Users/elzbietakrzych/Documents/codecool/ADVANCED/2018_10_01_TW/Spotify/example_data/albums.csv' DELIMITER ',' CSV HEADER;
