cl:
	rm -rf *.wdb xelab* xsim* xvlog* .Xil

co:
	xvlog ./*.v

el:
	xelab tb_multiplexed_bus_driver -debug wave -s tb_multiplexed_bus_driver

si:
	xsim tb_multiplexed_bus_driver -gui -wdb sim.wdb

all: cl co el si
