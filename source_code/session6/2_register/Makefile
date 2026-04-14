cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil vivado*

co:
	xvlog ./*.v

el:
	xelab tb_register -debug wave -s tb_register

si:
	xsim tb_register -gui -wdb sim.wdb

all: cl co el si
