/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Apr 27 11:32:52 2024
/////////////////////////////////////////////////////////////


module adder ( a, b, mode, sum, c_out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input mode;
  output c_out;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55;

  INVX8 U10 ( .A(mode), .Y(n21) );
  NAND2X1 U11 ( .A(mode), .B(n19), .Y(n20) );
  CLKINVX1 U12 ( .A(a[0]), .Y(n19) );
  CLKINVX1 U13 ( .A(n21), .Y(n2) );
  INVX3 U14 ( .A(n2), .Y(n3) );
  OR2X2 U15 ( .A(n48), .B(n12), .Y(n23) );
  BUFX8 U16 ( .A(n30), .Y(n4) );
  CLKINVX1 U17 ( .A(n23), .Y(n11) );
  AND4X4 U18 ( .A(n40), .B(n37), .C(n23), .D(n41), .Y(n26) );
  XOR2X4 U19 ( .A(n21), .B(b[6]), .Y(n24) );
  XOR2X2 U20 ( .A(n21), .B(b[0]), .Y(n29) );
  XOR2X4 U21 ( .A(n21), .B(b[5]), .Y(n9) );
  NAND2X1 U22 ( .A(a[6]), .B(n24), .Y(n52) );
  INVXL U23 ( .A(n24), .Y(n50) );
  INVX1 U24 ( .A(n18), .Y(n33) );
  OAI2BB1XL U25 ( .A0N(n49), .A1N(n48), .B0(n47), .Y(n53) );
  AND2XL U26 ( .A(n35), .B(n34), .Y(n5) );
  XOR3XL U27 ( .A(a[1]), .B(n4), .C(n31), .Y(sum[1]) );
  XNOR3XL U28 ( .A(a[5]), .B(n46), .C(n49), .Y(sum[5]) );
  XOR3X1 U29 ( .A(a[7]), .B(n51), .C(n55), .Y(sum[7]) );
  XOR3XL U30 ( .A(a[2]), .B(n33), .C(n32), .Y(sum[2]) );
  NAND2X1 U31 ( .A(n47), .B(n52), .Y(n12) );
  CLKINVX1 U32 ( .A(n9), .Y(n46) );
  CLKINVX1 U33 ( .A(n17), .Y(n36) );
  CLKINVX1 U34 ( .A(n14), .Y(n39) );
  CLKINVX1 U35 ( .A(n42), .Y(n13) );
  OAI31XL U36 ( .A0(n45), .A1(n44), .A2(n43), .B0(n42), .Y(n49) );
  CLKINVX1 U37 ( .A(n41), .Y(n43) );
  CLKINVX1 U38 ( .A(n37), .Y(n45) );
  XOR2X1 U39 ( .A(n21), .B(b[1]), .Y(n30) );
  XOR2X1 U40 ( .A(n3), .B(b[7]), .Y(n51) );
  XOR2X1 U41 ( .A(n21), .B(b[2]), .Y(n18) );
  XOR2X1 U42 ( .A(n21), .B(b[3]), .Y(n17) );
  XOR2X1 U43 ( .A(n21), .B(b[4]), .Y(n14) );
  NAND2X1 U44 ( .A(a[4]), .B(n14), .Y(n42) );
  NAND2X1 U45 ( .A(a[5]), .B(n9), .Y(n47) );
  NAND2X1 U46 ( .A(a[2]), .B(n18), .Y(n35) );
  NAND2X1 U47 ( .A(n36), .B(n16), .Y(n37) );
  CLKINVX1 U48 ( .A(a[3]), .Y(n16) );
  NAND2X1 U49 ( .A(n39), .B(n15), .Y(n41) );
  CLKINVX1 U50 ( .A(a[4]), .Y(n15) );
  NAND2X1 U51 ( .A(n46), .B(n10), .Y(n48) );
  CLKINVX1 U52 ( .A(a[5]), .Y(n10) );
  NAND2X1 U53 ( .A(n50), .B(n25), .Y(n54) );
  CLKINVX1 U54 ( .A(a[6]), .Y(n25) );
  NOR2X6 U55 ( .A(n6), .B(n7), .Y(n32) );
  OA21X4 U56 ( .A0(a[1]), .A1(n4), .B0(n31), .Y(n6) );
  AND2X2 U57 ( .A(a[1]), .B(n4), .Y(n7) );
  AND2X2 U58 ( .A(a[3]), .B(n17), .Y(n8) );
  CLKINVX1 U59 ( .A(a[2]), .Y(n22) );
  XNOR3X1 U60 ( .A(a[0]), .B(mode), .C(n29), .Y(sum[0]) );
  XOR3X1 U61 ( .A(a[3]), .B(n36), .C(n5), .Y(sum[3]) );
  XOR3X1 U62 ( .A(a[4]), .B(n39), .C(n38), .Y(sum[4]) );
  AOI2BB1X1 U63 ( .A0N(n45), .A1N(n5), .B0(n8), .Y(n38) );
  XNOR3X1 U64 ( .A(a[6]), .B(n50), .C(n53), .Y(sum[6]) );
  OAI2BB1X1 U65 ( .A0N(n54), .A1N(n53), .B0(n52), .Y(n55) );
  CLKINVX1 U66 ( .A(n40), .Y(n44) );
  NAND3BX4 U67 ( .AN(n8), .B(n35), .C(n34), .Y(n40) );
  OAI2BB1X2 U68 ( .A0N(a[7]), .A1N(n51), .B0(n28), .Y(c_out) );
  AOI2BB1X2 U69 ( .A0N(n13), .A1N(n12), .B0(n11), .Y(n27) );
  AO22X4 U70 ( .A0(a[0]), .A1(n3), .B0(n29), .B1(n20), .Y(n31) );
  AO21X4 U71 ( .A0(n33), .A1(n22), .B0(n32), .Y(n34) );
  OAI221X2 U72 ( .A0(a[7]), .A1(n51), .B0(n27), .B1(n26), .C0(n54), .Y(n28) );
endmodule

