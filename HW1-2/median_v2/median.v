module median (a0, a1, a2, out);

	input    [7:0]   a0, a1, a2;
	
	output 	 [7:0]   out;
	
	//====================================================================
	//======================= enter your code here =======================
	
	wire [7:0] pre_out [1:0];
	
	
	wire [7:0] sum;
	wire [7:0] min,max;





	sum u0_sum(
		.a0(a0),
		.a1(a1),
		.a2(a2),
		.sum(sum)
	);




	max_min_detector u1_max_min_detector(
		.sum(sum),
		.min(min),
		.max(max)
	);


	median_detector u2_median(
		.sum(sum),.min(min),.max(max),
		.out(pre_out[0])
	);	
	

	

	equal u3_equal(
		.a0(a0),
		.a1(a1),
		.a2(a2),
		.out(pre_out[1])
	);


	preout2out u4_out(
		.pre_out_1(pre_out[0]),
		.pre_out_2(pre_out[1]),
		.out(out)
	);





	//====================================================================

endmodule




module sum(
	input wire [7:0] a0,a1,a2,
	output wire [7:0] sum
);
	assign sum = a0 | a1 | a2;
endmodule



module median_detector(
	input wire [7:0] sum,min,max,
	output wire [7:0] out
);

	assign out = ~(~sum | (min|max));

endmodule



module max_min_detector(
	input wire [7:0] sum,	
	output reg [7:0] min,max
);


	

	always@(*)begin :Pirority_Encoder_max
		if(sum[7]) 			max = 8'b10000000; 
		else if(sum[6]) max = 8'b01000000;
		else if(sum[5]) max = 8'b00100000;
		else if(sum[4]) max = 8'b00010000;
		else if(sum[3]) max = 8'b00001000;
		else if(sum[2]) max = 8'b00000100;
		else if(sum[1]) max = 8'b00000010;
		else if(sum[0]) max = 8'b00000001;
		else max = 0;
	end


	always@(*)begin :Pirority_Encoder_min
		if(sum[0]) 			min = 8'b00000001; 
		else if(sum[1]) min = 8'b00000010;
		else if(sum[2]) min = 8'b00000100;
		else if(sum[3]) min = 8'b00001000;
		else if(sum[4]) min = 8'b00010000;
		else if(sum[5]) min = 8'b00100000;
		else if(sum[6]) min = 8'b01000000;
		else if(sum[7]) min = 8'b10000000;
		else min = 0;
	end

endmodule




module equal(
	input wire [7:0] a0,a1,a2,
	output wire [7:0] out
);


	wire [7:0] e01,e12,e02;

	genvar i;
	generate 
		for(i=0;i<8;i=i+1) begin
			nand(e01[i],a0[i],a1[i]);
			nand(e12[i],a1[i],a2[i]);
			nand(e02[i],a0[i],a2[i]);
			nand(out[i],e01[i],e12[i],e02[i]);
		end
	endgenerate

endmodule


module preout2out(
	input wire [7:0] pre_out_1,pre_out_2,
	output wire [7:0] out
);

	assign out = pre_out_1 | pre_out_2;

endmodule

