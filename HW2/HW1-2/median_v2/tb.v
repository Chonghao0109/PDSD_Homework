`timescale 1ns/1ps
`include "./tsmc13.v"
`include	"median_syn.v"
module tb;




	`define PAT_PATH "dat/pattern.dat"
	`define PAT_LEN 4



  reg    [7:0] a0, a1, a2;
  wire   [7:0] out;

	reg [31:0] pattern_data [`PAT_LEN-1:0];
	

	median dut(
		.a0(a0),
		.a1(a1),
		.a2(a2),
		.out(out)
	);






	`ifdef SDF
		initial $sdf_annotate("./median_syn.sdf",dut);
	`endif
	



	`ifdef FSDB 
		initial begin
			$fsdbDumpfile("wave.fsdb");
			$fsdbDumpvars();
		end
	`endif


	`ifdef VCD 
		initial begin
			$dumpfile("wave.vcd");
			$dumpvars();
		end
	`endif
	

	initial begin
		$readmemb(`PAT_PATH,pattern_data);
	end

	integer pattern;
	initial begin
		a0 = 0;
		a1 = 0;
		a2 = 0;
		#10

		for(pattern=0;pattern<`PAT_LEN;pattern=pattern+1)begin
			{a0,a1,a2} = pattern_data[pattern][31:8];
			#10
			if(pattern_data[pattern][7:0] == out)begin
				$write("Success ");
			end
			else begin
				$write("Error ");
			end
			$display("Target answer:%b Your answer:%b a0:%b a1:%b a2:%b ",pattern_data[pattern][7:0],out,a0,a1,a2);
		end
	
		$finish();

	end



endmodule
