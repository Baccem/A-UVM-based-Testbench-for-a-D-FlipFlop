
`timescale 1ps/1ps

`include "mypkg.sv"


module tb();
  
  // interface instantiation
  dff_if dif();
  
  // DUT instantiation
  dff dut (
    .clk(dif.clk),
    .rst(dif.rst),
    .din(dif.din),
    .dout(dif.dout)
  );
  
  // clock block 
  initial begin     
    dif.clk = 0 ;
    //forever #10 dif.clk = ~ dif.clk;    
  end
  
    always #10 dif.clk = ~dif.clk;
  
  initial begin 
  
  //uvm_config_db #(virtual dff_if)::set(null,"*","dif",dif);
  uvm_config_db #(virtual dff_if)::set(null, "*", "dif", dif);
  run_test("test");
  end

  //waves dump
  initial begin 
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  

  
endmodule // Code your testbench here
// or browse Examples
