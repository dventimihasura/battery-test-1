SHELL=bash

PGHOST=localhost
PGUSER=postgres
PGPORT=5432
PGDATABASE=postgres
PGPASSWORD=postgrespassword

.ONESHELL:

pgbench.log:
	export PGHOST=$(PGHOST) PGPORT=$(PGPORT) PGUSER=$(PGUSER) PGDATABASE=$(PGDATABASE) PGPASSWORD=$(PGPASSWORD)
	sudo -u postgres psql -c "alter user postgres password '$(PGPASSWORD)'"
	pgbench -i -IdtGvpf -s100 -q
	pgbench -n -S -T10 -j1 -c1 -Msimple >> $@
	pgbench -n -S -T10 -j1 -c1 -Mextended >> $@
	pgbench -n -S -T10 -j1 -c1 -Mprepared >> $@
