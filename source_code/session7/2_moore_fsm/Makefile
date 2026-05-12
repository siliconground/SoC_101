cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_moore_fsm -debug wave -s tb_moore_fsm

si:
	xsim tb_moore_fsm -gui -wdb sim.wdb

all: cl co el si
