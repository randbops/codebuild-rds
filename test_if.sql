DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles  -- SELECT list can be empty for this
      WHERE  rolname = 'keycloak_user') THEN

      CREATE ROLE keycloak_user LOGIN PASSWORD 'my_password';
   END IF;
END
$do$;