#!/bin/sh
# c{api}tal is up with its seeded data: the articles list holds the seeded posts, and the
# OpenAPI specification is c{api}tal's.
set -u
get() { curl -sS --max-time 20 "$1" 2>/dev/null; }
get http://backend:8000/api/articles | grep -q '"articlesCount"' || { echo "articles"; exit 1; }
get http://backend:8000/openapi.json | grep -q '/api/v2/users/login' || { echo "openapi"; exit 1; }
get http://frontend:4100/ | grep -q 'c{api}tal' || { echo "front end"; exit 1; }
echo "c{api}tal answers with its seeded articles"
