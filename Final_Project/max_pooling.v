 //==============================================================================
 //  Author         : ChongHao Xu 
 //  Email          : chonghaoxu0109@gmail.com
 //  Last modified  : 2024-06-01 21:10
 //  Filename       : max_pooling.v
 //  Component      : 
 //  Description    : 
 //  
 //  
 //==============================================================================

module max_pooling(
  // System Singal 
  input wire          clk,
  input wire          reset,

  // FSM 
  input wire [11:0]   current_address,
  input wire [1:0]    dx,
  input wire [1:0]    dy,

  // Read Layer 0 
  output reg          read_valid,
  output reg [11:0]   read_address,
  input wire [19:0]   read_data,
  input wire [19:0]   layer_0_wr_data,

  
  // Write Layer 1
  output reg [19:0]   layer_1_result, 
  output reg [11:0]   layer_1_address,
  output reg          layer_1_valid
);

  wire [5:0] x = current_address[5:0];
  wire [5:0] y = current_address[11:6];

  wire t1 = (y[0] & !x[0] & dy==1 & dx==0) ? 1:0;  
  wire t2 = (y[0] & !x[0] & dy==1 & dx==2) ? 1:0;  
  wire t3 = (y[0] & !x[0] & dy==2 & dx==1) ? 1:0;  
  wire t4 = (y[0] & x[0] & dy==0 & dx==0)  ? 1:0;  
  wire t5 = (y[0] & x[0] & dy==0 & dx==1)  ? 1:0;  
  wire t6 = (y[0] & x[0] & dy==1 & dx==0)  ? 1:0;  

  reg [19:0] max;
  reg [19:0] temp;




  always@(*)begin
    temp = max < read_data ? read_data : max;
  end


  always@(*)begin
    if(t1)begin
      read_valid = 1;
      read_address[11:6]  = y-1;
      read_address[5:0]   = x;
    end
    else if(t3)begin
      read_valid = 1;
      read_address[11:6]  = y-1;
      read_address[5:0]   = x+1;
    end
    else if(t5)begin
      read_valid = 1;
      read_address[11:6]  = y;
      read_address[5:0]   = x-1;
    end
    else begin
      read_valid = 0;
      read_address[11:6]  = 0;
      read_address[5:0]   = 0;
    end
  end

  always@(posedge clk or posedge reset)begin
    if(reset)begin 
      layer_1_result  <= 0;
      layer_1_address <= 0;
      layer_1_valid   <= 0;
    end
    else begin
      layer_1_result  <= layer_0_wr_data > max ?  layer_0_wr_data : max;
      layer_1_address <= {2'b00,y[5:1],x[5:1]};
      layer_1_valid   <= (x[0] && y[0] && dx == 1 && dy == 2) ? 1:0; 
    end
  end 

  always@(posedge clk or posedge reset)begin
    if(reset)begin
      max <= 0;
    end
    else begin
      if(t2) max <= read_data;
      else if(t4) max <= temp;
      else if(t6) max <= temp;
    end
  end
  


endmodule
