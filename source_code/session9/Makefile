cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil *.vcd

co:
	xvlog ./*.v

el:
	xelab tb_clock_controller -debug wave -s tb_clock_controller

si:
	xsim tb_clock_controller -gui -wdb sim.wdb

all: cl co el si
