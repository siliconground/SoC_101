cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_shift_register_sipo -debug wave -s tb_shift_register_sipo

si:
	xsim tb_shift_register_sipo -gui -wdb sim.wdb

all: cl co el si
