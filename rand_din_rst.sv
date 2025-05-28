//========================== Transaction =========================//

class rand_din_rst extends uvm_sequence #(transaction);
  
  `uvm_object_utils(rand_din_rst)
  
  transaction t;
  
  function new(input string path = "rand_din_rst");
    super.new(path);
  endfunction
  
  task body();
    repeat(15) begin 
       t = transaction::type_id::create("t");
      start_item(t);
      assert(t.randomize());
      `uvm_info("SEQ", $sformatf("rst : %0b  din : %0b  dout : %0b", t.rst, t.din, t.dout), UVM_NONE);
      finish_item(t);
    end
  endtask
  
endclass