//========================== Transaction =========================//

class valid_din extends uvm_sequence #(transaction);
  
  `uvm_object_utils(valid_din)
  
  transaction t;
  
  function new(input string path = "valid_din");
    super.new(path);
  endfunction
  
  task body();
    repeat (15) begin 
       t = transaction::type_id::create("t");
      
      start_item(t);
      assert(t.randomize());
        // forcing/overriding the value of rst to be 0
        t.rst = 1'b0;
        `uvm_info("SEQ", $sformatf("rst : %0b  din : %0b  dout : %0b", t.rst, t.din, t.dout), UVM_NONE);
      finish_item(t);
      
    end
  endtask
  
endclass