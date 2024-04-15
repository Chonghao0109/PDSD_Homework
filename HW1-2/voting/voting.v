
//===============================================================================//
//            PLEASE DO NOT modify basic I/O name or top module name!            // 
//===============================================================================//

module voting (a0, a1, a2, a3, a4, out);

	input    [2:0]   a0, a1, a2, a3, a4;
	
	output reg  [2:0] out;
	
	//====================================================================
	//======================= enter your code here =======================

	wire [2:0] s0,s1,s2;
	reg [2:0] value;

	reg ge10,ge21;

	adder u1(
		.a({a0[0],a1[0],a2[0],a3[0],a4[0]}),
		.o(s0)
	);
	adder u2(
		.a({a0[1],a1[1],a2[1],a3[1],a4[1]}),
		.o(s1)
	);
	adder u3(
		.a({a0[2],a1[2],a2[2],a3[2],a4[2]}),
		.o(s2)
	);


	always@(*)begin :proc_comp
		ge10 = s1 >= s0;
		value = ge10 ? s1 : s0;
		ge21 = s2 >= value;
	end

	always@(*)begin :proc_arb
		out[2] = ge21;
		out[1] = ~ge21 & ge10;
		out[0] = ~ge21 & ~ge10;
	end



	//====================================================================
	
endmodule

module adder(
	input [4:0] a,
	output wire [2:0] o
);

	wire [1:0] w1,w2;

	assign w1 = a[0] + a[1];
	assign w2 = a[2] + a[3] + a[4];

	assign o =	w1 + w2;	


endmodule



