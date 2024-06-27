 //==============================================================================
 //  Author         : ChongHao Xu 
 //  Email          : chonghaoxu0109@gmail.com
 //  Last modified  : 2024-05-31 16:39
 //  Filename       : accumulater.v
 //  Component      : 
 //  Description    : 
 //  
 //  
 //==============================================================================

module accumulater(
  // System Signal 
  input wire                clk,
  input wire                reset,
  // Result 
  output reg signed [36:0]  result, // 1 signed + 4 integer + 32 fraction
  output reg                result_valid,
  // Connect Multiplier
  input wire signed [36:0]  data,
  input wire [3:0]          pixel_counter
);



  // Convolution Parameter Bias
  // Description :
  //    The original declare type is 4 bits integer plus 16 bits fraction, 
  //    with vlaue never exceeding 1,So I Reduce the integer bits
  // Type : 16 bits fraction 
  parameter BIAS = 16'h1310;
  
  reg signed [40:0] accumulate_value;
  // Description                            
  always@(posedge clk)begin :accumulater
    if(pixel_counter == 0) begin
      accumulate_value <= data + ({BIAS,{16{1'b0}}});
    end
    else begin
      accumulate_value <= accumulate_value + data;
    end
  end 
  
  always@(posedge clk or posedge reset)begin
    if(reset)begin
      result_valid <= 0;
    end
    else begin
      result_valid  <= pixel_counter == 8 ? 1'b1 : 1'b0;
    end
  end
 
  always@(*)begin
    result  = accumulate_value ;
  end

    
endmodule
