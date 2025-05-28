//========================== Transaction =========================//

class rst_dff extends uvm_sequence #(transaction);
  
  `uvm_object_utils(rst_dff)
  
  transaction t;
  
  function new(input string path = "rst_dff");
    super.new(path);
  endfunction
  
  task body();
    repeat(15) begin 
       t = transaction::type_id::create("t");
      a
    start_item(t);
    assert(t.randomize());
    // forcing rst to 1 to reset the dut
    t.rst = 1'b1;
    `uvm_info("SEQ", $sformatf("rst : %0b  din : %0b  dout : %0b", t.rst, t.din, t.dout), UVM_NONE);
	finish_item(t);
    end
  endtask
  
endclass