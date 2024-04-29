/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Apr 27 11:16:29 2024
/////////////////////////////////////////////////////////////


module adder ( a, b, mode, sum, c_out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input mode;
  output c_out;
  wire   \fa_u1/w1 , \fa_u1/Cin , \fa_u8/w1 , \fa_u7/w1 , \fa_u6/w1 ,
         \fa_u5/w1 , \fa_u4/w1 , \fa_u3/w1 , \fa_u2/w1 , n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17;
  wire   [7:0] cb;
  wire   [6:0] carry;

  XOR2X1 U10 ( .A(\fa_u1/Cin ), .B(\fa_u1/w1 ), .Y(sum[0]) );
  XOR2X1 U11 ( .A(carry[0]), .B(\fa_u2/w1 ), .Y(sum[1]) );
  XOR2X1 U12 ( .A(carry[1]), .B(\fa_u3/w1 ), .Y(sum[2]) );
  XOR2X1 U13 ( .A(carry[2]), .B(\fa_u4/w1 ), .Y(sum[3]) );
  XOR2X1 U14 ( .A(carry[3]), .B(\fa_u5/w1 ), .Y(sum[4]) );
  XOR2X1 U15 ( .A(carry[4]), .B(\fa_u6/w1 ), .Y(sum[5]) );
  XOR2X1 U16 ( .A(carry[5]), .B(\fa_u7/w1 ), .Y(sum[6]) );
  XOR2X1 U17 ( .A(carry[6]), .B(\fa_u8/w1 ), .Y(sum[7]) );
  XOR2X1 U18 ( .A(cb[0]), .B(a[0]), .Y(\fa_u1/w1 ) );
  XOR2X1 U19 ( .A(\fa_u1/Cin ), .B(b[0]), .Y(cb[0]) );
  INVX3 U20 ( .A(mode), .Y(\fa_u1/Cin ) );
  NAND2X1 U21 ( .A(n2), .B(n3), .Y(carry[0]) );
  NAND2X1 U22 ( .A(cb[0]), .B(a[0]), .Y(n2) );
  NAND2X1 U23 ( .A(\fa_u1/Cin ), .B(\fa_u1/w1 ), .Y(n3) );
  NAND2X1 U24 ( .A(n4), .B(n5), .Y(carry[1]) );
  NAND2X1 U25 ( .A(cb[1]), .B(a[1]), .Y(n4) );
  NAND2X1 U26 ( .A(carry[0]), .B(\fa_u2/w1 ), .Y(n5) );
  NAND2X1 U27 ( .A(n6), .B(n7), .Y(carry[2]) );
  NAND2X1 U28 ( .A(cb[2]), .B(a[2]), .Y(n6) );
  NAND2X1 U29 ( .A(carry[1]), .B(\fa_u3/w1 ), .Y(n7) );
  NAND2X1 U30 ( .A(n8), .B(n9), .Y(carry[3]) );
  NAND2X1 U31 ( .A(cb[3]), .B(a[3]), .Y(n8) );
  NAND2X1 U32 ( .A(carry[2]), .B(\fa_u4/w1 ), .Y(n9) );
  NAND2X1 U33 ( .A(n10), .B(n11), .Y(carry[4]) );
  NAND2X1 U34 ( .A(cb[4]), .B(a[4]), .Y(n10) );
  NAND2X1 U35 ( .A(carry[3]), .B(\fa_u5/w1 ), .Y(n11) );
  NAND2X1 U36 ( .A(n12), .B(n13), .Y(carry[5]) );
  NAND2X1 U37 ( .A(cb[5]), .B(a[5]), .Y(n12) );
  NAND2X1 U38 ( .A(carry[4]), .B(\fa_u6/w1 ), .Y(n13) );
  NAND2X1 U39 ( .A(n14), .B(n15), .Y(carry[6]) );
  NAND2X1 U40 ( .A(cb[6]), .B(a[6]), .Y(n14) );
  NAND2X1 U41 ( .A(carry[5]), .B(\fa_u7/w1 ), .Y(n15) );
  NAND2X1 U42 ( .A(n16), .B(n17), .Y(c_out) );
  NAND2X1 U43 ( .A(cb[7]), .B(a[7]), .Y(n16) );
  NAND2X1 U44 ( .A(carry[6]), .B(\fa_u8/w1 ), .Y(n17) );
  XOR2X1 U45 ( .A(cb[1]), .B(a[1]), .Y(\fa_u2/w1 ) );
  XOR2X1 U46 ( .A(cb[2]), .B(a[2]), .Y(\fa_u3/w1 ) );
  XOR2X1 U47 ( .A(cb[3]), .B(a[3]), .Y(\fa_u4/w1 ) );
  XOR2X1 U48 ( .A(\fa_u1/Cin ), .B(b[1]), .Y(cb[1]) );
  XOR2X1 U49 ( .A(\fa_u1/Cin ), .B(b[2]), .Y(cb[2]) );
  XOR2X1 U50 ( .A(\fa_u1/Cin ), .B(b[3]), .Y(cb[3]) );
  XOR2X1 U51 ( .A(cb[4]), .B(a[4]), .Y(\fa_u5/w1 ) );
  XOR2X1 U52 ( .A(cb[5]), .B(a[5]), .Y(\fa_u6/w1 ) );
  XOR2X1 U53 ( .A(cb[6]), .B(a[6]), .Y(\fa_u7/w1 ) );
  XOR2X1 U54 ( .A(\fa_u1/Cin ), .B(b[4]), .Y(cb[4]) );
  XOR2X1 U55 ( .A(\fa_u1/Cin ), .B(b[5]), .Y(cb[5]) );
  XOR2X1 U56 ( .A(\fa_u1/Cin ), .B(b[6]), .Y(cb[6]) );
  XOR2X1 U57 ( .A(cb[7]), .B(a[7]), .Y(\fa_u8/w1 ) );
  XOR2X1 U58 ( .A(\fa_u1/Cin ), .B(b[7]), .Y(cb[7]) );
endmodule

