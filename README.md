# c{api}tal

[c{api}tal](https://github.com/Checkmarx/capital) by the Checkmarx research team: a vulnerable
blogging application (a Medium clone) whose API holds ten challenges mapped to the
[OWASP API Security Top 10](https://owasp.org/www-project-api-security/). This repository runs it
with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, and
the upstream source, split into each machine's build folder, builds with upstream's Dockerfiles.

| Machine | Service |
| --- | --- |
| frontend | React blog on port 4100 |
| backend | FastAPI on port 8000 (`/api`, specification at `/docs`) |
| db | PostgreSQL 11.5 |
| redis | Redis 7.0.3 with upstream's data file, on port 6379 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:4100/ and the API at http://localhost:8000/api (Swagger UI at
http://localhost:8000/docs). The front end is upstream's development server: its first start
compiles for a minute or two. Each solved challenge returns a `flag{...}`.

Differences from upstream's `docker-compose.yml`, which pulls upstream's published images: every
image builds here from the vendored source, with the compose file's environment baked into the
backend image and dependencies resolved as of the source's dates (details in
[UPSTREAM.md](UPSTREAM.md)).

Lab guide: upstream's [README](build/backend/app/README.md) (write-ups linked there).
Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

AGPL-3.0, as c{api}tal ([LICENSE](LICENSE)), copyright Checkmarx.

Source offer (AGPL-3.0 section 13): anyone who interacts with this application over a network
can get its complete corresponding source, unchanged, from this repository (the folders listed
in [UPSTREAM.md](UPSTREAM.md), at the commit named there) together with the build files that
produce the running images, or from upstream at https://github.com/Checkmarx/capital. The
application is deliberately insecure: keep it isolated.
