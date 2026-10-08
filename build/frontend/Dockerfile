# Upstream's frontend/dockerfile (app/dockerfile here) with two changes: the sources are copied
# from app/, and npm resolves dependencies as of the date the frontend last changed
# (2023-01-22), since upstream runs `npm install` without a lockfile (its yarn.lock is not used).
FROM node:18.5.0-slim
ENV REACT_APP_BACKEND_URL=http://localhost:8000/api
ENV npm_config_before=2023-01-22T09:58:54Z
EXPOSE 4100
WORKDIR /app
COPY app/ .
RUN npm install --force
CMD ["npm", "start"]
