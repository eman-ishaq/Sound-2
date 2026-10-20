SOUND GROUP — ENTERTAINMENT WEBSITE
===================================
Project: PHP + MySQL website for music and video discovery
Theme: Elegant editorial design with responsive layout

FEATURES INCLUDED
-----------------
• Responsive home page with site introduction and latest 5 music + latest 5 video listings.
• Music and video library with search across title, artist, album, genre, language and year.
• Filters for media type, genre, language and release year.
• Detail page with cover image, description, HTML audio/video playback and reviews.
• New-item badge for recently added content.
• User registration with unique User ID, required name/address/phone/email, password hashing and validation.
• Sign-in with User ID or email; session regeneration on login.
• User account page showing account information and submitted reviews.
• Add/update one rating and review per user per media item.
• Administrator dashboard with counts and management sections.
• Admin can add/edit/delete music and video records, upload cover art and media, manage categories, activate/deactivate accounts, change roles, and edit site information.
• PDO prepared statements, HTML output escaping, CSRF tokens on POST forms, random upload names, file-extension/MIME checks, upload size limit.
• Sample catalogue records are provided for layout demonstration. Sample records are fictional and do not include copyrighted audio/video files.

REQUIREMENTS
------------
• Windows 10/11 (or another OS with PHP/MySQL)
• XAMPP (Apache + PHP + MySQL/MariaDB)
• Modern browser such as Google Chrome
• PHP extensions: PDO MySQL, fileinfo; mbstring is recommended

INSTALL ON WINDOWS USING XAMPP
------------------------------
1. Install XAMPP.
2. Copy the entire folder SOUND_Group_Entertainment_Website into C:\xampp\htdocs\
   (so index.php is at C:\xampp\htdocs\SOUND_Group_Entertainment_Website\index.php).
3. Open XAMPP Control Panel and start Apache and MySQL.
4. In Chrome open:
   http://localhost/SOUND_Group_Entertainment_Website/setup.php
5. Wait for “INSTALLATION COMPLETE”. The setup script creates database sound_group,
   required tables, demo catalogue items, settings, and an administrator account.
6. Open the website using:
   http://localhost/SOUND_Group_Entertainment_Website/
7. Administrator login:
   User ID: admin
   Temporary password: SoundAdmin!2026
8. Open Admin in the top navigation to add your own catalogue, upload licensed media,
   manage users, categories and site text.
9. IMPORTANT: after installation, delete or rename setup.php and change the temporary
   admin password before any public hosting. The supplied student project is intended
   for local evaluation; add a secure password-change flow and production hardening
   before deployment to the public internet.

DATABASE SETTINGS
-----------------
Defaults are in config.php:
Host: 127.0.0.1
Database: sound_group
Username: root
Password: (blank; typical default XAMPP local setup)
If your MySQL account uses a password, update DB_USER / DB_PASS in config.php before setup.
The database schema and starter records are also supplied in database_backup.sql.

HOW TO DEMONSTRATE
------------------
1. Open the home page; show the latest music and videos.
2. Click Explore; search by title/artist and test type/year/genre/language filters.
3. Open a catalogue item and demonstrate its information and reviews.
4. Register a user with a unique User ID and all required fields.
5. Sign in as the new user; submit a rating and review, then edit it.
6. Sign out and sign in as admin; add a catalogue item and optionally upload authorised
   cover/audio/video files; manage categories, users and site details.
7. Verify that a new item is marked NEW and appears on the home page.

IMPORTANT NOTES
---------------
• The sample tracks/videos are demonstration metadata only. Upload media that you own or
  have permission to distribute. The project does not fetch or pirate content from other sites.
• For real uploads, PHP settings upload_max_filesize and post_max_size must be large enough
  (e.g. 100M). The application itself caps each uploaded file at 100 MB.
• If setup cannot create the database, open phpMyAdmin, create a database named sound_group,
  then reload setup.php. Confirm config.php matches your MySQL credentials.
• If uploads fail, confirm uploads/covers and uploads/media are writable by the web server.
• This is an educational project, not a security-audited production streaming service.

PROJECT FILES
-------------
index.php                Main website and route/controller
config.php               Database connection settings
functions.php            Validation helpers, authentication and upload utilities
setup.php                One-time database/table/seed installer
assets/style.css         Responsive visual design
assets/app.js            Small interaction/animation script
uploads/covers/          Uploaded cover images
uploads/media/           Uploaded audio/video files
database_backup.sql      Database schema and demo catalogue backup

docs/PROJECT_DOCUMENTATION.md  Project overview, design, roles, database and test plan
