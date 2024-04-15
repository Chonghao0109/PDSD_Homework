// Project Name   : Carry Look Ahead Adder 
// File Name      : top.v
// top module     : adder 
// Author         : ChongHao Xu
// Space_Complex  : SIZE * FA * 2
// Speed          : FA + SIZE * multiplexer 
// Description    : 
//
//
//

`timescale 1ns/1ps

// Description    : 
//    top module
//      adder:
//      
//      
//      
//
module adder (a, b, mode, sum, c_out, Overflow);
  input   [7:0]	a, b;
  input			    mode;

  output	[7:0]	sum;
  output			  c_out;
  output			  Overflow;


  

  wire sub;
  wire  [7:0] nb;
  wire  [6:0]	carry;
  wire [7:0] P, G;




  not#(2)(sub,mode);
  
  
  //2's complement
  xor#(2)(nb[0],b[0],sub);
  xor#(2)(nb[1],b[1],sub);
  xor#(2)(nb[2],b[2],sub);
  xor#(2)(nb[3],b[3],sub);
  xor#(2)(nb[4],b[4],sub);
  xor#(2)(nb[5],b[5],sub);
  xor#(2)(nb[6],b[6],sub);
  xor#(2)(nb[7],b[7],sub);


  FA FA_u1(
    .A(a[0]),
    .B(nb[0]),
    .CIN(sub),
    .P(P[0]),
    .G(G[0]),
    .sum(sum[0])
  ); 


  FA FA_u2(
    .A(a[1]),
    .B(nb[1]),
    .CIN(carry[0]),
    .P(P[1]),
    .G(G[1]),
    .sum(sum[1])
  ); 
  FA FA_u3(
    .A(a[2]),
    .B(nb[2]),
    .CIN(carry[1]),
    .P(P[2]),
    .G(G[2]),
    .sum(sum[2])
  ); 
  FA FA_u4(
    .A(a[3]),
    .B(nb[3]),
    .CIN(carry[2]),
    .P(P[3]),
    .G(G[3]),
    .sum(sum[3])
  ); 
  FA FA_u5(
    .A(a[4]),
    .B(nb[4]),
    .CIN(carry[3]),
    .P(P[4]),
    .G(G[4]),
    .sum(sum[4])
  ); 
  FA FA_u6(
    .A(a[5]),
    .B(nb[5]),
    .CIN(carry[4]),
    .P(P[5]),
    .G(G[5]),
    .sum(sum[5])
  ); 
  FA FA_u7(
    .A(a[6]),
    .B(nb[6]),
    .CIN(carry[5]),
    .P(P[6]),
    .G(G[6]),
    .sum(sum[6])
  ); 
  FA FA_u8(
    .A(a[7]),
    .B(nb[7]),
    .CIN(carry[6]),
    .P(P[7]),
    .G(G[7]),
    .sum(sum[7])
  ); 


  carry_lookahead_4bit carry_lookahead_4bit_u1(
    .CIN(sub),
    .P(P[3:0]),
    .G(G[3:0]),
    .COUT(carry[3:0])
  );


  carry_lookahead_4bit carry_lookahead_4bit_u2(
    .CIN(carry[3]),
    .P(P[7:4]),
    .G(G[7:4]),
    .COUT({c_out,carry[6:4]})
  );

  and#(2)(Overflow,c_out,mode);


endmodule







 
// module name    : carry_lookahead_4bit
// Description    : 
//    
//      
module carry_lookahead_4bit(
  input         CIN,
  input [3:0]   P,
  input [3:0]   G,
  output [4:0]  COUT
);

  wire [3:0] nG;
  not#(2)(nG[0],G[0]);
  not#(2)(nG[1],G[1]);
  not#(2)(nG[2],G[2]);
  not#(2)(nG[3],G[3]);


  // Carry
  // COUT[0] = G[0] | (P[0] & CIN); 
  wire w00;
  nand#(1)(w00,P[0],CIN);
  nand#(1)(COUT[0],nG[0],w00);


  // COUT[1] = G[1] | P[1] & G[0] | (P[1] & P[0] & CIN)
  wire w10, w11;
  nand#(1)(w10,P[1],G[0]);
  nand#(1)(w11,P[1],P[0],CIN);
  nand#(1)(COUT[1],nG[1],w10,w11);

  // COUT[2] = G[2] | P[2] & G[1] | P[2] & P[1] & G[0] | P[2] & P[1] & P[0] & CIN
  wire w20,w21,w22 ;
  nand#(1)(w20,P[2],G[1]);
  nand#(1)(w21,P[2],P[1],G[0]);
  nand#(1)(w22,P[2],P[1],P[0],CIN);
  nand#(1)(COUT[2],nG[2],w20,w21,w22);

  // COUT[3] = G[3] | P[3] & G[2] | P[3] & P[2] & G[1] | P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & P[0] & CIN
  wire w30,w31,w32,w33;
  nand#(1)(w30,P[3],G[2]);
  nand#(1)(w31,P[3],P[2],G[1]);
  nand#(1)(w32,P[3],P[2],P[1],G[0]);
  nand#(1)(w33,P[3],P[2],P[1],P[0],CIN);
  nand#(1)(COUT[3],nG[3],w30,w31,w32,w33);

endmodule







// module name    : FA
// Description    : 
//    
//      
module FA(
  input  A,B,CIN,
  output P,G,
  output sum
);

  wire w0;

  and#(2)(G,A,B);
  nor#(1)(w0,A,B);
  not#(1)(P,w0);

  wire w1;
  nor#(1)(w1,w0,G);

  xor#(2)(sum,CIN,w1);

endmodule
