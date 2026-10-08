# Upstream

| | |
| --- | --- |
| Project | c{api}tal |
| Repository | https://github.com/Checkmarx/capital |
| Version | main (no releases) |
| Commit | 70c0bfd93d83b266f8e85fb7b21509718b657ac0 |
| Licence | AGPL-3.0 |

That commit is vendored unchanged, without its Git history, split so that each service sits in
the build folder of its machine:

| Upstream path | Here |
| --- | --- |
| `frontend/` | `build/frontend/app/` |
| `redis/` | `build/redis/app/` (built by upstream's own Dockerfile, as is) |
| everything else (the backend, tests, Postman collection) | `build/backend/app/` |

`build/backend/Dockerfile` is upstream's root Dockerfile with the sources copied from `app/`, the
environment of upstream's `docker-compose.yml` baked in (`DATABASE_URL` pointing at the `db`
machine, `APP_ENV=prod`), and pip resolving the dependencies as of the date `requirements.txt`
last changed (`--uploaded-prior-to 2022-08-30`). `build/frontend/Dockerfile` is upstream's
`frontend/dockerfile` with the sources copied from `app/` and npm resolving dependencies as of
the date the front end last changed (`npm_config_before=2023-01-22T09:58:54Z`). The database is
upstream's `postgres:11.5-alpine`, unchanged.

To update, replace the three folders with a newer commit, then change these tables and dates.
