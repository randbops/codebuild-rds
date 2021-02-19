DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles  -- SELECT list can be empty for this
      WHERE  rolname = 'rp_test_user') THEN

      CREATE ROLE rp_test_user LOGIN PASSWORD 'my_password';
   END IF;
END
$do$;