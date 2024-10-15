USE EMPLOYEES;

-- Create role, set/grant its permissions, assign the user to the role.
CREATE ROLE IF NOT EXISTS 'admin_role';
GRANT ALL PRIVILEGES ON EMPLOYEES.* TO 'admin_role' WITH GRANT OPTION ;
GRANT 'admin_role' to 'admin_user' @'%';  -- I do not think I need this, but I am adding just in case.
SET DEFAULT ROLE 'admin_role' TO 'admin_user'@'%';

-- Read_only
CREATE ROLE IF NOT EXISTS 'read_role';
GRANT SELECT, SHOW VIEW ON EMPLOYEES.* TO 'read_role';
GRANT 'read_role' TO 'read_only' @'%';
SET DEFAULT ROLE 'read_role' TO 'read_only'@'%';
GRANT EXECUTE ON PROCEDURE getAllEmployeesInfo TO 'read_only' @'%';

-- Modify
CREATE ROLE IF NOT EXISTS 'modify_role';
GRANT EXECUTE, INSERT, UPDATE, DELETE, ALTER, CREATE, DROP ON EMPLOYEES.* TO 'modify_role';
GRANT 'modify_role' to 'modify_user' @'%';
SET DEFAULT ROLE 'modify_role' TO 'modify_user'@'%';

FLUSH PRIVILEGES;

# REVOKE ALL PRIVILEGES ON *.* FROM modify_role;
# REVOKE ALL PRIVILEGES ON *.* FROM 'modify_user'@'%';
#
# REVOKE ALL PRIVILEGES ON *.* FROM read_role;
# REVOKE ALL PRIVILEGES ON *.* FROM 'read_only'@'%';
#
# REVOKE ALL PRIVILEGES ON *.* FROM admin_role;
# REVOKE ALL PRIVILEGES ON *.* FROM 'admin_user'@'%';