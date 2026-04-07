cl:
	rm -rf *xe* *xs* *.wdb* *trace* *xv* *we* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_data_bus_driver -debug wave -s tb_data_bus_driver

si:
	xsim tb_data_bus_driver -gui -wdb sim.wdb

all: cl co el si
