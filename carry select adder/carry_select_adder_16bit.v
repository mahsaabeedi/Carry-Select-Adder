module carry_select_adder_16bit(a, b, cin, sum, cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;
 
wire [2:0] c;
 
ripple_carry_4_bit rca1(
.a(a[3:0]),
.b(b[3:0]),
.cin(cin),
.sum(sum[3:0]),
.cout(c[0]));
 
// first 4-bit by ripple_carry_adder
carry_select_adder_4bit_slice csa_slice1(
.a(a[7:4]),
.b(b[7:4]),
.cin(c[0]),
.sum(sum[7:4]),
.cout(c[1]));
 
carry_select_adder_4bit_slice csa_slice2(
.a(a[11:8]),
.b(b[11:8]),
.cin(c[1]),
.sum(sum[11:8]), 
.cout(c[2]));
 
carry_select_adder_4bit_slice csa_slice3(
.a(a[15:12]),
.b(b[15:12]),
.cin(c[2]),
.sum(sum[15:12]),
.cout(cout));
endmodule