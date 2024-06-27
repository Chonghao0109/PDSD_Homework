 //==============================================================================
 //  Author         : ChongHao Xu 
 //  Email          : chonghaoxu0109@gmail.com
 //  Last modified  : 2024-05-31 14:27
 //  Filename       : pipeline_multiplier.v
 //  Component      : DW02_mult_4_stage
 //  Description    : 
 //  
 //  
 //==============================================================================

`include "./DW02_mult_4_stage.v"

module pipeline_multiplier(
  //  System Signal 
  input wire            clk,
  input wire            reset,
  
  // Output Data
  output reg [36:0]     result,         // 1 signed + 4 integer + 32 fraction 
  output reg [3:0]      pixel_counter,  // Represent the position in the mask 

  // Connect FSM
  input wire            fsm_work_valid,
  
  // Connect ROM_CONTROLLER
  input wire [19:0]     rom_valid_data     
  
);
  

  // Convolution Parameter
  // Description :
  //    The original declare type is 4 bits integer plus 16 bits fraction, 
  //    with vlaue never exceeding 1,So I Reduce the integer bits,Leave only signed bit
  // Type : 1 signed bit + 16 bits fraction 
  parameter P1 = 17'h0A89E;  
  parameter P2 = 17'h092D5;
  parameter P3 = 17'h06D43;
  parameter P4 = 17'h01004;
  parameter P5 = 17'h18F71;
  parameter P6 = 17'h16E54;
  parameter P7 = 17'h1A6D7;
  parameter P8 = 17'h1C834;
  parameter P9 = 17'h1AC19;


  reg  [20:0]   ma;   // 1 signed + 4 intager + 16 fraction 
  reg  [16:0]   mb;   // 1 signed + 0 integer + 16 fraction
  wire [37:0]   mo;   // 2 signed + 4 integer + 32 fraction

  // Multiplier
  // PRODUCT = A X B 
  DW02_mult_4_stage#(.A_width(21),.B_width(17))
    multi(
      .A(ma), 
      .B(mb),
      .TC(1'b1),//TC(Two’s complement)
      // 0: unsigned
      // 1: signed
      .CLK(clk),
      .PRODUCT(mo)
    ); 
  
  always@(posedge clk or posedge reset)begin
    if(reset)begin
      ma  <= 0;
      mb  <= 0;
    end
    else begin
      ma <= {1'b0,rom_valid_data}; //Signed Extend
      case(pixel_counter)
        0: mb <= P6;
        1: mb <= P7;
        2: mb <= P8;
        3: mb <= P9;
        4: mb <= P1;
        5: mb <= P2;
        6: mb <= P3;
        7: mb <= P4;
        8: mb <= P5;
      endcase
    end
  end
  
 
  // Description                            
  always@(posedge clk or posedge reset)begin :multiplier_predata
    if(reset)begin 
      pixel_counter <= 4;
    end 
    else if(fsm_work_valid)begin
      pixel_counter <= pixel_counter==8 ? 0 : pixel_counter + 1;
    end 
  end 
  
  
  
  always@(posedge clk)begin
    result <= mo[36:0];
  end

endmodule
