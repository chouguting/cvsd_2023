set_clock_latency -source -early -max -rise  -0.84439 [get_ports {i_clk}] -clock i_clk 
set_clock_latency -source -early -max -fall  -0.893875 [get_ports {i_clk}] -clock i_clk 
set_clock_latency -source -late -max -rise  -0.84439 [get_ports {i_clk}] -clock i_clk 
set_clock_latency -source -late -max -fall  -0.893875 [get_ports {i_clk}] -clock i_clk 
