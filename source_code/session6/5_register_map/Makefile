cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_simple_register -debug wave -s tb_simple_register

si:
	xsim tb_simple_register -gui -wdb sim.wdb

all: cl co el si
