SHELL=bash

pgbench.log:
	pgbench -i -IdtGvpf -s100 -q
	pgbench -n -S -T50 -j50 -c10 -Msimple >> $@
	pgbench -n -S -T50 -j50 -c10 -Mextended >> $@
	pgbench -n -S -T50 -j50 -c10 -Mprepared >> $@
