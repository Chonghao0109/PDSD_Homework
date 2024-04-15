
module tb;





  reg    [2:0] a0, a1, a2, a3, a4;
  wire   [2:0] out;



	voting dut(
		.a0(a0),
		.a1(a1),
		.a2(a2),
		.a3(a3),
		.a4(a4),
		.out(out)
	);





	`ifdef FSDB 
		initial begin
			$fsdbDumpfile("wave.fsdb");
			$fsdbDumpvars("+mda");
		end
	`endif


	`ifdef VCD 
		initial begin
			$dumpfile("wave.vcd");
			$dumpvars();
		end
	`endif
	
	
	integer i1,i2,i3,i4,i5,p1,p2,p3;
	integer pattern;
	reg [2:0] Target;
	initial begin
		a0 = 0;
		a1 = 0;
		a2 = 0;
		a3 = 0;
		a4 = 0;
		#10
		
		for(i1=0;i1<3;i1=i1+1)begin
			for(i2=0;i2<3;i2=i2+1)begin
				for(i3=0;i3<3;i3=i3+1)begin
					for(i4=0;i4<3;i4=i4+1)begin
						for(i5=0;i5<3;i5=i5+1)begin
							
							a0 = 1<<i1;
							a1 = 1<<i2;
							a2 = 1<<i3;
							a3 = 1<<i4;
							a4 = 1<<i5;

							#10
							pattern = i1*81 + i2*27 + i3*9 + i4*3+i5;
							
							p1=0;
							p2=0;
							p3=0;
							if(i1==0)	p1=p1+1;
							else if(i1==1)	p2=p2+1;
							else if(i1==2)	p3=p3+1;

							if(i2==0)	p1=p1+1;
							else if(i2==1)	p2=p2+1;
							else if(i2==2)	p3=p3+1;

							if(i3==0)	p1=p1+1;
							else if(i3==1)	p2=p2+1;
							else if(i3==2)	p3=p3+1;

							if(i4==0)	p1=p1+1;
							else if(i4==1)	p2=p2+1;
							else if(i4==2)	p3=p3+1;

							if(i5==0)	p1=p1+1;
							else if(i5==1)	p2=p2+1;
							else if(i5==2)	p3=p3+1;

							if(p3>=p2 && p3 >= p1)	Target=3'b100;
							else if(p2>=p3 && p2 >= p1)	Target=3'b010;
							else if(p1>=p3 && p1 >= p2)	Target=3'b001;
							else	Target=0;	


							if( Target == out)begin
								$write("%d Success ",pattern);
								$display("Target answer:%b Your answer:%b a0:%b a1:%b a2:%b a3:%b a4:%b",Target,out,a0,a1,a2,a3,a4);
							end
							else begin
								$write("%d Error ",pattern);
								$display("Target answer:%b Your answer:%b a0:%b a1:%b a2:%b a3:%b a4:%b",Target,out,a0,a1,a2,a3,a4);
								$finish();
							end



						end
					end
				end
			end
		end

		$finish();
	end



endmodule
