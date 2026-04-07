cl:
	rm -rf *.wdb xelab* xsim* xvlog* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_bidirectional_bus_driver -debug wave -s tb_bidirectional_bus_driver

si:
	xsim tb_bidirectional_bus_driver -gui -wdb sim.wdb

all: cl co el si
