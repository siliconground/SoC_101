cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil *.vcd

co:
	xvlog ./*.v

el:
	xelab tb_reset -debug wave -s tb_reset

si:
	xsim tb_reset -gui -wdb sim.wdb

all: cl co el si
