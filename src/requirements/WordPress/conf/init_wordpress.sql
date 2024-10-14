-- Crée les tables de WordPress
USE maria;
SOURCE /var/www/wordpress/wp-admin/includes/schema.sql;

-- Insertion des informations de base (site, utilisateur admin)
INSERT INTO wp_options (option_name, option_value, autoload) VALUES ('siteurl', 'http://localhost:8443', 'yes');
INSERT INTO wp_options (option_name, option_value, autoload) VALUES ('home', 'http://localhost:8443', 'yes');
INSERT INTO wp_options (option_name, option_value, autoload) VALUES ('blogname', 'Mon site WordPress', 'yes');
INSERT INTO wp_options (option_name, option_value, autoload) VALUES ('admin_email', 'email@example.com', 'yes');

-- Crée l'utilisateur administrateur
INSERT INTO wp_users (user_login, user_pass, user_nicename, user_email, user_registered, user_status, display_name) 
VALUES ('admin', MD5('admin_password'), 'admin', 'email@example.com', NOW(), 0, 'admin');

-- Donne les droits d'administrateur à l'utilisateur
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
INSERT INTO wp_usermeta (user_id, meta_key, meta_value) VALUES (1, 'wp_user_level', '10');
