cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil *.vcd

co:
	xvlog ./*.v

el:
	xelab tb_tri_state_io -debug wave -s tb_tri_state_io

si:
	xsim tb_tri_state_io -gui -wdb sim.wdb

all: cl co el si
