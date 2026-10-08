# Upstream's Dockerfile (app/Dockerfile, the repository root of Checkmarx/capital) with these
# changes:
#   - the sources are copied from app/;
#   - the environment of upstream's docker-compose.yml for the backend is baked in (ENV below);
#     the database host is the `db` machine, as in that file;
#   - requirements.txt pins the direct dependencies only, so pip resolves the rest as of the
#     date requirements.txt last changed (2022-08-29), with a pip release that has
#     --uploaded-prior-to.
FROM python:3.9.10-slim
ENV DATABASE_URL=postgresql://postgres:postgres@db/postgres \
    APP_ENV=prod
COPY app/app /capital/app
COPY app/requirements.txt /capital
COPY app/alembic.ini /capital
COPY app/main.py /capital
WORKDIR /capital
RUN apt update -y
RUN apt install -y procps
RUN pip install --upgrade 'pip>=26' && pip install --uploaded-prior-to 2022-08-30T00:00:00Z -r requirements.txt
CMD ["python3", "main.py"]
