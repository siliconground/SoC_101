cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_bcd_to_7seg -debug wave -s tb_bcd_to_7seg

si:
	xsim tb_bcd_to_7seg -gui -wdb sim.wdb

all: cl co el si
