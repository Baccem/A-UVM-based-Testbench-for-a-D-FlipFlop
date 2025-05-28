<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
 
</head>
<body>

  <h1>A‑UVM‑based‑Testbench‑for‑a‑D‑FlipFlop</h1>
  <p><em>This is a test bench environment using the open‑source UVM framework to test and verify the functionality of a D Flip‑Flop.</em></p>

  <h2>Table of Contents</h2>
  <ul>
    <li><a href="#overview">Overview</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#directory-structure">Directory Structure</a></li>
    <li><a href="#running-the-testbench">Running the Testbench</a></li>
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
    <dt><strong>  </strong></dt>
    <dd>  </dd>
        <dt><strong> Transaction </strong></dt>
    <dd> Encapsulates the inputs and outputs of the DUT </dd>
        <dt><strong> Sequences:valid_din, rst_dff and rand_din_rst rand_ </strong></dt>
    <dd> They are used to make the testing scenarios </dd>
        <dt><strong> Driver </strong></dt>
    <dd> Drives data to DUT via virtual Interface </dd>
        <dt><strong> Monitor </strong></dt>
    <dd> Samples data from DUT via virtual interface </dd>
            <dt><strong> Scoreboard </strong></dt>
    <dd> Compares output to golden model  </dd>
        <dt><strong> Agent </strong></dt>
    <dd> Encapsulates Driver, Monitor and Sequencer </dd>
    <dd> Connects scroeboard with monitor </dd>
        <dt><strong> Env </strong></dt>
    <dd> Encapsulates Agent, Scoreboard and config </dd>
        <dt><strong> Test </strong></dt>
    <dd> Enacpsulates Env and Sequneces and start the sequence </dd>
    

  </dl>

  <h2 id="directory-structure">Directory Structure</h2>
  <pre>
 ├
 ├── tb.sv
 ├── dff_if.sv
 ├── dff.sv               
 └── waves.vcd
 ├── mypkg.sv
 ├── config.sv
 ├── transaction.sv
 ├── valid_din.sv
 ├── rst_dff.sv
 ├── rand_din_rst.sv
 ├── driver.sv
 ├── monitor.sv
 ├── scoreboard.sv
 ├── agent.sv
 ├── env.sv
 └── test.sv
  </pre>



  <h2 id="running-the-testbench">Running the Testbench</h2>
  <p>The code was run using EDA Playground with synopsys VCS 2023</p>
  <pre><code>
    https://edaplayground.com/x/JSbY
  </code></pre>
  <p>The waves will be dumped to <code>waves.vcd</code>, and you’ll see UVM logs for each transaction and scoreboard check.</p>


</body>
</html>
