# Basic Gates in Verilog

This repository contains a Verilog implementation of basic logic gates and a test bench to verify their functionality.

## Overview

The `Basic_Gates` module implements basic logic gates: NOT, AND, OR, NOR, NAND, XOR, and XNOR. The test bench (`tb_Basic_Gates`) applies different combinations of inputs to the module and displays the corresponding outputs.

## Files

- `Basic_Gates.v`: Verilog module implementing basic logic gates.
- `tb_Basic_Gates.v`: Test bench for the `Basic_Gates` module.

## Module Description

### Basic_Gates

#### Ports

- **Inputs**
  - `a_in`: Input signal A
  - `b_in`: Input signal B

- **Outputs**
  - `not_A`: NOT of input A
  - `not_B`: NOT of input B
  - `and_out`: AND of inputs A and B
  - `or_out`: OR of inputs A and B
  - `nor_out`: NOR of inputs A and B
  - `nand_out`: NAND of inputs A and B
  - `xor_out`: XOR of inputs A and B
  - `xnor_out`: XNOR of inputs A and B

## Test Bench Description

The test bench applies the following combinations of inputs to the `Basic_Gates` module:

1. `a_in = 0`, `b_in = 0`
2. `a_in = 0`, `b_in = 1`
3. `a_in = 1`, `b_in = 0`
4. `a_in = 1`, `b_in = 1`

For each combination, the outputs are displayed in the console.

  ![image](https://github.com/user-attachments/assets/2f76a15b-5e5b-435d-8fcb-8b14b3dd5b5c)

---
## Verilog code
    
    module Basic_Gates(input a_in, b_in, 
                   output not_A, not_B, 
                   output and_out, or_out, 
                   output nor_out, nand_out, 
                   output xor_out, xnor_out);

    // Data flow style using continuous assignments
      assign not_A = ~a_in;
      assign not_B = ~b_in;
      assign and_out = a_in & b_in;
      assign or_out = a_in | b_in;
      assign nor_out = ~(a_in | b_in);
      assign nand_out = ~(a_in & b_in);
      assign xor_out = a_in ^ b_in;
      assign xnor_out = ~(a_in ^ b_in);

    endmodule

---
## TestBench 

    module tb_Basic_Gates;


      reg a_in, b_in;
      wire not_A, not_B, and_out, or_out, nor_out, nand_out, xor_out, xnor_out;


      Basic_Gates uut (
      .a_in(a_in), 
      .b_in(b_in), 
      .not_A(not_A), 
      .not_B(not_B), 
      .and_out(and_out), 
      .or_out(or_out), 
      .nor_out(nor_out), 
      .nand_out(nand_out), 
      .xor_out(xor_out), 
      .xnor_out(xnor_out)
    );


    initial begin
	    a_in = 1'b0 ;
      b_in = 1'b0 ;
      #10;
      a_in = 1'b0 ;
      b_in = 1'b1 ;
      #10;
      a_in = 1'b1 ;
      b_in = 1'b0 ;
      #10;
      a_in = 1'b1 ;
      b_in = 1'b1 ;
      #10;
    end

    initial begin
  	  #100 $finish;
    end
  
        initial begin
          $dumpfile("Basic_Gates.vcd");
          $dumpvars(0,tb_Basic_Gates);
        end
  
    endmodule

---

## Simulating the Design

    Compile the design and testbench:

      iverilog Basic_Gates.v tb_Basic_Gates.v

Run the simulation:

    ./a.out

View the waveform:

    gtkwave Basic_Gates.vcd

![Basic_Gates_waveform](https://github.com/user-attachments/assets/c1fce9d6-0bb5-4c96-88c5-ea43a8545a36)


---

## synthesizing the half_adder design using Yosys!

Step-by-Step Yosys Flow

1.Start Yosys

    yosys

2.Read the liberty library

    read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

3.Read the Verilog code

    read_verilog Basic_Gates_Data_Flow.v

4.Synthesize the design

    synth -top Basic_Gates

5.Technology mapping

    abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

6.Visualize the gate-level netlist

    show

![Basic_Gates yosys_show](https://github.com/user-attachments/assets/2bc8d172-40dc-4096-a366-e2824bc19d16)

