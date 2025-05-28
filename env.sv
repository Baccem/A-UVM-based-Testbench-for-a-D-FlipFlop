//========================== Env =========================//

class env extends uvm_env;
  
  `uvm_component_utils(env)
  
  agent agn;
  scoreboard scr;
  config_dff cfg;
  function new(input string path="env",uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
     virtual function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       agn = agent::type_id::create("agn",this);
       scr = scoreboard::type_id::create("scr",this);
       cfg = config_dff::type_id::create("cfg");
       uvm_config_db #(config_dff)::set(this,"agn","cfg",cfg);
     endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // ka2ene b3ml connect been el object da w da
    agn.mon.send.connect(scr.recv);
  endfunction
  
endclass