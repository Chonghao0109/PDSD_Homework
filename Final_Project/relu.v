 //==============================================================================
 //  Author         : ChongHao Xu 
 //  Email          : chonghaoxu0109@gmail.com
 //  Last modified  : 2024-05-31 17:04
 //  Filename       : 
 //  Component      : 
 //  Description    : 
 //  
 //  
 //==============================================================================

module relu(
  // System Singal
  input wire                  clk,
  input wire                  reset,
  

  // Connect Arbiter 
  output reg  [19:0]          ram_0_write_data,    
  output reg                  ram_0_write_valid,

  // Accumulater
  input wire signed [36:0]    accumulate_value,   // 1 signed + 4 integer + 32 fraction
  input wire                  accumulate_valid

);


  
  reg  [35:0]      relu_value;  // 4 integer + 32 fraction
  reg  [19:0]      rounding;    // 4 integer + 16 fraction

  always@(*)begin
    relu_value = ~{36{accumulate_value[36]}} & accumulate_value[35:0];
    rounding   =  relu_value[35-:20] + relu_value[15];
  end

  always@(posedge clk or posedge reset)begin
    if(reset)begin
      ram_0_write_valid <= 0;
    end
    else begin
      ram_0_write_valid <= accumulate_valid;
    end
  end
 
  always@(posedge clk or posedge reset)begin
    if(reset) begin
      ram_0_write_data <= 0;
    end
    else begin
      if(accumulate_valid) ram_0_write_data <= rounding;
    end
  end
  

endmodule
