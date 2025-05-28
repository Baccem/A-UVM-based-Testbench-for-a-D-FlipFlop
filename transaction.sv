//========================== Transaction =========================//

class transaction extends uvm_sequence_item;
  rand logic rst;
  rand logic din;
  logic dout;
  
  `uvm_object_utils(transaction)
  
  function new(input string path = "transaction ");
    super.new(path);
  endfunction
  
endclass
  