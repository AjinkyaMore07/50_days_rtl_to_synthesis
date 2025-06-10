module FA(input a_in, b_in, c_in, output sum, carry);
  assign sum = a_in ^ b_in ^ c_in;
  assign carry = (a_in & b_in) | (b_in & c_in) | (a_in & c_in);
endmodule
