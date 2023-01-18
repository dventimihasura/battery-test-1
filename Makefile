SHELL=bash

pgbench.log:
	pgbench -i -IdtGvpf -s100 -q
	pgbench -n -S -R100000 -j50 -c10 -Msimple >> $@
	pgbench -n -S -R100000 -j50 -c10 -Mextended >> $@
	pgbench -n -S -R100000 -j50 -c10 -Mprepared >> $@
