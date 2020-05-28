REVOKE ALL PRIVILEGES ON * . * FROM 'pugesto'@'localhost';

REVOKE ALL PRIVILEGES ON `pg_world` . * FROM 'pugesto'@'localhost';

REVOKE GRANT OPTION ON `pg_world` . * FROM 'pugesto'@'localhost';

REVOKE ALL PRIVILEGES ON `pg_roles` . * FROM 'pugesto'@'localhost';

REVOKE GRANT OPTION ON `pg_roles` . * FROM 'pugesto'@'localhost';

REVOKE ALL PRIVILEGES ON `pg_auth` . * FROM 'pugesto'@'localhost';

REVOKE GRANT OPTION ON `pg_auth` . * FROM 'pugesto'@'localhost';

REVOKE ALL PRIVILEGES ON `pg_hotfixes` . * FROM 'pugesto'@'localhost';

REVOKE GRANT OPTION ON `pg_hotfixes` . * FROM 'pugesto'@'localhost';

DROP USER 'pugesto'@'localhost';

DROP DATABASE IF EXISTS `pg_world`;

DROP DATABASE IF EXISTS `pg_roles`;

DROP DATABASE IF EXISTS `pg_auth`;

DROP DATABASE IF EXISTS `pg_hotfixes`;
