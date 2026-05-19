cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_FSM -debug wave -s tb_FSM

si:
	xsim tb_FSM -gui -wdb sim.wdb

all: cl co el si
