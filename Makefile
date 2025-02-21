start:
	docker compose -f docker-compose.yml up --remove-orphans -d

list:
	docker exec -t patroni-pg_coord-1 /venv/bin/patronictl -c /etc/patroni/patroni.yml topology

stop:
	docker compose -f docker-compose.yml down --remove-orphans

cleanstop:
	docker compose -f docker-compose.yml down --remove-orphans --rmi local
