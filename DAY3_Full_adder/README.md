# Full Adder in Verilog

## Overview

The `Fa` module implements a Full Adder, a fundamental digital circuit that adds three single-bit binary numbers. It produces a sum and a carry-out output.

## Files

- `Fa.v`: Verilog module for the Full Adder.
- `tb_Fa.v`: Testbench for the Full Adder module.

## Module Description

### Full Adder (`Fa`)

#### Ports

- **Inputs**
  - `a_in`: Input bit A
  - `b_in`: Input bit B
  - `c_in`: Carry-in bit

- **Outputs**
  - `sum`: Sum of inputs A, B, and C
  - `carry`: Carry-out of the addition

#### Functionality

The Full Adder calculates the sum and carry-out for three single-bit binary inputs. The `sum` is computed using XOR operation, and the `carry` is computed using AND and OR operations.

## Testbench Description

The testbench (`tb_Fa`) applies the following combinations of inputs to the `Fa` module:

1. `a_in = 0`, `b_in = 0`, `c_in = 0`
2. `a_in = 0`, `b_in = 0`, `c_in = 1`
3. `a_in = 0`, `b_in = 1`, `c_in = 0`
4. `a_in = 0`, `b_in = 1`, `c_in = 1`
5. `a_in = 1`, `b_in = 0`, `c_in = 0`
6. `a_in = 1`, `b_in = 0`, `c_in = 1`
7. `a_in = 1`, `b_in = 1`, `c_in = 0`
8. `a_in = 1`, `b_in = 1`, `c_in = 1`

It displays the values of `sum` and `carry` for each input combination and generates a waveform file for visualization.

![image](https://github.com/user-attachments/assets/3823b3a1-d5f9-4a1d-84d3-9b4926e00b79)


## Verilog Code
---

    module FA(input a_in, b_in, c_in, output sum, carry);
      assign sum = a_in ^ b_in ^ c_in;
      assign carry = (a_in & b_in) | (b_in & c_in) | (a_in & c_in);
    endmodule

--- 

## TestBench
---

    module tb_fa;

        // Declare test bench variables
      reg a_in, b_in, c_in;
      wire sum, carry;

        // Instantiate the full adder module
      Fa uut (
        .a_in(a_in), 
        .b_in(b_in), 
        .c_in(c_in), 
        .sum(sum), 
    .    carry(carry)
    );

      // Apply stimulus
      initial begin
      a_in = 1'b0; b_in = 1'b0; c_in = 1'b0; #10;
      a_in = 1'b0; b_in = 1'b0; c_in = 1'b1; #10;
      a_in = 1'b0; b_in = 1'b1; c_in = 1'b0; #10;
      a_in = 1'b0; b_in = 1'b1; c_in = 1'b1; #10;
      a_in = 1'b1; b_in = 1'b0; c_in = 1'b0; #10;
      a_in = 1'b1; b_in = 1'b0; c_in = 1'b1; #10;
      a_in = 1'b1; b_in = 1'b1; c_in = 1'b0; #10;
      a_in = 1'b1; b_in = 1'b1; c_in = 1'b1; #10;
    end

      // Finish simulation after 100 time units
    initial begin
      #100 $finish;
    end

      // Dump waveforms for viewing
    initial begin
      $dumpfile("fa.vcd");
      $dumpvars(0,tb_fa);
      end

    endmodule

---

## Simulating the Design
---
    
  Compile the design and testbench:

    iverilog FA.v tb_fa.v

Run the simulation:

    ./a.out

View the waveform:

    gtkwave fa.vcd
    
![FA](https://github.com/user-attachments/assets/8b057034-5bdb-4f20-97a1-62e0627185e9)

---
## synthesizing the half_adder design using Yosys!

---

Step-by-Step Yosys Flow

1.Start Yosys

    yosys

2.Read the liberty library

    read_liberty -lib ../lib/nangate45_fast.lib

3.Read the Verilog code

    read_verilog FA.v

4.Synthesize the design

    synth -top FA  

5.Technology mapping

    abc -liberty ../lib/nangate45_fast.lib

6.Visualize the gate-level netlist

    show
    
![Full_Adder yosys_show](https://github.com/user-attachments/assets/c3da3a2c-86ac-4080-972f-e9af26bd9c4b)


