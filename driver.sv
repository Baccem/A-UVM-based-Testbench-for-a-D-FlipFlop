class driver extends uvm_driver#(transaction);
  
  `uvm_component_utils(driver)
  
  function new(input string path="driver",uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual dff_if vif;
  transaction t;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  //  t = transaction::type_id::create("t",this);
    endfunction
  
  virtual function void end_of_elaboration(); 
    super.end_of_elaboration();
    // new to me
  if(!uvm_config_db #(virtual dff_if)::get(this,"","dif",vif))
    `uvm_error("DRV","Couldn't access virtual interface through uvm_config_db")
    endfunction
    
    task run_phase (uvm_phase phase);
    	
    //repeat(2) @(posedge vif.clk);
     t = transaction::type_id::create("t",this);
    forever begin 
      seq_item_port.get_next_item(t);
      vif.rst = t.rst;
      vif.din = t.din;
      `uvm_info("DRV", $sformatf("rst : %0b  din : %0b  dout : %0b", t.rst,t.din, t.dout), UVM_NONE);
      seq_item_port.item_done();
repeat(2) @(posedge vif.clk);
    end
    
    endtask
  
endclass