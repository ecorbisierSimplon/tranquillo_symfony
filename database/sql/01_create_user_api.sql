CREATE USER 'api' @'%' IDENTIFIED BY 'password';

GRANT
GRANT OPTION,
SELECT,
INSERT
,
UPDATE,
REFERENCES ON `tranquillo`.* TO 'api' @'%';