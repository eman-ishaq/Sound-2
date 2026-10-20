-- SOUND Group Entertainment Website: schema + fictional demo catalogue
-- Database name: sound_group | Import via phpMyAdmin or run setup.php instead.
CREATE DATABASE IF NOT EXISTS sound_group CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sound_group;
CREATE TABLE IF NOT EXISTS users (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(30) NOT NULL UNIQUE,
 name VARCHAR(100) NOT NULL,
 address VARCHAR(255) NOT NULL,
 phone VARCHAR(30) NOT NULL,
 email VARCHAR(190) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL,
 role ENUM('admin','user') NOT NULL DEFAULT 'user',
 is_active TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS media_items (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 type ENUM('music','video') NOT NULL,
 title VARCHAR(190) NOT NULL,
 artist VARCHAR(190) NOT NULL,
 album VARCHAR(190) NOT NULL,
 release_year SMALLINT UNSIGNED NOT NULL,
 genre VARCHAR(100) NOT NULL,
 language VARCHAR(80) NOT NULL,
 description TEXT NOT NULL,
 cover_path VARCHAR(255) NULL,
 media_path VARCHAR(255) NULL,
 is_new TINYINT(1) NOT NULL DEFAULT 0,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 INDEX(type), INDEX(title), INDEX(artist), INDEX(release_year), INDEX(genre), INDEX(language)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS reviews (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id INT UNSIGNED NOT NULL,
 media_id INT UNSIGNED NOT NULL,
 rating TINYINT UNSIGNED NOT NULL,
 review_text VARCHAR(1200) NOT NULL DEFAULT '',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 UNIQUE KEY unique_user_media(user_id,media_id),
 CONSTRAINT fk_review_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
 CONSTRAINT fk_review_media FOREIGN KEY(media_id) REFERENCES media_items(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS categories (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 category_type ENUM('Artist','Album','Year','Genre','Language') NOT NULL,
 category_name VARCHAR(190) NOT NULL,
 UNIQUE KEY unique_category(category_type,category_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS settings (setting_key VARCHAR(80) PRIMARY KEY, setting_value TEXT NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT IGNORE INTO settings(setting_key,setting_value) VALUES
 ('site_name','SOUND'),('tagline','A world of music, made for discovery.'),
 ('about_text','SOUND is your destination to discover songs and videos across languages, eras, artists and genres. Find a favourite, share your thoughts and explore something new.');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'music','Midnight Letters','The Paper Moons','Midnight Letters EP',2025,'Indie Pop','English','A reflective indie-pop release with warm melodies and late-night storytelling.',1 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Midnight Letters' AND artist='The Paper Moons');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'music','Rang-e-Safar','Areeba Noor','Rang-e-Safar',2024,'Regional Pop','Urdu','A contemporary regional-pop collection inspired by journeys, home and new beginnings.',1 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Rang-e-Safar' AND artist='Areeba Noor');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'music','Golden Hour','North Avenue','Soft Light',2023,'Alternative','English','A mellow alternative track built around gentle guitars and an open, cinematic chorus.',0 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Golden Hour' AND artist='North Avenue');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'music','Dil Ki Dastaan','Meher Ali','Dil Ki Dastaan',2022,'Romantic','Urdu','A romantic song about little moments that stay with us.',0 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Dil Ki Dastaan' AND artist='Meher Ali');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'music','Monsoon Memory','The Blue Room','Weather Inside',2021,'Acoustic','English','An intimate acoustic recording with a nostalgic mood.',0 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Monsoon Memory' AND artist='The Blue Room');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'video','A City in Motion','SOUND Sessions','Studio Sessions Vol. 1',2025,'Music Video','English','A short visual session celebrating city life, street lights and music after dark.',1 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='A City in Motion');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'video','Mehfil — Live Session','Areeba Noor','SOUND Live',2024,'Live Performance','Urdu','An intimate live performance recorded for the SOUND Sessions collection.',1 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Mehfil — Live Session');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'video','Behind the Melody','The Paper Moons','Making of Midnight Letters',2023,'Documentary','English','A behind-the-scenes look at songwriting and recording.',0 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Behind the Melody');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'video','Acoustic at Sunset','North Avenue','SOUND Live',2022,'Live Performance','English','An acoustic performance in a warm sunset setting.',0 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='Acoustic at Sunset');
INSERT INTO media_items(type,title,artist,album,release_year,genre,language,description,is_new) SELECT 'video','The Rhythm of Home','SOUND Collective','Stories in Sound',2021,'Culture','Regional','A short editorial film exploring music, memory and local traditions.',0 WHERE NOT EXISTS(SELECT 1 FROM media_items WHERE title='The Rhythm of Home');
-- Administrator is created securely by setup.php with password_hash().
