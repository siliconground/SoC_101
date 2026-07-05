cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_FSM3 -debug wave -s tb_FSM3

si:
	xsim tb_FSM3 -gui -wdb sim.wdb

all: cl co el si
