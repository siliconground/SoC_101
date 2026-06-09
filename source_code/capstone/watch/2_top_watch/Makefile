cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil *.vcd

co:
	xvlog ./*.v

el:
	xelab tb_top_watch -debug wave -s tb_top_watch

si:
	xsim tb_top_watch -gui -wdb sim.wdb

all: cl co el si
