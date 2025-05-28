//========================== package mypkg =========================//

`include "uvm_macros.svh"

package mypkg;

import uvm_pkg::*;
`include "config.sv"
`include "transaction.sv"
`include "valid_din.sv"
`include "rst_dff.sv"
`include "rand_din_rst.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

endpackage