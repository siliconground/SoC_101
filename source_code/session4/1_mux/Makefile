cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_gpio_mux -debug wave -s tb_gpio_mux

si:
	xsim tb_gpio_mux -gui -wdb sim.wdb

all: cl co el si
