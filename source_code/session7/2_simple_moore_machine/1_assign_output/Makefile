cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_FSM1 -debug wave -s tb_FSM1

si:
	xsim tb_FSM1 -gui -wdb sim.wdb

all: cl co el si
