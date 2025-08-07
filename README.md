# ollama-caddy

1. Create `.env` using the template (`.env.example`)
2. Enter all required models in `entrypoint.sh`
3. Run

```bash
docker-compose up -d
```
or
```bash
docker compose up -d
```

Access ollama web ui here: `localhost:14080`

and acess your models using curl
```bash 
curl 'http://localhost:10434/api/tags' \
    --header 'Authorization: Bearer <token>'
```
