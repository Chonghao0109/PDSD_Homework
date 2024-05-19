
`timescale 1ns/1ps

`define CYCLE	 10
`define SDF_PATH "traffic_light_syn.sdf"


module tb;



	parameter LONG_TIME 	= 20;
	parameter MEDIUM_TIME = 4;
	parameter SHORT_TIME 	= 2;	
	parameter PEDESTRAIN_CHANSFER = 5;


	// Target Answer
	parameter S0_Target = 8'b100_001_01;
	parameter S1_Target = 8'b010_001_01;
	parameter S2_Target = 8'b001_001_01;
	parameter S3_Target = 8'b001_100_01;
	parameter S4_Target = 8'b001_010_01;
	parameter S5_Target = 8'b001_001_01;
	parameter S6_Target = 8'b001_001_10;
	parameter S7_Target = 8'b001_001_01;

	reg check_state;
	integer Error;

	reg clk,reset,c;
	wire HG,HY,HR;
	wire FG,FY,FR;
	wire PG,PR;

	wire [7:0] Your_Answer = {HG,HY,HR,FG,FY,FR,PG,PR};	

	traffic_light dut(
		.clk(clk),
		.reset(reset),
		.c(c),
		.HG(HG),
		.HY(HY),
		.HR(HR),
		.FG(FG),
		.FY(FY),
		.FR(FR),
		.PG(PG),
		.PR(PR)
	);


	`ifdef SDF
		initial begin
			$sdf_annotate(`SDF_PATH, dut);
		end
	`endif


	`ifdef FSDB
		initial begin
			$fsdbDumpfile("wave.fsdb");
			$fsdbDumpvars();
		end
	`endif

	



	always#(`CYCLE/2) clk = ~clk;

	initial begin
		Error = 0;
		clk = 0;
		reset = 0;
		c = 0;
		#(`CYCLE/2) 
			reset = 1;
		#(`CYCLE/2) 
			reset = 0;

		// State Reset Pattern
		check_state = (Your_Answer == S0_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;
		

		if(Your_Answer == S0_Target && check_state) $display("Pattern 1 Success");
		else begin 
			$display("Pattern 1 Error");
			Error = Error + 1;
		end
		c = 1;	
		// S1 RESET
		#(`CYCLE*LONG_TIME) 
			check_state = (Your_Answer == S1_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;
		
		
		if(Your_Answer == S0_Target && check_state) $display("Pattern 2 Success");
		else begin 
			$display("Pattern 2 Error");
			Error = Error + 1;
		end

	
		// S2 RESET
		#(`CYCLE*(LONG_TIME+MEDIUM_TIME)) 
			check_state = (Your_Answer == S2_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;
		
		if(Your_Answer == S0_Target && check_state) $display("Pattern 3 Success");
		else begin 
			$display("Pattern 3 Error");
			Error = Error + 1;
		end
			

		// S3 RESET
		c = 1;
		#(`CYCLE*(LONG_TIME+MEDIUM_TIME+SHORT_TIME)) 
			check_state = (Your_Answer == S3_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;
			
		if(Your_Answer == S0_Target && check_state) $display("Pattern 4 Success");
		else begin 
			$display("Pattern 4 Error");
			Error = Error + 1;
		end

		// S4 RESET
		#(`CYCLE*(2*LONG_TIME+MEDIUM_TIME+SHORT_TIME)) 
			check_state = (Your_Answer == S4_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;			
		if(Your_Answer == S0_Target && check_state) $display("Pattern 5 Success");
		else begin 
			$display("Pattern 5 Error");
			Error = Error + 1;
		end

		// S5 RESET
		#(`CYCLE*(2*LONG_TIME+2*MEDIUM_TIME+SHORT_TIME)) 
			check_state = (Your_Answer == S5_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;			
		if(Your_Answer == S0_Target && check_state) $display("Pattern 6 Success");
		else begin 
			$display("Pattern 6 Error");
			Error = Error + 1;
		end

		// S6 RESET
		c = 0;
		#(`CYCLE * (5*(LONG_TIME)+MEDIUM_TIME+SHORT_TIME))
			check_state = (Your_Answer == S6_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;			
		if(Your_Answer == S0_Target && check_state) $display("Pattern 7 Success");
		else begin 
			$display("Pattern 7 Error");
			Error = Error + 1;
		end

		// S7 RESET
		#(`CYCLE* (6*(LONG_TIME)+MEDIUM_TIME+SHORT_TIME))
			check_state = (Your_Answer == S6_Target) ? 1:0;
			check_state = (Your_Answer == S7_Target) ? 1:0;
		#(`CYCLE)
			reset = 1;
		#(`CYCLE)
			reset = 0;			
		if(Your_Answer == S0_Target && check_state) $display("Pattern 8 Success");
		else begin 
			$display("Pattern 8 Error");
			Error = Error + 1;
		end


		
		//State Chansfer Pattern 
		check_state = 1;
		c = 1;
			if(Your_Answer != S0_Target) check_state = 0; 
		#(`CYCLE*LONG_TIME) 
			if(Your_Answer != S1_Target) check_state = 0; 
		#(`CYCLE*MEDIUM_TIME)
			if(Your_Answer != S2_Target) check_state = 0; 
		#(`CYCLE*SHORT_TIME)
			if(Your_Answer != S3_Target) check_state = 0; 
		#(`CYCLE*LONG_TIME)
			if(Your_Answer != S4_Target) check_state = 0; 
		#(`CYCLE*MEDIUM_TIME)
			if(Your_Answer != S5_Target) check_state = 0; 
		#(`CYCLE*SHORT_TIME)
			if(Your_Answer != S0_Target) check_state = 0; 
		
		if(check_state) $display("Pattern 9 Success");
		else begin 
			$display("Pattern 9 Error");
			Error = Error + 1;
		end

		check_state = 1;
		c = 0;							
		#(`CYCLE* (4*(LONG_TIME)+MEDIUM_TIME+SHORT_TIME))
			if(Your_Answer != S6_Target) check_state = 0; 
		#(`CYCLE*LONG_TIME)
			if(Your_Answer != S7_Target) check_state = 0;
		#(`CYCLE*SHORT_TIME)
			if(Your_Answer != S0_Target) check_state = 0; 


		if(check_state) $display("Pattern 10 Success");
		else begin 
			$display("Pattern 01 Error");
			Error = Error + 1;
		end


		#(`CYCLE*3)
		if(Error == 0)begin
		  $display("                                                                                                   ");                                                  
		  $display("                                                                                                   ");                                                  
		  $display("                                                                                                   ");                                                  
		  $display("                                       __________________________                                  ");                                                  
		  $display("                                      |                          |                                 ");                                                  
		  $display("                                      |       ALL   SUCCESS      |                                 ");                                                  
		  $display("                                      |__________________________|                                 ");                                                  
		  $display("                                                                                                   ");                                                  
		  $display("                                                                                                   ");                                                  
		  $display("                                                                                                   ");                                                  
		  $display("                                                                                                   ");                                                  
		  $display("                                                                                                   ");                                                  
		  $display("                                                                                                   ");                                                  
      $display("                        : i t t t :                                                                ");
      $display("                    : j j f f f j j t .                                 . i ; , .                  ");
      $display("                  ; j j L L L L f L f i :                           , t t j i t i ;                ");
      $display("                ; f f L G G L L L L L j t .                     . ; j j j j L f t i ,              ");
      $display("              i f L G G D D D D D G G f f t .                   t t j L L L L f f t i :            ");
      $display("            : f L L D D D E E E E D G f f f j t t ,     .   . i f L G G D G G L L j t ,            ");
      $display("            f L G G G G G L L f f f f f j j j j j t t t j j j f f L G D D D G L f j t i :          ");
      $display("            f f L L L L L L f f f f f j j j j j j j j f f f f f f f f j j f G E L f L ; ,          ");
      $display("          j j f L L L L L L L L L L f f j j t ; ; ; ; t f f f f f f f f j j f L D D L f ; .        ");
      $display("        ; f L L L L L L L L L L L L f j i ; , , : : : : , t f L f f f f j j j j j L G G i :        ");
      $display("      : L L G G G L L L L L L L L f i ; , : : : : . : : : , , i f f f f f j j j j f f f j j        ");
      $display("    . L L L G G L L L L L L L j i ; , : : : : : . . . : : : : : : ; f f f j j j j j j f f j t      ");
      $display("    f L G D D D D L f f j i , , , , : : : : : : . . . . : : : : : : : : ; t j j j j j j j j j t    ");
      $display("  ; i i j j j j i , , , , , , , , : : : : : : : . . . . . . . . . : : : : : : , i t t t t j j j i  ");
      $display("; ; ; ; ; ; ; ; , , , , , , , : , , , : : : : : : . . . . . . . . . : : : : . : : : , , ; ; ; ; , :");
      $display("; ; ; ; ; ; ; ; ; , , , , , , : , ; , , : : : : : . . . . . . . . : : : : . . . . . . : : : : : : :");
      $display("; ; , , , , , ; ; , , , , , , , f f ; , , : : : : . . . . . . : j D j : : : . . . . . . . . . . . .");
      $display(", , , , , , ; ; ; , , , , , , t K E ; , , : : : : . . : : : . ; K K E : : . . . . . . . . . . . . .");
      $display(", , , , , , , ; , , , , , , , , i ; , , : : : : : : : . . . . : i i , : : : . . . . . . . . . . . .");
      $display("; ; , , , , , , , , , , , , , , , , , , : : : : : : : . . : . : , , : : : : . . . . . . . . . . . .");
      $display("; ; , , , , , , , , , , , , i i i , , , : : : : : : : . . . . : : ; ; ; : : : . . . . . . . . . . .");
      $display("; ; , , , , , , , , , , , t E E E E j , , : : : : : : : : : : , G E E D t : : : . . . . . . . . . .");
      $display("; ; , , , , , , , , , , ; E W f j E E , , : : : : : : : : : : L K f j L E t , : . . . . . . . . . .");
      $display("; ; , ; , , ; ; , , , , L E i .   i K i , : : : : : : : : : ; E E . . : D D , : : . . . . . . . . .");
      $display("; ; ; ; ; ; ; ; ; , , , E K f , j K K t , : : : : : : : : : i E E , : f E D , : : : : : : . . . . .");
      $display("; ; ; ; ; ; i i ; , , , E K K K K K K j , : : : : : : : : : t E E E E E E D , : : : : : : : . . . .");
      $display("; ; ; ; ; i i i i i , , L K K D G K K j , , : : : : : : : : ; K E E E D E G : : : : : : : : : : . .");
      $display(", , ; ; ; j t j t j ; , ; K E ; f K L , , , : : : : : : : : . D K K i j E , , t ; , , ; , , : : : .");
      $display(", , , , i E j K j E j f , i K D L G i , , : : , , , , , : : : , D E D D i , t D t D j f j ; : . : .");
      $display(", , : , f K L W L K D G , , , , , ; , , , , , , j G , , : : : : ; ; ; ; , , f G G W G L E i : : : .");
      $display(", , . : L K D K G W E D , , , , , , , , , , , , G D , , , : : : : : : : : ; E L E L K f E t : . : .");
      $display(", , : : j G L f L G G L ; , , , , , , , L i ; t K K t ; i t , , : : : : : t G ; G i D t j i : . : .");
      $display("; , : : , j f f j f L j ; , , , , , , , D D D E K K K D E E i , , : : : : : i i i i i i ; , . . . .");
      $display("; , : : : , t j j f j i ; ; , , , , , , ; G E G f j f G L j ; ; , , : : : . : , , , , , : : . . . .");
      $display("; ; , , , , , , ; ; ; ; ; ; , , , , , , : : , , j f t i ; ; ; , , , , : : . . . . . . . . . . . . .");
      $display("i ; ; , , , , , , ; ; ; ; ; ; ; , , , : : : : ; L E G i ; ; , , , , , , : : . . . . . . . . . . . .");
      $display("i i ; ; ; ; i ; ; ; ; ; ; ; ; ; ; , , : : : : : ; t t i ; , , , , , , , : : : : : : : . : : : . . .");
      $display("i i ; ; i i i i i ; ; ; ; ; ; ; ; ; , , , : : : : , ; ; , , , , , , , , : : : : : : : : : : : : . .");
		end



		$finish();

	end



	

endmodule 
