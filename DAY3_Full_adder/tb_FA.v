
module tb_fa;

  // Declare test bench variables
  reg a_in, b_in, c_in;
  wire sum, carry;

  // Instantiate the full adder module
  FA uut (
    .a_in(a_in), 
    .b_in(b_in), 
    .c_in(c_in), 
    .sum(sum), 
    .carry(carry)
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
