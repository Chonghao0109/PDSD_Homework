/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sun May 12 22:03:05 2024
/////////////////////////////////////////////////////////////


module traffic_light ( clk, reset, c, HG, HY, HR, FG, FY, FR, PG, PR );
  input clk, reset, c;
  output HG, HY, HR, FG, FY, FR, PG, PR;
  wire   n50, N88, N89, N90, N92, N93, N94, N95, N96, n4, n5, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n44, n45, n46, n47, n48, n49;
  wire   [2:0] state;
  wire   [2:0] next_state;
  wire   [2:0] s0_times;
  wire   [4:0] counter;
  wire   [4:2] \add_122/carry ;

  DFFRX1 \s0_times_reg[1]  ( .D(n44), .CK(clk), .RN(n46), .Q(s0_times[1]), 
        .QN(n9) );
  DFFRX1 \s0_times_reg[0]  ( .D(n40), .CK(clk), .RN(n46), .Q(s0_times[0]), 
        .QN(n10) );
  DFFRX1 \counter_reg[0]  ( .D(n42), .CK(clk), .RN(n46), .Q(counter[0]) );
  DFFRX1 \counter_reg[3]  ( .D(N95), .CK(clk), .RN(n46), .Q(counter[3]) );
  DFFRX1 \counter_reg[2]  ( .D(N94), .CK(clk), .RN(n46), .Q(counter[2]) );
  DFFRX1 \counter_reg[4]  ( .D(N96), .CK(clk), .RN(n46), .Q(counter[4]) );
  DFFRX1 \s0_times_reg[2]  ( .D(n41), .CK(clk), .RN(n46), .Q(s0_times[2]), 
        .QN(n8) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n46), .Q(state[1]), 
        .QN(n5) );
  DFFRX1 \state_reg[0]  ( .D(n38), .CK(clk), .RN(n46), .Q(state[0]), .QN(n7)
         );
  DFFRX1 \counter_reg[1]  ( .D(N93), .CK(clk), .RN(n46), .Q(counter[1]) );
  DFFRX2 \state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n46), .Q(state[2]), 
        .QN(n4) );
  CLKINVX1 U49 ( .A(next_state[0]), .Y(n37) );
  CLKINVX1 U50 ( .A(n37), .Y(n38) );
  NAND3XL U51 ( .A(n26), .B(n27), .C(n28), .Y(next_state[0]) );
  INVXL U52 ( .A(n36), .Y(n39) );
  CLKINVX1 U53 ( .A(n39), .Y(n40) );
  OAI32XL U54 ( .A0(n9), .A1(s0_times[2]), .A2(n11), .B0(n12), .B1(n8), .Y(n34) );
  BUFX2 U55 ( .A(n34), .Y(n41) );
  BUFX2 U56 ( .A(N92), .Y(n42) );
  NOR2XL U57 ( .A(counter[0]), .B(n17), .Y(N92) );
  NAND2XL U58 ( .A(n4), .B(n5), .Y(n50) );
  BUFX2 U59 ( .A(n50), .Y(HR) );
  BUFX2 U60 ( .A(n35), .Y(n44) );
  OAI211X1 U61 ( .A0(state[1]), .A1(n47), .B0(n18), .C0(n19), .Y(n17) );
  OAI221XL U62 ( .A0(n32), .A1(n5), .B0(n30), .B1(n27), .C0(FR), .Y(
        next_state[1]) );
  NAND2X1 U63 ( .A(HG), .B(n16), .Y(n13) );
  INVX3 U64 ( .A(PR), .Y(PG) );
  INVX3 U65 ( .A(n27), .Y(HY) );
  INVX3 U66 ( .A(n21), .Y(FY) );
  NOR2BX1 U67 ( .AN(N90), .B(n17), .Y(N95) );
  NOR2BX1 U68 ( .AN(N89), .B(n17), .Y(N94) );
  NOR2BX1 U69 ( .AN(N88), .B(n17), .Y(N93) );
  NAND2X1 U70 ( .A(PR), .B(n13), .Y(n15) );
  CLKINVX1 U71 ( .A(FR), .Y(n49) );
  CLKINVX1 U72 ( .A(n50), .Y(n48) );
  CLKINVX1 U73 ( .A(next_state[1]), .Y(n47) );
  NOR2X1 U74 ( .A(n16), .B(n20), .Y(n19) );
  XOR2X1 U75 ( .A(n7), .B(next_state[0]), .Y(n18) );
  NAND2X2 U76 ( .A(state[1]), .B(n7), .Y(FR) );
  OA21XL U77 ( .A0(state[2]), .A1(s0_times[2]), .B0(n24), .Y(n32) );
  NOR2X2 U78 ( .A(n50), .B(state[0]), .Y(HG) );
  NAND3X2 U79 ( .A(state[2]), .B(n5), .C(state[0]), .Y(PR) );
  NOR3BX1 U80 ( .AN(n31), .B(counter[1]), .C(counter[4]), .Y(n24) );
  NOR2X2 U81 ( .A(state[2]), .B(FR), .Y(FG) );
  OA21XL U82 ( .A0(n13), .A1(s0_times[1]), .B0(n14), .Y(n12) );
  XOR2X1 U83 ( .A(next_state[2]), .B(state[2]), .Y(n20) );
  NAND2X1 U84 ( .A(state[0]), .B(n48), .Y(n27) );
  NAND2X1 U85 ( .A(state[2]), .B(n49), .Y(n21) );
  OAI22XL U86 ( .A0(n14), .A1(n9), .B0(s0_times[1]), .B1(n11), .Y(n35) );
  NAND4X1 U87 ( .A(PR), .B(n21), .C(n22), .D(n23), .Y(next_state[2]) );
  NAND3X1 U88 ( .A(s0_times[2]), .B(n24), .C(n25), .Y(n22) );
  AOI2BB2X1 U89 ( .B0(n16), .B1(n49), .A0N(n24), .A1N(n4), .Y(n23) );
  NOR3X1 U90 ( .A(n7), .B(state[2]), .C(n5), .Y(n25) );
  NOR2X1 U91 ( .A(n45), .B(n17), .Y(N96) );
  XNOR2X1 U92 ( .A(\add_122/carry [4]), .B(counter[4]), .Y(n45) );
  NAND3BX1 U93 ( .AN(counter[4]), .B(n31), .C(counter[1]), .Y(n30) );
  AND3X2 U94 ( .A(counter[1]), .B(n31), .C(counter[4]), .Y(n16) );
  OAI211X1 U95 ( .A0(c), .A1(s0_times[2]), .B0(n48), .C0(n16), .Y(n26) );
  AOI2BB2X1 U96 ( .B0(state[0]), .B1(n29), .A0N(n30), .A1N(n21), .Y(n28) );
  OAI222XL U97 ( .A0(state[1]), .A1(n16), .B0(n24), .B1(n5), .C0(state[2]), 
        .C1(n8), .Y(n29) );
  NAND2BX1 U98 ( .AN(n13), .B(s0_times[0]), .Y(n11) );
  OA21XL U99 ( .A0(s0_times[0]), .A1(n13), .B0(n15), .Y(n14) );
  AND2X2 U100 ( .A(n33), .B(counter[0]), .Y(n31) );
  NOR2X1 U101 ( .A(counter[3]), .B(counter[2]), .Y(n33) );
  OAI22XL U102 ( .A0(n10), .A1(n15), .B0(s0_times[0]), .B1(n13), .Y(n36) );
  ADDHXL U103 ( .A(counter[1]), .B(counter[0]), .CO(\add_122/carry [2]), .S(
        N88) );
  ADDHXL U104 ( .A(counter[2]), .B(\add_122/carry [2]), .CO(\add_122/carry [3]), .S(N89) );
  ADDHXL U105 ( .A(counter[3]), .B(\add_122/carry [3]), .CO(\add_122/carry [4]), .S(N90) );
  INVX3 U106 ( .A(reset), .Y(n46) );
endmodule

