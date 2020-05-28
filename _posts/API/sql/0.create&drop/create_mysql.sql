GRANT USAGE ON *.* TO 'pugesto'@'localhost' IDENTIFIED BY 'pugesto' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 ;

CREATE DATABASE `pg_world` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE DATABASE `pg_roles` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE DATABASE `pg_auth` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE DATABASE `pg_hotfixes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON `pg_world` . * TO 'pugesto'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `pg_roles` . * TO 'pugesto'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `pg_auth` . * TO 'pugesto'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `pg_hotfixes` . * TO 'pugesto'@'localhost' WITH GRANT OPTION;
