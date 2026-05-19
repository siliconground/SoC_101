cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_mealy_fsm -debug wave -s tb_mealy_fsm

si:
	xsim tb_mealy_fsm -gui -wdb sim.wdb

all: cl co el si
