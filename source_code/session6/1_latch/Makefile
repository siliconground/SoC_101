cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_d_latch -debug wave -s tb_d_latch

si:
	xsim tb_d_latch -gui -wdb sim.wdb

all: cl co el si
