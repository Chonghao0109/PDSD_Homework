`timescale 1ns/1ps

`include "./tsmc13.v"
`include "./adder_syn.v"

module testfixture;

	



	//======= Define Data Path =======
	`define data_path "dat/data.dat"
	//====== Define Parameters =======
	`define PAT_LENGTH 4




	// Circuit Answer
	reg [7:0] a,b;
	reg mode;
	wire c_out;
	wire overflow;
	wire [7:0] sum; 

	//	Target Answer
	reg [7:0] t_sum;
	reg t_overflow;		
	integer success,error;
	integer i;



	//======= Instantiate Unit Under Test =======
	adder adder_u1(
    .sum(sum),
    .c_out(c_out),
    .a(a),
    .b(b),
    .mode(mode)
  );


	`ifdef SDF
		initial $sdf_annotate("./adder_syn.sdf",adder_u1); 
	`endif


	// Dump the waveforms
	`ifdef FSDB
		initial begin
			$fsdbDumpfile("adder.fsdb");
			$fsdbDumpvars();
		end
	`endif

	//========= Read Data 2 Register ============
	reg [16:0] data [99:0]; // mode + a + b
	initial begin 
		$readmemb(`data_path,data);
	end




	//========= Test Unit ============
	initial begin
		success = 0;
		error = 0;

		a = 0;
		b = 0;
		mode = 0;
		#25
		$display("Start Testing");
		$display("====================================");
		$display("Mode | A | B | Sum | C_out | t_sum ");
		$display("====================================");
		for (i = 0; i < `PAT_LENGTH; i = i + 1) begin
			mode = data[i][16];
			a = data[i][15:8];
			b = data[i][7:0];

			#100
			t_sum = mode ? a+b : a-b;

			if ( t_sum==t_sum) begin // Overflow
				success = success + 1;
				$write("Pattern %d Success |",i+1);
			end
			else begin
				error = error + 1;
				$write("Pattern %d Error   |",i+1);
			end
			$display("%d \t| %d \t| %d \t| %d \t| %d \t| %d \t|",mode,a,b,sum,c_out,t_sum);
		end
		$display("====================================");
		$display("Test Result: %d Success, %d Error",success,error);
		$display("====================================");
		$finish;
	end



endmodule 
