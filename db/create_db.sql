-- Database: inventory

-- DROP DATABASE inventory;

CREATE DATABASE test
    WITH 
    OWNER = vento
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE test
    IS 'This is the Database for the test project';