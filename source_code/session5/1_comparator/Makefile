cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_comparator -debug wave -s tb_comparator

si:
	xsim tb_comparator -gui -wdb sim.wdb

all: cl co el si
