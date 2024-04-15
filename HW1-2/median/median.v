module median (a0, a1, a2, out);

	input    [7:0]   a0, a1, a2;
	
	output 	 [7:0]   out;
	
	//====================================================================
	//======================= enter your code here =======================


	wire gab,eab;
	wire gbc,ebc;
	wire gac,eac;
	wire [2:0] s;

	comparator_8bit u1_comparator(
		.a(a0),
		.b(a1),
		.g(gab),
		.e(eab)
	);
	comparator_8bit u2_comparator(
		.a(a1),
		.b(a2),
		.g(gbc),
		.e(ebc)
	);
	comparator_8bit u3_comparator(
		.a(a0),
		.b(a2),
		.g(gac),
		.e(eac)
	);


	median_detection u4_median_detection(
		.gab(gab),
		.eab(eab),
		.gbc(gbc),
		.ebc(ebc),
		.gac(gac),
		.eac(eac),
		.s(s)
	);


	selecter u5_selecter(
		.a0(a0),
		.a1(a1),
		.a2(a2),
		.s(s),
		.out(out)
	);


	//====================================================================

endmodule




module comparator_8bit(
	input wire [7:0] a,b,
	output wire g,e 
);
	

	wire [7:0] rg,re,rl;
	wire [7:0] ec;

	
	comparator_1bit u3_comparator(
		.a(a[0]),
		.b(b[0]),
		.g(rg[0]),
		.e(re[0])
	);
	comparator_1bit u4_comparator(
		.a(a[1]),
		.b(b[1]),
		.g(rg[1]),
		.e(re[1])
	);
	comparator_1bit u5_comparator(
		.a(a[2]),
		.b(b[2]),
		.g(rg[2]),
		.e(re[2])
	);
	comparator_1bit u6_comparator(
		.a(a[3]),
		.b(b[3]),
		.g(rg[3]),
		.e(re[3])
	);
	comparator_1bit u7_comparator(
		.a(a[4]),
		.b(b[4]),
		.g(rg[4]),
		.e(re[4])
	);
	comparator_1bit u8_comparator(
		.a(a[5]),
		.b(b[5]),
		.g(rg[5]),
		.e(re[5])
	);
	comparator_1bit u9_comparator(
		.a(a[6]),
		.b(b[6]),
		.g(rg[6]),
		.e(re[6])
	);
	comparator_1bit u10_comparator(
		.a(a[7]),
		.b(b[7]),
		.g(rg[7]),
		.e(re[7])
	);



	equal_cont u1_equal_cont(
		.a(re),
		.o(ec)
	);

	
	
	compare_detector u2_compare_detector(
		.rg(rg),
		.ec(ec),
		.g(g),
		.e(e)
	);



	

endmodule



module compare_detector(
	input wire [7:0] rg,ec,
	output wire g,e 
);
	
	assign g = (rg[7]) || (rg[6] && ec[7]) || (rg[5] && ec[6]) || (rg[4] && ec[5]) || (rg[3] && ec[4]) || (rg[2] && ec[3]) || (rg[1] && ec[2]) || (rg[0] && ec[1]) ;
	assign e = ec[0];

endmodule




module equal_cont(
	input wire [7:0] a,
	output wire [7:0] o
);

	assign o[7] = a[7];
	and(o[6],a[7],a[6]);
	and(o[5],o[6],a[5]);
	and(o[4],o[5],a[4]);
	and(o[3],o[4],a[3]);
	and(o[2],o[3],a[2]);
	and(o[1],o[2],a[1]); 
	and(o[0],o[1],a[0]); 

endmodule 





module comparator_1bit(
	input wire a,b,
	output wire g,e
);

	wire w1,w2;
	wire na,nb;
	
	not(na,a);
	not(nb,b);

	nor(g,na,b);
	
	
	nand(w1,a,b);
	nand(w2,na,nb);
	nand(e,w1,w2);

endmodule



module median_detection(
	input wire gab,eab,
	input wire gbc,ebc,
	input wire gac,eac,
	output wire [2:0] s
);

	wire ab,ba;
	wire ac,ca;
	wire bc,cb;
	
	assign ab = gab | eab;
	assign ba = ~gab;
	assign ac = gac | eac;
	assign ca = ~gac;
	assign bc = gbc | ebc;
	assign cb = ~gbc;

	// a c b || b c a
	assign s[2] = (ac && cb) || (bc && ca);
	// a b c || c b a
	assign s[1] = (ab && bc) || (cb && ba);
	// b a c || c a b
	assign s[0] = (ba && ac) || (ca && ab);
	
endmodule





module selecter(
	input wire [7:0] a0,a1,a2,
	input wire [2:0] s,
	output tri [7:0] out
);

	assign out = s[2] ? a2:8'bz;
	assign out = s[1] ? a1:8'bz;
	assign out = s[0] ? a0:8'bz;

endmodule 


