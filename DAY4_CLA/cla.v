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
