class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
  //instance of analysis port
  uvm_analysis_port #(transaction) send;
  
  function new(input string path="monitor",uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  
  virtual dff_if vif;
  transaction t;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t = transaction::type_id::create("t",this);
    send = new("send",this);
  endfunction
  
    virtual function void end_of_elaboration(); 
    super.end_of_elaboration();
      if(!uvm_config_db #(virtual dff_if)::get(this,"","dif",vif))
        `uvm_error("MON","Couldn't access virtual interface through uvm_config_db");
    endfunction
  
      task run_phase(uvm_phase phase);
      // new to me
        forever begin 
      repeat(2) @(posedge vif.clk);
      	t.rst = vif.rst;
      	t.din = vif.din;
      	t.dout = vif.dout;      
      `uvm_info("MON", $sformatf("rst : %0b  din : %0b  dout : %0b", t.rst, t.din, t.dout), UVM_NONE);
      // new to me
      send.write(t);
        end
      endtask
        
  
endclass