start:
	docker compose -f docker-compose.yml up --remove-orphans -d

list:
	docker exec -t pg_c1 /venv/bin/patronictl -c /etc/patroni/patroni.yml topology -w 1

stop:
	docker compose -f docker-compose.yml down --remove-orphans

cleanstop:
	docker compose -f docker-compose.yml down --remove-orphans --rmi local
