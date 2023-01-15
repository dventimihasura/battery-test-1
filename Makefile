SHELL=bash

PGHOST=localhost
PGUSER=postgres
PGPORT=5432
PGDATABASE=postgres
PGPASSWORD=postgrespassword

pgbench.log:
	sudo -u postgres psql -c "alter user postgres password $(POSTGRESPASSWORD)"
	pgbench -i -ItGpf -s100 -q
	pgbench -n -S -T10 -j1 -c1 -Msimple >> $@
	pgbench -n -S -T10 -j1 -c1 -Mextended >> $@
	pgbench -n -S -T10 -j1 -c1 -Mprepared >> $@
