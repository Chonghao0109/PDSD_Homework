/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Apr 27 13:23:03 2024
/////////////////////////////////////////////////////////////


module median ( a0, a1, a2, out );
  input [7:0] a0;
  input [7:0] a1;
  input [7:0] a2;
  output [7:0] out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59;
  wire   [2:0] s;

  TBUFXL \u5_selecter/out_tri3[7]  ( .A(a0[7]), .OE(s[0]), .Y(out[7]) );
  TBUFXL \u5_selecter/out_tri3[6]  ( .A(a0[6]), .OE(s[0]), .Y(out[6]) );
  TBUFXL \u5_selecter/out_tri3[5]  ( .A(a0[5]), .OE(s[0]), .Y(out[5]) );
  TBUFXL \u5_selecter/out_tri3[4]  ( .A(a0[4]), .OE(s[0]), .Y(out[4]) );
  TBUFXL \u5_selecter/out_tri3[3]  ( .A(a0[3]), .OE(s[0]), .Y(out[3]) );
  TBUFXL \u5_selecter/out_tri3[2]  ( .A(a0[2]), .OE(s[0]), .Y(out[2]) );
  TBUFXL \u5_selecter/out_tri3[1]  ( .A(a0[1]), .OE(s[0]), .Y(out[1]) );
  TBUFXL \u5_selecter/out_tri3[0]  ( .A(a0[0]), .OE(s[0]), .Y(out[0]) );
  TBUFXL \u5_selecter/out_tri[7]  ( .A(a2[7]), .OE(s[2]), .Y(out[7]) );
  TBUFXL \u5_selecter/out_tri[6]  ( .A(a2[6]), .OE(s[2]), .Y(out[6]) );
  TBUFXL \u5_selecter/out_tri[5]  ( .A(a2[5]), .OE(s[2]), .Y(out[5]) );
  TBUFXL \u5_selecter/out_tri[4]  ( .A(a2[4]), .OE(s[2]), .Y(out[4]) );
  TBUFXL \u5_selecter/out_tri[3]  ( .A(a2[3]), .OE(s[2]), .Y(out[3]) );
  TBUFXL \u5_selecter/out_tri[2]  ( .A(a2[2]), .OE(s[2]), .Y(out[2]) );
  TBUFXL \u5_selecter/out_tri[1]  ( .A(a2[1]), .OE(s[2]), .Y(out[1]) );
  TBUFXL \u5_selecter/out_tri[0]  ( .A(a2[0]), .OE(s[2]), .Y(out[0]) );
  TBUFXL \u5_selecter/out_tri2[7]  ( .A(a1[7]), .OE(s[1]), .Y(out[7]) );
  TBUFXL \u5_selecter/out_tri2[6]  ( .A(a1[6]), .OE(s[1]), .Y(out[6]) );
  TBUFXL \u5_selecter/out_tri2[5]  ( .A(a1[5]), .OE(s[1]), .Y(out[5]) );
  TBUFXL \u5_selecter/out_tri2[4]  ( .A(a1[4]), .OE(s[1]), .Y(out[4]) );
  TBUFXL \u5_selecter/out_tri2[3]  ( .A(a1[3]), .OE(s[1]), .Y(out[3]) );
  TBUFXL \u5_selecter/out_tri2[2]  ( .A(a1[2]), .OE(s[1]), .Y(out[2]) );
  TBUFXL \u5_selecter/out_tri2[1]  ( .A(a1[1]), .OE(s[1]), .Y(out[1]) );
  TBUFXL \u5_selecter/out_tri2[0]  ( .A(a1[0]), .OE(s[1]), .Y(out[0]) );
  OAI22X2 U1 ( .A0(n6), .A1(n4), .B0(n1), .B1(n5), .Y(s[0]) );
  OAI22X2 U2 ( .A0(n1), .A1(n2), .B0(n3), .B1(n4), .Y(s[2]) );
  OAI22X2 U3 ( .A0(n2), .A1(n5), .B0(n6), .B1(n3), .Y(s[1]) );
  NOR2BX1 U4 ( .AN(n7), .B(n2), .Y(n3) );
  OAI21XL U5 ( .A0(a1[0]), .A1(n8), .B0(n9), .Y(n7) );
  NAND4X1 U6 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(n2) );
  AOI33X1 U7 ( .A0(n9), .A1(n8), .A2(a1[0]), .B0(n14), .B1(n15), .B2(a1[1]), 
        .Y(n13) );
  OA21XL U8 ( .A0(a1[1]), .A1(n15), .B0(n14), .Y(n9) );
  OA21XL U9 ( .A0(a1[2]), .A1(n16), .B0(n17), .Y(n14) );
  AOI33X1 U10 ( .A0(n17), .A1(n16), .A2(a1[2]), .B0(n18), .B1(n19), .B2(a1[3]), 
        .Y(n12) );
  OA21XL U11 ( .A0(a1[3]), .A1(n19), .B0(n18), .Y(n17) );
  OA21XL U12 ( .A0(a1[4]), .A1(n20), .B0(n21), .Y(n18) );
  AOI33X1 U13 ( .A0(n21), .A1(n20), .A2(a1[4]), .B0(n22), .B1(n23), .B2(a1[5]), 
        .Y(n11) );
  OA21XL U14 ( .A0(a1[5]), .A1(n23), .B0(n22), .Y(n21) );
  OA21XL U15 ( .A0(a1[6]), .A1(n24), .B0(n25), .Y(n22) );
  AOI32X1 U16 ( .A0(n25), .A1(n24), .A2(a1[6]), .B0(a1[7]), .B1(n26), .Y(n10)
         );
  NAND2X1 U17 ( .A(a2[7]), .B(n27), .Y(n25) );
  NOR2BX1 U18 ( .AN(n28), .B(n4), .Y(n1) );
  OAI21XL U19 ( .A0(a0[0]), .A1(n8), .B0(n29), .Y(n28) );
  NAND4X1 U20 ( .A(n30), .B(n31), .C(n32), .D(n33), .Y(n4) );
  AOI33X1 U21 ( .A0(n29), .A1(n8), .A2(a0[0]), .B0(n34), .B1(n15), .B2(a0[1]), 
        .Y(n33) );
  CLKINVX1 U22 ( .A(a2[0]), .Y(n8) );
  OA21XL U23 ( .A0(a0[1]), .A1(n15), .B0(n34), .Y(n29) );
  OA21XL U24 ( .A0(a0[2]), .A1(n16), .B0(n35), .Y(n34) );
  CLKINVX1 U25 ( .A(a2[1]), .Y(n15) );
  AOI33X1 U26 ( .A0(n35), .A1(n16), .A2(a0[2]), .B0(n36), .B1(n19), .B2(a0[3]), 
        .Y(n32) );
  CLKINVX1 U27 ( .A(a2[2]), .Y(n16) );
  OA21XL U28 ( .A0(a0[3]), .A1(n19), .B0(n36), .Y(n35) );
  OA21XL U29 ( .A0(a0[4]), .A1(n20), .B0(n37), .Y(n36) );
  CLKINVX1 U30 ( .A(a2[3]), .Y(n19) );
  AOI33X1 U31 ( .A0(n37), .A1(n20), .A2(a0[4]), .B0(n38), .B1(n23), .B2(a0[5]), 
        .Y(n31) );
  CLKINVX1 U32 ( .A(a2[4]), .Y(n20) );
  OA21XL U33 ( .A0(a0[5]), .A1(n23), .B0(n38), .Y(n37) );
  OA21XL U34 ( .A0(a0[6]), .A1(n24), .B0(n39), .Y(n38) );
  CLKINVX1 U35 ( .A(a2[5]), .Y(n23) );
  AOI32X1 U36 ( .A0(n39), .A1(n24), .A2(a0[6]), .B0(a0[7]), .B1(n26), .Y(n30)
         );
  CLKINVX1 U37 ( .A(a2[7]), .Y(n26) );
  CLKINVX1 U38 ( .A(a2[6]), .Y(n24) );
  NAND2X1 U39 ( .A(a2[7]), .B(n40), .Y(n39) );
  NOR2BX1 U40 ( .AN(n41), .B(n5), .Y(n6) );
  NAND4X1 U41 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n5) );
  AOI33X1 U42 ( .A0(a0[0]), .A1(n46), .A2(n47), .B0(a0[1]), .B1(n48), .B2(n49), 
        .Y(n45) );
  AOI33X1 U43 ( .A0(a0[2]), .A1(n50), .A2(n51), .B0(a0[3]), .B1(n52), .B2(n53), 
        .Y(n44) );
  AOI33X1 U44 ( .A0(a0[4]), .A1(n54), .A2(n55), .B0(a0[5]), .B1(n56), .B2(n57), 
        .Y(n43) );
  AOI32X1 U45 ( .A0(n58), .A1(n59), .A2(a0[6]), .B0(a0[7]), .B1(n27), .Y(n42)
         );
  CLKINVX1 U46 ( .A(a1[7]), .Y(n27) );
  OAI21XL U47 ( .A0(a0[0]), .A1(n46), .B0(n47), .Y(n41) );
  OA21XL U48 ( .A0(a0[1]), .A1(n48), .B0(n49), .Y(n47) );
  OA21XL U49 ( .A0(a0[2]), .A1(n50), .B0(n51), .Y(n49) );
  OA21XL U50 ( .A0(a0[3]), .A1(n52), .B0(n53), .Y(n51) );
  OA21XL U51 ( .A0(a0[4]), .A1(n54), .B0(n55), .Y(n53) );
  OA21XL U52 ( .A0(a0[5]), .A1(n56), .B0(n57), .Y(n55) );
  OA21XL U53 ( .A0(a0[6]), .A1(n59), .B0(n58), .Y(n57) );
  NAND2X1 U54 ( .A(a1[7]), .B(n40), .Y(n58) );
  CLKINVX1 U55 ( .A(a0[7]), .Y(n40) );
  CLKINVX1 U56 ( .A(a1[6]), .Y(n59) );
  CLKINVX1 U57 ( .A(a1[5]), .Y(n56) );
  CLKINVX1 U58 ( .A(a1[4]), .Y(n54) );
  CLKINVX1 U59 ( .A(a1[3]), .Y(n52) );
  CLKINVX1 U60 ( .A(a1[2]), .Y(n50) );
  CLKINVX1 U61 ( .A(a1[1]), .Y(n48) );
  CLKINVX1 U62 ( .A(a1[0]), .Y(n46) );
endmodule

