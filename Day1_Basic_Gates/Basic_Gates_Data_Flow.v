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
