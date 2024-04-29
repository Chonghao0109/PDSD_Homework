/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Apr 27 12:00:26 2024
/////////////////////////////////////////////////////////////


module voting ( a0, a1, a2, a3, a4, out );
  input [2:0] a0;
  input [2:0] a1;
  input [2:0] a2;
  input [2:0] a3;
  input [2:0] a4;
  output [2:0] out;
  wire   n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65;

  OAI21X1 U17 ( .A0(n23), .A1(n24), .B0(n25), .Y(out[2]) );
  OAI22X1 U18 ( .A0(n39), .A1(n40), .B0(n46), .B1(n47), .Y(n29) );
  NOR2X1 U19 ( .A(out[2]), .B(n22), .Y(out[1]) );
  NOR2BX1 U20 ( .AN(n22), .B(out[2]), .Y(out[0]) );
  OAI211X1 U21 ( .A0(n26), .A1(n27), .B0(n28), .C0(n29), .Y(n25) );
  CLKINVX1 U22 ( .A(n24), .Y(n27) );
  CLKINVX1 U23 ( .A(n23), .Y(n26) );
  NAND2X1 U24 ( .A(n30), .B(n31), .Y(n24) );
  OAI32X1 U25 ( .A0(n32), .A1(n29), .A2(n28), .B0(n33), .B1(n34), .Y(n23) );
  OAI31XL U26 ( .A0(n35), .A1(n36), .A2(n37), .B0(n38), .Y(n34) );
  XNOR2X1 U27 ( .A(n39), .B(n40), .Y(n38) );
  XNOR2X1 U28 ( .A(n28), .B(n29), .Y(n36) );
  MXI2X1 U29 ( .A(n41), .B(n42), .S0(n22), .Y(n33) );
  AOI2BB1X1 U30 ( .A0N(n43), .A1N(a4[1]), .B0(n44), .Y(n41) );
  AO22X1 U31 ( .A0(n45), .A1(a2[2]), .B0(a1[2]), .B1(a0[2]), .Y(n28) );
  CLKINVX1 U32 ( .A(a4[2]), .Y(n40) );
  XNOR2X1 U33 ( .A(n46), .B(n47), .Y(n39) );
  CLKINVX1 U34 ( .A(a3[2]), .Y(n47) );
  XNOR2X1 U35 ( .A(a2[2]), .B(n45), .Y(n46) );
  XOR2X1 U36 ( .A(a0[2]), .B(a1[2]), .Y(n45) );
  MXI2X1 U37 ( .A(n37), .B(n35), .S0(n22), .Y(n32) );
  AOI2BB1X1 U38 ( .A0N(n48), .A1N(n30), .B0(n49), .Y(n22) );
  AOI221XL U39 ( .A0(n35), .A1(n50), .B0(n30), .B1(n48), .C0(n51), .Y(n49) );
  CLKINVX1 U40 ( .A(n52), .Y(n51) );
  OAI211X1 U41 ( .A0(n50), .A1(n35), .B0(n42), .C0(n53), .Y(n52) );
  XNOR2X1 U42 ( .A(n43), .B(a4[1]), .Y(n53) );
  OA21XL U43 ( .A0(a4[0]), .A1(n54), .B0(n55), .Y(n42) );
  CLKINVX1 U44 ( .A(n37), .Y(n50) );
  XOR2X1 U45 ( .A(n56), .B(n57), .Y(n37) );
  XOR2X1 U46 ( .A(n58), .B(n59), .Y(n35) );
  NAND2X1 U47 ( .A(n57), .B(n56), .Y(n30) );
  AO22X1 U48 ( .A0(n60), .A1(a2[1]), .B0(a1[1]), .B1(a0[1]), .Y(n56) );
  AO21X1 U49 ( .A0(n61), .A1(a3[1]), .B0(n44), .Y(n57) );
  NOR2BX1 U50 ( .AN(a4[1]), .B(n62), .Y(n44) );
  CLKINVX1 U51 ( .A(n43), .Y(n62) );
  XOR2X1 U52 ( .A(n61), .B(a3[1]), .Y(n43) );
  XOR2X1 U53 ( .A(a2[1]), .B(n60), .Y(n61) );
  XOR2X1 U54 ( .A(a0[1]), .B(a1[1]), .Y(n60) );
  CLKINVX1 U55 ( .A(n31), .Y(n48) );
  NAND2X1 U56 ( .A(n59), .B(n58), .Y(n31) );
  AO22X1 U57 ( .A0(n63), .A1(a2[0]), .B0(a1[0]), .B1(a0[0]), .Y(n58) );
  OAI21XL U58 ( .A0(n64), .A1(n65), .B0(n55), .Y(n59) );
  NAND2X1 U59 ( .A(a4[0]), .B(n54), .Y(n55) );
  XNOR2X1 U60 ( .A(n64), .B(a3[0]), .Y(n54) );
  CLKINVX1 U61 ( .A(a3[0]), .Y(n65) );
  XNOR2X1 U62 ( .A(a2[0]), .B(n63), .Y(n64) );
  XOR2X1 U63 ( .A(a0[0]), .B(a1[0]), .Y(n63) );
endmodule

