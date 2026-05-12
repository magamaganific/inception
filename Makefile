COMPOSE=docker compose
COMPOSE_FILE=src/docker-compose.yml

all:up

up:
	$(COMPOSE) -f $(COMPOSE_FILE) up --build -d

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down

fclean:
	sudo rm -rf /home/mfornovi/data/MD/*
	sudo rm -rf /home/mfornovi/data/WP/*
	$(COMPOSE) -f $(COMPOSE_FILE) down --volumes --remove-orphans

remove: down
	sudo rm -rf /home/mfornovi/data/MD/*
	sudo rm -rf /home/mfornovi/data/WP/*
	docker network prune
	docker rmi $$(docker images -aq)

re: fclean up