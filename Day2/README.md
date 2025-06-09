
# Half Adder in Verilog


## Overview

The `ha` module implements a Half Adder, a fundamental digital circuit that adds two single-bit binary numbers. It produces a sum and a carry-out output.

## Files

- `ha.v`: Verilog module for the Half Adder.
- `tb_ha.v`: Testbench for the Half Adder module.

## Module Description

### Half Adder (`ha`)

#### Ports

- **Inputs**
  - `a`: Input bit A
  - `b`: Input bit B

- **Outputs**
  - `sum`: Sum of inputs A and B
  - `carry`: Carry-out of the addition

#### Functionality

The Half Adder calculates the sum and carry-out for two single-bit binary inputs. The `sum` is computed using XOR operation, and the `carry` is computed using AND operation.

## Testbench Description

The testbench (`tb_ha`) applies the following combinations of inputs to the `ha` module:

1. `a = 0`, `b = 0`
2. `a = 0`, `b = 1`
3. `a = 1`, `b = 0`
4. `a = 1`, `b = 1`

It displays the values of `sum` and `carry` for each input combination and generates a waveform file for visualization.


a b | sum carry
0 0 | 0   0
0 1 | 1   0
1 0 | 1   0
1 1 | 0   1

---

## Verilog Code

    module ha(input a,b,output sum,carry);
      xor g1(sum,a,b);
      and g2(carry,a,b);
    endmodule

---

## TestBench 

      module tb_ha;

        // Declare test bench variables
      reg a, b;
      wire sum, carry;

      // Instantiate the half adder module
      ha uut (
    .a(a), 
    .b(b), 
    .sum(sum), 
    .carry(carry)
    );

      // Apply stimulus
    initial begin
    a = 1'b0;
    b = 1'b0;
    #10;
    a = 1'b0;
    b = 1'b1;
    #10;
    a = 1'b1;
    b = 1'b0;
    #10;
    a = 1'b1;
    b = 1'b1;
    #10;
    end

      // Finish simulation after 100 time units
    initial begin
    #100 $finish;
    end

      // Dump waveforms for viewing
    initial begin
    $dumpfile("ha.vcd");
    $dumpvars(0,tb_ha);
    end

    endmodule
---

## Simulating the Design

Compile the design and testbench:

    iverilog Half_adder_primitive.v Half_adder_tb.v

Run the simulation:

    ./a.out

View the waveform:

    gtkwave ha.vcd

![half_adder](https://github.com/user-attachments/assets/248bfd78-bbba-4226-89ec-ee1645dbf94e)

---

## synthesizing the half_adder design using Yosys!

Step-by-Step Yosys Flow

1.Start Yosys

    yosys

2.Read the liberty library

    read_liberty -lib ../lib/nangate45_slow.lib

3.Read the Verilog code

    read_verilog Half_adder_primitive.v

4.Synthesize the design

    synth -top ha

5.Technology mapping

    abc -liberty ../lib/nangate45_slow.lib

6.Visualize the gate-level netlist

    show
    
![half_adder_yosys yosys_show](https://github.com/user-attachments/assets/adf64569-cd6b-43a8-a224-2fbff7d8a525)

  
