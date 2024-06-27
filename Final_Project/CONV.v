 //==============================================================================
 //  Author         : ChongHao Xu 
 //  Email          : chonghaoxu0109@gmail.com
 //  Last modified  : 2024-05-28 09:51
 //  Filename       : CONV.v
 //  Component      : DW02_mult_4_stage
 //  Description    : 
 //             ROM                       RAM                       RAM
 //         Image_Source       ->        Layer 0       ->          Layer 1  
 //                        CONVOLUTION             MAX_POOLING
 //         
 //           CONVOLUTION +-- Mask
 //                       |   
 //                       |-- Bias
 //                       |   
 //                       +-- ReLu
 //
 //     
 //                                                               
 //                                                               
 //                                                               
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++==============================================================================



`include "./rom_controller.v"
`include "./pipeline_multiplier.v"
`include "./accumulater.v"
`include "./relu.v"
`include "./max_pooling.v"


module  CONV(

  // System Singal
	input	wire            clk,      // System Clock Posedge Active
	input	wire            reset,    // High Active
	output wire           busy,    
	input wire						ready, 	    

	// Image Source ROM
  //  t1 trend address t2 recive data
  //                 t1           t2
  //                   ____________            ____________
  // clock ___________|            |__________|            |_______
  // addr        x    |           32          |        x
  // data               x          |          32a4         |      x
	output wire [11:0]    iaddr,    // ROM Address 
	input wire	[19:0]    idata,	  // ROM Data
	
  // Result RAM
  // 
  //
  // Read 
  //                   ____________            ____________
  // clock ___________|            |__________|            |_______
  // addr        x    |           32          |        x          
  // data        x                 |          32a4         |     x           
  // crd         x    |            1          |        x           
  //
  // Write
  //                   ____________            ____________
  // clock ___________|            |__________|            |_______
  // addr        x    |           32          |        x          
  // data        x    |          32a4         |        x           
  // cwr         x    |            1          |        x           
  //
	output reg 	          cwr,      // Write Enable
	output reg 	[11:0]    caddr_wr, // Write Address
	output reg 	[19:0]    cdata_wr, // Write Data

	output reg	          crd,      // Read Enable
	output reg 	[11:0]    caddr_rd, // Read Address
	input	wire  [19:0]    cdata_rd, // Read Data
	
  // 3'b000 : None
  // 3'b001 : Layer 0
  // 3'b011 : Layer 1
	output reg 	[2:0]			csel  // RAM Selection

);


  // FSM State
  parameter IDLE = 2'b00;
  parameter WORK = 2'b01;
  parameter WAIT = 2'b11;




  wire [19:0]   rom_valid_data;
  wire [36:0]   multiplier_result;  // 1 signed + 4 bit integer + 32 fraction  
  wire [3:0]    pixel_counter;      // Represent pixel in map from Multiplier
   
  wire [36:0]   accumulater_result;
  wire          accumulater_valid;

  wire [19:0]   layer_0_data;
  wire          layer_0_valid;

  reg [1:0]     state,next_state;  
  reg [5:0]     x,y;    
  reg [1:0]     dx,dy;
  wire          fsm_valid = state != IDLE ? 1:0;
 
  
  wire [11:0]   layer_0_rd_address;
  wire [19:0]   layer_0_rd_data;
  wire          layer_0_rd_valid;
  
  wire [11:0]   layer_1_address;
  wire [19:0]   layer_1_data;
  wire          layer_1_valid;
  reg  [11:0]   layer_0_address;
  
  rom_controller rom_controller_u1(
    .data(rom_valid_data),
    // Connnect FSM
    .fsm_x(x),
    .fsm_y(y),
    .fsm_dx(dx),
    .fsm_dy(dy),
    // Connect ROM
    .rom_address(iaddr),
    .rom_data(idata)
  );



  pipeline_multiplier pipeline_multiplier_u2(
    //  System Signal 
    .clk(clk),
    .reset(reset),
    // Output Data
    .result(multiplier_result),
    .pixel_counter(pixel_counter),
    // Connect FSM
    .fsm_work_valid(fsm_valid),
    // Connect ROM_CONTROLLER
    .rom_valid_data(rom_valid_data)     
  );


  accumulater accumulater_u3(
    // System Signal 
    .clk(clk),
    .reset(reset),
    // Result 
    .result(accumulater_result),
    .result_valid(accumulater_valid),
    // Connect Multiplier
    .data(multiplier_result),
    .pixel_counter(pixel_counter)
  );

  
  relu relu_u4(
    // System Singal
    .clk(clk),
    .reset(reset),
  
    // Connect Arbiter 
    .ram_0_write_data(layer_0_data),    // 1 signed + 4 integer + 32 fraction
    .ram_0_write_valid(layer_0_valid),
  
    // Accumulater
    .accumulate_value(accumulater_result),
    .accumulate_valid(accumulater_valid)
  
  );

  

  max_pooling max_pooling_u5(
    // System Singal 
    .clk(clk),
    .reset(reset),
  
    // FSM 
    .current_address(layer_0_address),
    .dx(dx),
    .dy(dy),
  
    // Read Layer 0 
    .read_valid(layer_0_rd_valid),
    .read_address(layer_0_rd_address),
    .read_data(layer_0_rd_data),
    .layer_0_wr_data(layer_0_data),
  
    
    // Write Layer 1
    .layer_1_result(layer_1_data),  
    .layer_1_address(layer_1_address),
    .layer_1_valid(layer_1_valid)
  );







  
  always@(posedge clk or posedge reset)begin :layer_0_addr
    if(reset) begin
      layer_0_address <= 0;
    end
    else begin
      if(dx==1 && dy == 2) layer_0_address <= {y,x};
    end
  end


  always@(*)begin :aribiter
    if(layer_0_valid)begin
      caddr_wr  = layer_0_address;
      cdata_wr  = layer_0_data;
      cwr       = 1'b1;
      csel      = 3'b001;
      crd       = 1'b0;
      caddr_rd  = 0;
    end
    else if(layer_1_valid)begin
      caddr_wr  = layer_1_address;
      cdata_wr  = layer_1_data;
      cwr       = 1'b1;
      csel      = 3'b011;
      crd       = 1'b0;
      caddr_rd  = 0;
    end
    else if(layer_0_rd_valid)begin
      caddr_wr  = layer_1_address;
      cdata_wr  = layer_1_data;
      cwr       = 1'b0;
      csel      = 3'b001;
      crd       = 1'b1;
      caddr_rd = layer_0_rd_address;
    end
    else begin
      caddr_wr  = 0;
      cdata_wr  = 0;
      cwr       = 1'b0;
      csel      = 3'b001;
      crd       = 1'b0;
      caddr_rd  = 0;
    end
  end

  assign layer_0_rd_data = cdata_rd;




  // Finite State Machine
  
  assign busy = state!=IDLE ? 1:0;

  always@(posedge clk or posedge reset)begin
    if(reset)begin
      state <= IDLE;
    end
    else begin
      state <= next_state;
    end
  end
  
  always@(*)begin
    case(state)
      IDLE  : next_state = (ready) ? WORK : IDLE;
      WORK  : next_state = ( &{x,y}  && dx==2 & dy == 2 ) ? WAIT : WORK;
      WAIT  : next_state = ( dx == 2 && dy == 2) ? IDLE : WAIT;
      default next_state = IDLE;
    endcase
  end

  
  always@(posedge clk or posedge reset)begin
    if(reset)begin
      x <= 0;
      y <= 0;
      dx <= 0;
      dy <= 0;
    end
    else if(state == WORK || state == WAIT)begin
      if(dx == 2 && dy == 2 && x == 63)begin
        dx <= 0;
        dy <= 0;
        x  <= 0;
        y  <= y + 1;
      end
      else if(dx == 2 && dy == 2)begin
        dx <= 0;
        dy <= 0;
        x  <= (state==WORK) ? (x+1) : 0;
      end
      else if(dx == 2) begin
        dx <= 0;
        dy <= dy + 1;
      end
      else dx <= dx + 1;
    end
  end

  


endmodule



