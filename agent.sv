//========================== Agent =========================//

class agent extends uvm_agent;
  
  `uvm_component_utils(agent)
  
  driver drv ;
  monitor mon;
  uvm_sequencer#(transaction) seq;
  // new to me
  config_dff cfg ;
  
  function new(input string path="agent",uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     mon = monitor::type_id::create("mon",this);
     cfg = config_dff::type_id::create("cfg");
     
     if(!uvm_config_db #(config_dff)::get(this,"","cfg",cfg))
       `uvm_error("AGENT", "FAILED TO ACCESS CONFIG");
     
     if(cfg.agent_type == UVM_ACTIVE) begin 
       drv = driver::type_id::create("drv",this);
       seq = uvm_sequencer#(transaction)::type_id::create("seq",this);
     end
   endfunction
  
  // agent type check

     
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seq.seq_item_export);
  endfunction
  
endclass

/////////////////////////////////////////////////////////////////////////

// class agent extends uvm_agent;
  
//   `uvm_component_utils(agent)
  
//   driver drv ;
//   monitor mon;
//   uvm_sequencer#(transaction) seq;
  
//   function new(input string path="agent",uvm_component parent = null);
//     super.new(path,parent);
//   endfunction
  
//    virtual function void build_phase(uvm_phase phase);
//     super.build_phase(phase);
//      drv = driver::type_id::create("drv",this);
//      mon = monitor::type_id::create("mon",this);
//      seq = uvm_sequencer#(transaction)::type_id::create("seq",this);
//    endfunction
  
//   virtual function void connect_phase(uvm_phase phase);
//     super.connect_phase(phase);
//     drv.seq_item_port.connect(seq.seq_item_export);
//   endfunction
  
// endclass