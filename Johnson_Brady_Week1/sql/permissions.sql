-- Create role, set/grant it's permissions, assign the user to the role.
CREATE ROLE IF NOT EXISTS 'admin_role'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'admin_role'@'%' WITH GRANT OPTION ;
SET DEFAULT ROLE 'admin_role' TO 'admin_user'@'%';
GRANT 'admin_role' to 'admin_user' @'%'; -- I do not think I need this, but I am adding just in case.

-- Read_only
CREATE ROLE IF NOT EXISTS 'read_role';
GRANT SELECT, SHOW VIEW ON *.* TO 'read_role';
SET DEFAULT ROLE 'read_role' TO 'read_only'@'%';
GRANT 'read_role' to 'read_only' @'%';

-- Modify
CREATE ROLE IF NOT EXISTS 'modify_role';
GRANT INSERT, UPDATE, DELETE, ALTER, CREATE, DROP ON *.* TO 'modify_role';
SET DEFAULT ROLE 'modify_role' TO 'modify_user'@'%';
GRANT 'modify_role' to 'modify_user' @'%';
