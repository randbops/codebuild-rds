DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles  -- SELECT list can be empty for this
      WHERE  rolname = 'schema_user') THEN

        CREATE ROLE schema_user WITH
        LOGIN
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        INHERIT
        NOREPLICATION
        CONNECTION LIMIT -1
        PASSWORD 'PASSWORD HERE';

        COMMENT ON ROLE schema_user IS 'User used by the UK ETS application to perform DB operations.';

        ALTER DEFAULT PRIVILEGES GRANT ALL ON TABLES TO schema_user;

        ALTER DEFAULT PRIVILEGES GRANT ALL ON SEQUENCES TO schema_user;

   END IF;
END
$do$;

DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles  -- SELECT list can be empty for this
      WHERE  rolname = 'runtime_user') THEN

        CREATE ROLE runtime_user WITH
        LOGIN
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        INHERIT
        NOREPLICATION
        CONNECTION LIMIT -1
        PASSWORD 'PASSWORD HERE';

        COMMENT ON ROLE runtime_user IS 'User used by the UK ETS application to perform DB operations.';

        GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
        ON ALL TABLES IN SCHEMA public TO runtime_user;

   END IF;
END
$do$;