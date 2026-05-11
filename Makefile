COMPOSE=docker compose
COMPOSE_FILES=src/docker-compose.yml

all:up

up:
	$(COMPOSE) -f $(COMPOSE_FILES) up --build -d

down:
	$(COMPOSE) -f $(COMPOSE_FILES) down

fclean:
	sudo rm -rf /home/mfornovi/data/MD/*
	sudo rm -rf /home/mfornovi/data/WP/*
	$(COMPOSE) -f $(COMPOSE_FILES) down --volumes --remove-orphans

remove: down
	sudo rm -rf /home/mfornovi/data/MD/*
	sudo rm -rf /home/mfornovi/data/WP/*
	docker network prune
	docker rmi $$(docker images -aq)

re: fclean up