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
