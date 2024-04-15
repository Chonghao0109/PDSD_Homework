
// Project Name   : Carry Select Adder 
// File Name      : top.v
// top module     : adder 
// Author         : ChongHao Xu
// Space_Complex  : SIZE * FA * 2
// Speed          : FA + SIZE * multiplexer 
// Description    : 
//
//
//



// Description    : 
//    top module
//    adder:
//      - FA_CSA * 8
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



	not#(1) n1(sub,mode);


  xor#(2) x1(cb[0], sub, b[0]);
  xor#(2) x2(cb[1], sub, b[1]);
  xor#(2) x3(cb[2], sub, b[2]);
  xor#(2) x4(cb[3], sub, b[3]);
  xor#(2) x5(cb[4], sub, b[4]);
  xor#(2) x6(cb[5], sub, b[5]);
  xor#(2) x7(cb[6], sub, b[6]);
  xor#(2) x8(cb[7], sub, b[7]);



  wire carry [6:0];

  FA_CSA fa_u1(
    .S(sum[0]),
    .COUT(carry[0]), 
    .A(a[0]),
    .B(cb[0]),
    .CIN(sub)
  );

  FA_CSA fa_u2(
    .S(sum[1]),
    .COUT(carry[1]), 
    .A(a[1]),
    .B(cb[1]),
    .CIN(carry[0])
  );

  FA_CSA fa_u3(
    .S(sum[2]),
    .COUT(carry[2]), 
    .A(a[2]),
    .B(cb[2]),
    .CIN(carry[1])
  );

  FA_CSA fa_u4(
    .S(sum[3]),
    .COUT(carry[3]), 
    .A(a[3]),
    .B(cb[3]),
    .CIN(carry[2])
  );

  FA_CSA fa_u5(
    .S(sum[4]),
    .COUT(carry[4]), 
    .A(a[4]),
    .B(cb[4]),
    .CIN(carry[3])
  );

  FA_CSA fa_u6(
    .S(sum[5]),
    .COUT(carry[5]), 
    .A(a[5]),
    .B(cb[5]),
    .CIN(carry[4])
  );

  FA_CSA fa_u7(
    .S(sum[6]),
    .COUT(carry[6]), 
    .A(a[6]),
    .B(cb[6]),
    .CIN(carry[5])
  );

  FA_CSA fa_u8(
    .S(sum[7]),
    .COUT(c_out),
    .A(a[7]),
    .B(cb[7]),
    .CIN(carry[6])
  );

  
  and#(2)(Overflow,c_out,mode);

endmodule 








// module         : FA_CSA
// Description    : 
//  
//    FA_CSA:
//      - HA    * 1
//      - HA_P1 * 1
//      - multiplexer * 2
//
module FA_CSA(
  output tri S,COUT,
  input wire A,B,CIN
);

  wire s1,cout1,s2,cout2;

	multiplexer m1(
		.OUT(S),
		.IN1(s1),
		.IN2(s2),
		.SEL(CIN)
	);

	multiplexer m2(
		.OUT(COUT),
		.IN1(cout1),
		.IN2(cout2),
		.SEL(CIN)
	);

  HA ha_u1(
    .S(s1),
    .Cout(cout1),
    .A(A),
    .B(B)
  );


  HA_P1 ha_u2(
    .S(s2),
    .COUT(cout2),
    .A(A),
    .B(B)
  );



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


// module         : HA_P1 
// Description    : 
//  
//    HA_P1:
//      - xnor  * 1
//      - or * 1
//
module HA_P1(
  output wire S,COUT,
  input wire A,B
);


  xnor#(2) xnor_u1(S,A,B);
  or#(2) or_u1(COUT,A,B); 

endmodule




// module         : multiplexer 
// Description    : 
//  
//    multiplexer:
//      - buffer * 2
//
module multiplexer(
	output tri OUT,
	input wire IN1,
	input wire IN2,
	input wire SEL
);

	
	bufif0#(2)(OUT,IN1,SEL);
	bufif1#(2)(OUT,IN2,SEL);


endmodule


