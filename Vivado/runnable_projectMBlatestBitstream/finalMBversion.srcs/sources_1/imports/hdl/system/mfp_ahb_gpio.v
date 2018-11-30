// mfp_ahb_gpio.v
//
// General-purpose I/O module for Altera's DE2-115 and 
// Digilent's (Xilinx) Nexys4-DDR board


`include "mfp_ahb_const.vh"

module mfp_ahb_gpio(
    input                        HCLK,
    input                        HRESETn,
    input      [  3          :0] HADDR,
    input      [  1          :0] HTRANS,
    input      [ 31          :0] HWDATA,
    input                        HWRITE,
    input                        HSEL,
    output reg [ 31          :0] HRDATA,

// memory-mapped I/O
    input      [`MFP_N_SW-1  :0] IO_Switch,
    input      [`MFP_N_PB-1  :0] IO_PB,
    output reg [`MFP_N_LED-1 :0] IO_LED,
    output reg [7:0] IO_BotCtrl,
    input [31:0] IO_BotInfo, 
    output reg soft_reset,                
                        
    // final project additions
    input [11:0] x_acc,
    input [11:0] y_acc,                    
    input [11:0] z_acc,
    
    // World Map Select
    output reg [1:0] LSEL
);

  reg  [3:0]  HADDR_d;
  reg         HWRITE_d;
  reg         HSEL_d;
  reg  [1:0]  HTRANS_d;
  wire        we;            // write enable

  //assign LSEL = 2'b01;
  
  // delay HADDR, HWRITE, HSEL, and HTRANS to align with HWDATA for writing
  always @ (posedge HCLK) 
  begin
    HADDR_d  <= HADDR;
	HWRITE_d <= HWRITE;
	HSEL_d   <= HSEL;
	HTRANS_d <= HTRANS;
  end
  
  initial begin
    IO_LED = `MFP_N_LED'b0; 
    IO_BotCtrl = 0;
    soft_reset = 1; //inactive high
    LSEL = 0; //game over screen default
  end
  
  // overall write enable signal
  assign we = (HTRANS_d != `HTRANS_IDLE) & HSEL_d & HWRITE_d;

    always @(posedge HCLK or negedge HRESETn)
       if (~HRESETn) begin
         IO_LED <= `MFP_N_LED'b0; 
         IO_BotCtrl <= 0;
         soft_reset <= 1; //inactive high
         LSEL <= 0; //game over screen default
       end
       else if (we)
         case (HADDR_d)
           `H_LED_IONUM: IO_LED <= HWDATA[`MFP_N_LED-1:0];
           `H_IO_BotCtrl: IO_BotCtrl <= HWDATA[7:0];
           `H_IO_SoftReset: soft_reset <= HWDATA[0];
           `H_IO_LEVEL_SEL: LSEL <= HWDATA[1:0];
         endcase
    
	always @(posedge HCLK or negedge HRESETn)
       if (~HRESETn) begin
         HRDATA <= 32'h0;
       end
       else begin
	     case (HADDR)
           `H_SW_IONUM: HRDATA <= { {32 - `MFP_N_SW {1'b0}}, IO_Switch };
           `H_PB_IONUM: HRDATA <= { {32 - `MFP_N_PB {1'b0}}, IO_PB };
           `H_IO_BotInfo: HRDATA <= IO_BotInfo;
           `H_IO_BotCtrl: begin
             HRDATA[31:8] <= 0;
             HRDATA[7:0] <= IO_BotCtrl;
           end
           `H_IO_LEVEL_SEL: begin
             HRDATA[31:2] <= 0;
             HRDATA[1:0] <= LSEL;
            end
            `H_LED_IONUM: begin
                HRDATA[31:`MFP_N_LED] <= 0;
                HRDATA[`MFP_N_LED-1:0] <= IO_LED;
            end
            `H_IO_ACC_X: begin
                HRDATA[11:0] <= x_acc;     
                HRDATA[31:12] <= 0;
            end  
            `H_IO_ACC_Y: begin
                HRDATA[11:0] <= y_acc;
                HRDATA[31:12] <= 0;
            end
            `H_IO_ACC_Z: begin
                HRDATA[11:0] <= z_acc;
                HRDATA[31:12] <= 0;
            end
             
            default:    HRDATA <= 32'h00000000;
         endcase
       end
endmodule
