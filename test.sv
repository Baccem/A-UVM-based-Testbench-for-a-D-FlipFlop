//========================== test =========================//

class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  env my_env;
  valid_din vd;
  rst_dff rd;
  rand_din_rst rdr;
  
  function new(input string path="test",uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
       virtual function void build_phase(uvm_phase phase);
         super.build_phase(phase);
		 my_env = env::type_id::create("my_env",this);
         vd = valid_din::type_id::create("vd");
         rd = rst_dff ::type_id::create("rd");
         rdr =rand_din_rst ::type_id::create("rdr");
         if (vd == null)
           `uvm_info("TEST","vd is null",UVM_MEDIUM)
       endfunction
  
  task run_phase(uvm_phase phase);
   // super.run_phase(phase);
    phase.raise_objection(this);
    
    vd.start(my_env.agn.seq);
    #40
    rd.start(my_env.agn.seq);
    #40
    rdr.start(my_env.agn.seq);
    #40
    phase.drop_objection(this);
  endtask
  
  
endclass