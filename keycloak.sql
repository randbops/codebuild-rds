DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles  -- SELECT list can be empty for this
      WHERE  rolname = 'rp_test_user') THEN

      CREATE ROLE keycloak_user WITH
      LOGIN
      NOSUPERUSER
      NOCREATEDB
      NOCREATEROLE
      INHERIT
      NOREPLICATION
      CONNECTION LIMIT -1
      PASSWORD 'seine123';

      COMMENT ON ROLE keycloak_user IS 'User used by the UK ETS application to perform DB operations.';
   END IF;
END
$do$;