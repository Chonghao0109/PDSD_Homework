/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Apr 27 11:21:53 2024
/////////////////////////////////////////////////////////////


module adder ( a, b, mode, sum, c_out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input mode;
  output c_out;
  wire   \fa_u1/cout2 , \fa_u1/cout1 , \fa_u1/s2 , \fa_u1/s1 , \fa_u1/CIN ,
         \fa_u1/ha_u2/n1 , \fa_u8/cout2 , \fa_u8/cout1 , \fa_u8/s2 ,
         \fa_u8/s1 , \fa_u7/cout2 , \fa_u7/cout1 , \fa_u7/s2 , \fa_u7/s1 ,
         \fa_u6/cout2 , \fa_u6/cout1 , \fa_u6/s2 , \fa_u6/s1 , \fa_u5/cout2 ,
         \fa_u5/cout1 , \fa_u5/s2 , \fa_u5/s1 , \fa_u4/cout2 , \fa_u4/cout1 ,
         \fa_u4/s2 , \fa_u4/s1 , \fa_u3/cout2 , \fa_u3/cout1 , \fa_u3/s2 ,
         \fa_u3/s1 , \fa_u2/cout2 , \fa_u2/cout1 , \fa_u2/s2 , \fa_u2/s1 , n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  wire   [7:0] cb;
  wire   [6:0] carry;

  CLKINVX1 \fa_u8/m1/U1  ( .A(carry[6]), .Y(n15) );
  CLKINVX1 \fa_u7/m1/U1  ( .A(carry[5]), .Y(n13) );
  CLKINVX1 \fa_u6/m1/U1  ( .A(carry[4]), .Y(n11) );
  CLKINVX1 \fa_u5/m1/U1  ( .A(carry[3]), .Y(n9) );
  CLKINVX1 \fa_u1/m2/U1  ( .A(\fa_u1/CIN ), .Y(n4) );
  TBUFXL \fa_u1/m1/__tmp300  ( .A(\fa_u1/s1 ), .OE(n4), .Y(sum[0]) );
  TBUFXL \fa_u1/m1/__tmp301  ( .A(\fa_u1/s2 ), .OE(\fa_u1/CIN ), .Y(sum[0]) );
  TBUFXL \fa_u8/m1/__tmp300  ( .A(\fa_u8/s1 ), .OE(n15), .Y(sum[7]) );
  TBUFXL \fa_u7/m1/__tmp300  ( .A(\fa_u7/s1 ), .OE(n13), .Y(sum[6]) );
  TBUFXL \fa_u6/m1/__tmp300  ( .A(\fa_u6/s1 ), .OE(n11), .Y(sum[5]) );
  TBUFXL \fa_u5/m1/__tmp300  ( .A(\fa_u5/s1 ), .OE(n9), .Y(sum[4]) );
  TBUFXL \fa_u4/m1/__tmp300  ( .A(\fa_u4/s1 ), .OE(n8), .Y(sum[3]) );
  TBUFXL \fa_u3/m1/__tmp300  ( .A(\fa_u3/s1 ), .OE(n6), .Y(sum[2]) );
  TBUFXL \fa_u2/m1/__tmp300  ( .A(\fa_u2/s1 ), .OE(n5), .Y(sum[1]) );
  TBUFXL \fa_u8/m1/__tmp301  ( .A(\fa_u8/s2 ), .OE(carry[6]), .Y(sum[7]) );
  TBUFXL \fa_u7/m1/__tmp301  ( .A(\fa_u7/s2 ), .OE(carry[5]), .Y(sum[6]) );
  TBUFXL \fa_u6/m1/__tmp301  ( .A(\fa_u6/s2 ), .OE(carry[4]), .Y(sum[5]) );
  TBUFXL \fa_u5/m1/__tmp301  ( .A(\fa_u5/s2 ), .OE(carry[3]), .Y(sum[4]) );
  TBUFXL \fa_u4/m1/__tmp301  ( .A(\fa_u4/s2 ), .OE(carry[2]), .Y(sum[3]) );
  TBUFXL \fa_u3/m1/__tmp301  ( .A(\fa_u3/s2 ), .OE(carry[1]), .Y(sum[2]) );
  TBUFXL \fa_u2/m1/__tmp301  ( .A(\fa_u2/s2 ), .OE(carry[0]), .Y(sum[1]) );
  TBUFX2 \fa_u8/m2/__tmp301  ( .A(\fa_u8/cout2 ), .OE(carry[6]), .Y(c_out) );
  TBUFX3 \fa_u8/m2/__tmp300  ( .A(\fa_u8/cout1 ), .OE(n16), .Y(c_out) );
  TBUFX16 \fa_u6/m2/__tmp300  ( .A(\fa_u6/cout1 ), .OE(n12), .Y(carry[5]) );
  TBUFX16 \fa_u5/m2/__tmp300  ( .A(\fa_u5/cout1 ), .OE(n10), .Y(carry[4]) );
  TBUFX16 \fa_u4/m2/__tmp300  ( .A(\fa_u4/cout1 ), .OE(n8), .Y(carry[3]) );
  TBUFX4 \fa_u2/m2/__tmp301  ( .A(\fa_u2/cout2 ), .OE(carry[0]), .Y(carry[1])
         );
  TBUFX16 \fa_u7/m2/__tmp300  ( .A(\fa_u7/cout1 ), .OE(n14), .Y(carry[6]) );
  TBUFX6 \fa_u2/m2/__tmp300  ( .A(\fa_u2/cout1 ), .OE(n5), .Y(carry[1]) );
  TBUFX6 \fa_u1/m2/__tmp300  ( .A(\fa_u1/cout1 ), .OE(n4), .Y(carry[0]) );
  TBUFX3 \fa_u1/m2/__tmp301  ( .A(\fa_u1/cout2 ), .OE(\fa_u1/CIN ), .Y(
        carry[0]) );
  TBUFX4 \fa_u4/m2/__tmp301  ( .A(\fa_u4/cout2 ), .OE(carry[2]), .Y(carry[3])
         );
  TBUFX4 \fa_u3/m2/__tmp301  ( .A(\fa_u3/cout2 ), .OE(carry[1]), .Y(carry[2])
         );
  TBUFX16 \fa_u3/m2/__tmp300  ( .A(\fa_u3/cout1 ), .OE(n7), .Y(carry[2]) );
  TBUFX6 \fa_u6/m2/__tmp301  ( .A(\fa_u6/cout2 ), .OE(carry[4]), .Y(carry[5])
         );
  TBUFX6 \fa_u7/m2/__tmp301  ( .A(\fa_u7/cout2 ), .OE(carry[5]), .Y(carry[6])
         );
  TBUFX6 \fa_u5/m2/__tmp301  ( .A(\fa_u5/cout2 ), .OE(carry[3]), .Y(carry[4])
         );
  CLKINVX12 U10 ( .A(carry[5]), .Y(n14) );
  AND2X1 U11 ( .A(n2), .B(a[2]), .Y(\fa_u3/cout1 ) );
  CLKINVX8 U12 ( .A(carry[0]), .Y(n5) );
  CLKINVX3 U13 ( .A(carry[1]), .Y(n7) );
  XNOR2XL U14 ( .A(a[1]), .B(cb[1]), .Y(\fa_u2/s2 ) );
  OR2X2 U15 ( .A(cb[1]), .B(a[1]), .Y(\fa_u2/cout2 ) );
  AND2X6 U16 ( .A(cb[1]), .B(a[1]), .Y(\fa_u2/cout1 ) );
  AND2X8 U17 ( .A(cb[0]), .B(a[0]), .Y(\fa_u1/cout1 ) );
  XOR2XL U18 ( .A(a[0]), .B(n3), .Y(\fa_u1/s2 ) );
  NAND2X6 U19 ( .A(n3), .B(\fa_u1/ha_u2/n1 ), .Y(\fa_u1/cout2 ) );
  XNOR2X4 U20 ( .A(\fa_u1/CIN ), .B(b[0]), .Y(n3) );
  CLKBUFX3 U21 ( .A(cb[2]), .Y(n2) );
  INVX3 U22 ( .A(carry[3]), .Y(n10) );
  OR2X1 U23 ( .A(n2), .B(a[2]), .Y(\fa_u3/cout2 ) );
  OR2X1 U24 ( .A(cb[6]), .B(a[6]), .Y(\fa_u7/cout2 ) );
  OR2X1 U25 ( .A(cb[4]), .B(a[4]), .Y(\fa_u5/cout2 ) );
  XNOR2X2 U26 ( .A(mode), .B(b[0]), .Y(cb[0]) );
  OR2X1 U27 ( .A(cb[3]), .B(a[3]), .Y(\fa_u4/cout2 ) );
  OR2X1 U28 ( .A(cb[5]), .B(a[5]), .Y(\fa_u6/cout2 ) );
  OR2X1 U29 ( .A(cb[7]), .B(a[7]), .Y(\fa_u8/cout2 ) );
  XNOR2X1 U30 ( .A(a[2]), .B(n2), .Y(\fa_u3/s2 ) );
  XNOR2X1 U31 ( .A(a[3]), .B(cb[3]), .Y(\fa_u4/s2 ) );
  XNOR2X1 U32 ( .A(a[4]), .B(cb[4]), .Y(\fa_u5/s2 ) );
  XNOR2X1 U33 ( .A(a[5]), .B(cb[5]), .Y(\fa_u6/s2 ) );
  XNOR2X1 U34 ( .A(a[6]), .B(cb[6]), .Y(\fa_u7/s2 ) );
  XNOR2X1 U35 ( .A(a[7]), .B(cb[7]), .Y(\fa_u8/s2 ) );
  INVXL U36 ( .A(carry[1]), .Y(n6) );
  INVX4 U37 ( .A(carry[2]), .Y(n8) );
  INVX3 U38 ( .A(carry[4]), .Y(n12) );
  XOR2X2 U39 ( .A(\fa_u1/CIN ), .B(b[1]), .Y(cb[1]) );
  INVX12 U40 ( .A(mode), .Y(\fa_u1/CIN ) );
  CLKINVX1 U41 ( .A(carry[6]), .Y(n16) );
  AND2XL U42 ( .A(cb[3]), .B(a[3]), .Y(\fa_u4/cout1 ) );
  AND2XL U43 ( .A(cb[4]), .B(a[4]), .Y(\fa_u5/cout1 ) );
  XOR2XL U44 ( .A(cb[1]), .B(a[1]), .Y(\fa_u2/s1 ) );
  XOR2XL U45 ( .A(n2), .B(a[2]), .Y(\fa_u3/s1 ) );
  XOR2XL U46 ( .A(cb[3]), .B(a[3]), .Y(\fa_u4/s1 ) );
  XOR2XL U47 ( .A(cb[4]), .B(a[4]), .Y(\fa_u5/s1 ) );
  XOR2XL U48 ( .A(cb[0]), .B(a[0]), .Y(\fa_u1/s1 ) );
  XOR2X1 U49 ( .A(\fa_u1/CIN ), .B(b[2]), .Y(cb[2]) );
  XOR2X1 U50 ( .A(\fa_u1/CIN ), .B(b[3]), .Y(cb[3]) );
  XOR2X1 U51 ( .A(\fa_u1/CIN ), .B(b[4]), .Y(cb[4]) );
  XOR2X1 U52 ( .A(\fa_u1/CIN ), .B(b[5]), .Y(cb[5]) );
  XOR2X1 U53 ( .A(\fa_u1/CIN ), .B(b[6]), .Y(cb[6]) );
  AND2X2 U54 ( .A(cb[6]), .B(a[6]), .Y(\fa_u7/cout1 ) );
  AND2X2 U55 ( .A(cb[5]), .B(a[5]), .Y(\fa_u6/cout1 ) );
  XOR2X1 U56 ( .A(\fa_u1/CIN ), .B(b[7]), .Y(cb[7]) );
  AND2X2 U57 ( .A(cb[7]), .B(a[7]), .Y(\fa_u8/cout1 ) );
  XOR2X1 U58 ( .A(cb[5]), .B(a[5]), .Y(\fa_u6/s1 ) );
  XOR2X1 U59 ( .A(cb[6]), .B(a[6]), .Y(\fa_u7/s1 ) );
  XOR2X1 U60 ( .A(cb[7]), .B(a[7]), .Y(\fa_u8/s1 ) );
  CLKINVX1 U61 ( .A(a[0]), .Y(\fa_u1/ha_u2/n1 ) );
endmodule

