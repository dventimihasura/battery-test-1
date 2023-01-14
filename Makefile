SHELL=bash

pgbench.log:
	pgbench -i -ItGpf -s100 -q
	pgbench -n -S -T10 -j1 -c1 -Msimple >> $@
	pgbench -n -S -T10 -j1 -c1 -Mextended >> $@
	pgbench -n -S -T10 -j1 -c1 -Mprepared >> $@
