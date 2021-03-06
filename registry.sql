DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'schema_user') THEN

        CREATE ROLE schema_user WITH
        LOGIN
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        INHERIT
        NOREPLICATION
        CONNECTION LIMIT -1
        PASSWORD 'schemapassword';

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
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'runtime_user') THEN

        CREATE ROLE runtime_user WITH
        LOGIN
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        INHERIT
        NOREPLICATION
        CONNECTION LIMIT -1
        PASSWORD 'runtimepassword';

        COMMENT ON ROLE runtime_user IS 'User used by the UK ETS application to perform DB operations.';

        GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
        ON ALL TABLES IN SCHEMA public TO runtime_user;

        ALTER DEFAULT PRIVILEGES GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
         ON TABLES TO runtime_user;

        GRANT ALL PRIVILEGES
         ON ALL SEQUENCES IN SCHEMA public TO runtime_user;

        ALTER DEFAULT PRIVILEGES GRANT ALL
         ON SEQUENCES TO runtime_user;

      COMMENT ON ROLE keycloak_user IS 'User used by the UK ETS application to perform DB operations.';
   END IF;
END
$do$;