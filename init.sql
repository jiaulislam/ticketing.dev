-- CREATE User statements for services
CREATE USER auth_user WITH PASSWORD 'password123';
CREATE USER ticket_user WITH PASSWORD 'password123';
CREATE USER order_user WITH PASSWORD 'password123';

-- CREATE Database statements for services
CREATE DATABASE auth_service OWNER auth_user;
CREATE DATABASE ticket_service OWNER ticket_user;
CREATE DATABASE order_service OWNER order_user;

-- GRANT privileges on databases to users
GRANT ALL PRIVILEGES ON DATABASE auth_service TO auth_user;
GRANT ALL PRIVILEGES ON DATABASE ticket_service TO ticket_user;
GRANT ALL PRIVILEGES ON DATABASE order_service TO order_user;

-- GRANT CREATEDB privilege to users
ALTER USER auth_user WITH CREATEDB;
ALTER USER ticket_user WITH CREATEDB;
ALTER USER order_user WITH CREATEDB;
