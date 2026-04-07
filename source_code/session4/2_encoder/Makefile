cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_interrupt_controller -debug wave -s tb_interrupt_controller

si:
	xsim tb_interrupt_controller -gui -wdb sim.wdb

all: cl co el si
