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
