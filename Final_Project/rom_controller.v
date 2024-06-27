 //==============================================================================
 //  Author         : ChongHao Xu 
 //  Email          : chonghaoxu0109@gmail.com
 //  Last modified  : 2024-05-31 14:04
 //  Filename       : rom_contorller.v
 //  Component      : 
 //  Description    : 
 //  
 //  
 //==============================================================================


module rom_controller(
  
  output reg  [19:0]      data,
  
  // Connnect FSM
  input wire  [5:0]       fsm_x,fsm_y,
  input wire  [1:0]       fsm_dx,fsm_dy,
  
  // Connect ROM
  output reg  [11:0]      rom_address,
  input wire  [19:0]      rom_data
);
 

  wire data_valid; 
  wire x_valid;
  wire y_valid;

  assign data_valid = x_valid & y_valid; 
  assign x_valid = $signed(fsm_x+fsm_dx-1) >= 0 ? ($signed(fsm_x+fsm_dx-1) <= 63 ? 1:0 ) : 0;
  assign y_valid = $signed(fsm_y+fsm_dy-1) >= 0 ? ($signed(fsm_y+fsm_dy-1) <= 63 ? 1:0 ) : 0;


  always@(*)begin :address_conveter
    rom_address[5:0] = (fsm_x+fsm_dx-1);
    rom_address[11:6] = (fsm_y+fsm_dy-1);
  end
 
  always@(*)begin
    data = rom_data & {20{data_valid}};
  end



endmodule
