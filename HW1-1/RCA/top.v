// Project Name   : Ripple Carry Adder
// File Name      : top.v
// top module     : adder 
// Author         : ChongHao Xu
// Space_Complex  : SIZE*FA
// Speed          : SIZE*FA
// Description    : 
//
//
//


// module Name    : RCA
// Description    : 
//    top module
//    adder:
//      - FA * 8
//      - not * 1
//      - XOR * 9
//
module adder(
  input wire [7:0]  a,b,
  input wire        mode,  // mode: 1: add, 0: sub
  output wire [7:0] sum,
  output wire       c_out,
  output wire       Overflow
);


  wire [7:0] cb;
	wire sub;
  wire carry [6:0];
	
  
  
  
  not#(1) n1(sub,mode);


  xor#(2) x1(cb[0], sub, b[0]);
  xor#(2) x2(cb[1], sub, b[1]);
  xor#(2) x3(cb[2], sub, b[2]);
  xor#(2) x4(cb[3], sub, b[3]);
  xor#(2) x5(cb[4], sub, b[4]);
  xor#(2) x6(cb[5], sub, b[5]);
  xor#(2) x7(cb[6], sub, b[6]);
  xor#(2) x8(cb[7], sub, b[7]);
  

  FA fa_u1(
    .S(sum[0]),
    .Cout(carry[0]), 
    .A(a[0]),
    .B(cb[0]),
    .Cin(sub)
  );

  FA fa_u2(
    .S(sum[1]),
    .Cout(carry[1]), 
    .A(a[1]),
    .B(cb[1]),
    .Cin(carry[0])
  );

  FA fa_u3(
    .S(sum[2]),
    .Cout(carry[2]), 
    .A(a[2]),
    .B(cb[2]),
    .Cin(carry[1])
  );

  FA fa_u4(
    .S(sum[3]),
    .Cout(carry[3]), 
    .A(a[3]),
    .B(cb[3]),
    .Cin(carry[2])
  );

  FA fa_u5(
    .S(sum[4]),
    .Cout(carry[4]), 
    .A(a[4]),
    .B(cb[4]),
    .Cin(carry[3])
  );

  FA fa_u6(
    .S(sum[5]),
    .Cout(carry[5]), 
    .A(a[5]),
    .B(cb[5]),
    .Cin(carry[4])
  );

  FA fa_u7(
    .S(sum[6]),
    .Cout(carry[6]), 
    .A(a[6]),
    .B(cb[6]),
    .Cin(carry[5])
  );

  FA fa_u8(
    .S(sum[7]),
    .Cout(c_out),
    .A(a[7]),
    .B(cb[7]),
    .Cin(carry[6])
  );

  and#(2)(Overflow,c_out,mode);


endmodule 



// module Name    : FA 
// Description    : 
//  FA:
//    - HA * 2
//    - or * 1
//
module FA(
  output wire S,Cout,
  input wire A,B,Cin
);

  wire w1,w2,w3;
  HA h1(w1,w2,A,B);
  HA h2(S,w3,w1,Cin);

  or#(2) o1(Cout,w2,w3);
  
endmodule


// module Name    : HA 
// Description    : 
//  HA:
//    - HA * 2
//      - or * 1
//
module HA(
  output wire S,Cout,
  input wire A,B
);

  xor#(2)x1(S,A,B);
  and#(2)a1(Cout,A,B);


endmodule
