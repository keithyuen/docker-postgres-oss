# PostgreSQL + pgAdmin on Docker Compose

This project provides a Docker Compose setup for PostgreSQL with SSL and pgAdmin 4. It includes:

- Self-signed SSL certificate generation
- Preloaded schema and mock data
- pgAdmin 4 with a pre-configured server connection

## Quick Setup

### 1. Prepare folders

```bash
mkdir -p certgen certs data logs secrets initdb pgadmin
```

### 2. Add secrets

```bash
echo "your_pg_user" > secrets/pg_user.txt
echo "your_pg_password" > secrets/pg_pw.txt
```

### 3. Add initialization files

- `sql/init.sql`: Your SQL schema and data
- `pgadmin/servers.json`: pgAdmin server config
- `pgadmin/pgpass`: Credential file
- `certgen/Dockerfile` and `certgen/generate-cert.sh`: For SSL cert generation

### 4. Run the stack

```bash
docker-compose up --build
```
or
```bash
docker-compose up -d
```

Access pgAdmin at: [http://localhost:5050](http://localhost:5050) or specified host 
Login: `admin@local.com` / `admin123` (skipped as pre-configured)

## Notes

- pgAdmin connects to the PostgreSQL container using hostname `postgres`
- SSL certificates are generated if they don't exist
- SSL certiticates might not have the required permissions on your work computer. Fixed by running: 
```bash
chmod 600 ./certs/server.key
```
- init.sql runs only on first database initialization

## Clean up
Clean up data directories after use. If not, the new data will not be initiated by initdb.
```bash
docker-compose down
rm -rf ./data
rm -rf ./log
```
