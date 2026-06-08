cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil *.vcd

co:
	xvlog ./*.v

el:
	xelab tb_ahb_gpio -debug wave -s tb_ahb_gpio

si:
	xsim tb_ahb_gpio -gui -wdb sim.wdb

all: cl co el si
