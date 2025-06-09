
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
