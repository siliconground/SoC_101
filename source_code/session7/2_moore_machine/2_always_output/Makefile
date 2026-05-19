cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_FSM2 -debug wave -s tb_FSM2

si:
	xsim tb_FSM2 -gui -wdb sim.wdb

all: cl co el si
