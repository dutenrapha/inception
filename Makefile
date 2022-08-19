DB_NAME = mariadb
DB_WP_NAME = wordpress
USER_NAME = rdutenke
MARIADB_VOLUME_DIR = /home/$(USER_NAME)/data/$(DB_NAME)
WORDPRESS_VOLUME_DIR = /home/$(USER_NAME)/data/$(DB_WP_NAME)
ALL_VOLUMES = $(shell docker volume ls -q)
DOMAIN	=	$(shell awk '/rdutenke.42.fr/{print $$2}' /etc/hosts)

all: fclean $(MARIADB_VOLUME_DIR) $(WORDPRESS_VOLUME_DIR) hosts
	cd ./src && docker-compose up -d

$(MARIADB_VOLUME_DIR):
	sudo mkdir -p $(MARIADB_VOLUME_DIR)
	docker volume create --name $(DB_NAME) --opt type=none --opt device=$(MARIADB_VOLUME_DIR) --opt o=bind

$(WORDPRESS_VOLUME_DIR):
	sudo mkdir -p $(WORDPRESS_VOLUME_DIR)
	docker volume create --name $(DB_WP_NAME) --opt type=none --opt device=$(WORDPRESS_VOLUME_DIR) --opt o=bind


hosts:
ifneq (${DOMAIN},phemsi-a.42.fr)
	cp /etc/hosts ./hosts_backup
	sudo rm /etc/hosts
	sudo cp ./srcs/requirements/tools/hosts /etc/
endif

clean:
ifneq ($(ALL_VOLUMES),)
	docker volume rm $(ALL_VOLUMES)
endif

fclean: clean
	sudo rm -rf /home/rdutenke/data
	sudo rm /etc/hosts
	sudo mv ./hosts_backup /etc/hosts
