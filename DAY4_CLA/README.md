# Carry Lookahead Adder (CLA) Implementation in Verilog

## Overview

## Files

- `cla.v`: Verilog code for the 4-bit Carry Lookahead Adder.
- `tb_cla.v`: Testbench for the CLA module to verify its correctness.

## Carry Lookahead Adder (CLA)

### Description

The Carry Lookahead Adder (CLA) computes the sum of two 4-bit binary numbers with reduced delay compared to the Ripple Carry Adder (RCA). The CLA achieves this by calculating the carry signals in advance based on the generate and propagate signals for each bit.

### Module: cla.v

#### Ports

- `input [3:0] a, b`: 4-bit input operands.
- `input cin`: Carry-in input.
- `output [3:0] sum`: 4-bit sum output.
- `output carry`: Carry-out output.

#### Logic

The CLA module computes the sum and carry as follows:
1. Calculate the intermediate carry signals using generate and propagate logic.
2. Compute the sum bits using XOR operation on the input bits and the carry bits.

### Testbench: tb_cla.v

The testbench applies a set of test vectors to the CLA module and verifies its functionality. The test vectors include various combinations of input operands and carry-in values.

## Advantages and Disadvantages of CLA

### Advantages
1. **Speed**: Reduces propagation delay compared to Ripple Carry Adders.
2. **Scalability**: More scalable for larger bit-widths.
3. **Efficiency in Parallel Computation**: Suitable for high-performance computing.

### Disadvantages
1. **Complexity**: More complex to design and understand.
2. **Area and Power Consumption**: Increases silicon area and power consumption.
3. **Fan-Out**: Higher fan-out requires more robust buffering.
---


## Verilog Code
---
    module cla(
        input [3:0] a, b,
        input cin,
        output [3:0] sum,
        output carry
      );
                wire cout0, cout1, cout2, cout3;

                assign cout0 = (a[0] & b[0]) | ((a[0] ^ b[0]) & cin);
                assign cout1 = (a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & cin)));
                assign cout2 = (a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & cin)))));
                assign carry = (a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & cin)))))));

          assign sum = a ^ b ^ {cout2, cout1, cout0, cin};
    endmodule

---

## TestBench
---
      module tb_cla;
          // Testbench signals
          reg [3:0] a, b;
          reg cin;
          wire [3:0] sum;
          wire carry;
      
          // Instantiate the CLA module
          cla uut (
              .a(a),
              .b(b),
              .cin(cin),
              .sum(sum),
              .carry(carry)
          );
      
          // Test vectors and simulation
          initial begin
              // Display the results in a readable format
              $monitor("Time = %0t | a = %b | b = %b | cin = %b | sum = %b | carry = %b", 
                       $time, a, b, cin, sum, carry);
      
              // Test case 1
              a = 4'b0000; b = 4'b0000; cin = 1'b0;
              #10;
      
              // Test case 2
              a = 4'b0101; b = 4'b0011; cin = 1'b0;
              #10;
      
              // Test case 3
              a = 4'b1111; b = 4'b0001; cin = 1'b1;
              #10;
      
              // Test case 4
              a = 4'b1010; b = 4'b0101; cin = 1'b1;
              #10;
      
              // Test case 5
              a = 4'b1100; b = 4'b1100; cin = 1'b0;
              #10;
      
              // Test case 6
              a = 4'b0110; b = 4'b1001; cin = 1'b1;
              #10;
      
              // End the simulation
              $finish;
      	end
          initial begin
           $dumpfile("cla.vcd");
           $dumpvars(0,tb_cla);
          end
       
      endmodule

![cla_waveform](https://github.com/user-attachments/assets/3bc44bd4-b950-455e-8a1a-ff71d4b948ae)

---

## synthesizing the half_adder design using Yosys!

Step-by-Step Yosys Flow

1.Start Yosys

    yosys

2.Read the liberty library

    read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

3.Read the Verilog code

    read_verilog cla.v

4.Synthesize the design

    synth -top FA  

5.Technology mapping

    abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

6.Visualize the gate-level netlist

    show

![cla yosys_show](https://github.com/user-attachments/assets/ae6b7f71-64f7-46f2-915e-b28d95066e01)

---


