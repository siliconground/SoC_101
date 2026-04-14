cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_fdivider -debug wave -s tb_fdivider

si:
	xsim tb_fdivider -gui -wdb sim.wdb

all: cl co el si
