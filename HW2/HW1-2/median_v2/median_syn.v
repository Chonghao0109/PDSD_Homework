/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Apr 27 14:36:15 2024
/////////////////////////////////////////////////////////////


module median ( a0, a1, a2, out );
  input [7:0] a0;
  input [7:0] a1;
  input [7:0] a2;
  output [7:0] out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  AO22X1 U1 ( .A0(n1), .A1(a0[7]), .B0(a1[7]), .B1(a2[7]), .Y(out[7]) );
  OAI222XL U2 ( .A0(n2), .A1(n3), .B0(n4), .B1(n5), .C0(n6), .C1(n7), .Y(
        out[6]) );
  CLKINVX1 U3 ( .A(a1[6]), .Y(n7) );
  CLKINVX1 U4 ( .A(a0[6]), .Y(n6) );
  OAI31XL U5 ( .A0(n8), .A1(n9), .A2(n10), .B0(n11), .Y(n5) );
  OAI221XL U6 ( .A0(n12), .A1(n13), .B0(n14), .B1(n15), .C0(n16), .Y(out[5])
         );
  OAI211X1 U7 ( .A0(n9), .A1(n8), .B0(n17), .C0(n10), .Y(n16) );
  CLKINVX1 U8 ( .A(a1[5]), .Y(n15) );
  CLKINVX1 U9 ( .A(a0[5]), .Y(n14) );
  OAI221XL U10 ( .A0(n18), .A1(n19), .B0(n20), .B1(n21), .C0(n22), .Y(out[4])
         );
  OAI211X1 U11 ( .A0(n23), .A1(n9), .B0(n24), .C0(n25), .Y(n22) );
  CLKINVX1 U12 ( .A(a1[4]), .Y(n21) );
  CLKINVX1 U13 ( .A(a0[4]), .Y(n20) );
  OAI221XL U14 ( .A0(n26), .A1(n27), .B0(n28), .B1(n29), .C0(n30), .Y(out[3])
         );
  OAI211X1 U15 ( .A0(n24), .A1(n25), .B0(n9), .C0(n23), .Y(n30) );
  OR2X1 U16 ( .A(n31), .B(n32), .Y(n9) );
  CLKINVX1 U17 ( .A(a1[3]), .Y(n29) );
  CLKINVX1 U18 ( .A(a0[3]), .Y(n28) );
  OAI221XL U19 ( .A0(n33), .A1(n34), .B0(n35), .B1(n36), .C0(n37), .Y(out[2])
         );
  OAI211X1 U20 ( .A0(n8), .A1(n25), .B0(n31), .C0(n32), .Y(n37) );
  NAND2BX1 U21 ( .AN(n38), .B(n39), .Y(n32) );
  CLKINVX1 U22 ( .A(a1[2]), .Y(n36) );
  CLKINVX1 U23 ( .A(a0[2]), .Y(n35) );
  OAI222XL U24 ( .A0(n40), .A1(n41), .B0(n39), .B1(n42), .C0(n43), .C1(n44), 
        .Y(out[1]) );
  CLKINVX1 U25 ( .A(a1[1]), .Y(n44) );
  CLKINVX1 U26 ( .A(a0[1]), .Y(n43) );
  OAI31XL U27 ( .A0(n25), .A1(n31), .A2(n8), .B0(n38), .Y(n42) );
  NAND2X1 U28 ( .A(n45), .B(n46), .Y(n38) );
  OR2X1 U29 ( .A(n23), .B(n24), .Y(n8) );
  NAND2X1 U30 ( .A(n18), .B(n19), .Y(n24) );
  CLKINVX1 U31 ( .A(a2[4]), .Y(n19) );
  NOR2X1 U32 ( .A(a1[4]), .B(a0[4]), .Y(n18) );
  NAND2X1 U33 ( .A(n26), .B(n27), .Y(n23) );
  CLKINVX1 U34 ( .A(a2[3]), .Y(n27) );
  NOR2X1 U35 ( .A(a1[3]), .B(a0[3]), .Y(n26) );
  NAND2X1 U36 ( .A(n33), .B(n34), .Y(n31) );
  CLKINVX1 U37 ( .A(a2[2]), .Y(n34) );
  NOR2X1 U38 ( .A(a1[2]), .B(a0[2]), .Y(n33) );
  OR2X1 U39 ( .A(n10), .B(n17), .Y(n25) );
  NAND2BX1 U40 ( .AN(n11), .B(n4), .Y(n17) );
  NOR2X1 U41 ( .A(n1), .B(a0[7]), .Y(n4) );
  OR2X1 U42 ( .A(a2[7]), .B(a1[7]), .Y(n1) );
  NAND2X1 U43 ( .A(n2), .B(n3), .Y(n11) );
  CLKINVX1 U44 ( .A(a2[6]), .Y(n3) );
  NOR2X1 U45 ( .A(a1[6]), .B(a0[6]), .Y(n2) );
  NAND2X1 U46 ( .A(n12), .B(n13), .Y(n10) );
  CLKINVX1 U47 ( .A(a2[5]), .Y(n13) );
  NOR2X1 U48 ( .A(a1[5]), .B(a0[5]), .Y(n12) );
  NOR2BX1 U49 ( .AN(n40), .B(a2[1]), .Y(n39) );
  CLKINVX1 U50 ( .A(a2[1]), .Y(n41) );
  NOR2X1 U51 ( .A(a1[1]), .B(a0[1]), .Y(n40) );
  OAI2BB2XL U52 ( .B0(n45), .B1(n46), .A0N(a1[0]), .A1N(a2[0]), .Y(out[0]) );
  CLKINVX1 U53 ( .A(a0[0]), .Y(n46) );
  NOR2X1 U54 ( .A(a2[0]), .B(a1[0]), .Y(n45) );
endmodule

