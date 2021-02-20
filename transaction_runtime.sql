DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'runtime_user8') THEN

        CREATE ROLE runtime_user8 WITH
        LOGIN
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        INHERIT
        NOREPLICATION
        CONNECTION LIMIT -1
        PASSWORD 'ROLE_PASSWORD';

        COMMENT ON ROLE runtime_user IS 'User used by the UK ETS application to perform DB operations.';

        GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
        ON ALL TABLES IN SCHEMA public TO runtime_user;

   END IF;
END
$do$;