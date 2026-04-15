xvlog ./*.v	
xelab tb_simple_register -debug wave -s tb_simple_register
xsim tb_simple_register -gui -wdb sim.wdb