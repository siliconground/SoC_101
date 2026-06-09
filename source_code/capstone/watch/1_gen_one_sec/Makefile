cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil *.vcd

co:
	xvlog ./*.v

el:
	xelab tb_gen_one_sec -debug wave -s tb_gen_one_sec

si:
	xsim tb_gen_one_sec -gui -wdb sim.wdb

all: cl co el si
