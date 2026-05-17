MAKEFLAGS += --no-print-directory

COMPOSE = /usr/bin/docker-COMPOSE
COMPOSE_FILE = srcs/docker-compose.yml
CERT_KEY = srcs/requirements/nginx/tools/server.key
CERT_CRT = scrs/requirements/nginx/tools/server.crt