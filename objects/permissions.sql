USE workshop;

CREATE USER "admin1"@"%" IDENTIFIED BY "password1";
CREATE USER "user2"@"%" IDENTIFIED BY "password2";
CREATE USER "user3"@"%" IDENTIFIED BY "password3";



GRANT ALL PRIVILEGES ON workshop.* TO 'admin1'@'%';




GRANT SELECT, INSERT, UPDATE, DELETE ON workshop.* TO "user2"@"%";
GRANT SELECT ON workshop.suscripciones TO "user2"@"%";

GRANT SELECT, DELETE ON workshop.juegos TO "user3"@"%";
GRANT SELECT, INSERT, UPDATE, DELETE ON workshop.genero_juegos TO "user3"@"%";