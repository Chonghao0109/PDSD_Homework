
module traffic_light(
  input wire clk,
  input wire reset,
  input wire c,
  output reg HG,
  output reg HY,
  output reg HR,
  output reg FG,
  output reg FY,
  output reg FR,
  output reg PG,
  output reg PR
);



  parameter LONG_TIME           = 'd20;
  parameter MEDIUM_TIME         = 'd4;
  parameter SHORT_TIME          = 'd2;	
  parameter PEDESTRAIN_CHANSFER = 'd5;
  
  
  
  reg [2:0] state,next_state;
  reg [4:0] counter;
  
  reg [2:0] s0_times;
  reg p;


  reg TL,TM,TS;
  reg counter_clr;
  
  
  
  // State Define
  parameter S0 = 3'b000; // HG
  parameter S1 = 3'b001; // HY
  parameter S2 = 3'b011; // HR
  parameter S3 = 3'b010; // FG
  parameter S4 = 3'b110; // FY
  parameter S5 = 3'b111; // FR
  parameter S6 = 3'b101; // PG
  parameter S7 = 3'b100; // PR
  
  
  
  always@(posedge clk or posedge reset)begin :Finite_State_Machine 
    if(reset)begin
      state <= S0;
    end
    else begin
      state <= next_state;
    end
  end
  
  
  always@(*)begin:proc_next_state
    case(state)
      S0: next_state = (TL & (c|p)) ? S1 : S0 ;
      S1: next_state = (TM) ? S2 : S1 ;
      S2: begin
        if(TS)begin
           next_state = p ? S6 : S3;
        end
        else next_state = S2;
      end
      S3: next_state = (TL) ? S4 : S3 ;
      S4: next_state = (TM) ? S5 : S4 ;
      S5: next_state = (TS) ? S0 : S5 ;
      S6: next_state = (TL) ? S7 : S6 ;
      S7: next_state = (TS) ? S0 : S7 ;
  	endcase
  end
  
  always@(posedge clk or posedge reset)begin :proc_S0_Times
    if(reset)begin
      s0_times <= 0;
    end
    else begin
      if(state==S0 && TL) s0_times <= s0_times + 1;
      else if(state == S6) s0_times <= 0;
    end
  end
  always@(*)begin
    p = (s0_times >= (PEDESTRAIN_CHANSFER-1)) ? 1 : 0;
  end
  
  
  always@(*)begin
    case(state)
      S0: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b100_001_01;
      S1: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b010_001_01;
      S2: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b001_001_01;
      S3: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b001_100_01;
      S4: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b001_010_01;
      S5: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b001_001_01;
      S6: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b001_001_10;
      S7: {HG,HY,HR,FG,FY,FR,PG,PR} = 9'b001_001_01;
    endcase
  end
  
  
  
  
  
  
  always@(*)begin :proc_counter_clr
    counter_clr = |(next_state^state) || TL;
  end
  
  
  
  
  always@(posedge clk or posedge reset)begin :proc_counter
    if(reset)begin
      counter <= 0;
    end
    else begin
      if(counter_clr) counter <= 0;
      else counter <= counter + 1;
    end
  end

  always@(*)begin :counter_state
    TL = (counter == (LONG_TIME-1))   ? 1 : 0;
    TM = (counter == (MEDIUM_TIME-1)) ? 1 : 0;
    TS = (counter == (SHORT_TIME-1))  ? 1 : 0;
  end
  


	

endmodule		






