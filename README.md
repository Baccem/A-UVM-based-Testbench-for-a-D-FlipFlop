# A-UVM-based-Testbench-for-a-D-FlipFlop
This is a test bench environment using open source UVM framework to test and verify the functionality of a D Flip Flop
<!-- README.html for A-UVM-based-Testbench-for-a-D-FlipFlop -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>A‑UVM‑based‑Testbench‑for‑a‑D‑FlipFlop</title>
  <style>
    body { font-family: Arial, sans-serif; line-height: 1.6; margin: 2em; }
    h1, h2 { color: #2c3e50; }
    pre { background: #f4f4f4; padding: 1em; overflow-x: auto; }
    code { font-family: Consolas, monospace; color: #c7254e; background: #f9f2f4; padding: 2px 4px; }
    .badge { display: inline-block; margin-right: 0.5em; }
  </style>
</head>
<body>

  <h1>A‑UVM‑based‑Testbench‑for‑a‑D‑FlipFlop</h1>
  <p><em>This is a test bench environment using the open‑source UVM framework to test and verify the functionality of a D Flip‑Flop.</em></p>

  <h2>Table of Contents</h2>
  <ul>
    <li><a href="#overview">Overview</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#directory-structure">Directory Structure</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#running-the-testbench">Running the Testbench</a></li>
    <li><a href="#extensions">Extensions</a></li>
  </ul>

  <h2 id="overview">Overview</h2>
  <p>
    This repository contains a complete UVM‑based verification environment for a single‑bit D Flip‑Flop
    (<code>dff</code>). It demonstrates:
  </p>
  <ul>
    <li>Virtual interface binding via <code>uvm_config_db</code>.</li>
    <li>Random stimulus generation with <code>uvm_sequence_item</code> and various <code>uvm_sequence</code> classes.</li>
    <li>A classic UVM <strong>agent</strong> composed of a <code>driver</code> and <code>monitor</code>.</li>
    <li>A <code>scoreboard</code> for result checking and pass/fail reporting.</li>
    <li>A top‑level <code>tb.sv</code> that instantiates the DUT, the interface, and kicks off <code>run_test("test")</code>.</li>
  </ul>

  <h2 id="features">Features</h2>
  <dl>
    <dt><strong>config_dff</strong></dt>
    <dd>UVM object carrying agent configuration (active/passive mode).</dd>

    <dt><strong>transaction</strong></dt>
    <dd>Sequence item encapsulating <code>rst</code>, <code>din</code>, and <code>dout</code> signals.</dd>

    <dt><strong>Sequences</strong></dt>
    <dd>
      <ul>
        <li><code>valid_din</code>: Drives only valid data cycles (rst=0).</li>
        <li><code>rst_dff</code>: Issues reset pulses (rst=1).</li>
        <li><code>rand_din_rst</code>: Randomizes both <code>din</code> and <code>rst</code>.</li>
      </ul>
    </dd>

    <dt><strong>driver</strong></dt>
    <dd>Implements <code>run_phase</code> to drive <code>rst</code> and <code>din</code> on the interface.</dd>

    <dt><strong>monitor</strong></dt>
    <dd>
      Samples DUT output (<code>dout</code>) on clock edges and writes transactions to the scoreboard.
    </dd>

    <dt><strong>scoreboard</strong></dt>
    <dd>
      Receives transactions via an <code>uvm_analysis_imp</code>, compares <code>dout</code> vs. <code>din</code>,
      and reports pass/fail or reset events.
    </dd>

    <dt><strong>agent & environment</strong></dt>
    <dd>
      Assembles the driver, monitor, sequencer, and scoreboard. Connects analysis ports for scoreboard updates.
    </dd>

    <dt><strong>test</strong></dt>
    <dd>Creates environment, starts various sequences in series, and controls test duration via UVM objections.</dd>
  </dl>

  <h2 id="directory-structure">Directory Structure</h2>
  <pre>
  ├── tb
  │   ├── tb.sv
  │   ├── dff_if.sv
  │   ├── dff.sv                &lt;-- DUT
  │   └── waves.vcd
  ├── pkg
  │   ├── config.sv
  │   ├── transaction.sv
  │   ├── valid_din.sv
  │   ├── rst_dff.sv
  │   ├── rand_din_rst.sv
  │   ├── driver.sv
  │   ├── monitor.sv
  │   ├── scoreboard.sv
  │   ├── agent.sv
  │   ├── env.sv
  │   └── test.sv
  └── README.html
  </pre>

  <h2 id="getting-started">Getting Started</h2>
  <ol>
    <li>Install a SystemVerilog simulator with UVM support (e.g. Questa, VCS, Xcelium).</li>
    <li>Clone this repo:
      <pre><code>git clone https://github.com/your‑org/A‑UVM‑based‑Testbench‑for‑a‑D‑FlipFlop.git</code></pre>
    </li>
    <li>Compile the DUT and UVM packages:
      <pre><code>
vlib work
vlog +acc +incdir+./pkg \
    ./tb/dff_if.sv \
    ./tb/dff.sv \
    ./pkg/config.sv \
    ./pkg/transaction.sv \
    ... (all .sv files) ...
      </code></pre>
    </li>
  </ol>

  <h2 id="running-the-testbench">Running the Testbench</h2>
  <p>Invoke your simulator with UVM switches:</p>
  <pre><code>
vsim work.tb \
  -sv_lib $UVM_HOME/lib/uvm.sv \
  +UVM_NO_DUPLICATE_REPORTS=1 \
  +UVM_VERBOSITY=UVM_LOW \
  -gui
  </code></pre>
  <p>The waves will be dumped to <code>waves.vcd</code>, and you’ll see UVM logs for each transaction and scoreboard check.</p>

  <h2 id="extensions">Extensions</h2>
  <ul>
    <li>Add a <strong>reference model</strong> in <code>scoreboard</code> for functional coverage.</li>
    <li>Implement a <strong>coverage collector</strong> for <code>din</code> toggling patterns.</li>
    <li>Scale to an <strong>N‑bit register file</strong> by parameterizing the interface and transactions.</li>
  </ul>

</body>
</html>
