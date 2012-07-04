app: compile ebin/dhcp.app.src

check: compile
	dialyzer -c ebin

ebin/dhcp.app.src: src/dhcp.app.src
	mkdir -p ebin
	cp src/dhcp.app.src ebin/
	cp src/dhcp.app ebin/


compile:
	mkdir -p ebin
	erl -eval 'case make:all() of up_to_date -> halt(0); error -> halt(1) end.' -noshell

clean:
	rm -rf ebin/* erl_crash.dump
	rm -r ebin

server: app
	sudo erl -pa ebin -eval 'dhcp:start().'

.PHONY: compile check app
